program project1;

uses
  fp_hidapi,
  fp_hidapi_libusb;

const
  {$IFDEF linux}
  libc = 'c';
  {$ENDIF}

  {$IFDEF windows}
  libc = 'msvcrt.dll';
  {$ENDIF}


  function printf(__format: pchar): longint; cdecl; varargs; external libc;

  procedure main1;
  var
    vendor_id: word = $046d;
    product_id: word = $c050;
    handle: Phid_device;
    res: longint;
    wstr: array [0..255] of Twchar_t;
  begin
    if hid_init <> 0 then begin
      WriteLn('HIDAPI init fehlgeschlagen');
      exit;
    end;

    handle := hid_open(vendor_id, product_id, nil);
    if handle = nil then begin
      WriteLn('Gerät nicht gefunden oder kann nicht geöffnet werden');
      WriteLn('Versche es nochmals als "root"');
    end else begin
      res := hid_get_manufacturer_string(handle, wstr, Length(wstr));
      if res = 0 then begin
        printf('Hersteller: %ls'#10, @wstr);
      end;

      res := hid_get_product_string(handle, wstr, Length(wstr));
      if res = 0 then begin
        printf('Produkt:    %ls'#10, @wstr);
      end;

      hid_close(handle);
    end;
    hid_exit();
  end;

  procedure main2;
  var
    devs, cur_dev: Phid_device_info;
    handle: Phid_device;

    wstr: array[0..255] of Twchar_t;
    res: longint;

  begin
    if hid_init <> 0 then begin
      WriteLn('HIDAPI init fehlgeschlagen');
      exit;
    end;

    printf('Version: %s'#10#10, hid_version_str);

    printf('Suche Geräte...'#10);
    devs := hid_enumerate($0, $0);
    cur_dev := devs;
    while cur_dev <> nil do begin
      printf('Gefundenes Gerät:'#10);
      printf('  VID=0x%04hx, PID=0x%04hx'#10, cur_dev^.vendor_id, cur_dev^.product_id);

      if cur_dev^.manufacturer_string <> nil then begin
        printf('  Hersteller: %ls'#10, cur_dev^.manufacturer_string);
      end else begin
        printf('  Hersteller: (nicht verfügbar)'#10);
      end;

      if cur_dev^.product_string <> nil then begin
        printf('  Produkt: %ls'#10, cur_dev^.product_string);
      end else begin
        handle := hid_open_path(cur_dev^.path);
        if handle <> nil then begin
          res := hid_get_product_string(handle, wstr, Length(wstr));
          if (res = 0) and (wstr[0] <> 0) then begin
            printf('  Produkt: %ls'#10, @wstr);
          end else begin
            printf('  Produkt: (nicht verfügbar)'#10);
          end;
          hid_close(handle);
        end else begin
          printf('  Produkt: (konnte nicht geöffnet werden)'#10);
        end;
      end;

      printf('Page Usage: %d    Usage: %d'#10, cur_dev^.usage_page, cur_dev^.usage);

      // Joystick-spezifische Usage Page/Usage prüfen
      if (cur_dev^.usage_page = $01) and
        ((cur_dev^.usage = $04) or (cur_dev^.usage = $05)) then begin
        printf('  >> Joystick oder Gamepad erkannt <<'#10);
      end;

      printf(#10);
      cur_dev := cur_dev^.next;
    end;

    hid_free_enumeration(devs);
    hid_exit();
  end;




begin
  main1;
  main2;
end.
