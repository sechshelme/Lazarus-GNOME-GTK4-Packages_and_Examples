unit fp_libgtop2;

interface

uses
fp_glib2;

const
  {$IFDEF unix}
  libgtop2 = 'libgtop.2.0';
  {$ENDIF}

  {$IFDEF mswindows}
  libgtop2 = 'libgtop.2.0.dll'; // ?????
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}
type
  Tgid_t=UInt32;

  {$DEFINE read_interface}
//  {$include fp_libgtop2_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//{$include fp_libgtop2_includes.inc}
{$UNDEF read_interface}

end.

