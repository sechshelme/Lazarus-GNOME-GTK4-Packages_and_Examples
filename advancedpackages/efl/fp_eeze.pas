unit fp_eeze;

interface

uses
  efl, fp_eina, fp_ecore;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}
  {$include eeze-1/Eeze.inc}
  {$include eeze-1/Eeze_Disk.inc}
  {$include eeze-1/Eeze_Net.inc}
  {$include eeze-1/Eeze_Sensor.inc}
  {$include eeze-1/eeze_scanner.inc}
{$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
  {$include eeze-1/Eeze.inc}
  {$include eeze-1/Eeze_Disk.inc}
  {$include eeze-1/Eeze_Net.inc}
  {$include eeze-1/Eeze_Sensor.inc}
  {$include eeze-1/eeze_scanner.inc}
{$UNDEF read_implementation}

end.

