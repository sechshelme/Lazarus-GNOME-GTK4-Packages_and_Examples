unit gweather_info;

interface

uses
  fp_glib2, fp_gweather, gweather_location, gweather_enums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGWeatherProvider = ^TGWeatherProvider;
  TGWeatherProvider = longint;

const
  GWEATHER_PROVIDER_NONE = 0;
  GWEATHER_PROVIDER_METAR = 1;
  GWEATHER_PROVIDER_IWIN = 1 shl 2;
  GWEATHER_PROVIDER_MET_NO = 1 shl 3;
  GWEATHER_PROVIDER_OWM = 1 shl 4;
  GWEATHER_PROVIDER_NWS = 1 shl 5;
  GWEATHER_PROVIDER_ALL = (((GWEATHER_PROVIDER_METAR or GWEATHER_PROVIDER_IWIN) or GWEATHER_PROVIDER_MET_NO) or GWEATHER_PROVIDER_OWM) or GWEATHER_PROVIDER_NWS;

type
  PGWeatherInfo = type Pointer;

  TGWeatherInfoClass = record
    parent_class: TGObjectClass;
  end;
  PGWeatherInfoClass = ^TGWeatherInfoClass;

function gweather_info_get_type: TGType; cdecl; external libgweather;
procedure gweather_info_store_cache; cdecl; external libgweather;
function gweather_info_new(location: PGWeatherLocation): PGWeatherInfo; cdecl; external libgweather;
procedure gweather_info_update(info: PGWeatherInfo); cdecl; external libgweather;
procedure gweather_info_abort(info: PGWeatherInfo); cdecl; external libgweather;
function gweather_info_get_enabled_providers(info: PGWeatherInfo): TGWeatherProvider; cdecl; external libgweather;
procedure gweather_info_set_enabled_providers(info: PGWeatherInfo; providers: TGWeatherProvider); cdecl; external libgweather;
function gweather_info_get_application_id(info: PGWeatherInfo): pchar; cdecl; external libgweather;
procedure gweather_info_set_application_id(info: PGWeatherInfo; application_id: pchar); cdecl; external libgweather;
function gweather_info_get_contact_info(info: PGWeatherInfo): pchar; cdecl; external libgweather;
procedure gweather_info_set_contact_info(info: PGWeatherInfo; contact_info: pchar); cdecl; external libgweather;
function gweather_info_is_valid(info: PGWeatherInfo): Tgboolean; cdecl; external libgweather;
function gweather_info_network_error(info: PGWeatherInfo): Tgboolean; cdecl; external libgweather;
function gweather_info_get_location(info: PGWeatherInfo): PGWeatherLocation; cdecl; external libgweather;
procedure gweather_info_set_location(info: PGWeatherInfo; location: PGWeatherLocation); cdecl; external libgweather;
function gweather_info_get_location_name(info: PGWeatherInfo): pchar; cdecl; external libgweather;
function gweather_info_get_update(info: PGWeatherInfo): pchar; cdecl; external libgweather;
function gweather_info_get_sky(info: PGWeatherInfo): pchar; cdecl; external libgweather;
function gweather_info_get_conditions(info: PGWeatherInfo): pchar; cdecl; external libgweather;
function gweather_info_get_temp(info: PGWeatherInfo): pchar; cdecl; external libgweather;
function gweather_info_get_temp_min(info: PGWeatherInfo): pchar; cdecl; external libgweather;
function gweather_info_get_temp_max(info: PGWeatherInfo): pchar; cdecl; external libgweather;
function gweather_info_get_dew(info: PGWeatherInfo): pchar; cdecl; external libgweather;
function gweather_info_get_humidity(info: PGWeatherInfo): pchar; cdecl; external libgweather;
function gweather_info_get_wind(info: PGWeatherInfo): pchar; cdecl; external libgweather;
function gweather_info_get_pressure(info: PGWeatherInfo): pchar; cdecl; external libgweather;
function gweather_info_get_visibility(info: PGWeatherInfo): pchar; cdecl; external libgweather;
function gweather_info_get_apparent(info: PGWeatherInfo): pchar; cdecl; external libgweather;
function gweather_info_get_sunrise(info: PGWeatherInfo): pchar; cdecl; external libgweather;
function gweather_info_get_sunset(info: PGWeatherInfo): pchar; cdecl; external libgweather;
function gweather_info_get_forecast_list(info: PGWeatherInfo): PGSList; cdecl; external libgweather;
function gweather_info_get_attribution(info: PGWeatherInfo): pchar; cdecl; external libgweather;
function gweather_info_get_temp_summary(info: PGWeatherInfo): pchar; cdecl; external libgweather;
function gweather_info_get_weather_summary(info: PGWeatherInfo): pchar; cdecl; external libgweather;
function gweather_info_get_icon_name(info: PGWeatherInfo): pchar; cdecl; external libgweather;
function gweather_info_get_symbolic_icon_name(info: PGWeatherInfo): pchar; cdecl; external libgweather;
function gweather_info_next_sun_event(info: PGWeatherInfo): longint; cdecl; external libgweather;
function gweather_info_is_daytime(info: PGWeatherInfo): Tgboolean; cdecl; external libgweather;

