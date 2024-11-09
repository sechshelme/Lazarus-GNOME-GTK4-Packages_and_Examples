unit GTK4;

interface

uses
  ctypes, pango, cairo218, glib280, gdk2pixbuf, GDK4, GSK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include GTK4_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include GTK4_includes.inc}
{$UNDEF read_implementation}

end.
