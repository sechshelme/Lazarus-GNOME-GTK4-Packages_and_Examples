unit fp_adwaita;

interface

uses
  ctypes, fp_glib2, fp_pango, fp_GDK4, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_adwaita_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_adwaita_includes.inc}
{$UNDEF read_implementation}

end.

