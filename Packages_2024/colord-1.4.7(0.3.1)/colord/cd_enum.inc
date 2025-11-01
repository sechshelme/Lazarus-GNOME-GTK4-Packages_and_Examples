{$IFDEF read_interface}

type
  PCdDeviceKind = ^TCdDeviceKind;
  TCdDeviceKind = longint;

const
  CD_DEVICE_KIND_UNKNOWN = 0;
  CD_DEVICE_KIND_DISPLAY = 1;
  CD_DEVICE_KIND_SCANNER = 2;
  CD_DEVICE_KIND_PRINTER = 3;
  CD_DEVICE_KIND_CAMERA = 4;
  CD_DEVICE_KIND_WEBCAM = 5;
  CD_DEVICE_KIND_LAST = 6;

type
  PCdProfileKind = ^TCdProfileKind;
  TCdProfileKind = longint;

const
  CD_PROFILE_KIND_UNKNOWN = 0;
  CD_PROFILE_KIND_INPUT_DEVICE = 1;
  CD_PROFILE_KIND_DISPLAY_DEVICE = 2;
  CD_PROFILE_KIND_OUTPUT_DEVICE = 3;
  CD_PROFILE_KIND_DEVICELINK = 4;
  CD_PROFILE_KIND_COLORSPACE_CONVERSION = 5;
  CD_PROFILE_KIND_ABSTRACT = 6;
  CD_PROFILE_KIND_NAMED_COLOR = 7;
  CD_PROFILE_KIND_LAST = 8;

type
  PCdObjectScope = ^TCdObjectScope;
  TCdObjectScope = longint;

const
  CD_OBJECT_SCOPE_UNKNOWN = 0;
  CD_OBJECT_SCOPE_NORMAL = 1;
  CD_OBJECT_SCOPE_TEMP = 2;
  CD_OBJECT_SCOPE_DISK = 3;
  CD_OBJECT_SCOPE_LAST = 4;

type
  PCdRenderingIntent = ^TCdRenderingIntent;
  TCdRenderingIntent = longint;

const
  CD_RENDERING_INTENT_UNKNOWN = 0;
  CD_RENDERING_INTENT_PERCEPTUAL = 1;
  CD_RENDERING_INTENT_RELATIVE_COLORIMETRIC = 2;
  CD_RENDERING_INTENT_SATURATION = 3;
  CD_RENDERING_INTENT_ABSOLUTE_COLORIMETRIC = 4;
  CD_RENDERING_INTENT_LAST = 5;

type
  PCdPixelFormat = ^TCdPixelFormat;
  TCdPixelFormat = Tguint32;

const
  CD_PIXEL_FORMAT_UNKNOWN = $00000000;
  CD_PIXEL_FORMAT_ARGB32 = $00044099;
  CD_PIXEL_FORMAT_RGB24 = $00040019;
  CD_PIXEL_FORMAT_CMYK32 = $00060021;
  CD_PIXEL_FORMAT_BGRA32 = $00044499;
  CD_PIXEL_FORMAT_RGBA32 = $00040099;

type
  PCdColorspace = ^TCdColorspace;
  TCdColorspace = longint;

const
  CD_COLORSPACE_UNKNOWN = 0;
  CD_COLORSPACE_XYZ = 1;
  CD_COLORSPACE_LAB = 2;
  CD_COLORSPACE_LUV = 3;
  CD_COLORSPACE_YCBCR = 4;
  CD_COLORSPACE_YXY = 5;
  CD_COLORSPACE_RGB = 6;
  CD_COLORSPACE_GRAY = 7;
  CD_COLORSPACE_HSV = 8;
  CD_COLORSPACE_CMYK = 9;
  CD_COLORSPACE_CMY = 10;
  CD_COLORSPACE_LAST = 11;

type
  PCdDeviceMode = ^TCdDeviceMode;
  TCdDeviceMode = longint;

