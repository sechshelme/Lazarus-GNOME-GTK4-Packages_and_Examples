unit fp_gmime3;

interface

uses
  fp_glib2;

const
  {$IFDEF Linux}
  libgmime3 = 'libgmime-3.0';
  {$ENDIF}

  {$IFDEF Windows}
  libgmime3 = 'libgmime-3.0.dll';  // ???????'
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tsize_t=SizeUInt;
  Psize_t=^Tsize_t;

  {$DEFINE read_interface}
//  {$include fp_gmime3_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
//{$include fp_gmime3_includes.inc}
{$UNDEF read_implementation}

end.
