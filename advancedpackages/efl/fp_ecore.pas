unit fp_ecore;

interface

  uses
    efl, fp_eo, fp_eina, fp_efl, fp_emile;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_ecore_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_ecore_includes.inc}
{$UNDEF read_implementation}

end.

