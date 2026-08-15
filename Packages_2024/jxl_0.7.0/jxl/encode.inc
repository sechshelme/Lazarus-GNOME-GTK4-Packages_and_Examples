{$IFDEF read_interface}


function JxlEncoderVersion: Tuint32_t; cdecl; external libjxl;

type
  PJxlEncoder = type Pointer;
  PJxlEncoderFrameSettings = type Pointer;
  PJxlEncoderOptions = PJxlEncoderFrameSettings;

type
  PJxlEncoderStatus = ^TJxlEncoderStatus;
  TJxlEncoderStatus = longint;
const
  JXL_ENC_SUCCESS = 0;
  JXL_ENC_ERROR = 1;
  JXL_ENC_NEED_MORE_OUTPUT = 2;
  JXL_ENC_NOT_SUPPORTED = 3;

type
  PJxlEncoderError = ^TJxlEncoderError;
  TJxlEncoderError = longint;
const
  JXL_ENC_ERR_OK = 0;
  JXL_ENC_ERR_GENERIC = 1;
  JXL_ENC_ERR_OOM = 2;
  JXL_ENC_ERR_JBRD = 3;
  JXL_ENC_ERR_BAD_INPUT = 4;
  JXL_ENC_ERR_NOT_SUPPORTED = $80;
  JXL_ENC_ERR_API_USAGE = $81;

type
  PJxlEncoderFrameSettingId = ^TJxlEncoderFrameSettingId;
  TJxlEncoderFrameSettingId = longint;
const
  JXL_ENC_FRAME_SETTING_EFFORT = 0;
  JXL_ENC_FRAME_SETTING_DECODING_SPEED = 1;
  JXL_ENC_FRAME_SETTING_RESAMPLING = 2;
  JXL_ENC_FRAME_SETTING_EXTRA_CHANNEL_RESAMPLING = 3;
  JXL_ENC_FRAME_SETTING_ALREADY_DOWNSAMPLED = 4;
  JXL_ENC_FRAME_SETTING_PHOTON_NOISE = 5;
  JXL_ENC_FRAME_SETTING_NOISE = 6;
  JXL_ENC_FRAME_SETTING_DOTS = 7;
  JXL_ENC_FRAME_SETTING_PATCHES = 8;
  JXL_ENC_FRAME_SETTING_EPF = 9;
  JXL_ENC_FRAME_SETTING_GABORISH = 10;
  JXL_ENC_FRAME_SETTING_MODULAR = 11;
  JXL_ENC_FRAME_SETTING_KEEP_INVISIBLE = 12;
  JXL_ENC_FRAME_SETTING_GROUP_ORDER = 13;
  JXL_ENC_FRAME_SETTING_GROUP_ORDER_CENTER_X = 14;
  JXL_ENC_FRAME_SETTING_GROUP_ORDER_CENTER_Y = 15;
  JXL_ENC_FRAME_SETTING_RESPONSIVE = 16;
  JXL_ENC_FRAME_SETTING_PROGRESSIVE_AC = 17;
  JXL_ENC_FRAME_SETTING_QPROGRESSIVE_AC = 18;
  JXL_ENC_FRAME_SETTING_PROGRESSIVE_DC = 19;
  JXL_ENC_FRAME_SETTING_CHANNEL_COLORS_GLOBAL_PERCENT = 20;
  JXL_ENC_FRAME_SETTING_CHANNEL_COLORS_GROUP_PERCENT = 21;
  JXL_ENC_FRAME_SETTING_PALETTE_COLORS = 22;
  JXL_ENC_FRAME_SETTING_LOSSY_PALETTE = 23;
  JXL_ENC_FRAME_SETTING_COLOR_TRANSFORM = 24;
  JXL_ENC_FRAME_SETTING_MODULAR_COLOR_SPACE = 25;
  JXL_ENC_FRAME_SETTING_MODULAR_GROUP_SIZE = 26;
  JXL_ENC_FRAME_SETTING_MODULAR_PREDICTOR = 27;
  JXL_ENC_FRAME_SETTING_MODULAR_MA_TREE_LEARNING_PERCENT = 28;
  JXL_ENC_FRAME_SETTING_MODULAR_NB_PREV_CHANNELS = 29;
  JXL_ENC_FRAME_SETTING_JPEG_RECON_CFL = 30;
  JXL_ENC_FRAME_INDEX_BOX = 31;
  JXL_ENC_FRAME_SETTING_BROTLI_EFFORT = 32;
  JXL_ENC_FRAME_SETTING_FILL_ENUM = 65535;

