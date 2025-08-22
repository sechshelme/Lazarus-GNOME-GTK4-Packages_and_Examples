program project1;

uses
  fp_hidapi,
  fp_hidapi_libusb;


  function wprintf(format: Pwchar_t): integer; cdecl; varargs; external 'c';

  procedure main;
  const
    ls: array[0..19] of char = ('%', #0, #0, #0, 'l', #0, #0, #0, 's', #0, #0, #0, #10, #0, #0, #0, #0, #0, #0, #0);
  var
    vendor_id: word = $046d;
    product_id: word = $c050;
    handle: Phid_device;
    res: longint;
    wstr: array [0..11255] of Twchar_t;
  begin
    if hid_init <> 0 then begin
      WriteLn('HIDAPI init fehlgeschlagen');
      exit;
    end;

    handle := hid_open(vendor_id, product_id, nil);
    if handle = nil then begin
      WriteLn('Gerät nicht gefunden oder kann nicht geöffnet werden');
      hid_exit;
      exit;
    end;

    res := hid_get_manufacturer_string(handle, wstr, Length(wstr));
    if res = 0 then begin
      Write('Hersteller: ');
      wprintf(@ls[0], @wstr);
    end;

    res := hid_get_product_string(handle, wstr, Length(wstr));
    if res = 0 then begin
      Write('Product: ');
      wprintf(@ls[0], @wstr);
    end;

    hid_close(handle);
    hid_exit();
  end;



begin
  main;
end.
