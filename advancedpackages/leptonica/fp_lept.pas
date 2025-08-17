unit fp_lept;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  {$IFDEF Linux}
  libleptb = 'liblept';
  {$ENDIF}

  {$IFDEF msWindows}
  libleptb = 'libleptonica-6.dll';
  {$ENDIF}

  type
  Tsize_t=SizeInt;
  Psize_t=^Tsize_t;

  PFILE=type Pointer;

  {$DEFINE read_interface}
  {$include fp_leptonica_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_leptonica_includes.inc}
{$UNDEF read_implementation}

end.
