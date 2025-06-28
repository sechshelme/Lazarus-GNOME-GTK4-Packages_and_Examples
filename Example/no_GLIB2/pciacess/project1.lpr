program project1;

uses
  fp_pciaccess;

  function printf(__format: pchar): longint; cdecl; varargs; external 'c';

  procedure main;
  var
    err: longint;
    iter: Ppci_device_iterator;
    dev: Ppci_device;
    i: integer;
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
        printf('  Class: 0x%06x, Revision: 0x%02x'#10, dev^.device_class, dev^.revision);
        printf('  Subsystem Vendor: 0x%04x, Subsystem Device: 0x%04x'#10, dev^.subvendor_id, dev^.subdevice_id);
        printf('  IRQ: %d\n', dev^.irq);

        // BARs ausgeben
        for  i := 0 to 5 do begin
          if dev^.regions[i].size > 0 then begin
            printf('  BAR%d: 0x%016llx (size: 0x%llx)'#10, i,
              dev^.regions[i].base_addr, dev^.regions[i].size);
          end;
        end;
        printf(#10);
      end;
    until dev = nil;
    pci_iterator_destroy(iter);
    pci_system_cleanup;

  end;

begin
  main;
end.
