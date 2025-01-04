unit fp_JSC;

interface

uses
  ctypes, fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_jsc_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_jsc_includes.inc}
{$UNDEF read_implementation}

end.

