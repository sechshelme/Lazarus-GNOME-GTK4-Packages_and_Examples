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
    handle: Plibusb_device_handle;
    buf: array[0..255] of char;
    device: Plibusb_device;
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
      device := devs[i];
      r := libusb_get_device_descriptor(device, @desc);
      if r < 0 then begin
        WriteLn('Fehler beim Lesen des Device Descriptors: ', libusb_error_name(r));
        continue;
      end;

      WriteLn('Device ', i: 4, ': VendorID = ', desc.idVendor: 6, '   ProductID = ', desc.idProduct: 6, '   Klasse = ', desc.bDeviceClass: 4);

      r := libusb_open(device, @handle);
      if (r = 0) and (handle <> nil) then begin

        if desc.iManufacturer <> 0 then begin
          r := libusb_get_string_descriptor_ascii(handle, desc.iManufacturer, @buf, sizeof(buf));
          if r > 0 then begin
            WriteLn('  Hersteller: ', buf);
          end;
        end;

        if desc.iProduct <> 0 then begin
          r := libusb_get_string_descriptor_ascii(handle, desc.iProduct, @buf, sizeof(buf));
          if r > 0 then begin
            WriteLn('  Produkt: ', buf);
          end;
        end;

        if desc.iSerialNumber <> 0 then begin
          r := libusb_get_string_descriptor_ascii(handle, desc.iSerialNumber, @buf, sizeof(buf));
          if r > 0 then begin
            WriteLn('  Seriennummer: ', buf);
          end;
        end;

        libusb_close(handle);
      end else begin
        WriteLn('  Kann Device nicht öffnen, Programm als "root" ausführen');
      end;
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
