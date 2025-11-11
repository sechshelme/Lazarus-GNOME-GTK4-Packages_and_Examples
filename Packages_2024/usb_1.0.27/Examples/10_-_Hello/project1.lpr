program project1;

uses
  fp_libusb;

  procedure PrintVersion;
  var
    version: Plibusb_version;
  begin
    version := libusb_get_version;
    with version^ do begin
      WriteLn('Version: ', major, '.', minor, '.', micro, '.', nano, #10);
    end;
  end;


  procedure ListDevices;
  var
    ctx: Plibusb_context = nil;
    cnt: Tssize_t;
    devs: PPlibusb_device;
    desc: Tlibusb_device_descriptor;
    r: longint;
    i: integer;
  begin
    r := libusb_init(@ctx);
    if r < 0 then begin
      WriteLn('Fehler bei libusb_init: ', libusb_error_name(r));
      Exit;
    end;

    cnt := libusb_get_device_list(ctx, @devs);
    if cnt < 0 then begin
      WriteLn('Fehler beim Abrufen der Geräteliste: ', libusb_error_name(cnt));
      libusb_exit(ctx);
      Exit;;
    end;

    WriteLn('Gefundene USB-Geräte: ', cnt);

    for  i := 0 to cnt - 1 do begin
      r := libusb_get_device_descriptor(devs[i], @desc);
      if r < 0 then begin
        WriteLn('Fehler beim Lesen des Device Descriptors: ', libusb_error_name(r));
        continue;
      end;

      WriteLn('Device ', i: 4, ': VendorID = ', desc.idVendor: 6, '   ProductID = ', desc.idProduct: 6, '   Klasse = ', desc.bDeviceClass: 4);
    end;

    libusb_free_device_list(devs, 1);
    libusb_exit(ctx);
  end;

  procedure main;
  begin
    PrintVersion;
    ListDevices;
  end;

begin
  main;
end.
