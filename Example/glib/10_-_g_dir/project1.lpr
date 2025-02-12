program project1;

uses
  ctypes,
  fp_glib2;

  procedure read_name;
  const
    path = '.';
  var
    dir: PGDir;
    err: PGError = nil;
    entry, fullpath: Pgchar;
    i: Tguint = 0;
  begin
    dir := g_dir_open(path, 0, @err);
    if dir = nil then begin
      g_printf('Ungültiger Pfad: %s'#10, err^.message);
      g_error_free(err);
      Exit;
    end;

    repeat
      entry := g_dir_read_name(dir);
      if entry <> nil then begin
        fullpath := g_build_filename(path, entry, nil);
        if g_file_test(fullpath, G_FILE_TEST_IS_DIR) then begin
          g_printf('%3d. [%s]'#10, i, entry);
        end else if g_file_test(fullpath, G_FILE_TEST_IS_EXECUTABLE) then begin
          g_printf('%3d. *%s'#10, i, entry);
        end else begin
          g_printf('%3d. %s'#10, i, entry);
        end;
        Inc(i);
      end;
    until entry = nil;

    g_dir_close(dir);
  end;



  function main(argc: cint; argv: PPChar): cint;
  begin
    read_name;
  end;

begin
  main(argc, argv);
end.
