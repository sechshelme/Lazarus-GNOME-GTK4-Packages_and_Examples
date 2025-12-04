unit fp_adapta;

interface

uses
fp_GTK4;

const
  {$IFDEF Linux}
  libadapta = 'adapta-1';
  {$ENDIF}

  {$IFDEF Windows}
  libadapta = 'adapta-1-0.dll';  // ??????
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
//  {$include fp_GTK4_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
//{$include fp_GTK4_includes.inc}
{$UNDEF read_implementation}

end.

