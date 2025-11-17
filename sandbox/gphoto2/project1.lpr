program project1;

uses
  fp_gphoto2;

  procedure main;
  var
    ret: longint;
    camera: PCamera;
    summary: TCameraText;
  begin
    ret := gp_camera_new(@camera);
    if ret < GP_OK then begin
      WriteLn('Kamera konnte nicht erstellt werden');
      Exit;
    end;

    // Kamera initialisieren
    ret := gp_camera_init(camera, nil);
    if ret < GP_OK then begin
      WriteLn('Kamera konnte nicht initialisiert werden.');
      gp_camera_free(camera);
      Exit;
    end;

    // Zusammenfassung (Summary) der Kamera auslesen
    ret := gp_camera_get_summary(camera, @summary, nil);
    if ret < GP_OK then begin
      WriteLn('Fehler beim Auslesen der Kamera-Zusammenfassung.');
    end else begin
      WriteLn('Kamera Zusammenfassung: ', summary.text);
    end;

    // Kamera freigeben
    gp_camera_exit(camera, nil);
    gp_camera_free(camera);
  end;

begin
  main;
end.
