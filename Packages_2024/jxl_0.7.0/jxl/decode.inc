{$IFDEF read_interface}


function JxlDecoderVersion: Tuint32_t; cdecl; external libjxl;

type
  PJxlSignature = ^TJxlSignature;
  TJxlSignature = longint;
const
  JXL_SIG_NOT_ENOUGH_BYTES = 0;
  JXL_SIG_INVALID = 1;
  JXL_SIG_CODESTREAM = 2;
  JXL_SIG_CONTAINER = 3;

function JxlSignatureCheck(buf: Puint8_t; len: Tsize_t): TJxlSignature; cdecl; external libjxl;

type
  PJxlDecoder = type Pointer;

function JxlDecoderCreate(memory_manager: PJxlMemoryManager): PJxlDecoder; cdecl; external libjxl;
procedure JxlDecoderReset(dec: PJxlDecoder); cdecl; external libjxl;
procedure JxlDecoderDestroy(dec: PJxlDecoder); cdecl; external libjxl;

type
  PJxlDecoderStatus = ^TJxlDecoderStatus;
  TJxlDecoderStatus = longint;
const
  JXL_DEC_SUCCESS = 0;
  JXL_DEC_ERROR = 1;
  JXL_DEC_NEED_MORE_INPUT = 2;
  JXL_DEC_NEED_PREVIEW_OUT_BUFFER = 3;
  JXL_DEC_NEED_DC_OUT_BUFFER = 4;
  JXL_DEC_NEED_IMAGE_OUT_BUFFER = 5;
  JXL_DEC_JPEG_NEED_MORE_OUTPUT = 6;
  JXL_DEC_BOX_NEED_MORE_OUTPUT = 7;
  JXL_DEC_BASIC_INFO = $40;
  JXL_DEC_EXTENSIONS = $80;
  JXL_DEC_COLOR_ENCODING = $100;
  JXL_DEC_PREVIEW_IMAGE = $200;
  JXL_DEC_FRAME = $400;
  JXL_DEC_DC_IMAGE = $800;
  JXL_DEC_FULL_IMAGE = $1000;
  JXL_DEC_JPEG_RECONSTRUCTION = $2000;
  JXL_DEC_BOX = $4000;
  JXL_DEC_FRAME_PROGRESSION = $8000;

procedure JxlDecoderRewind(dec: PJxlDecoder); cdecl; external libjxl;
procedure JxlDecoderSkipFrames(dec: PJxlDecoder; amount: Tsize_t); cdecl; external libjxl;
function JxlDecoderSkipCurrentFrame(dec: PJxlDecoder): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderDefaultPixelFormat(dec: PJxlDecoder; format: PJxlPixelFormat): TJxlDecoderStatus; cdecl; external libjxl; deprecated;
function JxlDecoderSetParallelRunner(dec: PJxlDecoder; parallel_runner: TJxlParallelRunner; parallel_runner_opaque: pointer): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderSizeHintBasicInfo(dec: PJxlDecoder): Tsize_t; cdecl; external libjxl;
function JxlDecoderSubscribeEvents(dec: PJxlDecoder; events_wanted: longint): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderSetKeepOrientation(dec: PJxlDecoder; skip_reorientation: TJXL_BOOL): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderSetUnpremultiplyAlpha(dec: PJxlDecoder; unpremul_alpha: TJXL_BOOL): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderSetRenderSpotcolors(dec: PJxlDecoder; render_spotcolors: TJXL_BOOL): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderSetCoalescing(dec: PJxlDecoder; coalescing: TJXL_BOOL): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderProcessInput(dec: PJxlDecoder): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderSetInput(dec: PJxlDecoder; data: Puint8_t; size: Tsize_t): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderReleaseInput(dec: PJxlDecoder): Tsize_t; cdecl; external libjxl;
procedure JxlDecoderCloseInput(dec: PJxlDecoder); cdecl; external libjxl;
function JxlDecoderGetBasicInfo(dec: PJxlDecoder; info: PJxlBasicInfo): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderGetExtraChannelInfo(dec: PJxlDecoder; index: Tsize_t; info: PJxlExtraChannelInfo): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderGetExtraChannelName(dec: PJxlDecoder; index: Tsize_t; name: pchar; size: Tsize_t): TJxlDecoderStatus; cdecl; external libjxl;

type
  PJxlColorProfileTarget = ^TJxlColorProfileTarget;
  TJxlColorProfileTarget = longint;
const
  JXL_COLOR_PROFILE_TARGET_ORIGINAL = 0;
  JXL_COLOR_PROFILE_TARGET_DATA = 1;

