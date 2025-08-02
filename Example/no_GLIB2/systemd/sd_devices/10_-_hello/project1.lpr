program project1;

uses
  fp_systemd;

  procedure main;
  var
    r: longint;
    enumerator: Psd_device_enumerator = nil;
    device: Psd_device = nil;
    syspath, devname, model: pchar;
  begin
    r := sd_device_enumerator_new(@enumerator);
    if r < 0 then begin
      WriteLn('Failed to create enumerator: ', r);
      Halt(1);
    end;

    r := sd_device_enumerator_add_match_subsystem(enumerator, 'block', 1);
    if r < 0 then begin
      WriteLn('Failed to add subsystem match: ', r);
      sd_device_enumerator_unref(enumerator);
      Halt(1);
    end;

    device := sd_device_enumerator_get_device_first(enumerator);
    while device <> nil do begin
      sd_device_get_syspath(device, @syspath);
      sd_device_get_devname(device, @devname);
      sd_device_get_property_value(device, 'ID_MODEL', @model);

      WriteLn('Device: ', devname);
      WriteLn('  Sysfs Path: ', syspath);
      WriteLn('  Model: ', model, #10);

      device := sd_device_enumerator_get_device_next(enumerator);
    end;

    sd_device_enumerator_unref(enumerator);
  end;

begin
  main;
end.