const
  CD_DEVICE_MODE_UNKNOWN = 0;
  CD_DEVICE_MODE_PHYSICAL = 1;
  CD_DEVICE_MODE_VIRTUAL = 2;
  CD_DEVICE_MODE_LAST = 3;

type
  PCdDeviceRelation = ^TCdDeviceRelation;
  TCdDeviceRelation = longint;

const
  CD_DEVICE_RELATION_UNKNOWN = 0;
  CD_DEVICE_RELATION_SOFT = 1;
  CD_DEVICE_RELATION_HARD = 2;
  CD_DEVICE_RELATION_LAST = 3;

type
  PCdSensorKind = ^TCdSensorKind;
  TCdSensorKind = longint;

const
  CD_SENSOR_KIND_UNKNOWN = 0;
  CD_SENSOR_KIND_DUMMY = 1;
  CD_SENSOR_KIND_HUEY = 2;
  CD_SENSOR_KIND_COLOR_MUNKI_PHOTO = 3;
  CD_SENSOR_KIND_SPYDER = 4;
  CD_SENSOR_KIND_DTP20 = 5;
  CD_SENSOR_KIND_DTP22 = 6;
  CD_SENSOR_KIND_DTP41 = 7;
  CD_SENSOR_KIND_DTP51 = 8;
  CD_SENSOR_KIND_DTP94 = 9;
  CD_SENSOR_KIND_SPECTRO_SCAN = 10;
  CD_SENSOR_KIND_I1_PRO = 11;
  CD_SENSOR_KIND_COLORIMTRE_HCFR = 12;
  CD_SENSOR_KIND_I1_DISPLAY3 = 13;
  CD_SENSOR_KIND_COLORHUG = 14;
  CD_SENSOR_KIND_SPYDER2 = 15;
  CD_SENSOR_KIND_SPYDER3 = 16;
  CD_SENSOR_KIND_COLORHUG_PLUS = 17;
  CD_SENSOR_KIND_I1_DISPLAY1 = 18;
  CD_SENSOR_KIND_I1_DISPLAY2 = 19;
  CD_SENSOR_KIND_DTP92 = 20;
  CD_SENSOR_KIND_I1_MONITOR = 21;
  CD_SENSOR_KIND_SPYDER4 = 22;
  CD_SENSOR_KIND_COLOR_MUNKI_SMILE = 23;
  CD_SENSOR_KIND_COLORHUG2 = 24;
  CD_SENSOR_KIND_SPYDER5 = 25;
  CD_SENSOR_KIND_SPARK = 26;
  CD_SENSOR_KIND_SPYDERX = 27;
  CD_SENSOR_KIND_LAST = 28;

  CD_SENSOR_KIND_COLORHUG_SPECTRO = CD_SENSOR_KIND_COLORHUG_PLUS;

type
  PCdSensorCap = ^TCdSensorCap;
  TCdSensorCap = longint;

const
  CD_SENSOR_CAP_UNKNOWN = 0;
  CD_SENSOR_CAP_LCD = 1;
  CD_SENSOR_CAP_CRT = 2;
  CD_SENSOR_CAP_PRINTER = 3;
  CD_SENSOR_CAP_SPOT = 4;
  CD_SENSOR_CAP_PROJECTOR = 5;
  CD_SENSOR_CAP_AMBIENT = 6;
  CD_SENSOR_CAP_CALIBRATION = 7;
  CD_SENSOR_CAP_LED = 8;
  CD_SENSOR_CAP_PLASMA = 9;
  CD_SENSOR_CAP_LCD_CCFL = 10;
  CD_SENSOR_CAP_LCD_RGB_LED = 11;
  CD_SENSOR_CAP_LCD_WHITE_LED = 12;
  CD_SENSOR_CAP_WIDE_GAMUT_LCD_CCFL = 13;
  CD_SENSOR_CAP_WIDE_GAMUT_LCD_RGB_LED = 14;
  CD_SENSOR_CAP_SPECTRAL = 15;
  CD_SENSOR_CAP_CALIBRATION_DARK = 16;
  CD_SENSOR_CAP_CALIBRATION_IRRADIANCE = 17;
  CD_SENSOR_CAP_LAST = 18;

