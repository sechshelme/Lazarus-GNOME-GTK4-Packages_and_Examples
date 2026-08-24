unit fp_hdf5_openmpi;

interface

uses
  fp_hdf5_serial;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include hdf5/H5FDmpi.inc}
  {$include hdf5/H5FDmpio.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include hdf5/H5FDmpi.inc}
{$include hdf5/H5FDmpio.inc}
{$UNDEF read_implementation}

end.
