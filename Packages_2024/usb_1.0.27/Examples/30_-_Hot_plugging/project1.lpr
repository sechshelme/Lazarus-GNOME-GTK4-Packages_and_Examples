program project1;

uses
  crt,
  fp_libusb;

  function hotplug_callback(ctx: Plibusb_context; device: Plibusb_device; event: Tlibusb_hotplug_event; user_data: pointer): longint; cdecl;
  var
    desc: Tlibusb_device_descriptor;
  begin
    libusb_get_device_descriptor(device, @desc);

    case event of
      LIBUSB_HOTPLUG_EVENT_DEVICE_ARRIVED: begin
        WriteLn('USB Gerät angeschlossen: VID=', desc.idVendor, ' PID=', desc.idProduct);
      end;
      LIBUSB_HOTPLUG_EVENT_DEVICE_LEFT: begin
        WriteLn('USB Gerät entfernt: VID=', desc.idVendor, ' PID=', desc.idProduct);
      end;
    end;

    Result := 0;
  end;

  procedure ListDevices;
  var
    r, completed: longint;
    ctx: Plibusb_context = nil;
    handle: Tlibusb_hotplug_callback_handle;
    tv: Ttimeval = (tv_sec: 0; tv_usec: 100000);
  begin
    r := libusb_init(@ctx);
    if r < 0 then begin
      WriteLn('Fehler bei libusb_init: ', libusb_error_name(r));
      Exit;
    end;

    if libusb_has_capability(LIBUSB_CAP_HAS_HOTPLUG) = 0 then begin
      WriteLn('Hotplug wird von dieser libusb-Version/Plattform nicht unterstützt.');
      libusb_exit(ctx);
      Exit;
    end;

    r := libusb_hotplug_register_callback(ctx,
      LIBUSB_HOTPLUG_EVENT_DEVICE_ARRIVED or LIBUSB_HOTPLUG_EVENT_DEVICE_LEFT, 0,
      LIBUSB_HOTPLUG_MATCH_ANY, LIBUSB_HOTPLUG_MATCH_ANY, LIBUSB_HOTPLUG_MATCH_ANY,
      @hotplug_callback, nil, @handle);

    if r <> LIBUSB_SUCCESS then begin
      WriteLn('Fehler beim Registrieren des Callbacks: ', r);
      libusb_exit(ctx);
      Exit;
    end;

    WriteLn('Taste = Beenden');

    completed := 0;;
    repeat
      Write('.');
      libusb_handle_events_timeout_completed(ctx, @tv, @completed);
    until KeyPressed;

    libusb_hotplug_deregister_callback(ctx, handle);
    libusb_exit(ctx);
  end;

  procedure main;
  begin
    ListDevices;
  end;

begin
  main;
end.
