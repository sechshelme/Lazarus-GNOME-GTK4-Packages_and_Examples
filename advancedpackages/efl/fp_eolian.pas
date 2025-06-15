unit fp_eolian;

interface

uses
  efl, fp_eina;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}
  {$include eolian-1/Eolian.inc}
  {$include eolian-1/Eolian_Aux.inc}
{$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
  {$include eolian-1/Eolian.inc}
  {$include eolian-1/Eolian_Aux.inc}
{$UNDEF read_implementation}

end.

