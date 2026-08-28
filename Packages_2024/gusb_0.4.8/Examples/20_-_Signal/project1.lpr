program project1;

uses
  fp_gusb,
  fp_glib2;

  procedure on_device_added(context: PGUsbContext; device: PGUsbDevice; user_data: Tgpointer);   cdecl;
  begin
    g_print('Ein USB-Gerät wurde eingesteckt !'#10);
    g_print('Vendor ID: 0x%04x, Product ID: 0x%04x'#10, g_usb_device_get_vid(device), g_usb_device_get_pid(device));
  end;

  procedure on_device_removed(context: PGUsbContext; device: PGUsbDevice; user_data: Tgpointer);  cdecl;
  begin
    g_print('Ein USB-Gerät wurde entfernt !'#10);
    g_print('Vendor ID: 0x%04x, Product ID: 0x%04x'#10, g_usb_device_get_vid(device), g_usb_device_get_pid(device));
  end;

  procedure main;
  var
    context: PGUsbContext;
    err: PGError = nil;
    loop: PGMainLoop;
  begin
    loop := g_main_loop_new(nil, False);

    context := g_usb_context_new(@err);
    if context = nil then begin
      g_printerr('Fehler beim Erstellen des USB-Kontexts: %s'#10, err^.message);
      g_clear_error(@err);
      Exit;
    end;

    g_usb_context_enumerate (context);

    g_signal_connect(context, 'device-added', G_CALLBACK(@on_device_added), nil);
    g_signal_connect(context, 'device-removed', G_CALLBACK(@on_device_removed), nil);

    g_main_loop_run(loop);

    g_object_unref(context);
    g_main_loop_unref(loop);
  end;

begin
  main;
end.
