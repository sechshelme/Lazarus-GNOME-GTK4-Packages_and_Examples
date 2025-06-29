unit fp_pci;

interface

const
  {$ifdef linux}
  libpci = 'libpci';
  {$endif}

type
  Ppci_property = Pointer; // ??????
  Pid_bucket = Pointer;
  Pudev = Pointer;
  Pudev_hwdb = Pointer;
  Pid_entry = Pointer;
  PPid_entry = ^Pid_entry;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_pci_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_pci_includes.inc}
{$UNDEF read_interface}

end.
