unit hwcontext;

interface

uses
  fp_ffmpeg, log, buffer, pixfmt, dict, frame;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAVHWDeviceType = longint;

const
  AV_HWDEVICE_TYPE_NONE = 0;
  AV_HWDEVICE_TYPE_VDPAU = 1;
  AV_HWDEVICE_TYPE_CUDA = 2;
  AV_HWDEVICE_TYPE_VAAPI = 3;
  AV_HWDEVICE_TYPE_DXVA2 = 4;
  AV_HWDEVICE_TYPE_QSV = 5;
  AV_HWDEVICE_TYPE_VIDEOTOOLBOX = 6;
  AV_HWDEVICE_TYPE_D3D11VA = 7;
  AV_HWDEVICE_TYPE_DRM = 8;
  AV_HWDEVICE_TYPE_OPENCL = 9;
  AV_HWDEVICE_TYPE_MEDIACODEC = 10;
  AV_HWDEVICE_TYPE_VULKAN = 11;

type
  PAVHWDeviceInternal = type Pointer;

  PAVHWDeviceContext = ^TAVHWDeviceContext;
  TAVHWDeviceContext = record
    av_class: PAVClass;
    internal: PAVHWDeviceInternal;
    _type: TAVHWDeviceType;
    hwctx: pointer;
    free: procedure(ctx: PAVHWDeviceContext); cdecl;
    user_opaque: pointer;
  end;

  PAVHWFramesInternal = type Pointer;

  PAVHWFramesContext = ^TAVHWFramesContext;
  TAVHWFramesContext = record
    av_class: PAVClass;
    internal: PAVHWFramesInternal;
    device_ref: PAVBufferRef;
    device_ctx: PAVHWDeviceContext;
    hwctx: pointer;
    free: procedure(ctx: PAVHWFramesContext); cdecl;
    user_opaque: pointer;
    pool: PAVBufferPool;
    initial_pool_size: longint;
    format: TAVPixelFormat;
    sw_format: TAVPixelFormat;
    width: longint;
    height: longint;
  end;

function av_hwdevice_find_type_by_name(name: pchar): TAVHWDeviceType; cdecl; external libavutil;
function av_hwdevice_get_type_name(_type: TAVHWDeviceType): pchar; cdecl; external libavutil;
function av_hwdevice_iterate_types(prev: TAVHWDeviceType): TAVHWDeviceType; cdecl; external libavutil;
function av_hwdevice_ctx_alloc(_type: TAVHWDeviceType): PAVBufferRef; cdecl; external libavutil;
function av_hwdevice_ctx_init(ref: PAVBufferRef): longint; cdecl; external libavutil;
function av_hwdevice_ctx_create(device_ctx: PPAVBufferRef; _type: TAVHWDeviceType; device: pchar; opts: PAVDictionary; flags: longint): longint; cdecl; external libavutil;
function av_hwdevice_ctx_create_derived(dst_ctx: PPAVBufferRef; _type: TAVHWDeviceType; src_ctx: PAVBufferRef; flags: longint): longint; cdecl; external libavutil;
function av_hwdevice_ctx_create_derived_opts(dst_ctx: PPAVBufferRef; _type: TAVHWDeviceType; src_ctx: PAVBufferRef; options: PAVDictionary; flags: longint): longint; cdecl; external libavutil;
function av_hwframe_ctx_alloc(device_ctx: PAVBufferRef): PAVBufferRef; cdecl; external libavutil;
function av_hwframe_ctx_init(ref: PAVBufferRef): longint; cdecl; external libavutil;
function av_hwframe_get_buffer(hwframe_ctx: PAVBufferRef; frame: PAVFrame; flags: longint): longint; cdecl; external libavutil;
function av_hwframe_transfer_data(dst: PAVFrame; src: PAVFrame; flags: longint): longint; cdecl; external libavutil;

type
  TAVHWFrameTransferDirection = longint;

const
  AV_HWFRAME_TRANSFER_DIRECTION_FROM = 0;
  AV_HWFRAME_TRANSFER_DIRECTION_TO = 1;

function av_hwframe_transfer_get_formats(hwframe_ctx: PAVBufferRef; dir: TAVHWFrameTransferDirection; formats: PPAVPixelFormat; flags: longint): longint; cdecl; external libavutil;

type
  TAVHWFramesConstraints = record
    valid_hw_formats: PAVPixelFormat;
    valid_sw_formats: PAVPixelFormat;
    min_width: longint;
    min_height: longint;
    max_width: longint;
    max_height: longint;
  end;
  PAVHWFramesConstraints = ^TAVHWFramesConstraints;
  PPAVHWFramesConstraints = ^PAVHWFramesConstraints;

function av_hwdevice_hwconfig_alloc(device_ctx: PAVBufferRef): pointer; cdecl; external libavutil;
function av_hwdevice_get_hwframe_constraints(ref: PAVBufferRef; hwconfig: pointer): PAVHWFramesConstraints; cdecl; external libavutil;
procedure av_hwframe_constraints_free(constraints: PPAVHWFramesConstraints); cdecl; external libavutil;

const
  AV_HWFRAME_MAP_READ = 1 shl 0;
  AV_HWFRAME_MAP_WRITE = 1 shl 1;
  AV_HWFRAME_MAP_OVERWRITE = 1 shl 2;
  AV_HWFRAME_MAP_DIRECT = 1 shl 3;

function av_hwframe_map(dst: PAVFrame; src: PAVFrame; flags: longint): longint; cdecl; external libavutil;
function av_hwframe_ctx_create_derived(derived_frame_ctx: PPAVBufferRef; format: TAVPixelFormat; derived_device_ctx: PAVBufferRef; source_frame_ctx: PAVBufferRef; flags: longint): longint; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:15:17 ===


implementation



end.
