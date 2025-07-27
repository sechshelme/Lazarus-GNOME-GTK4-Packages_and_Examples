program project1;

uses
  fp_stdio,
  fp_pci;

  procedure main;
  var
    pacc: Ppci_access;
    dev: Ppci_dev;
    namebuf: array[0..1023] of char;
    name: pchar;
  begin
    printf('libpci Version: %d'#10, PCI_LIB_VERSION);

    pacc := pci_alloc;
    pci_init(pacc);
    pci_scan_bus(pacc);

    dev := pacc^.devices;
    while dev <> nil do begin
      pci_fill_info(dev, PCI_FILL_IDENT or PCI_FILL_BASES);
      printf('Bus %2.2x:%2.2x.%d'#10, dev^.bus, dev^.dev, dev^.func);
      printf('  Vendor: 0x%.4x, Device: 0x%.4x'#10, dev^.vendor_id, dev^.device_id);
      name := pci_lookup_name(pacc, namebuf, SizeOf(namebuf), PCI_LOOKUP_VENDOR, dev^.vendor_id);
      printf('  Hersteller: %s'#10, name);
      name := pci_lookup_name(pacc, namebuf, SizeOf(namebuf), PCI_LOOKUP_DEVICE, dev^.vendor_id, dev^.device_id);
      printf('  Geräte-Name: %s'#10#10, name);
      dev := dev^.next;
    end;

    pci_cleanup(pacc);
  end;

begin
  main;
end.