type
  PGWeatherWindDirection = ^TGWeatherWindDirection;
  TGWeatherWindDirection = longint;

const
  GWEATHER_WIND_INVALID = -(1);
  GWEATHER_WIND_VARIABLE = (-(1)) + 1;
  GWEATHER_WIND_N = (-(1)) + 2;
  GWEATHER_WIND_NNE = (-(1)) + 3;
  GWEATHER_WIND_NE = (-(1)) + 4;
  GWEATHER_WIND_ENE = (-(1)) + 5;
  GWEATHER_WIND_E = (-(1)) + 6;
  GWEATHER_WIND_ESE = (-(1)) + 7;
  GWEATHER_WIND_SE = (-(1)) + 8;
  GWEATHER_WIND_SSE = (-(1)) + 9;
  GWEATHER_WIND_S = (-(1)) + 10;
  GWEATHER_WIND_SSW = (-(1)) + 11;
  GWEATHER_WIND_SW = (-(1)) + 12;
  GWEATHER_WIND_WSW = (-(1)) + 13;
  GWEATHER_WIND_W = (-(1)) + 14;
  GWEATHER_WIND_WNW = (-(1)) + 15;
  GWEATHER_WIND_NW = (-(1)) + 16;
  GWEATHER_WIND_NNW = (-(1)) + 17;
  GWEATHER_WIND_LAST = (-(1)) + 18;

function gweather_wind_direction_to_string(wind: TGWeatherWindDirection): pchar; cdecl; external libgweather;
function gweather_wind_direction_to_string_full(wind: TGWeatherWindDirection; options: TGWeatherFormatOptions): pchar; cdecl; external libgweather;

type
  PGWeatherSky = ^TGWeatherSky;
  TGWeatherSky = longint;

const
  GWEATHER_SKY_INVALID = -(1);
  GWEATHER_SKY_CLEAR = (-(1)) + 1;
  GWEATHER_SKY_BROKEN = (-(1)) + 2;
  GWEATHER_SKY_SCATTERED = (-(1)) + 3;
  GWEATHER_SKY_FEW = (-(1)) + 4;
  GWEATHER_SKY_OVERCAST = (-(1)) + 5;
  GWEATHER_SKY_LAST = (-(1)) + 6;

function gweather_sky_to_string(sky: TGWeatherSky): pchar; cdecl; external libgweather;
function gweather_sky_to_string_full(sky: TGWeatherSky; options: TGWeatherFormatOptions): pchar; cdecl; external libgweather;

type
  PGWeatherConditionPhenomenon = ^TGWeatherConditionPhenomenon;
  TGWeatherConditionPhenomenon = longint;

