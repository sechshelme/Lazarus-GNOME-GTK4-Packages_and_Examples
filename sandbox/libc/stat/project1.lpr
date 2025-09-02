program project1;

uses
  clib,

  fp_stat,
  stat_bits,
  struct_stat,


  fp_stdio,
  fp_unistd,
  fp_termios;

const
  path = '/home/tux/Schreibtisch/stat/main.c';

  procedure printFileInfo(afileStat: Pointer);
  begin

  end;

  procedure main;
  var
    fileStat: Tstat;
  begin
    if lstat(path, @fileStat) < 0 then begin
      WriteLn('lstat');
      Exit;
    end;

    WriteLn('stat: ', SizeOf(fileStat));
    WriteLn('Tstat:' ,SizeOf(Tstat));
    WriteLn('Tteststat:' ,SizeOf(Tteststat));

    if S_ISLNK(fileStat.st_mode) then begin
      printf('Symbolic link detected. Showing link info:'#10);
      printf('Information for %s'#10, path);
      printFileInfo(@fileStat);


      if stat(path, @fileStat) = 0 then begin
        printf(#10'Symbolic link target info:'#10);
        printf('Information for %s'#10, path);
        printFileInfo(@fileStat);
      end;
    end else begin
      printf('Information for %s'#10, path);
      printFileInfo(@fileStat);
    end;
  end;

begin
  main;
end.
