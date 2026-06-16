program project1;

uses
  fp_pci;

  procedure main;
  var
    pacc: Ppci_access;
    dev: Ppci_dev;
    namebuf: array[0..1023] of char;
    name: pchar;
  begin
    WriteLn('libpci Version: %d'#10, PCI_LIB_VERSION);

    pacc := pci_alloc;
    pci_init(pacc);
    pci_scan_bus(pacc);

    dev := pacc^.devices;
    while dev <> nil do begin
      pci_fill_info(dev, PCI_FILL_IDENT or PCI_FILL_BASES);
      WriteLn('Bus ', dev^.bus,' - ', dev^.dev,' - ', dev^.func);
      WriteLn('  Vendor / Device: ','  ', dev^.vendor_id,' / ', dev^.device_id);
      name := pci_lookup_name(pacc, namebuf, SizeOf(namebuf), PCI_LOOKUP_VENDOR, dev^.vendor_id);
      WriteLn('  Hersteller: ', name);
      name := pci_lookup_name(pacc, namebuf, SizeOf(namebuf), PCI_LOOKUP_DEVICE, dev^.vendor_id, dev^.device_id);
      WriteLn('  Geräte-Name: ', name);
      dev := dev^.next;
    end;

    pci_cleanup(pacc);
  end;

begin
  main;
end.
