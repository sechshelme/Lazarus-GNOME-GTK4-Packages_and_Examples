unit fp_GTK4;

interface

uses
  ctypes,
  fp_glib2, fp_graphene, fp_pango, fp_cairo, fp_gdk_pixbuf2, fp_GDK4, fp_GSK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_GTK4_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_GTK4_includes.inc}
{$UNDEF read_implementation}

end.
