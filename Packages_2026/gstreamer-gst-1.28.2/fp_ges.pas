unit fp_ges;

interface

uses
  fp_glib2, fp_gst, fp_gst_pbutils;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_enum}
  {$include fp_ges_includes.inc}
  {$UNDEF read_enum}

  {$DEFINE read_struct}
  {$include fp_ges_includes.inc}
  {$UNDEF read_struct}

  {$DEFINE read_function}
  {$include fp_ges_includes.inc}
  {$UNDEF read_function}

implementation

{$DEFINE read_implementation}
{$include fp_ges_includes.inc}
{$UNDEF read_implementation}

end.
