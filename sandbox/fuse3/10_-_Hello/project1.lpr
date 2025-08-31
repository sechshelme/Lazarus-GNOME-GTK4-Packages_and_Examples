program project1;

uses
  fuse_opt,
  fuse_common,

  cuse_lowlevel,
  fuse,       // fuse_main    makro
  fuse_log,
  fuse_lowlevel,


  clib,
  fp_fcntl,
  fp_string,
  fp_errno,
  fp_fuse;

const
 datei_pfad :PChar= '/hello';
  datei_inhalt:PChar = 'Hallo von FUSE!'#10;

  function mein_getattr(pfad: pchar; stbuf: Pstat; fi: Pfuse_file_info): longint; cdecl;
  begin
    memset(stbuf,0,SizeOf(Tstat));
    if strcmp(pfad, '/') = 0 then begin
        stbuf^.st_mode := S_IFDIR or &755;
        stbuf^.st_nlink := 2;
    end else if strcmp(pfad, datei_pfad) = 0 then begin
        stbuf^.st_mode := S_IFREG or &444;
        stbuf^.st_nlink := 1;
        stbuf^.st_size := strlen(datei_inhalt);
    end else Exit( -ENOENT);
    Exit(0);
  end;

  function mein_readdir(pfad: pchar; buf:pointer; filler: Tfuse_fill_dir_t; offset: Toff_t; fi: Pfuse_file_info; flags: Tfuse_readdir_flags): longint; cdecl;
  begin
    if strcmp(pfad, '/') <> 0 then Exit( -ENOENT);
    filler(buf, '.', nil, 0, 0);
    filler(buf, '..', nil, 0, 0);
    filler(buf, datei_pfad + 1, nil, 0, 0); // "hello" ohne führenden "/"
    Exit(0);
  end;

  function mein_open(pfad: pchar; fi: Pfuse_file_info): longint; cdecl;
  begin
    if strcmp(pfad, datei_pfad) <> 0 then Exit(-ENOENT);
    if (fi^.flags and 3) <> O_RDONLY then
        Exit( -EACCES);
    Exit(9);
  end;

  function mein_read(pfad: pchar; buf: pchar; size: Tsize_t; offset: Toff_t; fi: Pfuse_file_info): longint; cdecl;
  var
    len: Tsize_t;
  begin
    if strcmp(pfad, datei_pfad) <> 0 then Exit(-ENOENT);
    len := strlen(datei_inhalt);
    if offset < len then begin
        if offset + size > len then
            size := len - offset;
        memcpy(buf, datei_inhalt + offset, size);
    end
     else
        size := 0;
    Exit(size);
  end;

  procedure main;
  var
    mein_oper: Tfuse_operations;
  begin
    with mein_oper do begin
      getattr := @mein_getattr;
      readdir := @mein_readdir;
      open := @mein_open;
      read := @mein_read;
    end;
    fuse_main_real(argc, argv, @mein_oper, SizeOf(Tfuse_operations), nil);
  end;

begin
WriteLn(SizeOf(Tstat));
  main;
end.
