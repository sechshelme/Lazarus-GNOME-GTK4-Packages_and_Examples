{$IFDEF read_interface}

type
  PGWeatherTemperatureUnit = ^TGWeatherTemperatureUnit;
  TGWeatherTemperatureUnit = longint;

const
  GWEATHER_TEMP_UNIT_INVALID = 0;
  GWEATHER_TEMP_UNIT_DEFAULT = 1;
  GWEATHER_TEMP_UNIT_KELVIN = 2;
  GWEATHER_TEMP_UNIT_CENTIGRADE = 3;
  GWEATHER_TEMP_UNIT_FAHRENHEIT = 4;

type
  PGWeatherSpeedUnit = ^TGWeatherSpeedUnit;
  TGWeatherSpeedUnit = longint;

const
  GWEATHER_SPEED_UNIT_INVALID = 0;
  GWEATHER_SPEED_UNIT_DEFAULT = 1;
  GWEATHER_SPEED_UNIT_MS = 2;
  GWEATHER_SPEED_UNIT_KPH = 3;
  GWEATHER_SPEED_UNIT_MPH = 4;
  GWEATHER_SPEED_UNIT_KNOTS = 5;
  GWEATHER_SPEED_UNIT_BFT = 6;

type
  PGWeatherPressureUnit = ^TGWeatherPressureUnit;
  TGWeatherPressureUnit = longint;

const
  GWEATHER_PRESSURE_UNIT_INVALID = 0;
  GWEATHER_PRESSURE_UNIT_DEFAULT = 1;
  GWEATHER_PRESSURE_UNIT_KPA = 2;
  GWEATHER_PRESSURE_UNIT_HPA = 3;
  GWEATHER_PRESSURE_UNIT_MB = 4;
  GWEATHER_PRESSURE_UNIT_MM_HG = 5;
  GWEATHER_PRESSURE_UNIT_INCH_HG = 6;
  GWEATHER_PRESSURE_UNIT_ATM = 7;

type
  PGWeatherDistanceUnit = ^TGWeatherDistanceUnit;
  TGWeatherDistanceUnit = longint;

const
  GWEATHER_DISTANCE_UNIT_INVALID = 0;
  GWEATHER_DISTANCE_UNIT_DEFAULT = 1;
  GWEATHER_DISTANCE_UNIT_METERS = 2;
  GWEATHER_DISTANCE_UNIT_KM = 3;
  GWEATHER_DISTANCE_UNIT_MILES = 4;

type
  PGWeatherFormatOptions = ^TGWeatherFormatOptions;
  TGWeatherFormatOptions = longint;

const
  GWEATHER_FORMAT_OPTION_DEFAULT = 0;
  GWEATHER_FORMAT_OPTION_SENTENCE_CAPITALIZATION = 1 shl 0;
  GWEATHER_FORMAT_OPTION_NO_CAPITALIZATION = 1 shl 1;

  // === Konventiert am: 18-6-26 17:07:30 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
