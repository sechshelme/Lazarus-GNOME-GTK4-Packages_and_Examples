unit fp_pango;

//{$modeswitch typehelpers}

interface

uses
  {$IFDEF Linux}
  x, xlib,
  {$ENDIF}
  ctypes, fp_glib2, fp_cairo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_pango_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_pango_includes.inc}
{$UNDEF read_implementation}

end.

