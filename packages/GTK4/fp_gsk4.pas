unit fp_GSK4;

//{$modeswitch typehelpers}

interface

uses
  ctypes, gdk2pixbuf, glib280, Cairo, pango, fp_GDK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_GSK4_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_GSK4_includes.inc}
{$UNDEF read_implementation}

end.
