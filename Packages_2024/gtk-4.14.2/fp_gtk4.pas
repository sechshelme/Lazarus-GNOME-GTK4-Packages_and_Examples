unit fp_GTK4;

interface

uses
  {$IFDEF Linux}
  x, xlib,
  {$ENDIF}
  fp_glib2, fp_graphene, fp_pango, fp_cairo, fp_gdk_pixbuf2;

  // ==== GTK4
const
  {$IFDEF Linux}
  libgtk4 = 'gtk-4';
  {$ENDIF}

  {$IFDEF Windows}
  libgtk4 = 'libgtk-4-1.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}

  {$include fp_GDK4_includes.inc}
  {$include fp_GSK4_includes.inc}
  {$include fp_GTK4_includes.inc}

  {$IFDEF Linux}
  {$include unix-print/gtk/print/gtkpagesetupunixdialog.inc }
  {$include unix-print/gtk/print/gtkprinter.inc }
  {$include unix-print/gtk/print/gtkprintunixdialog.inc }
  {$include unix-print/gtk/print/gtkprintjob.inc }
  {$ENDIF}

  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}

{$include fp_GDK4_includes.inc}
{$include fp_GSK4_includes.inc}
{$include fp_GTK4_includes.inc}

{$IFDEF Linux}
{$include unix-print/gtk/print/gtkpagesetupunixdialog.inc }
{$include unix-print/gtk/print/gtkprinter.inc }
{$include unix-print/gtk/print/gtkprintunixdialog.inc }
{$include unix-print/gtk/print/gtkprintjob.inc }
{$ENDIF}

{$UNDEF read_implementation}

end.
