unit gweather_version;

interface

uses
  fp_gweather;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GWEATHER_MAJOR_VERSION = 4;
  GWEATHER_MINOR_VERSION = 4;
  GWEATHER_MICRO_VERSION = 2;
  GWEATHER_VERSION_ = '4.4.2';
  GWEATHER_VERSION_HEX = ((GWEATHER_MAJOR_VERSION shl 24) or (GWEATHER_MINOR_VERSION shl 16)) or (GWEATHER_MICRO_VERSION shl 8);

function GWEATHER_CHECK_VERSION(major, minor, micro: integer): boolean; inline;

// === Konventiert am: 18-6-26 17:08:05 ===


implementation

function GWEATHER_CHECK_VERSION(major, minor, micro: integer): boolean; inline;
begin
  Result := (GWEATHER_MAJOR_VERSION > major) or
    ((GWEATHER_MAJOR_VERSION = major) and (GWEATHER_MINOR_VERSION > minor)) or
    ((GWEATHER_MAJOR_VERSION = major) and (GWEATHER_MINOR_VERSION = minor) and
    (GWEATHER_MICRO_VERSION >= micro));
end;


end.
