unit fp_gtksourceview;

interface

uses
  fp_glib2, fp_GDK4, fp_gdk_pixbuf2, fp_GTK4, fp_pango;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_gtksourceview_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_gtksourceview_includes.inc}
{$UNDEF read_implementation}

end.

