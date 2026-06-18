{$IFDEF read_interface}


function gweather_temperature_unit_get_type: TGType; cdecl; external libgweather;
function GWEATHER_TYPE_TEMPERATURE_UNIT: TGType;

function gweather_speed_unit_get_type: TGType; cdecl; external libgweather;
function GWEATHER_TYPE_SPEED_UNIT: TGType;

function gweather_pressure_unit_get_type: TGType; cdecl; external libgweather;
function GWEATHER_TYPE_PRESSURE_UNIT: TGType;

function gweather_distance_unit_get_type: TGType; cdecl; external libgweather;
function GWEATHER_TYPE_DISTANCE_UNIT: TGType;

function gweather_format_options_get_type: TGType; cdecl; external libgweather;
function GWEATHER_TYPE_FORMAT_OPTIONS: TGType;

function gweather_provider_get_type: TGType; cdecl; external libgweather;
function GWEATHER_TYPE_PROVIDER: TGType;

function gweather_wind_direction_get_type: TGType; cdecl; external libgweather;
function GWEATHER_TYPE_WIND_DIRECTION: TGType;

function gweather_sky_get_type: TGType; cdecl; external libgweather;
function GWEATHER_TYPE_SKY: TGType;

function gweather_phenomenon_get_type: TGType; cdecl; external libgweather;
function GWEATHER_TYPE_PHENOMENON: TGType;

function gweather_qualifier_get_type: TGType; cdecl; external libgweather;
function GWEATHER_TYPE_QUALIFIER: TGType;

function gweather_location_level_get_type: TGType; cdecl; external libgweather;
function GWEATHER_TYPE_LOCATION_LEVEL: TGType;


// === Konventiert am: 18-6-26 17:07:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GWEATHER_TYPE_TEMPERATURE_UNIT: TGType;
begin
  GWEATHER_TYPE_TEMPERATURE_UNIT := gweather_temperature_unit_get_type;
end;

function GWEATHER_TYPE_SPEED_UNIT: TGType;
begin
  GWEATHER_TYPE_SPEED_UNIT := gweather_speed_unit_get_type;
end;

function GWEATHER_TYPE_PRESSURE_UNIT: TGType;
begin
  GWEATHER_TYPE_PRESSURE_UNIT := gweather_pressure_unit_get_type;
end;

function GWEATHER_TYPE_DISTANCE_UNIT: TGType;
begin
  GWEATHER_TYPE_DISTANCE_UNIT := gweather_distance_unit_get_type;
end;

function GWEATHER_TYPE_FORMAT_OPTIONS: TGType;
begin
  GWEATHER_TYPE_FORMAT_OPTIONS := gweather_format_options_get_type;
end;

function GWEATHER_TYPE_PROVIDER: TGType;
begin
  GWEATHER_TYPE_PROVIDER := gweather_provider_get_type;
end;

function GWEATHER_TYPE_WIND_DIRECTION: TGType;
begin
  GWEATHER_TYPE_WIND_DIRECTION := gweather_wind_direction_get_type;
end;

function GWEATHER_TYPE_SKY: TGType;
begin
  GWEATHER_TYPE_SKY := gweather_sky_get_type;
end;

function GWEATHER_TYPE_PHENOMENON: TGType;
begin
  GWEATHER_TYPE_PHENOMENON := gweather_phenomenon_get_type;
end;

function GWEATHER_TYPE_QUALIFIER: TGType;
begin
  GWEATHER_TYPE_QUALIFIER := gweather_qualifier_get_type;
end;

function GWEATHER_TYPE_LOCATION_LEVEL: TGType;

begin
  GWEATHER_TYPE_LOCATION_LEVEL := gweather_location_level_get_type;
end;


{$ENDIF read_implementation}
