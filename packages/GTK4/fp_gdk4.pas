unit fp_GDK4;

//{$modeswitch typehelpers}

interface

uses
  {$IFDEF Linux}
  x, xlib,
  {$ENDIF}
  ctypes,
  fp_glib2, fp_graphene, fp_pango, fp_gdk_pixbuf2, fp_cairo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_GDK4_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_GDK4_includes.inc}
{$UNDEF read_implementation}

end.

