unit fp_harfbuzz;

interface

uses
  ctypes, fp_cairo, fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_harfbuzz_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_harfbuzz_includes.inc}
{$UNDEF read_implementation}

end.

