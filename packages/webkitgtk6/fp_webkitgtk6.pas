unit fp_webkitgtk6;

interface

uses
  ctypes, fp_gdk4, fp_gtk4, fp_glib2, fp_JSC;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_webkitgtk6_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_webkitgtk6_includes.inc}
{$UNDEF read_implementation}

end.

