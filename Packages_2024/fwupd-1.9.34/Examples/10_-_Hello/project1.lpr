program project1;

uses
  fp_glib2,
  fp_fwupd;

  procedure main;
  var
    devices, guids: PGPtrArray;
    err: PGError = nil;
    dev: Tgpointer;
    name, version, id: Pgchar;
    i: integer;
    client: PFwupdClient;
  begin
    client := fwupd_client_new;
    devices := fwupd_client_get_devices(client, nil, @err);

    if devices = nil then begin
      g_printf('Fehler beim Abrufen der Geräte: %s'#10, err^.message);
      g_free(err);
    end;

    g_printf('Erkannte Hardware-Komponenten:'#10#10);
    for i := 0 to devices^.len - 1 do begin
      dev := g_ptr_array_index(devices, i);
      name := fwupd_device_get_name(dev);
      version := fwupd_device_get_version(dev);
      id := fwupd_device_get_id(dev);

      g_printf('%4d. %s (Version: %s) [ID: %s]'#10, i, name, version, id);

      guids := fwupd_device_get_guids(dev);
      if guids^.len > 0 then  begin
        g_printf('      GUID: %s'#10, g_ptr_array_index(guids, 0));
      end;
      g_printf(#10);
    end;
  end;

begin
  main;
end.
