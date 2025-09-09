program project1;

uses
  fp_stdio,
  fp_fcntl,
  fp_unistd,
  clib,

  elf,                // makro
  elf_linux,          // makro
  elf_fdpic,
  libelf,
  gelf,
  link,               // makro
  link_bits,

  fp_elf64;

const
  path = '/lib/i386-linux-gnu/libgmodule-2.0.so.0';

  procedure main;
  var
    fd: longint;
    elf: PElf;
    shstrndx: Tsize_t;
    scn: PElf_Scn = nil;
    shdr: TGElf_Shdr;
    data: PElf_Data;
    count: TElf64_Xword;
    sym: TGElf_Sym;
    name: pchar;
    i: integer;
  begin
    if elf_version(EV_CURRENT) = EV_NONE then begin
      WriteLn('ELF library initialization failed.');
      Exit;
    end;

    fd := open(path, O_RDONLY);
    if fd < 0 then begin
      WriteLn('Failed to open ELF file');
      Exit;
    end;

    elf := elf_begin(fd, ELF_C_READ, nil);
    if elf = nil then begin
      WriteLn('elf_begin() failed: ', elf_errmsg(-1));
      close(fd);
      Exit;
    end;

    //    size_t shstrndx;
    if elf_getshdrstrndx(elf, @shstrndx) <> 0 then begin
      WriteLn('elf_getshdrstrndx() failed: ', elf_errmsg(-1));
      elf_end(elf);
      close(fd);
      Exit;
    end;

    repeat
      scn := elf_nextscn(elf, scn);
      if scn <> nil then begin
        if gelf_getshdr(scn, @shdr) <> @shdr then begin
          WriteLn('gelf_getshdr() failed: ', elf_errmsg(-1));
          elf_end(elf);
          close(fd);
          Exit;
        end;

        if (shdr.sh_type = SHT_SYMTAB) or (shdr.sh_type = SHT_DYNSYM) then begin
          data := elf_getdata(scn, nil);
          count := shdr.sh_size div shdr.sh_entsize;
          WriteLn('Symbol table: ', count, ' entries');

          for  i := 0 to count - 1 do begin
            if gelf_getsym(data, i, @sym) <> @sym then begin
              WriteLn('gelf_getsym() failed: ', elf_errmsg(-1));
              continue;
            end;
            if sym.st_value <> 0 then begin
              name := elf_strptr(elf, shdr.sh_link, sym.st_name);
              if (name <> nil) and (name[0] <> #0) then begin
                printf('  %s: 0x%08jx'#10, name, sym.st_value);
              end;
            end;
          end;
        end;
      end;
    until scn = nil;

    elf_end(elf);
    close(fd);
  end;


begin
  main;
end.
