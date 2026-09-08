unit fp_xrl;

interface

const
  {$IFDEF Linux}
  libxrl = 'xrl';
  {$ENDIF}

  {$IFDEF Windows}
  libxrl = 'libxrl-11.dll';
  {$ENDIF}

  type
  Tsize_t=SizeUInt;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
//  {$include fp_xrl_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//{$include fp_xrl_includes.inc}
{$UNDEF read_implementation}

end.

