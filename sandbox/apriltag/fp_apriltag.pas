unit fp_apriltag;

interface

const
  {$IFDEF Linux}
  libapriltag = 'apriltag';
  {$ENDIF}

  {$IFDEF Windows}
  libapriltag = 'apriltag.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
//  {$include fp_apriltag_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//{$include fp_apriltag_includes.inc}
{$UNDEF read_implementation}

end.

