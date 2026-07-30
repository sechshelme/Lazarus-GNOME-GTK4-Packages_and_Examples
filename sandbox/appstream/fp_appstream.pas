unit fp_appstream;

interface

const
  {$IFDEF Linux}
  libappstream = 'appstream';
  {$ENDIF}

  {$IFDEF Windows}
  {$FATAL  no supported}
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  //{$include fp_appstream_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//{$include fp_appstream_includes.inc}
{$UNDEF read_interface}

end.

