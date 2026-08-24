unit fp_hdf5_serial_hl;

interface

uses
  fp_hdf5_serial;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include hdf5/H5TBpublic.inc}
  {$include hdf5/H5LTpublic.inc}
  {$include hdf5/H5IMpublic.inc}
  {$include hdf5/H5PTpublic.inc}
  {$include hdf5/H5DSpublic.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include hdf5/H5TBpublic.inc}
{$include hdf5/H5LTpublic.inc}
{$include hdf5/H5IMpublic.inc}
{$include hdf5/H5PTpublic.inc}
{$include hdf5/H5DSpublic.inc}
{$UNDEF read_implementation}

end.