type
  PCdSensorState = ^TCdSensorState;
  TCdSensorState = longint;

const
  CD_SENSOR_STATE_UNKNOWN = 0;
  CD_SENSOR_STATE_STARTING = 1;
  CD_SENSOR_STATE_IDLE = 2;
  CD_SENSOR_STATE_MEASURING = 3;
  CD_SENSOR_STATE_BUSY = 4;
  CD_SENSOR_STATE_LAST = 5;

type
  PCdStandardSpace = ^TCdStandardSpace;
  TCdStandardSpace = longint;

const
  CD_STANDARD_SPACE_UNKNOWN = 0;
  CD_STANDARD_SPACE_SRGB = 1;
  CD_STANDARD_SPACE_ADOBE_RGB = 2;
  CD_STANDARD_SPACE_PROPHOTO_RGB = 3;
  CD_STANDARD_SPACE_LAST = 4;

type
  PCdProfileWarning = ^TCdProfileWarning;
  TCdProfileWarning = longint;

const
  CD_PROFILE_WARNING_NONE = 0;
  CD_PROFILE_WARNING_DESCRIPTION_MISSING = 1;
  CD_PROFILE_WARNING_COPYRIGHT_MISSING = 2;
  CD_PROFILE_WARNING_VCGT_NON_MONOTONIC = 3;
  CD_PROFILE_WARNING_SCUM_DOT = 4;
  CD_PROFILE_WARNING_GRAY_AXIS_INVALID = 5;
  CD_PROFILE_WARNING_GRAY_AXIS_NON_MONOTONIC = 6;
  CD_PROFILE_WARNING_PRIMARIES_INVALID = 7;
  CD_PROFILE_WARNING_PRIMARIES_NON_ADDITIVE = 8;
  CD_PROFILE_WARNING_PRIMARIES_UNLIKELY = 9;
  CD_PROFILE_WARNING_WHITEPOINT_INVALID = 10;
  CD_PROFILE_WARNING_WHITEPOINT_UNLIKELY = 11;
  CD_PROFILE_WARNING_LAST = 12;

type
  PCdProfileQuality = ^TCdProfileQuality;
  TCdProfileQuality = longint;

const
  CD_PROFILE_QUALITY_LOW = 0;
  CD_PROFILE_QUALITY_MEDIUM = 1;
  CD_PROFILE_QUALITY_HIGH = 2;
  CD_PROFILE_QUALITY_LAST = 3;

type
  PCdSensorError = ^TCdSensorError;
  TCdSensorError = longint;

const
  CD_SENSOR_ERROR_NO_SUPPORT = 0;
  CD_SENSOR_ERROR_NO_DATA = 1;
  CD_SENSOR_ERROR_INTERNAL = 2;
  CD_SENSOR_ERROR_ALREADY_LOCKED = 3;
  CD_SENSOR_ERROR_NOT_LOCKED = 4;
  CD_SENSOR_ERROR_IN_USE = 5;
  CD_SENSOR_ERROR_FAILED_TO_AUTHENTICATE = 6;
  CD_SENSOR_ERROR_REQUIRED_POSITION_CALIBRATE = 7;
  CD_SENSOR_ERROR_REQUIRED_POSITION_SURFACE = 8;
  CD_SENSOR_ERROR_REQUIRED_DARK_CALIBRATION = 9;
  CD_SENSOR_ERROR_REQUIRED_IRRADIANCE_CALIBRATION = 10;
  CD_SENSOR_ERROR_LAST = 11;

type
  PCdProfileError = ^TCdProfileError;
  TCdProfileError = longint;

