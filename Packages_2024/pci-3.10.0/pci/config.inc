{$IFDEF read_interface}


const
  PCI_PATH_PROC_BUS_PCI = '/proc/bus/pci';
  PCI_PATH_SYS_BUS_PCI = '/sys/bus/pci';
  PCI_PATH_DEVMEM_DEVICE = '/dev/mem';
  PCI_PATH_ACPI_MCFG = '/sys/firmware/acpi/tables/MCFG';
  PCI_PATH_EFI_SYSTAB = '/sys/firmware/efi/systab';
  PCI_IDS = 'pci.ids.gz';
  PCI_PATH_IDS_DIR = '/usr/share/misc';
  PCI_ID_DOMAIN = 'pci.id.ucw.cz';
  PCILIB_VERSION = '3.10.0';

  // === Konventiert am: 28-6-25 19:49:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
