unit fp_ecore_con;

interface

  uses
    efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_ecore_con_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_ecore_con_includes.inc}
{$UNDEF read_implementation}

end.

