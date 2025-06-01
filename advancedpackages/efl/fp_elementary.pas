unit fp_elementary;

interface

  uses
  efl,
  fp_eina,
  fp_eo,
  fp_efl,
  fp_evas,
  fp_ecore,
  fp_ecore_evas,
  fp_ethumb,
  fp_edje,
  fp_ecore_file,
  fp_eet;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_elementary_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_elementary_includes.inc}
{$UNDEF read_implementation}

end.