const
  CD_PROFILE_ERROR_INTERNAL = 0;
  CD_PROFILE_ERROR_ALREADY_INSTALLED = 1;
  CD_PROFILE_ERROR_FAILED_TO_WRITE = 2;
  CD_PROFILE_ERROR_FAILED_TO_PARSE = 3;
  CD_PROFILE_ERROR_FAILED_TO_READ = 4;
  CD_PROFILE_ERROR_FAILED_TO_AUTHENTICATE = 5;
  CD_PROFILE_ERROR_PROPERTY_INVALID = 6;
  CD_PROFILE_ERROR_FAILED_TO_GET_UID = 7;
  CD_PROFILE_ERROR_LAST = 8;

type
  PCdDeviceError = ^TCdDeviceError;
  TCdDeviceError = longint;

const
  CD_DEVICE_ERROR_INTERNAL = 0;
  CD_DEVICE_ERROR_PROFILE_DOES_NOT_EXIST = 1;
  CD_DEVICE_ERROR_PROFILE_ALREADY_ADDED = 2;
  CD_DEVICE_ERROR_PROFILING = 3;
  CD_DEVICE_ERROR_NOTHING_MATCHED = 4;
  CD_DEVICE_ERROR_FAILED_TO_INHIBIT = 5;
  CD_DEVICE_ERROR_FAILED_TO_UNINHIBIT = 6;
  CD_DEVICE_ERROR_FAILED_TO_AUTHENTICATE = 7;
  CD_DEVICE_ERROR_NOT_ENABLED = 8;
  CD_DEVICE_ERROR_LAST = 9;

type
  PCdClientError = ^TCdClientError;
  TCdClientError = longint;

const
  CD_CLIENT_ERROR_INTERNAL = 0;
  CD_CLIENT_ERROR_ALREADY_EXISTS = 1;
  CD_CLIENT_ERROR_FAILED_TO_AUTHENTICATE = 2;
  CD_CLIENT_ERROR_NOT_SUPPORTED = 3;
  CD_CLIENT_ERROR_NOT_FOUND = 4;
  CD_CLIENT_ERROR_INPUT_INVALID = 5;
  CD_CLIENT_ERROR_FILE_INVALID = 6;
  CD_CLIENT_ERROR_LAST = 7;

