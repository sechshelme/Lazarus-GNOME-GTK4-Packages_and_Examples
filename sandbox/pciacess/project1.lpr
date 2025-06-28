program project1;

uses
  pciaccess;

  function printf(__format: pchar): longint; cdecl; varargs; external 'c';

  procedure main;
  var
    err: longint;
    iter: Ppci_device_iterator;
    dev: Ppci_device;
  begin
    err := pci_system_init;
    if err <> 0 then begin
      WriteLn('PCI Init failed: ', err);
      Exit;
    end;

    iter := pci_id_match_iterator_create(nil);
    repeat
      dev := pci_device_next(iter);
      if dev <> nil then begin
        printf('PCI-Gerät: Bus %02x, Gerät %02x, Funktion %x'#10, dev^.bus, dev^.dev, dev^.func);
        printf('  Vendor-ID: 0x%04x, Device-ID: 0x%04x'#10, dev^.vendor_id, dev^.device_id);
        printf(#10);
      end;
    until dev = nil;
    pci_iterator_destroy(iter);

  end;

begin
  main;
end.
