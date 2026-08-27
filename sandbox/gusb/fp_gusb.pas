unit fp_gusb;

interface

uses
  fp_glib2;

const
  {$IFDEF Linux}
  libgusb = 'gusb';
  {$ENDIF}

  {$IFDEF Windows}
  libgusb = 'libgusb-2.dll';
  {$ENDIF}

  type
  PJsonObject=type Pointer;
  PJsonBuilder=type Pointer;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
//  {$include fp_chafa_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//{$include fp_chafa_includes.inc}
{$UNDEF read_implementation}
end.