const
  GWEATHER_PHENOMENON_INVALID = -(1);
  GWEATHER_PHENOMENON_NONE = (-(1)) + 1;
  GWEATHER_PHENOMENON_DRIZZLE = (-(1)) + 2;
  GWEATHER_PHENOMENON_RAIN = (-(1)) + 3;
  GWEATHER_PHENOMENON_SNOW = (-(1)) + 4;
  GWEATHER_PHENOMENON_SNOW_GRAINS = (-(1)) + 5;
  GWEATHER_PHENOMENON_ICE_CRYSTALS = (-(1)) + 6;
  GWEATHER_PHENOMENON_ICE_PELLETS = (-(1)) + 7;
  GWEATHER_PHENOMENON_HAIL = (-(1)) + 8;
  GWEATHER_PHENOMENON_SMALL_HAIL = (-(1)) + 9;
  GWEATHER_PHENOMENON_UNKNOWN_PRECIPITATION = (-(1)) + 10;
  GWEATHER_PHENOMENON_MIST = (-(1)) + 11;
  GWEATHER_PHENOMENON_FOG = (-(1)) + 12;
  GWEATHER_PHENOMENON_SMOKE = (-(1)) + 13;
  GWEATHER_PHENOMENON_VOLCANIC_ASH = (-(1)) + 14;
  GWEATHER_PHENOMENON_SAND = (-(1)) + 15;
  GWEATHER_PHENOMENON_HAZE = (-(1)) + 16;
  GWEATHER_PHENOMENON_SPRAY = (-(1)) + 17;
  GWEATHER_PHENOMENON_DUST = (-(1)) + 18;
  GWEATHER_PHENOMENON_SQUALL = (-(1)) + 19;
  GWEATHER_PHENOMENON_SANDSTORM = (-(1)) + 20;
  GWEATHER_PHENOMENON_DUSTSTORM = (-(1)) + 21;
  GWEATHER_PHENOMENON_FUNNEL_CLOUD = (-(1)) + 22;
  GWEATHER_PHENOMENON_TORNADO = (-(1)) + 23;
  GWEATHER_PHENOMENON_DUST_WHIRLS = (-(1)) + 24;
  GWEATHER_PHENOMENON_LAST = (-(1)) + 25;

type
  PGWeatherConditionQualifier = ^TGWeatherConditionQualifier;
  TGWeatherConditionQualifier = longint;

const
  GWEATHER_QUALIFIER_INVALID = -(1);
  GWEATHER_QUALIFIER_NONE = (-(1)) + 1;
  GWEATHER_QUALIFIER_VICINITY = (-(1)) + 2;
  GWEATHER_QUALIFIER_LIGHT = (-(1)) + 3;
  GWEATHER_QUALIFIER_MODERATE = (-(1)) + 4;
  GWEATHER_QUALIFIER_HEAVY = (-(1)) + 5;
  GWEATHER_QUALIFIER_SHALLOW = (-(1)) + 6;
  GWEATHER_QUALIFIER_PATCHES = (-(1)) + 7;
  GWEATHER_QUALIFIER_PARTIAL = (-(1)) + 8;
  GWEATHER_QUALIFIER_THUNDERSTORM = (-(1)) + 9;
  GWEATHER_QUALIFIER_BLOWING = (-(1)) + 10;
  GWEATHER_QUALIFIER_SHOWERS = (-(1)) + 11;
  GWEATHER_QUALIFIER_DRIFTING = (-(1)) + 12;
  GWEATHER_QUALIFIER_FREEZING = (-(1)) + 13;
  GWEATHER_QUALIFIER_LAST = (-(1)) + 14;

type
  PGWeatherMoonPhase = ^TGWeatherMoonPhase;
  TGWeatherMoonPhase = double;

  PGWeatherMoonLatitude = ^TGWeatherMoonLatitude;
  TGWeatherMoonLatitude = double;

