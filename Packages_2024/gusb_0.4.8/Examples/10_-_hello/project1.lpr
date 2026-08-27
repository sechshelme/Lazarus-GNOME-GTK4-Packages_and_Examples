program project1;

uses
  fp_gusb,
  fp_glib2;

  procedure main;
  var
    context: PGUsbContext;
    err: PGError = nil;
    devices: PGPtrArray;
    i: integer;
    device: Tgpointer;
    vid, pid: Tguint16;
    manufacturer_idx, product_idx: Tguint8;
    manufacturer, product: Pgchar;
  begin
    g_print('Initialisiere libgusb Kontext...'#10);

    context := g_usb_context_new(@err);
    if context = nil then begin
      g_printerr('Fehler beim Erstellen des USB-Kontexts: %s'#10, err^.message);
      g_clear_error(@err);
      Exit;
    end;

    devices := g_usb_context_get_devices(context);
    if (devices = nil) or (devices^.len = 0) then begin
      g_print('Keine USB-Geräte gefunden.'#10);
      if devices <> nil then begin
        g_ptr_array_unref(devices);
      end;
      g_object_unref(context);
      Exit;
    end;

    g_print('Gefundene USB-Geräte: %u'#10, devices^.len);
    g_print('--------------------------------------------------'#10);

    for i := 0 to devices^.len - 1 do begin
      device := g_ptr_array_index(devices, i);

      vid := g_usb_device_get_vid(device);
      pid := g_usb_device_get_pid(device);

      manufacturer_idx := g_usb_device_get_manufacturer_index(device);
      product_idx := g_usb_device_get_product_index(device);

      manufacturer := nil;
      product := nil;

      if not g_usb_device_open(device, @err) then begin
        if err <> nil then begin
          g_clear_error(@err);
        end;
      end;

      if manufacturer_idx > 0 then begin
        manufacturer := g_usb_device_get_string_descriptor(device, manufacturer_idx, nil);
      end;
      if product_idx > 0 then begin
        product := g_usb_device_get_string_descriptor(device, product_idx, nil);
      end;

      g_usb_device_close(device, nil);

      g_print('[%02u] ID %04x:%04x | %s - %s'#10, i + 1, vid, pid, manufacturer, product);

      if manufacturer <> nil then begin g_free(manufacturer); end;
      if product <> nil then begin g_free(product); end;
    end;

    g_print('--------------------------------------------------'#10);

    g_ptr_array_unref(devices);
    g_object_unref(context);
  end;

begin
  main;
end.
