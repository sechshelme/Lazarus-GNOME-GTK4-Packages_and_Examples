/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 02-10-2024   19:39                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

  {#warning "The GstPhotography interface is unstable API and may change in future." }
  {#warning "You can define GST_USE_UNSTABLE_API to avoid this warning."  }
const
  GST_PHOTOGRAPHY_AUTOFOCUS_DONE = 'autofocus-done';
  GST_PHOTOGRAPHY_SHAKE_RISK = 'shake-risk';
  MAX_WHITE_POINT_VALUES = 4;
  GST_PHOTOGRAPHY_PROP_WB_MODE = 'white-balance-mode';
  GST_PHOTOGRAPHY_PROP_COLOR_TONE = 'color-tone-mode';
  GST_PHOTOGRAPHY_PROP_SCENE_MODE = 'scene-mode';
  GST_PHOTOGRAPHY_PROP_FLASH_MODE = 'flash-mode';
  GST_PHOTOGRAPHY_PROP_NOISE_REDUCTION = 'noise-reduction';
  GST_PHOTOGRAPHY_PROP_FOCUS_STATUS = 'focus-status';
  GST_PHOTOGRAPHY_PROP_CAPABILITIES = 'capabilities';
  GST_PHOTOGRAPHY_PROP_SHAKE_RISK = 'shake-risk';
  GST_PHOTOGRAPHY_PROP_EV_COMP = 'ev-compensation';
  GST_PHOTOGRAPHY_PROP_ISO_SPEED = 'iso-speed';
  GST_PHOTOGRAPHY_PROP_APERTURE = 'aperture';
  GST_PHOTOGRAPHY_PROP_EXPOSURE_TIME = 'exposure-time';
  GST_PHOTOGRAPHY_PROP_IMAGE_CAPTURE_SUPPORTED_CAPS = 'image-capture-supported-caps';
  GST_PHOTOGRAPHY_PROP_IMAGE_PREVIEW_SUPPORTED_CAPS = 'image-preview-supported-caps';
  GST_PHOTOGRAPHY_PROP_FLICKER_MODE = 'flicker-mode';
  GST_PHOTOGRAPHY_PROP_FOCUS_MODE = 'focus-mode';
  GST_PHOTOGRAPHY_PROP_ZOOM = 'zoom';
  GST_PHOTOGRAPHY_PROP_COLOR_TEMPERATURE = 'color-temperature';
  GST_PHOTOGRAPHY_PROP_WHITE_POINT = 'white-point';
  GST_PHOTOGRAPHY_PROP_ANALOG_GAIN = 'analog-gain';
  GST_PHOTOGRAPHY_PROP_EXPOSURE_MODE = 'exposure-mode';
  GST_PHOTOGRAPHY_PROP_LENS_FOCUS = 'lens-focus';
  GST_PHOTOGRAPHY_PROP_MIN_EXPOSURE_TIME = 'min-exposure-time';
  GST_PHOTOGRAPHY_PROP_MAX_EXPOSURE_TIME = 'max-exposure-time';

type
  PGstPhotographyNoiseReduction = ^TGstPhotographyNoiseReduction;
  TGstPhotographyNoiseReduction = longint;

const
  GST_PHOTOGRAPHY_NOISE_REDUCTION_BAYER = 1 shl 0;
  GST_PHOTOGRAPHY_NOISE_REDUCTION_YCC = 1 shl 1;
  GST_PHOTOGRAPHY_NOISE_REDUCTION_TEMPORAL = 1 shl 2;
  GST_PHOTOGRAPHY_NOISE_REDUCTION_FIXED = 1 shl 3;
  GST_PHOTOGRAPHY_NOISE_REDUCTION_EXTRA = 1 shl 4;

type
  PGstPhotographyWhiteBalanceMode = ^TGstPhotographyWhiteBalanceMode;
  TGstPhotographyWhiteBalanceMode = longint;

const
  GST_PHOTOGRAPHY_WB_MODE_AUTO = 0;
  GST_PHOTOGRAPHY_WB_MODE_DAYLIGHT = 1;
  GST_PHOTOGRAPHY_WB_MODE_CLOUDY = 2;
  GST_PHOTOGRAPHY_WB_MODE_SUNSET = 3;
  GST_PHOTOGRAPHY_WB_MODE_TUNGSTEN = 4;
  GST_PHOTOGRAPHY_WB_MODE_FLUORESCENT = 5;
  GST_PHOTOGRAPHY_WB_MODE_MANUAL = 6;
  GST_PHOTOGRAPHY_WB_MODE_WARM_FLUORESCENT = 7;
  GST_PHOTOGRAPHY_WB_MODE_SHADE = 8;

type
  PGstPhotographyColorToneMode = ^TGstPhotographyColorToneMode;
  TGstPhotographyColorToneMode = longint;

const
  GST_PHOTOGRAPHY_COLOR_TONE_MODE_NORMAL = 0;
  GST_PHOTOGRAPHY_COLOR_TONE_MODE_SEPIA = 1;
  GST_PHOTOGRAPHY_COLOR_TONE_MODE_NEGATIVE = 2;
  GST_PHOTOGRAPHY_COLOR_TONE_MODE_GRAYSCALE = 3;
  GST_PHOTOGRAPHY_COLOR_TONE_MODE_NATURAL = 4;
  GST_PHOTOGRAPHY_COLOR_TONE_MODE_VIVID = 5;
  GST_PHOTOGRAPHY_COLOR_TONE_MODE_COLORSWAP = 6;
  GST_PHOTOGRAPHY_COLOR_TONE_MODE_SOLARIZE = 7;
  GST_PHOTOGRAPHY_COLOR_TONE_MODE_OUT_OF_FOCUS = 8;
  GST_PHOTOGRAPHY_COLOR_TONE_MODE_SKY_BLUE = 9;
  GST_PHOTOGRAPHY_COLOR_TONE_MODE_GRASS_GREEN = 10;
  GST_PHOTOGRAPHY_COLOR_TONE_MODE_SKIN_WHITEN = 11;
  GST_PHOTOGRAPHY_COLOR_TONE_MODE_POSTERIZE = 12;
  GST_PHOTOGRAPHY_COLOR_TONE_MODE_WHITEBOARD = 13;
  GST_PHOTOGRAPHY_COLOR_TONE_MODE_BLACKBOARD = 14;
  GST_PHOTOGRAPHY_COLOR_TONE_MODE_AQUA = 15;
  GST_PHOTOGRAPHY_COLOR_TONE_MODE_EMBOSS = 16;
  GST_PHOTOGRAPHY_COLOR_TONE_MODE_SKETCH = 17;
  GST_PHOTOGRAPHY_COLOR_TONE_MODE_NEON = 18;

type
  PGstPhotographySceneMode = ^TGstPhotographySceneMode;
  TGstPhotographySceneMode = longint;

const
  GST_PHOTOGRAPHY_SCENE_MODE_MANUAL = 0;
  GST_PHOTOGRAPHY_SCENE_MODE_CLOSEUP = 1;
  GST_PHOTOGRAPHY_SCENE_MODE_PORTRAIT = 2;
  GST_PHOTOGRAPHY_SCENE_MODE_LANDSCAPE = 3;
  GST_PHOTOGRAPHY_SCENE_MODE_SPORT = 4;
  GST_PHOTOGRAPHY_SCENE_MODE_NIGHT = 5;
  GST_PHOTOGRAPHY_SCENE_MODE_AUTO = 6;
  GST_PHOTOGRAPHY_SCENE_MODE_ACTION = 7;
  GST_PHOTOGRAPHY_SCENE_MODE_NIGHT_PORTRAIT = 8;
  GST_PHOTOGRAPHY_SCENE_MODE_THEATRE = 9;
  GST_PHOTOGRAPHY_SCENE_MODE_BEACH = 10;
  GST_PHOTOGRAPHY_SCENE_MODE_SNOW = 11;
  GST_PHOTOGRAPHY_SCENE_MODE_SUNSET = 12;
  GST_PHOTOGRAPHY_SCENE_MODE_STEADY_PHOTO = 13;
  GST_PHOTOGRAPHY_SCENE_MODE_FIREWORKS = 14;
  GST_PHOTOGRAPHY_SCENE_MODE_PARTY = 15;
  GST_PHOTOGRAPHY_SCENE_MODE_CANDLELIGHT = 16;
  GST_PHOTOGRAPHY_SCENE_MODE_BARCODE = 17;
  GST_PHOTOGRAPHY_SCENE_MODE_BACKLIGHT = 18;
  GST_PHOTOGRAPHY_SCENE_MODE_FLOWERS = 19;
  GST_PHOTOGRAPHY_SCENE_MODE_AR = 20;
  GST_PHOTOGRAPHY_SCENE_MODE_HDR = 21;

type
  PGstPhotographyFlashMode = ^TGstPhotographyFlashMode;
  TGstPhotographyFlashMode = longint;

const
  GST_PHOTOGRAPHY_FLASH_MODE_AUTO = 0;
  GST_PHOTOGRAPHY_FLASH_MODE_OFF = 1;
  GST_PHOTOGRAPHY_FLASH_MODE_ON = 2;
  GST_PHOTOGRAPHY_FLASH_MODE_FILL_IN = 3;
  GST_PHOTOGRAPHY_FLASH_MODE_RED_EYE = 4;

type
  PGstPhotographyFocusStatus = ^TGstPhotographyFocusStatus;
  TGstPhotographyFocusStatus = longint;

const
  GST_PHOTOGRAPHY_FOCUS_STATUS_NONE = 0;
  GST_PHOTOGRAPHY_FOCUS_STATUS_RUNNING = 1;
  GST_PHOTOGRAPHY_FOCUS_STATUS_FAIL = 2;
  GST_PHOTOGRAPHY_FOCUS_STATUS_SUCCESS = 3;

type
  PGstPhotographyCaps = ^TGstPhotographyCaps;
  TGstPhotographyCaps = longint;

const
  GST_PHOTOGRAPHY_CAPS_NONE = 0 shl 0;
  GST_PHOTOGRAPHY_CAPS_EV_COMP = 1 shl 0;
  GST_PHOTOGRAPHY_CAPS_ISO_SPEED = 1 shl 1;
  GST_PHOTOGRAPHY_CAPS_WB_MODE = 1 shl 2;
  GST_PHOTOGRAPHY_CAPS_TONE = 1 shl 3;
  GST_PHOTOGRAPHY_CAPS_SCENE = 1 shl 4;
  GST_PHOTOGRAPHY_CAPS_FLASH = 1 shl 5;
  GST_PHOTOGRAPHY_CAPS_ZOOM = 1 shl 6;
  GST_PHOTOGRAPHY_CAPS_FOCUS = 1 shl 7;
  GST_PHOTOGRAPHY_CAPS_APERTURE = 1 shl 8;
  GST_PHOTOGRAPHY_CAPS_EXPOSURE = 1 shl 9;
  GST_PHOTOGRAPHY_CAPS_SHAKE = 1 shl 10;
  GST_PHOTOGRAPHY_CAPS_WHITE_BALANCE = 1 shl 11;
  GST_PHOTOGRAPHY_CAPS_NOISE_REDUCTION = 1 shl 12;
  GST_PHOTOGRAPHY_CAPS_FLICKER_REDUCTION = 1 shl 13;
  GST_PHOTOGRAPHY_CAPS_ALL = not (0);

type
  PGstPhotographyShakeRisk = ^TGstPhotographyShakeRisk;
  TGstPhotographyShakeRisk = longint;

const
  GST_PHOTOGRAPHY_SHAKE_RISK_LOW = 0;
  GST_PHOTOGRAPHY_SHAKE_RISK_MEDIUM = 1;
  GST_PHOTOGRAPHY_SHAKE_RISK_HIGH = 2;

type
  PGstPhotographyFlickerReductionMode = ^TGstPhotographyFlickerReductionMode;
  TGstPhotographyFlickerReductionMode = longint;

const
  GST_PHOTOGRAPHY_FLICKER_REDUCTION_OFF = 0;
  GST_PHOTOGRAPHY_FLICKER_REDUCTION_50HZ = 1;
  GST_PHOTOGRAPHY_FLICKER_REDUCTION_60HZ = 2;
  GST_PHOTOGRAPHY_FLICKER_REDUCTION_AUTO = 3;

type
  PGstPhotographyFocusMode = ^TGstPhotographyFocusMode;
  TGstPhotographyFocusMode = longint;

const
  GST_PHOTOGRAPHY_FOCUS_MODE_AUTO = 0;
  GST_PHOTOGRAPHY_FOCUS_MODE_MACRO = 1;
  GST_PHOTOGRAPHY_FOCUS_MODE_PORTRAIT = 2;
  GST_PHOTOGRAPHY_FOCUS_MODE_INFINITY = 3;
  GST_PHOTOGRAPHY_FOCUS_MODE_HYPERFOCAL = 4;
  GST_PHOTOGRAPHY_FOCUS_MODE_EXTENDED = 5;
  GST_PHOTOGRAPHY_FOCUS_MODE_CONTINUOUS_NORMAL = 6;
  GST_PHOTOGRAPHY_FOCUS_MODE_CONTINUOUS_EXTENDED = 7;
  GST_PHOTOGRAPHY_FOCUS_MODE_MANUAL = 8;

type
  PGstPhotographyExposureMode = ^TGstPhotographyExposureMode;
  TGstPhotographyExposureMode = longint;

const
  GST_PHOTOGRAPHY_EXPOSURE_MODE_AUTO = 0;
  GST_PHOTOGRAPHY_EXPOSURE_MODE_MANUAL = 1;

type
  TGstPhotographySettings = record
    wb_mode: TGstPhotographyWhiteBalanceMode;
    tone_mode: TGstPhotographyColorToneMode;
    scene_mode: TGstPhotographySceneMode;
    flash_mode: TGstPhotographyFlashMode;
    exposure_time: Tguint32;
    aperture: Tguint;
    ev_compensation: Tgfloat;
    iso_speed: Tguint;
    zoom: Tgfloat;
    flicker_mode: TGstPhotographyFlickerReductionMode;
    focus_mode: TGstPhotographyFocusMode;
    noise_reduction: TGstPhotographyNoiseReduction;
    exposure_mode: TGstPhotographyExposureMode;
    color_temperature: Tguint;
    white_point: array[0..(MAX_WHITE_POINT_VALUES) - 1] of Tguint;
    analog_gain: Tgfloat;
    lens_focus: Tgfloat;
    min_exposure_time: Tguint;
    max_exposure_time: Tguint;
  end;
  PGstPhotographySettings = ^TGstPhotographySettings;

  TGstPhotography = record
  end;
  PGstPhotography = ^TGstPhotography;

  TGstPhotographyCapturePrepared = procedure(Data: Tgpointer; configured_caps: PGstCaps); cdecl;

  TGstPhotographyInterface = record
    parent: TGTypeInterface;
    get_ev_compensation: function(photo: PGstPhotography; ev_comp: Pgfloat): Tgboolean; cdecl;
    get_iso_speed: function(photo: PGstPhotography; iso_speed: Pguint): Tgboolean; cdecl;
    get_aperture: function(photo: PGstPhotography; aperture: Pguint): Tgboolean; cdecl;
    get_exposure: function(photo: PGstPhotography; exposure: Pguint32): Tgboolean; cdecl;
    get_white_balance_mode: function(photo: PGstPhotography; wb_mode: PGstPhotographyWhiteBalanceMode): Tgboolean; cdecl;
    get_color_tone_mode: function(photo: PGstPhotography; tone_mode: PGstPhotographyColorToneMode): Tgboolean; cdecl;
    get_scene_mode: function(photo: PGstPhotography; scene_mode: PGstPhotographySceneMode): Tgboolean; cdecl;
    get_flash_mode: function(photo: PGstPhotography; flash_mode: PGstPhotographyFlashMode): Tgboolean; cdecl;
    get_zoom: function(photo: PGstPhotography; zoom: Pgfloat): Tgboolean; cdecl;
    get_flicker_mode: function(photo: PGstPhotography; flicker_mode: PGstPhotographyFlickerReductionMode): Tgboolean; cdecl;
    get_focus_mode: function(photo: PGstPhotography; focus_mode: PGstPhotographyFocusMode): Tgboolean; cdecl;
    set_ev_compensation: function(photo: PGstPhotography; ev_comp: Tgfloat): Tgboolean; cdecl;
    set_iso_speed: function(photo: PGstPhotography; iso_speed: Tguint): Tgboolean; cdecl;
    set_aperture: function(photo: PGstPhotography; aperture: Tguint): Tgboolean; cdecl;
    set_exposure: function(photo: PGstPhotography; exposure: Tguint32): Tgboolean; cdecl;
    set_white_balance_mode: function(photo: PGstPhotography; wb_mode: TGstPhotographyWhiteBalanceMode): Tgboolean; cdecl;
    set_color_tone_mode: function(photo: PGstPhotography; tone_mode: TGstPhotographyColorToneMode): Tgboolean; cdecl;
    set_scene_mode: function(photo: PGstPhotography; scene_mode: TGstPhotographySceneMode): Tgboolean; cdecl;
    set_flash_mode: function(photo: PGstPhotography; flash_mode: TGstPhotographyFlashMode): Tgboolean; cdecl;
    set_zoom: function(photo: PGstPhotography; zoom: Tgfloat): Tgboolean; cdecl;
    set_flicker_mode: function(photo: PGstPhotography; flicker_mode: TGstPhotographyFlickerReductionMode): Tgboolean; cdecl;
    set_focus_mode: function(photo: PGstPhotography; focus_mode: TGstPhotographyFocusMode): Tgboolean; cdecl;
    get_capabilities: function(photo: PGstPhotography): TGstPhotographyCaps; cdecl;
    prepare_for_capture: function(photo: PGstPhotography; func: TGstPhotographyCapturePrepared; capture_caps: PGstCaps; user_data: Tgpointer): Tgboolean; cdecl;
    set_autofocus: procedure(photo: PGstPhotography; on: Tgboolean); cdecl;
    set_config: function(photo: PGstPhotography; config: PGstPhotographySettings): Tgboolean; cdecl;
    get_config: function(photo: PGstPhotography; config: PGstPhotographySettings): Tgboolean; cdecl;
    get_noise_reduction: function(photo: PGstPhotography; noise_reduction: PGstPhotographyNoiseReduction): Tgboolean; cdecl;
    set_noise_reduction: function(photo: PGstPhotography; noise_reduction: TGstPhotographyNoiseReduction): Tgboolean; cdecl;
    set_exposure_mode: function(photo: PGstPhotography; exposure_mode: TGstPhotographyExposureMode): Tgboolean; cdecl;
    get_exposure_mode: function(photo: PGstPhotography; exposure_mode: PGstPhotographyExposureMode): Tgboolean; cdecl;
    set_analog_gain: function(photo: PGstPhotography; analog_gain: Tgfloat): Tgboolean; cdecl;
    get_analog_gain: function(photo: PGstPhotography; analog_gain: Pgfloat): Tgboolean; cdecl;
    set_lens_focus: function(photo: PGstPhotography; lens_focus: Tgfloat): Tgboolean; cdecl;
    get_lens_focus: function(photo: PGstPhotography; lens_focus: Pgfloat): Tgboolean; cdecl;
    set_color_temperature: function(photo: PGstPhotography; color_temperature: Tguint): Tgboolean; cdecl;
    get_color_temperature: function(photo: PGstPhotography; color_temperature: Pguint): Tgboolean; cdecl;
    set_min_exposure_time: function(photo: PGstPhotography; min_exposure_time: Tguint): Tgboolean; cdecl;
    get_min_exposure_time: function(photo: PGstPhotography; min_exposure_time: Pguint): Tgboolean; cdecl;
    set_max_exposure_time: function(photo: PGstPhotography; max_exposure_time: Tguint): Tgboolean; cdecl;
    get_max_exposure_time: function(photo: PGstPhotography; max_exposure_time: Pguint): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstPhotographyInterface = ^TGstPhotographyInterface;

function gst_photography_get_type: TGType; cdecl; external libgstphotography;
function gst_photography_get_ev_compensation(photo: PGstPhotography; ev_comp: Pgfloat): Tgboolean; cdecl; external libgstphotography;
function gst_photography_get_iso_speed(photo: PGstPhotography; iso_speed: Pguint): Tgboolean; cdecl; external libgstphotography;
function gst_photography_get_aperture(photo: PGstPhotography; aperture: Pguint): Tgboolean; cdecl; external libgstphotography;
function gst_photography_get_exposure(photo: PGstPhotography; exposure: Pguint32): Tgboolean; cdecl; external libgstphotography;
function gst_photography_get_white_balance_mode(photo: PGstPhotography; wb_mode: PGstPhotographyWhiteBalanceMode): Tgboolean; cdecl; external libgstphotography;
function gst_photography_get_color_tone_mode(photo: PGstPhotography; tone_mode: PGstPhotographyColorToneMode): Tgboolean; cdecl; external libgstphotography;
function gst_photography_get_scene_mode(photo: PGstPhotography; scene_mode: PGstPhotographySceneMode): Tgboolean; cdecl; external libgstphotography;
function gst_photography_get_flash_mode(photo: PGstPhotography; flash_mode: PGstPhotographyFlashMode): Tgboolean; cdecl; external libgstphotography;
function gst_photography_get_noise_reduction(photo: PGstPhotography; noise_reduction: PGstPhotographyNoiseReduction): Tgboolean; cdecl; external libgstphotography;
function gst_photography_get_zoom(photo: PGstPhotography; zoom: Pgfloat): Tgboolean; cdecl; external libgstphotography;
function gst_photography_get_flicker_mode(photo: PGstPhotography; mode: PGstPhotographyFlickerReductionMode): Tgboolean; cdecl; external libgstphotography;
function gst_photography_get_focus_mode(photo: PGstPhotography; mode: PGstPhotographyFocusMode): Tgboolean; cdecl; external libgstphotography;
function gst_photography_set_ev_compensation(photo: PGstPhotography; ev_comp: Tgfloat): Tgboolean; cdecl; external libgstphotography;
function gst_photography_set_iso_speed(photo: PGstPhotography; iso_speed: Tguint): Tgboolean; cdecl; external libgstphotography;
function gst_photography_set_aperture(photo: PGstPhotography; aperture: Tguint): Tgboolean; cdecl; external libgstphotography;
function gst_photography_set_exposure(photo: PGstPhotography; exposure: Tguint): Tgboolean; cdecl; external libgstphotography;
function gst_photography_set_white_balance_mode(photo: PGstPhotography; wb_mode: TGstPhotographyWhiteBalanceMode): Tgboolean; cdecl; external libgstphotography;
function gst_photography_set_color_tone_mode(photo: PGstPhotography; tone_mode: TGstPhotographyColorToneMode): Tgboolean; cdecl; external libgstphotography;
function gst_photography_set_scene_mode(photo: PGstPhotography; scene_mode: TGstPhotographySceneMode): Tgboolean; cdecl; external libgstphotography;
function gst_photography_set_flash_mode(photo: PGstPhotography; flash_mode: TGstPhotographyFlashMode): Tgboolean; cdecl; external libgstphotography;
function gst_photography_set_noise_reduction(photo: PGstPhotography; noise_reduction: TGstPhotographyNoiseReduction): Tgboolean; cdecl; external libgstphotography;
function gst_photography_set_zoom(photo: PGstPhotography; zoom: Tgfloat): Tgboolean; cdecl; external libgstphotography;
function gst_photography_set_flicker_mode(photo: PGstPhotography; mode: TGstPhotographyFlickerReductionMode): Tgboolean; cdecl; external libgstphotography;
function gst_photography_set_focus_mode(photo: PGstPhotography; mode: TGstPhotographyFocusMode): Tgboolean; cdecl; external libgstphotography;
function gst_photography_get_capabilities(photo: PGstPhotography): TGstPhotographyCaps; cdecl; external libgstphotography;
function gst_photography_prepare_for_capture(photo: PGstPhotography; func: TGstPhotographyCapturePrepared; capture_caps: PGstCaps; user_data: Tgpointer): Tgboolean; cdecl; external libgstphotography;
function gst_photography_set_config(photo: PGstPhotography; config: PGstPhotographySettings): Tgboolean; cdecl; external libgstphotography;
function gst_photography_get_config(photo: PGstPhotography; config: PGstPhotographySettings): Tgboolean; cdecl; external libgstphotography;
procedure gst_photography_set_autofocus(photo: PGstPhotography; on_: Tgboolean); cdecl; external libgstphotography;

// === Konventiert am: 2-10-24 19:27:58 ===

function GST_TYPE_PHOTOGRAPHY: TGType;
function GST_PHOTOGRAPHY(obj: Pointer): PGstPhotography;
function GST_IS_PHOTOGRAPHY(obj: Pointer): Tgboolean;
function GST_PHOTOGRAPHY_GET_INTERFACE(obj: Pointer): PGstPhotographyInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_PHOTOGRAPHY: TGType;
begin
  GST_TYPE_PHOTOGRAPHY := gst_photography_get_type;
end;

function GST_PHOTOGRAPHY(obj: Pointer): PGstPhotography;
begin
  Result := PGstPhotography(g_type_check_instance_cast(obj, GST_TYPE_PHOTOGRAPHY));
end;

function GST_IS_PHOTOGRAPHY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PHOTOGRAPHY);
end;

function GST_PHOTOGRAPHY_GET_INTERFACE(obj: Pointer): PGstPhotographyInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_PHOTOGRAPHY);
end;



{$ENDIF read_implementation}
