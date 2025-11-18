program project1;

// gphoto2 --auto-detect
// systemctl --user stop gvfs-daemon.service

uses
  fp_gphoto2;

  procedure PrintInfos(camera: PCamera);
  var
    ret: longint;
    summary: TCameraText;
  begin
    ret := gp_camera_get_summary(camera, @summary, nil);
    if ret < GP_OK then begin
      WriteLn('Fehler beim Auslesen der Kamera-Zusammenfassung.');
    end else begin
      WriteLn('Kamera Zusammenfassung: '#10, summary.text);
    end;
  end;

  procedure PrintFotos(camera: PCamera; context: PGPContext;path:PChar);
  var
    ret, count: longint;
    folders: PCameraList = nil;
    name: PChar;
    i: Integer;
  begin
    ret := gp_list_new(@folders);
    if ret < GP_OK then begin
      WriteLn('Konnte folders nicht erstellen');
      Exit;
    end;
    ret := gp_camera_folder_list_folders(camera, path, folders, context);
    if ret < GP_OK then begin
      WriteLn('Konnte folders nicht lesen');
      Exit;
    end;

    if folders <> nil then begin
      WriteLn('Ordner gefunden:');
      count := gp_list_count(folders);
      WriteLn('count:', count);
      for i := 0 to count - 1 do begin
          gp_list_get_name(folders,i,@name);
        WriteLn('  ', name);
      end;;
    end;
  end;

  procedure main;
  var
    ret: longint;
    camera: PCamera;
    context: PGPContext;
  begin
    context := gp_context_new;

    ret := gp_camera_new(@camera);
    if ret < GP_OK then begin
      WriteLn('Kamera konnte nicht erstellt werden');
      Exit;
    end;

    ret := gp_camera_init(camera, nil);
    if ret < GP_OK then begin
      WriteLn('Kamera konnte nicht initialisiert werden.');
      WriteLn('Folgendes auf der Konsole eingeben:');
      WriteLn('  systemctl --user stop gvfs-daemon.service');
      gp_camera_free(camera);
      Exit;
    end;

    PrintInfos(camera);
    PrintFotos(camera, context, '/');
    PrintFotos(camera, context, '/store_00010001');

    // Kamera freigeben
    gp_camera_exit(camera, nil);
    gp_camera_free(camera);
    gp_context_unref(context);
  end;

begin
  main;
end.