function JxlDecoderGetColorAsEncodedProfile(dec: PJxlDecoder; unused_format: PJxlPixelFormat; target: TJxlColorProfileTarget; color_encoding: PJxlColorEncoding): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderGetICCProfileSize(dec: PJxlDecoder; unused_format: PJxlPixelFormat; target: TJxlColorProfileTarget; size: Psize_t): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderGetColorAsICCProfile(dec: PJxlDecoder; unused_format: PJxlPixelFormat; target: TJxlColorProfileTarget; icc_profile: Puint8_t; size: Tsize_t): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderSetPreferredColorProfile(dec: PJxlDecoder; color_encoding: PJxlColorEncoding): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderSetDesiredIntensityTarget(dec: PJxlDecoder; desired_intensity_target: single): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderPreviewOutBufferSize(dec: PJxlDecoder; format: PJxlPixelFormat; size: Psize_t): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderSetPreviewOutBuffer(dec: PJxlDecoder; format: PJxlPixelFormat; buffer: pointer; size: Tsize_t): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderGetFrameHeader(dec: PJxlDecoder; header: PJxlFrameHeader): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderGetFrameName(dec: PJxlDecoder; name: pchar; size: Tsize_t): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderGetExtraChannelBlendInfo(dec: PJxlDecoder; index: Tsize_t; blend_info: PJxlBlendInfo): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderDCOutBufferSize(dec: PJxlDecoder; format: PJxlPixelFormat; size: Psize_t): TJxlDecoderStatus; cdecl; external libjxl; deprecated;
function JxlDecoderSetDCOutBuffer(dec: PJxlDecoder; format: PJxlPixelFormat; buffer: pointer; size: Tsize_t): TJxlDecoderStatus; cdecl; external libjxl; deprecated;
function JxlDecoderImageOutBufferSize(dec: PJxlDecoder; format: PJxlPixelFormat; size: Psize_t): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderSetImageOutBuffer(dec: PJxlDecoder; format: PJxlPixelFormat; buffer: pointer; size: Tsize_t): TJxlDecoderStatus; cdecl; external libjxl;

type
  TJxlImageOutCallback = procedure(opaque: pointer; x: Tsize_t; y: Tsize_t; num_pixels: Tsize_t; pixels: pointer); cdecl;
  TJxlImageOutInitCallback = function(init_opaque: pointer; num_threads: Tsize_t; num_pixels_per_thread: Tsize_t): pointer; cdecl;
  TJxlImageOutRunCallback = procedure(run_opaque: pointer; thread_id: Tsize_t; x: Tsize_t; y: Tsize_t; num_pixels: Tsize_t; pixels: pointer); cdecl;
  TJxlImageOutDestroyCallback = procedure(run_opaque: pointer); cdecl;

function JxlDecoderSetImageOutCallback(dec: PJxlDecoder; format: PJxlPixelFormat; callback: TJxlImageOutCallback; opaque: pointer): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderSetMultithreadedImageOutCallback(dec: PJxlDecoder; format: PJxlPixelFormat; init_callback: TJxlImageOutInitCallback; run_callback: TJxlImageOutRunCallback; destroy_callback: TJxlImageOutDestroyCallback;
  init_opaque: pointer): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderExtraChannelBufferSize(dec: PJxlDecoder; format: PJxlPixelFormat; size: Psize_t; index: Tuint32_t): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderSetExtraChannelBuffer(dec: PJxlDecoder; format: PJxlPixelFormat; buffer: pointer; size: Tsize_t; index: Tuint32_t): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderSetJPEGBuffer(dec: PJxlDecoder; data: Puint8_t; size: Tsize_t): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderReleaseJPEGBuffer(dec: PJxlDecoder): Tsize_t; cdecl; external libjxl;
function JxlDecoderSetBoxBuffer(dec: PJxlDecoder; data: Puint8_t; size: Tsize_t): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderReleaseBoxBuffer(dec: PJxlDecoder): Tsize_t; cdecl; external libjxl;
function JxlDecoderSetDecompressBoxes(dec: PJxlDecoder; decompress: TJXL_BOOL): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderGetBoxType(dec: PJxlDecoder; _type: TJxlBoxType; decompressed: TJXL_BOOL): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderGetBoxSizeRaw(dec: PJxlDecoder; size: Puint64_t): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderSetProgressiveDetail(dec: PJxlDecoder; detail: TJxlProgressiveDetail): TJxlDecoderStatus; cdecl; external libjxl;
function JxlDecoderGetIntendedDownsamplingRatio(dec: PJxlDecoder): Tsize_t; cdecl; external libjxl;
function JxlDecoderFlushImage(dec: PJxlDecoder): TJxlDecoderStatus; cdecl; external libjxl;

// === Konventiert am: 14-8-26 19:29:06 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
