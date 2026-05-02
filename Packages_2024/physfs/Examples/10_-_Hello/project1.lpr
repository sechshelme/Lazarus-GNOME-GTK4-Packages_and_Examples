program project1;

uses
  fp_physfs;

  procedure main;
  var
    f: PPHYSFS_File;
    fileLen, readLen: TPHYSFS_sint64;
    buffer: pchar;
    rc, i: PPChar;
  begin
    if PHYSFS_init(argv[0]) = 0 then begin
      WriteLn('Fehler beim Initialisieren: ', PHYSFS_getErrorByCode(PHYSFS_getLastErrorCode));
      Exit;
    end;

    if PHYSFS_mount('/home/tux/Downloads/live-chart-master.zip', '/test', 1) = 0 then begin
      WriteLn('Konnte daten.zip nicht mounten: ', PHYSFS_getErrorByCode(PHYSFS_getLastErrorCode));
    end;

    f := PHYSFS_openRead('test/live-chart-master/README.md');
    if f = nil then begin
      WriteLn('Datei nicht gefunden: ', PHYSFS_getErrorByCode(PHYSFS_getLastErrorCode));
    end else begin
      fileLen := PHYSFS_fileLength(f);
      buffer := GetMem(fileLen + 1);

      readLen := PHYSFS_readBytes(f, buffer, fileLen);
      buffer[readLen] := #0;

      WriteLn('Inhalt der Datei:', buffer, #10);

      Freemem(buffer);
      PHYSFS_close(f);
    end;

    rc := PHYSFS_enumerateFiles('test/live-chart-master');

    i := rc;
    WriteLn('File List:');
    while i^ <> nil do begin
      WriteLn(' ', i^);
      inc(i);
    end;
    PHYSFS_freeList(rc);
    PHYSFS_deinit;
  end;

begin
  main;
end.
