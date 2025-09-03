program project1;

uses
  clib,

  fp_stat,

  fp_stdio,
  fp_unistd,
  fp_termios;

const
  path = '/home/tux/Schreibtisch/stat/mainlink.c';
//  path = '/home/tux/Schreibtisch/stat/main.c';
//  path = '/home/tux/Schreibtisch/stat';

  procedure printAttribf(fileStat: Pstat; a: word; c: pchar);
  begin
    if (fileStat^.st_mode and a) <> 0 then begin
      printf(c);
    end else begin
      printf('-');
    end;
  end;

  procedure printFileInfo(fileStat: Pstat);
  begin
    printf('---------------------------'#10);
    printf('File Size:        %lld bytes'#10, fileStat^.st_size);
    printf('Number of Links:  %ld'#10, fileStat^.st_nlink);
    printf('File inode:       %ld'#10, fileStat^.st_ino);

    printAttribf(fileStat, S_IFDIR, 'd');
    printAttribf(fileStat, S_IRUSR, 'r');
    printAttribf(fileStat, S_IWUSR, 'w');
    printAttribf(fileStat, S_IXUSR, 'x');
    printAttribf(fileStat, S_IRGRP, 'r');
    printAttribf(fileStat, S_IWGRP, 'w');
    printAttribf(fileStat, S_IXGRP, 'x');
    printAttribf(fileStat, S_IROTH, 'r');
    printAttribf(fileStat, S_IWOTH, 'w');
    printAttribf(fileStat, S_IXOTH, 'x');
    printf(''#10);

    printf('Device ID: %ld'#10, fileStat^.st_dev);
    printf('Inode number: %ld'#10, fileStat^.st_ino);
    printf('User ID of owner: %d'#10, fileStat^.st_uid);
    printf('Group ID of owner: %d'#10, fileStat^.st_gid);
    printf('Size in bytes: %lld'#10, fileStat^.st_size);
    printf('Number of blocks allocated: %lld'#10, fileStat^.st_blocks);
    printf('Block size: %ld'#10, fileStat^.st_blksize);
    printf('Last access time: %ld'#10, fileStat^.st_atime);
    printf('Last modification time: %ld'#10, fileStat^.st_mtime);
    printf('Last status change time: %ld'#10, fileStat^.st_ctime);
  end;

procedure Test;
var
  Filest: Tstat;
begin
  FillChar(Filest, SizeOf(Filest),0);
  printf('size: %ld'#10#10, sizeof(Filest));
  printf('st_mode:    %ld'#10, @Filest.st_mode - @Filest);
  printf('st_nlink:   %ld'#10, @Filest.st_nlink - @Filest);
  printf('st_size:    %ld'#10, @Filest.st_size - @Filest);
  printf(#10#10);


  if lstat(path, @Filest) < 0 then begin
    WriteLn('lstat');
    Exit;
  end;
  printf('S_IFREG: %d'#10, S_IFREG);
  printf('S_IFDIR: %d'#10, S_IFDIR);
  printf('S_IRUSR: %d'#10, S_IRUSR);
  printf('S_IWUSR: %d'#10, S_IWUSR);
  printf('S_IXUSR: %d'#10, S_IXUSR);
  printf('S_IRGRP: %d'#10, S_IRGRP);
  printf('S_IWGRP: %d'#10, S_IWGRP);
  printf('S_IXGRP: %d'#10, S_IXGRP);
  printf('S_IROTH: %d'#10, S_IROTH);
  printf('S_IWOTH: %d'#10, S_IWOTH);
  printf('S_IXOTH: %d'#10, S_IXOTH);


  WriteLn();
  WriteLn('stat: ', SizeOf(Filest));
  WriteLn('Tstat:', SizeOf(Tstat));
  WriteLn('----------------------'#10);
  end;

  procedure main;
  var
    fileStat: Tstat;
  begin
    Test;

    FillChar(fileStat, SizeOf(fileStat),0);

    if lstat(path, @fileStat) < 0 then begin
      WriteLn('lstat');
      Exit;
    end;

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