function gweather_info_get_value_update(info: PGWeatherInfo; value: Ptime_t): Tgboolean; cdecl; external libgweather;
function gweather_info_get_value_sky(info: PGWeatherInfo; sky: PGWeatherSky): Tgboolean; cdecl; external libgweather;
function gweather_info_get_value_conditions(info: PGWeatherInfo; phenomenon: PGWeatherConditionPhenomenon; qualifier: PGWeatherConditionQualifier): Tgboolean; cdecl; external libgweather;
function gweather_info_get_value_temp(info: PGWeatherInfo; unit_: TGWeatherTemperatureUnit; value: Pdouble): Tgboolean; cdecl; external libgweather;
function gweather_info_get_value_temp_min(info: PGWeatherInfo; unit_: TGWeatherTemperatureUnit; value: Pdouble): Tgboolean; cdecl; external libgweather;
function gweather_info_get_value_temp_max(info: PGWeatherInfo; unit_: TGWeatherTemperatureUnit; value: Pdouble): Tgboolean; cdecl; external libgweather;
function gweather_info_get_value_dew(info: PGWeatherInfo; unit_: TGWeatherTemperatureUnit; value: Pdouble): Tgboolean; cdecl; external libgweather;
function gweather_info_get_value_apparent(info: PGWeatherInfo; unit_: TGWeatherTemperatureUnit; value: Pdouble): Tgboolean; cdecl; external libgweather;
function gweather_info_get_value_wind(info: PGWeatherInfo; unit_: TGWeatherSpeedUnit; speed: Pdouble; direction: PGWeatherWindDirection): Tgboolean; cdecl; external libgweather;
function gweather_info_get_value_pressure(info: PGWeatherInfo; unit_: TGWeatherPressureUnit; value: Pdouble): Tgboolean; cdecl; external libgweather;
function gweather_info_get_value_visibility(info: PGWeatherInfo; unit_: TGWeatherDistanceUnit; value: Pdouble): Tgboolean; cdecl; external libgweather;
function gweather_info_get_value_sunrise(info: PGWeatherInfo; value: Ptime_t): Tgboolean; cdecl; external libgweather;
function gweather_info_get_value_sunset(info: PGWeatherInfo; value: Ptime_t): Tgboolean; cdecl; external libgweather;
function gweather_info_get_value_moonphase(info: PGWeatherInfo; value: PGWeatherMoonPhase; lat: PGWeatherMoonLatitude): Tgboolean; cdecl; external libgweather;
function gweather_info_get_upcoming_moonphases(info: PGWeatherInfo; phases: Ptime_t): Tgboolean; cdecl; external libgweather;

type
  TGWeatherConditions = record
    significant: Tgboolean;
    phenomenon: TGWeatherConditionPhenomenon;
    qualifier: TGWeatherConditionQualifier;
  end;
  PGWeatherConditions = ^TGWeatherConditions;

function gweather_conditions_to_string(conditions: PGWeatherConditions): pchar; cdecl; external libgweather;
function gweather_conditions_to_string_full(conditions: PGWeatherConditions; options: TGWeatherFormatOptions): pchar; cdecl; external libgweather;
function gweather_temperature_unit_to_real(unit_: TGWeatherTemperatureUnit): TGWeatherTemperatureUnit; cdecl; external libgweather;
function gweather_speed_unit_to_string(unit_: TGWeatherSpeedUnit): pchar; cdecl; external libgweather;

// === Konventiert am: 18-6-26 17:07:59 ===

function GWEATHER_TYPE_INFO: TGType;
function GWEATHER_INFO(obj: Pointer): PGWeatherInfo;
function GWEATHER_IS_INFO(obj: Pointer): Tgboolean;

implementation

function GWEATHER_TYPE_INFO: TGType;
begin
  Result := gweather_info_get_type;
end;

function GWEATHER_INFO(obj: Pointer): PGWeatherInfo;
begin
  Result := PGWeatherInfo(g_type_check_instance_cast(obj, GWEATHER_TYPE_INFO));
end;

function GWEATHER_IS_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GWEATHER_TYPE_INFO);
end;


end.