const
  CD_CLIENT_PROPERTY_DAEMON_VERSION = 'DaemonVersion';
  CD_CLIENT_PROPERTY_SYSTEM_VENDOR = 'SystemVendor';
  CD_CLIENT_PROPERTY_SYSTEM_MODEL = 'SystemModel';
  CD_PROFILE_METADATA_STANDARD_SPACE = 'STANDARD_space';
  CD_PROFILE_METADATA_EDID_MD5 = 'EDID_md5';
  CD_PROFILE_METADATA_EDID_MODEL = 'EDID_model';
  CD_PROFILE_METADATA_EDID_SERIAL = 'EDID_serial';
  CD_PROFILE_METADATA_EDID_MNFT = 'EDID_mnft';
  CD_PROFILE_METADATA_EDID_VENDOR = 'EDID_manufacturer';
  CD_PROFILE_METADATA_FILE_CHECKSUM = 'FILE_checksum';
  CD_PROFILE_METADATA_CMF_PRODUCT = 'CMF_product';
  CD_PROFILE_METADATA_CMF_BINARY = 'CMF_binary';
  CD_PROFILE_METADATA_CMF_VERSION = 'CMF_version';
  CD_PROFILE_METADATA_DATA_SOURCE = 'DATA_source';
  CD_PROFILE_METADATA_DATA_SOURCE_EDID = 'edid';
  CD_PROFILE_METADATA_DATA_SOURCE_CALIB = 'calib';
  CD_PROFILE_METADATA_DATA_SOURCE_STANDARD = 'standard';
  CD_PROFILE_METADATA_DATA_SOURCE_TEST = 'test';
  CD_PROFILE_METADATA_MAPPING_FORMAT = 'MAPPING_format';
  CD_PROFILE_METADATA_MAPPING_QUALIFIER = 'MAPPING_qualifier';
  CD_PROFILE_METADATA_MAPPING_DEVICE_ID = 'MAPPING_device_id';
  CD_PROFILE_METADATA_ACCURACY_DE76_AVG = 'ACCURACY_dE76_avg';
  CD_PROFILE_METADATA_ACCURACY_DE76_MAX = 'ACCURACY_dE76_max';
  CD_PROFILE_METADATA_ACCURACY_DE76_RMS = 'ACCURACY_dE76_rms';
  CD_PROFILE_METADATA_MEASUREMENT_DEVICE = 'MEASUREMENT_device';
  CD_PROFILE_METADATA_SCREEN_SURFACE = 'SCREEN_surface';
  CD_PROFILE_METADATA_SCREEN_SURFACE_MATTE = 'matte';
  CD_PROFILE_METADATA_SCREEN_SURFACE_GLOSSY = 'glossy';
  CD_PROFILE_METADATA_SCREEN_BRIGHTNESS = 'SCREEN_brightness';
  CD_PROFILE_METADATA_CONNECTION_TYPE = 'CONNECTION_type';
  CD_PROFILE_METADATA_CONNECTION_TYPE_INTERNAL = 'internal';
  CD_PROFILE_METADATA_CONNECTION_TYPE_VGA = 'vga';
  CD_PROFILE_METADATA_CONNECTION_TYPE_DVI = 'dvi';
  CD_PROFILE_METADATA_CONNECTION_TYPE_HDMI = 'hdmi';
  CD_PROFILE_METADATA_CONNECTION_TYPE_DISPLAYPORT = 'displayport';
  CD_PROFILE_METADATA_LICENSE = 'License';
  CD_PROFILE_METADATA_QUALITY = 'Quality';
  CD_PROFILE_METADATA_QUALITY_LOW = 'low';
  CD_PROFILE_METADATA_QUALITY_MEDIUM = 'medium';
  CD_PROFILE_METADATA_QUALITY_HIGH = 'high';
  CD_PROFILE_PROPERTY_FILENAME = 'Filename';
  CD_PROFILE_PROPERTY_QUALIFIER = 'Qualifier';
  CD_PROFILE_PROPERTY_FORMAT = 'Format';
  CD_PROFILE_PROPERTY_COLORSPACE = 'Colorspace';
  CD_PROFILE_PROPERTY_TITLE = 'Title';
  CD_PROFILE_PROPERTY_KIND = 'Kind';
  CD_PROFILE_PROPERTY_CREATED = 'Created';
  CD_PROFILE_PROPERTY_HAS_VCGT = 'HasVcgt';
  CD_PROFILE_PROPERTY_IS_SYSTEM_WIDE = 'IsSystemWide';
  CD_PROFILE_PROPERTY_METADATA = 'Metadata';
  CD_PROFILE_PROPERTY_ID = 'ProfileId';
  CD_PROFILE_PROPERTY_SCOPE = 'Scope';
  CD_PROFILE_PROPERTY_OWNER = 'Owner';
  CD_PROFILE_PROPERTY_WARNINGS = 'Warnings';
  CD_DEVICE_METADATA_XRANDR_NAME = 'XRANDR_name';
  CD_DEVICE_METADATA_OUTPUT_EDID_MD5 = 'OutputEdidMd5';
  CD_DEVICE_METADATA_OUTPUT_PRIORITY = 'OutputPriority';
  CD_DEVICE_METADATA_OUTPUT_PRIORITY_PRIMARY = 'primary';
  CD_DEVICE_METADATA_OUTPUT_PRIORITY_SECONDARY = 'secondary';
  CD_DEVICE_METADATA_OWNER_CMDLINE = 'OwnerCmdline';
  CD_DEVICE_PROPERTY_MODEL = 'Model';
  CD_DEVICE_PROPERTY_KIND = 'Kind';
  CD_DEVICE_PROPERTY_VENDOR = 'Vendor';
  CD_DEVICE_PROPERTY_SERIAL = 'Serial';
  CD_DEVICE_PROPERTY_COLORSPACE = 'Colorspace';
  CD_DEVICE_PROPERTY_FORMAT = 'Format';
  CD_DEVICE_PROPERTY_MODE = 'Mode';
  CD_DEVICE_PROPERTY_PROFILES = 'Profiles';
  CD_DEVICE_PROPERTY_CREATED = 'Created';
  CD_DEVICE_PROPERTY_MODIFIED = 'Modified';
  CD_DEVICE_PROPERTY_METADATA = 'Metadata';
  CD_DEVICE_PROPERTY_ID = 'DeviceId';
  CD_DEVICE_PROPERTY_SCOPE = 'Scope';
  CD_DEVICE_PROPERTY_OWNER = 'Owner';
  CD_DEVICE_PROPERTY_SEAT = 'Seat';
  CD_DEVICE_PROPERTY_PROFILING_INHIBITORS = 'ProfilingInhibitors';
  CD_DEVICE_PROPERTY_ENABLED = 'Enabled';
  CD_DEVICE_PROPERTY_EMBEDDED = 'Embedded';
  CD_SENSOR_PROPERTY_ID = 'SensorId';
  CD_SENSOR_PROPERTY_KIND = 'Kind';
  CD_SENSOR_PROPERTY_STATE = 'State';
  CD_SENSOR_PROPERTY_MODE = 'Mode';
  CD_SENSOR_PROPERTY_SERIAL = 'Serial';
  CD_SENSOR_PROPERTY_MODEL = 'Model';
  CD_SENSOR_PROPERTY_VENDOR = 'Vendor';
  CD_SENSOR_PROPERTY_NATIVE = 'Native';
  CD_SENSOR_PROPERTY_LOCKED = 'Locked';
  CD_SENSOR_PROPERTY_CAPABILITIES = 'Capabilities';
  CD_SENSOR_PROPERTY_OPTIONS = 'Options';
  CD_SENSOR_PROPERTY_EMBEDDED = 'Embedded';
  CD_SENSOR_PROPERTY_METADATA = 'Metadata';
  CD_SENSOR_METADATA_IMAGE_ATTACH = 'ImageAttach';
  CD_SENSOR_METADATA_IMAGE_CALIBRATE = 'ImageCalibrate';
  CD_SENSOR_METADATA_IMAGE_SCREEN = 'ImageScreen';

