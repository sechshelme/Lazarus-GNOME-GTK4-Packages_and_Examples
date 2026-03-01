program project1;

uses
  fp_laszip;

  procedure main;
  var
    major, minor: Tlaszip_U8;
    revision: Tlaszip_U16;
    build: Tlaszip_U32;
    p: Tlaszip_POINTER = nil;
    res: Tlaszip_I32;
    error_msg: Plaszip_CHAR;
  begin
    laszip_get_version(@major, @minor, @revision, @build);
    WriteLn('LASzip Version: ', major, '.', minor, '.', revision, '.', build);

    res := laszip_create(@p);
    if res <> 0 then begin
      laszip_get_error(p, @error_msg);
      WriteLn('Fehler beim Erstellen: ', error_msg);
      Exit;
    end;

    WriteLn('LASzip Objekt erfolgreich erstellt.');

    laszip_clean(p);
    laszip_destroy(p);

    WriteLn('Objekt zerstört. Beende Programm.');
  end;

begin
  main;
end.
