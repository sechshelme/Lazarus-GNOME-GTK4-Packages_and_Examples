unit fp_ecore_evas;

interface

uses
  efl, fp_eina, fp_eo, fp_evas;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}

{$include ecore-evas-1/Ecore_Evas_Types.inc}
{$include ecore-evas-1/Ecore_Evas.inc}

{$UNDEF read_interface}


implementation

{$DEFINE read_implementation}

{$include ecore-evas-1/Ecore_Evas_Types.inc}
{$include ecore-evas-1/Ecore_Evas.inc}

{$UNDEF read_implementation}

end.

