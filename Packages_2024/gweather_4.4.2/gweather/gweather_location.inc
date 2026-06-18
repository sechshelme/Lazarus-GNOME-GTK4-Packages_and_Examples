{$IFDEF read_interface}


type
  TGWeatherLocationLevel = longint;

const
  GWEATHER_LOCATION_WORLD = 0;
  GWEATHER_LOCATION_REGION = 1;
  GWEATHER_LOCATION_COUNTRY = 2;
  GWEATHER_LOCATION_ADM1 = 3;
  GWEATHER_LOCATION_CITY = 4;
  GWEATHER_LOCATION_WEATHER_STATION = 5;
  GWEATHER_LOCATION_DETACHED = 6;
  GWEATHER_LOCATION_NAMED_TIMEZONE = 7;

type
  PGWeatherLocation = type Pointer;

  TGWeatherLocationClass = record
    parent_class: TGObjectClass;
  end;
  PGWeatherLocationClass = ^TGWeatherLocationClass;

type
  TGWeatherFilterFunc = function(location: PGWeatherLocation; user_data: Tgpointer): Tgboolean; cdecl;
  PGWeatherLocationLevel = ^TGWeatherLocationLevel;

function gweather_location_get_type: TGType; cdecl; external libgweather;
function gweather_location_get_world: PGWeatherLocation; cdecl; external libgweather;
function gweather_location_get_name(loc: PGWeatherLocation): pchar; cdecl; external libgweather;
function gweather_location_get_sort_name(loc: PGWeatherLocation): pchar; cdecl; external libgweather;
function gweather_location_get_english_name(loc: PGWeatherLocation): pchar; cdecl; external libgweather;
function gweather_location_get_english_sort_name(loc: PGWeatherLocation): pchar; cdecl; external libgweather;
function gweather_location_get_level(loc: PGWeatherLocation): TGWeatherLocationLevel; cdecl; external libgweather;
function gweather_location_get_parent(loc: PGWeatherLocation): PGWeatherLocation; cdecl; external libgweather;
function gweather_location_next_child(loc: PGWeatherLocation; child: PGWeatherLocation): PGWeatherLocation; cdecl; external libgweather;
function gweather_location_has_coords(loc: PGWeatherLocation): Tgboolean; cdecl; external libgweather;
procedure gweather_location_get_coords(loc: PGWeatherLocation; latitude: Pdouble; longitude: Pdouble); cdecl; external libgweather;
function gweather_location_get_distance(loc: PGWeatherLocation; loc2: PGWeatherLocation): double; cdecl; external libgweather;
function gweather_location_find_nearest_city(loc: PGWeatherLocation; lat: double; lon: double): PGWeatherLocation; cdecl; external libgweather;
function gweather_location_find_nearest_city_full(loc: PGWeatherLocation; lat: double; lon: double; func: TGWeatherFilterFunc; user_data: Tgpointer; destroy: TGDestroyNotify): PGWeatherLocation; cdecl; external libgweather;
procedure gweather_location_detect_nearest_city(loc: PGWeatherLocation; lat: double; lon: double; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgweather;
function gweather_location_detect_nearest_city_finish(result: PGAsyncResult; error: PPGError): PGWeatherLocation; cdecl; external libgweather;
function gweather_location_get_country(loc: PGWeatherLocation): pchar; cdecl; external libgweather;
function gweather_location_has_timezone(loc: PGWeatherLocation): Tgboolean; cdecl; external libgweather;
function gweather_location_get_timezone(loc: PGWeatherLocation): PGTimeZone; cdecl; external libgweather;
function gweather_location_get_timezone_str(loc: PGWeatherLocation): pchar; cdecl; external libgweather;
function gweather_location_get_timezones(loc: PGWeatherLocation): PPGTimeZone; cdecl; external libgweather;
procedure gweather_location_free_timezones(loc: PGWeatherLocation; zones: PPGTimeZone); cdecl; external libgweather;
function gweather_location_get_code(loc: PGWeatherLocation): pchar; cdecl; external libgweather;
function gweather_location_get_city_name(loc: PGWeatherLocation): pchar; cdecl; external libgweather;
function gweather_location_get_country_name(loc: PGWeatherLocation): pchar; cdecl; external libgweather;
function gweather_location_find_by_station_code(world: PGWeatherLocation; station_code: pchar): PGWeatherLocation; cdecl; external libgweather;
function gweather_location_find_by_country_code(world: PGWeatherLocation; country_code: pchar): PGWeatherLocation; cdecl; external libgweather;
function gweather_location_equal(one: PGWeatherLocation; two: PGWeatherLocation): Tgboolean; cdecl; external libgweather;
function gweather_location_serialize(loc: PGWeatherLocation): PGVariant; cdecl; external libgweather;
function gweather_location_deserialize(world: PGWeatherLocation; serialized: PGVariant): PGWeatherLocation; cdecl; external libgweather;
function gweather_location_new_detached(name: pchar; icao: pchar; latitude: double; longitude: double): PGWeatherLocation; cdecl; external libgweather;
function gweather_location_level_to_string(level: TGWeatherLocationLevel): pchar; cdecl; external libgweather;

// === Konventiert am: 18-6-26 17:07:52 ===

function GWEATHER_TYPE_LOCATION: TGType;
function GWEATHER_LOCATION(obj: Pointer): PGWeatherLocation;
function GWEATHER_IS_LOCATION(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GWEATHER_TYPE_LOCATION: TGType;
begin
  Result := gweather_location_get_type;
end;

function GWEATHER_LOCATION(obj: Pointer): PGWeatherLocation;
begin
  Result := PGWeatherLocation(g_type_check_instance_cast(obj, GWEATHER_TYPE_LOCATION));
end;

function GWEATHER_IS_LOCATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GWEATHER_TYPE_LOCATION);
end;


{$ENDIF read_implementation}
