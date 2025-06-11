unit fp_edje;

interface

  uses
    efl, fp_eo, fp_eina, fp_evas;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_edje_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_edje_includes.inc}
{$UNDEF read_implementation}

end.

