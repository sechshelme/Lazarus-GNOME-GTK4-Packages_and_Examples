unit fp_girepository;


interface

uses
  fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/x86_64-linux-gnu/ffi.h
type
  Pffi_cif = type Pointer;
  Pffi_type=type Pointer;
  Pffi_closure=type Pointer;

const
  {$IFDEF Linux}
  libgirepository = 'girepository-1.0';
  {$ENDIF}

  {$IFDEF msWindows}
  libgirepository = 'girepository-1.0.dll'; // ?????
  {$ENDIF}

  {$DEFINE read_interface}
  //  {$include fp_girepository_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
//{$include fp_girepository_includes.inc}
{$UNDEF read_implementation}

end.