function cd_bitfield_from_enums(value: Tgint): Tguint64; cdecl; varargs; external libcolord;
function cd_device_kind_to_string(kind_enum: TCdDeviceKind): Pgchar; cdecl; external libcolord;
function cd_device_kind_from_string(kind: Pgchar): TCdDeviceKind; cdecl; external libcolord;
function cd_profile_kind_to_string(profile_kind: TCdProfileKind): Pgchar; cdecl; external libcolord;
function cd_profile_kind_from_string(profile_kind: Pgchar): TCdProfileKind; cdecl; external libcolord;
function cd_rendering_intent_from_string(rendering_intent: Pgchar): TCdRenderingIntent; cdecl; external libcolord;
function cd_rendering_intent_to_string(rendering_intent: TCdRenderingIntent): Pgchar; cdecl; external libcolord;
function cd_pixel_format_from_string(pixel_format: Pgchar): TCdPixelFormat; cdecl; external libcolord;
function cd_pixel_format_to_string(pixel_format: TCdPixelFormat): Pgchar; cdecl; external libcolord;
function cd_colorspace_to_string(colorspace: TCdColorspace): Pgchar; cdecl; external libcolord;
function cd_colorspace_from_string(colorspace: Pgchar): TCdColorspace; cdecl; external libcolord;
function cd_device_mode_to_string(device_mode: TCdDeviceMode): Pgchar; cdecl; external libcolord;
function cd_device_mode_from_string(device_mode: Pgchar): TCdDeviceMode; cdecl; external libcolord;
function cd_device_relation_to_string(device_relation: TCdDeviceRelation): Pgchar; cdecl; external libcolord;
function cd_device_relation_from_string(device_relation: Pgchar): TCdDeviceRelation; cdecl; external libcolord;
function cd_object_scope_to_string(object_scope: TCdObjectScope): Pgchar; cdecl; external libcolord;
function cd_object_scope_from_string(object_scope: Pgchar): TCdObjectScope; cdecl; external libcolord;
function cd_sensor_kind_to_string(sensor_kind: TCdSensorKind): Pgchar; cdecl; external libcolord;
function cd_sensor_kind_from_string(sensor_kind: Pgchar): TCdSensorKind; cdecl; external libcolord;
function cd_sensor_state_to_string(sensor_state: TCdSensorState): Pgchar; cdecl; external libcolord;
function cd_sensor_state_from_string(sensor_state: Pgchar): TCdSensorState; cdecl; external libcolord;
function cd_sensor_cap_to_string(sensor_cap: TCdSensorCap): Pgchar; cdecl; external libcolord;
function cd_sensor_cap_from_string(sensor_cap: Pgchar): TCdSensorCap; cdecl; external libcolord;
function cd_standard_space_to_string(standard_space: TCdStandardSpace): Pgchar; cdecl; external libcolord;
function cd_standard_space_from_string(standard_space: Pgchar): TCdStandardSpace; cdecl; external libcolord;
function cd_profile_warning_to_string(kind_enum: TCdProfileWarning): Pgchar; cdecl; external libcolord;
function cd_profile_warning_from_string(_type: Pgchar): TCdProfileWarning; cdecl; external libcolord;
function cd_profile_quality_to_string(quality_enum: TCdProfileQuality): Pgchar; cdecl; external libcolord;
function cd_profile_quality_from_string(quality: Pgchar): TCdProfileQuality; cdecl; external libcolord;
function cd_device_kind_to_profile_kind(device_kind: TCdDeviceKind): TCdProfileKind; cdecl; external libcolord;
function cd_sensor_error_to_string(error_enum: TCdSensorError): Pgchar; cdecl; external libcolord;
function cd_sensor_error_from_string(error_desc: Pgchar): TCdSensorError; cdecl; external libcolord;
function cd_profile_error_to_string(error_enum: TCdProfileError): Pgchar; cdecl; external libcolord;
function cd_profile_error_from_string(error_desc: Pgchar): TCdProfileError; cdecl; external libcolord;
function cd_device_error_to_string(error_enum: TCdDeviceError): Pgchar; cdecl; external libcolord;
function cd_device_error_from_string(error_desc: Pgchar): TCdDeviceError; cdecl; external libcolord;
function cd_client_error_to_string(error_enum: TCdClientError): Pgchar; cdecl; external libcolord;
function cd_client_error_from_string(error_desc: Pgchar): TCdClientError; cdecl; external libcolord;

// === Konventiert am: 1-11-25 16:08:08 ===

function cd_bitfield_value(tmp: Tguint64): Tguint64; inline;
procedure cd_bitfield_add(var bitfield: Tguint64; tmp: Tguint64); inline;
procedure cd_bitfield_remove(var bitfield: Tguint64; tmp: Tguint64); inline;
function cd_bitfield_contain(bitfield: Tguint64; tmp: Tguint64): boolean; inline;


{$ENDIF read_interface}


{$IFDEF read_implementation}


type
  guint64 = QWord;

function cd_bitfield_value(tmp: Tguint64): Tguint64;
begin
  Result := guint64(1) shl tmp;
end;

procedure cd_bitfield_add(var bitfield: Tguint64; tmp: Tguint64);
begin
  bitfield := bitfield or cd_bitfield_value(tmp);
end;

procedure cd_bitfield_remove(var bitfield: Tguint64; tmp: Tguint64);
begin
  bitfield := bitfield and not cd_bitfield_value(tmp);
end;

function cd_bitfield_contain(bitfield: Tguint64; tmp: Tguint64): boolean;
begin
  Result := (bitfield and cd_bitfield_value(tmp)) <> 0;
end;


{$ENDIF read_implementation}
