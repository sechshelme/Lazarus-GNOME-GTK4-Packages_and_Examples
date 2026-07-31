unit fp_appstream;

interface

uses
  fp_glib2;

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

  {$DEFINE read_enum}
  {$include fp_appstream_includes.inc}
  {$UNDEF read_enum}

  {$DEFINE read_struct}
  {$include fp_appstream_includes.inc}
  {$UNDEF read_struct}

  {$DEFINE read_function}
  {$include fp_appstream_includes.inc}
  {$UNDEF read_function}

implementation

{$DEFINE read_implementation}
{$include fp_appstream_includes.inc}
{$UNDEF read_interface}

end.
