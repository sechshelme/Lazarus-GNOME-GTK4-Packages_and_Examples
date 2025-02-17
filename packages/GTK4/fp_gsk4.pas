unit fp_GSK4;

//{$modeswitch typehelpers}

interface

uses
  ctypes,
  fp_glib2, fp_graphene, fp_pango, fp_cairo, fp_GDK4;

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
