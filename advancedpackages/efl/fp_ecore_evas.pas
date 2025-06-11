unit fp_ecore_evas;

interface

uses
  efl, fp_eina, fp_eo, fp_evas;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}
{$MACRO ON}

{$DEFINE includes:=
  {$include ecore-evas-1/Ecore_Evas_Types.inc}
  {$include ecore-evas-1/Ecore_Evas.inc}
}


{$DEFINE read_interface}
includes
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
includes
{$UNDEF read_implementation}

end.

