unit fp_ges;

interface

uses
  fp_glib2,
  fp_gst,
  fp_gst_pbutils;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_ges_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_ges_includes.inc}
{$UNDEF read_implementation}

end.
