unit fp_gweather;

interface

uses
  fp_glib2;

const
  {$IFDEF Linux}
  libgweather = 'gweather-4';
  {$ENDIF}

  {$IFDEF Windows}
  libgweather = 'libgweather-4-0.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include gweather/gweather_version.inc}
  {$include gweather/gweather_enums.inc}
  {$include gweather/gweather_enum_types.inc}
  {$include gweather/gweather_location.inc}
  {$include gweather/gweather_info.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gweather/gweather_version.inc}
{$include gweather/gweather_enums.inc}
{$include gweather/gweather_enum_types.inc}
{$include gweather/gweather_location.inc}
{$include gweather/gweather_info.inc}
{$UNDEF read_implementation}

end.
