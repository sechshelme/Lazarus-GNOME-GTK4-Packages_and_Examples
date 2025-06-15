unit fp_ecore_x;

interface

uses
  efl, fp_eina;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}
  {$include ecore-x-1/Ecore_X.inc}
  {$include ecore-x-1/Ecore_X_Atoms.inc}
  {$include ecore-x-1/Ecore_X_Cursor.inc}
{$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
  {$include ecore-x-1/Ecore_X.inc}
  {$include ecore-x-1/Ecore_X_Atoms.inc}
  {$include ecore-x-1/Ecore_X_Cursor.inc}
{$UNDEF read_implementation}

end.

