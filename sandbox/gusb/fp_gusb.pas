unit fp_gusb;

interface

uses
  fp_glib2;

const
  {$IFDEF Linux}
  libgusb = 'gusb-1.0';
  {$ENDIF}

  {$IFDEF Windows}
  libgusb = 'libgusb-2.dll';
  {$ENDIF}


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