function JxlEncoderCreate(memory_manager: PJxlMemoryManager): PJxlEncoder; cdecl; external libjxl;
procedure JxlEncoderReset(enc: PJxlEncoder); cdecl; external libjxl;
procedure JxlEncoderDestroy(enc: PJxlEncoder); cdecl; external libjxl;
procedure JxlEncoderSetCms(enc: PJxlEncoder; cms: TJxlCmsInterface); cdecl; external libjxl;
function JxlEncoderSetParallelRunner(enc: PJxlEncoder; parallel_runner: TJxlParallelRunner; parallel_runner_opaque: pointer): TJxlEncoderStatus; cdecl; external libjxl;
function JxlEncoderGetError(enc: PJxlEncoder): TJxlEncoderError; cdecl; external libjxl;
function JxlEncoderProcessOutput(enc: PJxlEncoder; next_out: PPuint8_t; avail_out: Psize_t): TJxlEncoderStatus; cdecl; external libjxl;
function JxlEncoderSetFrameHeader(frame_settings: PJxlEncoderFrameSettings; frame_header: PJxlFrameHeader): TJxlEncoderStatus; cdecl; external libjxl;
function JxlEncoderSetExtraChannelBlendInfo(frame_settings: PJxlEncoderFrameSettings; index: Tsize_t; blend_info: PJxlBlendInfo): TJxlEncoderStatus; cdecl; external libjxl;
function JxlEncoderSetFrameName(frame_settings: PJxlEncoderFrameSettings; frame_name: pchar): TJxlEncoderStatus; cdecl; external libjxl;
function JxlEncoderAddJPEGFrame(frame_settings: PJxlEncoderFrameSettings; buffer: Puint8_t; size: Tsize_t): TJxlEncoderStatus; cdecl; external libjxl;
function JxlEncoderAddImageFrame(frame_settings: PJxlEncoderFrameSettings; pixel_format: PJxlPixelFormat; buffer: pointer; size: Tsize_t): TJxlEncoderStatus; cdecl; external libjxl;
function JxlEncoderSetExtraChannelBuffer(frame_settings: PJxlEncoderFrameSettings; pixel_format: PJxlPixelFormat; buffer: pointer; size: Tsize_t; index: Tuint32_t): TJxlEncoderStatus; cdecl; external libjxl;
function JxlEncoderAddBox(enc: PJxlEncoder; _type: TJxlBoxType; contents: Puint8_t; size: Tsize_t; compress_box: TJXL_BOOL): TJxlEncoderStatus; cdecl; external libjxl;
function JxlEncoderUseBoxes(enc: PJxlEncoder): TJxlEncoderStatus; cdecl; external libjxl;
procedure JxlEncoderCloseBoxes(enc: PJxlEncoder); cdecl; external libjxl;
procedure JxlEncoderCloseFrames(enc: PJxlEncoder); cdecl; external libjxl;
procedure JxlEncoderCloseInput(enc: PJxlEncoder); cdecl; external libjxl;
function JxlEncoderSetColorEncoding(enc: PJxlEncoder; color: PJxlColorEncoding): TJxlEncoderStatus; cdecl; external libjxl;
function JxlEncoderSetICCProfile(enc: PJxlEncoder; icc_profile: Puint8_t; size: Tsize_t): TJxlEncoderStatus; cdecl; external libjxl;
procedure JxlEncoderInitBasicInfo(info: PJxlBasicInfo); cdecl; external libjxl;
procedure JxlEncoderInitFrameHeader(frame_header: PJxlFrameHeader); cdecl; external libjxl;
procedure JxlEncoderInitBlendInfo(blend_info: PJxlBlendInfo); cdecl; external libjxl;
function JxlEncoderSetBasicInfo(enc: PJxlEncoder; info: PJxlBasicInfo): TJxlEncoderStatus; cdecl; external libjxl;
procedure JxlEncoderInitExtraChannelInfo(_type: TJxlExtraChannelType; info: PJxlExtraChannelInfo); cdecl; external libjxl;
function JxlEncoderSetExtraChannelInfo(enc: PJxlEncoder; index: Tsize_t; info: PJxlExtraChannelInfo): TJxlEncoderStatus; cdecl; external libjxl;
function JxlEncoderSetExtraChannelName(enc: PJxlEncoder; index: Tsize_t; name: pchar; size: Tsize_t): TJxlEncoderStatus; cdecl; external libjxl;
function JxlEncoderFrameSettingsSetOption(frame_settings: PJxlEncoderFrameSettings; option: TJxlEncoderFrameSettingId; value: Tint64_t): TJxlEncoderStatus; cdecl; external libjxl;
function JxlEncoderFrameSettingsSetFloatOption(frame_settings: PJxlEncoderFrameSettings; option: TJxlEncoderFrameSettingId; value: single): TJxlEncoderStatus; cdecl; external libjxl;
function JxlEncoderUseContainer(enc: PJxlEncoder; use_container: TJXL_BOOL): TJxlEncoderStatus; cdecl; external libjxl;
function JxlEncoderStoreJPEGMetadata(enc: PJxlEncoder; store_jpeg_metadata: TJXL_BOOL): TJxlEncoderStatus; cdecl; external libjxl;
function JxlEncoderSetCodestreamLevel(enc: PJxlEncoder; level: longint): TJxlEncoderStatus; cdecl; external libjxl;
function JxlEncoderGetRequiredCodestreamLevel(enc: PJxlEncoder): longint; cdecl; external libjxl;
function JxlEncoderSetFrameLossless(frame_settings: PJxlEncoderFrameSettings; lossless: TJXL_BOOL): TJxlEncoderStatus; cdecl; external libjxl;
function JxlEncoderOptionsSetLossless(para1: PJxlEncoderFrameSettings; para2: TJXL_BOOL): TJxlEncoderStatus; cdecl; external libjxl;
function JxlEncoderOptionsSetEffort(frame_settings: PJxlEncoderFrameSettings; effort: longint): TJxlEncoderStatus; cdecl; external libjxl; deprecated;
function JxlEncoderOptionsSetDecodingSpeed(frame_settings: PJxlEncoderFrameSettings; tier: longint): TJxlEncoderStatus; cdecl; external libjxl; deprecated;
function JxlEncoderSetFrameDistance(frame_settings: PJxlEncoderFrameSettings; distance: single): TJxlEncoderStatus; cdecl; external libjxl;
function JxlEncoderOptionsSetDistance(para1: PJxlEncoderFrameSettings; para2: single): TJxlEncoderStatus; cdecl; external libjxl; deprecated;
function JxlEncoderFrameSettingsCreate(enc: PJxlEncoder; source: PJxlEncoderFrameSettings): PJxlEncoderFrameSettings; cdecl; external libjxl;
function JxlEncoderOptionsCreate(para1: PJxlEncoder; para2: PJxlEncoderFrameSettings): PJxlEncoderFrameSettings; cdecl; external libjxl; deprecated;
procedure JxlColorEncodingSetToSRGB(color_encoding: PJxlColorEncoding; is_gray: TJXL_BOOL); cdecl; external libjxl;
procedure JxlColorEncodingSetToLinearSRGB(color_encoding: PJxlColorEncoding; is_gray: TJXL_BOOL); cdecl; external libjxl;

// === Konventiert am: 14-8-26 19:29:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
