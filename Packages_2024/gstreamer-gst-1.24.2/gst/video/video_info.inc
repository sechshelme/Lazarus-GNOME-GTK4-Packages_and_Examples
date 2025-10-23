
{$IFDEF read_interface}

const
  GST_CAPS_FEATURE_FORMAT_INTERLACED = 'format:Interlaced';

type
  PGstVideoInterlaceMode = ^TGstVideoInterlaceMode;
  TGstVideoInterlaceMode = longint;

const
  GST_VIDEO_INTERLACE_MODE_PROGRESSIVE = 0;
  GST_VIDEO_INTERLACE_MODE_INTERLEAVED = 1;
  GST_VIDEO_INTERLACE_MODE_MIXED = 2;
  GST_VIDEO_INTERLACE_MODE_FIELDS = 3;
  GST_VIDEO_INTERLACE_MODE_ALTERNATE = 4;

function gst_video_interlace_mode_to_string(mode: TGstVideoInterlaceMode): Pgchar; cdecl; external libgstvideo;
function gst_video_interlace_mode_from_string(mode: Pgchar): TGstVideoInterlaceMode; cdecl; external libgstvideo;

type
  PGstVideoMultiviewMode = ^TGstVideoMultiviewMode;
  TGstVideoMultiviewMode = longint;

const
  GST_VIDEO_MULTIVIEW_MODE_NONE = -(1);
  GST_VIDEO_MULTIVIEW_MODE_MONO = 0;
  GST_VIDEO_MULTIVIEW_MODE_LEFT = 1;
  GST_VIDEO_MULTIVIEW_MODE_RIGHT = 2;
  GST_VIDEO_MULTIVIEW_MODE_SIDE_BY_SIDE = 3;
  GST_VIDEO_MULTIVIEW_MODE_SIDE_BY_SIDE_QUINCUNX = 4;
  GST_VIDEO_MULTIVIEW_MODE_COLUMN_INTERLEAVED = 5;
  GST_VIDEO_MULTIVIEW_MODE_ROW_INTERLEAVED = 6;
  GST_VIDEO_MULTIVIEW_MODE_TOP_BOTTOM = 7;
  GST_VIDEO_MULTIVIEW_MODE_CHECKERBOARD = 8;
  GST_VIDEO_MULTIVIEW_MODE_FRAME_BY_FRAME = 32;
  GST_VIDEO_MULTIVIEW_MODE_MULTIVIEW_FRAME_BY_FRAME = 33;
  GST_VIDEO_MULTIVIEW_MODE_SEPARATED = 34;

type
  PGstVideoMultiviewFramePacking = ^TGstVideoMultiviewFramePacking;
  TGstVideoMultiviewFramePacking = longint;

const
  GST_VIDEO_MULTIVIEW_FRAME_PACKING_NONE = GST_VIDEO_MULTIVIEW_MODE_NONE;
  GST_VIDEO_MULTIVIEW_FRAME_PACKING_MONO = GST_VIDEO_MULTIVIEW_MODE_MONO;
  GST_VIDEO_MULTIVIEW_FRAME_PACKING_LEFT = GST_VIDEO_MULTIVIEW_MODE_LEFT;
  GST_VIDEO_MULTIVIEW_FRAME_PACKING_RIGHT = GST_VIDEO_MULTIVIEW_MODE_RIGHT;
  GST_VIDEO_MULTIVIEW_FRAME_PACKING_SIDE_BY_SIDE = GST_VIDEO_MULTIVIEW_MODE_SIDE_BY_SIDE;
  GST_VIDEO_MULTIVIEW_FRAME_PACKING_SIDE_BY_SIDE_QUINCUNX = GST_VIDEO_MULTIVIEW_MODE_SIDE_BY_SIDE_QUINCUNX;
  GST_VIDEO_MULTIVIEW_FRAME_PACKING_COLUMN_INTERLEAVED = GST_VIDEO_MULTIVIEW_MODE_COLUMN_INTERLEAVED;
  GST_VIDEO_MULTIVIEW_FRAME_PACKING_ROW_INTERLEAVED = GST_VIDEO_MULTIVIEW_MODE_ROW_INTERLEAVED;
  GST_VIDEO_MULTIVIEW_FRAME_PACKING_TOP_BOTTOM = GST_VIDEO_MULTIVIEW_MODE_TOP_BOTTOM;
  GST_VIDEO_MULTIVIEW_FRAME_PACKING_CHECKERBOARD = GST_VIDEO_MULTIVIEW_MODE_CHECKERBOARD;

const
  GST_VIDEO_MULTIVIEW_MAX_FRAME_PACKING = GST_VIDEO_MULTIVIEW_FRAME_PACKING_CHECKERBOARD;

type
  PGstVideoMultiviewFlags = ^TGstVideoMultiviewFlags;
  TGstVideoMultiviewFlags = longint;

const
  GST_VIDEO_MULTIVIEW_FLAGS_NONE = 0;
  GST_VIDEO_MULTIVIEW_FLAGS_RIGHT_VIEW_FIRST = 1 shl 0;
  GST_VIDEO_MULTIVIEW_FLAGS_LEFT_FLIPPED = 1 shl 1;
  GST_VIDEO_MULTIVIEW_FLAGS_LEFT_FLOPPED = 1 shl 2;
  GST_VIDEO_MULTIVIEW_FLAGS_RIGHT_FLIPPED = 1 shl 3;
  GST_VIDEO_MULTIVIEW_FLAGS_RIGHT_FLOPPED = 1 shl 4;
  GST_VIDEO_MULTIVIEW_FLAGS_HALF_ASPECT = 1 shl 14;
  GST_VIDEO_MULTIVIEW_FLAGS_MIXED_MONO = 1 shl 15;

type
  PGstVideoFlags = ^TGstVideoFlags;
  TGstVideoFlags = longint;

const
  GST_VIDEO_FLAG_NONE = 0;
  GST_VIDEO_FLAG_VARIABLE_FPS = 1 shl 0;
  GST_VIDEO_FLAG_PREMULTIPLIED_ALPHA = 1 shl 1;

type
  PGstVideoFieldOrder = ^TGstVideoFieldOrder;
  TGstVideoFieldOrder = longint;

const
  GST_VIDEO_FIELD_ORDER_UNKNOWN = 0;
  GST_VIDEO_FIELD_ORDER_TOP_FIELD_FIRST = 1;
  GST_VIDEO_FIELD_ORDER_BOTTOM_FIELD_FIRST = 2;

function gst_video_field_order_to_string(order: TGstVideoFieldOrder): Pgchar; cdecl; external libgstvideo;
function gst_video_field_order_from_string(order: Pgchar): TGstVideoFieldOrder; cdecl; external libgstvideo;

type
  PGstVideoInfo = ^TGstVideoInfo;

  TGstVideoInfo = record
    finfo: PGstVideoFormatInfo;
    interlace_mode: TGstVideoInterlaceMode;
    flags: TGstVideoFlags;
    Width: Tgint;
    Height: Tgint;
    size: Tgsize;
    views: Tgint;
    chroma_site: TGstVideoChromaSite;
    colorimetry: TGstVideoColorimetry;
    par_n: Tgint;
    par_d: Tgint;
    fps_n: Tgint;
    fps_d: Tgint;
    offset: array[0..(GST_VIDEO_MAX_PLANES) - 1] of Tgsize;
    stride: array[0..(GST_VIDEO_MAX_PLANES) - 1] of Tgint;
    ABI: record
      case longint of
        0: (abi: record
            multiview_mode: TGstVideoMultiviewMode;
            multiview_flags: TGstVideoMultiviewFlags;
            field_order: TGstVideoFieldOrder;
            end);
        1: (_gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer);
      end;
  end;

function gst_video_info_get_type: TGType; cdecl; external libgstvideo;

function gst_video_info_new: PGstVideoInfo; cdecl; external libgstvideo;
procedure gst_video_info_init(info: PGstVideoInfo); cdecl; external libgstvideo;
function gst_video_info_copy(info: PGstVideoInfo): PGstVideoInfo; cdecl; external libgstvideo;
procedure gst_video_info_free(info: PGstVideoInfo); cdecl; external libgstvideo;
function gst_video_info_new_from_caps(caps: PGstCaps): PGstVideoInfo; cdecl; external libgstvideo;
function gst_video_info_set_format(info: PGstVideoInfo; format: TGstVideoFormat; Width: Tguint; Height: Tguint): Tgboolean; cdecl; external libgstvideo;
function gst_video_info_set_interlaced_format(info: PGstVideoInfo; format: TGstVideoFormat; mode: TGstVideoInterlaceMode; Width: Tguint; Height: Tguint): Tgboolean; cdecl; external libgstvideo;
function gst_video_info_from_caps(info: PGstVideoInfo; caps: PGstCaps): Tgboolean; cdecl; external libgstvideo;
function gst_video_info_to_caps(info: PGstVideoInfo): PGstCaps; cdecl; external libgstvideo;
function gst_video_info_convert(info: PGstVideoInfo; src_format: TGstFormat; src_value: Tgint64; dest_format: TGstFormat; dest_value: Pgint64): Tgboolean; cdecl; external libgstvideo;
function gst_video_info_is_equal(info: PGstVideoInfo; other: PGstVideoInfo): Tgboolean; cdecl; external libgstvideo;
function gst_video_info_align(info: PGstVideoInfo; align: PGstVideoAlignment): Tgboolean; cdecl; external libgstvideo;
function gst_video_info_align_full(info: PGstVideoInfo; align: PGstVideoAlignment; plane_size: Pgsize): Tgboolean; cdecl; external libgstvideo;

function GST_TYPE_VIDEO_INFO: longint;
function GST_VIDEO_INFO_FORMAT(i: PGstVideoInfo): TGstVideoFormat;
function GST_VIDEO_INFO_NAME(i: PGstVideoInfo): Pgchar;
function GST_VIDEO_INFO_IS_YUV(i: PGstVideoInfo): Tgboolean;
function GST_VIDEO_INFO_IS_RGB(i: PGstVideoInfo): Tgboolean;
function GST_VIDEO_INFO_IS_GRAY(i: PGstVideoInfo): Tgboolean;
function GST_VIDEO_INFO_HAS_ALPHA(i: PGstVideoInfo): Tgboolean;
function GST_VIDEO_INFO_INTERLACE_MODE(i: PGstVideoInfo): TGstVideoInterlaceMode;
function GST_VIDEO_INFO_IS_INTERLACED(i: PGstVideoInfo): Tgboolean;
function GST_VIDEO_INFO_FIELD_ORDER(i: PGstVideoInfo): TGstVideoFieldOrder;
function GST_VIDEO_INFO_FLAGS(i: PGstVideoInfo): TGstVideoFlags;
function GST_VIDEO_INFO_WIDTH(i: PGstVideoInfo): Tgint;
function GST_VIDEO_INFO_HEIGHT(i: PGstVideoInfo): Tgint;
function GST_VIDEO_INFO_FIELD_HEIGHT(i: PGstVideoInfo): Tgint;
function GST_VIDEO_INFO_SIZE(i: PGstVideoInfo): Tgsize;
function GST_VIDEO_INFO_VIEWS(i: PGstVideoInfo): Tgint;
function GST_VIDEO_INFO_PAR_N(i: PGstVideoInfo): Tgint;
function GST_VIDEO_INFO_PAR_D(i: PGstVideoInfo): Tgint;
function GST_VIDEO_INFO_FPS_N(i: PGstVideoInfo): Tgint;
function GST_VIDEO_INFO_FIELD_RATE_N(i: PGstVideoInfo): Tgint;
function GST_VIDEO_INFO_FPS_D(i: PGstVideoInfo): Tgint;
function GST_VIDEO_INFO_COLORIMETRY(i: PGstVideoInfo): TGstVideoColorimetry;
function GST_VIDEO_INFO_CHROMA_SITE(i: PGstVideoInfo): TGstVideoChromaSite;
function GST_VIDEO_INFO_MULTIVIEW_MODE(i: PGstVideoInfo): TGstVideoMultiviewMode;
function GST_VIDEO_INFO_MULTIVIEW_FLAGS(i: PGstVideoInfo): TGstVideoMultiviewFlags;
function GST_VIDEO_INFO_FLAG_IS_SET(i: PGstVideoInfo; flag: longint): Tgboolean;
procedure GST_VIDEO_INFO_FLAG_SET(var i: PGstVideoInfo; flag: TGstVideoFlags);
procedure GST_VIDEO_INFO_FLAG_UNSET(var i: PGstVideoInfo; flag: TGstVideoFlags);
function GST_VIDEO_INFO_N_PLANES(i: PGstVideoInfo): longint;
function GST_VIDEO_INFO_PLANE_OFFSET(i: PGstVideoInfo; p: longint): Tgsize;
function GST_VIDEO_INFO_PLANE_STRIDE(i: PGstVideoInfo; p: longint): Tgint;
function GST_VIDEO_INFO_N_COMPONENTS(i: PGstVideoInfo): longint;
function GST_VIDEO_INFO_COMP_DEPTH(i: PGstVideoInfo; c: longint): Tguint;
function GST_VIDEO_INFO_COMP_WIDTH(i: PGstVideoInfo; c: longint): Tguint;
function GST_VIDEO_INFO_COMP_HEIGHT(i: PGstVideoInfo; c: longint): Tguint;
function GST_VIDEO_INFO_COMP_PLANE(i: PGstVideoInfo; c: longint): Tguint;
function GST_VIDEO_INFO_COMP_PSTRIDE(i: PGstVideoInfo; c: longint): Tguint;
function GST_VIDEO_INFO_COMP_POFFSET(i: PGstVideoInfo; c: longint): Tguint;


// === Konventiert am: 29-9-24 13:56:27 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_TYPE_VIDEO_INFO: longint;
begin
  GST_TYPE_VIDEO_INFO := gst_video_info_get_type;
end;

function GST_VIDEO_INFO_FORMAT(i: PGstVideoInfo): TGstVideoFormat;
begin
  GST_VIDEO_INFO_FORMAT := GST_VIDEO_FORMAT_INFO_FORMAT(i^.finfo);
end;

function GST_VIDEO_INFO_NAME(i: PGstVideoInfo): Pgchar;
begin
  GST_VIDEO_INFO_NAME := GST_VIDEO_FORMAT_INFO_NAME(i^.finfo);
end;

function GST_VIDEO_INFO_IS_YUV(i: PGstVideoInfo): Tgboolean;
begin
  GST_VIDEO_INFO_IS_YUV := GST_VIDEO_FORMAT_INFO_IS_YUV(i^.finfo);
end;

function GST_VIDEO_INFO_IS_RGB(i: PGstVideoInfo): Tgboolean;
begin
  GST_VIDEO_INFO_IS_RGB := GST_VIDEO_FORMAT_INFO_IS_RGB(i^.finfo);
end;

function GST_VIDEO_INFO_IS_GRAY(i: PGstVideoInfo): Tgboolean;
begin
  GST_VIDEO_INFO_IS_GRAY := GST_VIDEO_FORMAT_INFO_IS_GRAY(i^.finfo);
end;

function GST_VIDEO_INFO_HAS_ALPHA(i: PGstVideoInfo): Tgboolean;
begin
  GST_VIDEO_INFO_HAS_ALPHA := GST_VIDEO_FORMAT_INFO_HAS_ALPHA(i^.finfo);
end;

function GST_VIDEO_INFO_INTERLACE_MODE(i: PGstVideoInfo
  ): TGstVideoInterlaceMode;
begin
  GST_VIDEO_INFO_INTERLACE_MODE := i^.interlace_mode;
end;

function GST_VIDEO_INFO_IS_INTERLACED(i: PGstVideoInfo): Tgboolean;
begin
  GST_VIDEO_INFO_IS_INTERLACED := (i^.interlace_mode) <> GST_VIDEO_INTERLACE_MODE_PROGRESSIVE;
end;

function GST_VIDEO_INFO_FIELD_ORDER(i: PGstVideoInfo): TGstVideoFieldOrder;
begin
  GST_VIDEO_INFO_FIELD_ORDER := i^.ABI.abi.field_order;
end;

function GST_VIDEO_INFO_FLAGS(i: PGstVideoInfo): TGstVideoFlags;
begin
  GST_VIDEO_INFO_FLAGS := i^.flags;
end;

function GST_VIDEO_INFO_WIDTH(i: PGstVideoInfo): Tgint;
begin
  GST_VIDEO_INFO_WIDTH := i^.Width;
end;

function GST_VIDEO_INFO_HEIGHT(i: PGstVideoInfo): Tgint;
begin
  GST_VIDEO_INFO_HEIGHT := i^.Height;
end;

function GST_VIDEO_INFO_FIELD_HEIGHT(i: PGstVideoInfo): Tgint;
begin
  if i^.interlace_mode = GST_VIDEO_INTERLACE_MODE_ALTERNATE then begin
    Result := GST_ROUND_UP_2(i^.Height) div 2;
  end else begin
    Result := i^.Height;
  end;
end;

function GST_VIDEO_INFO_SIZE(i: PGstVideoInfo): Tgsize;
begin
  GST_VIDEO_INFO_SIZE := i^.size;
end;

function GST_VIDEO_INFO_VIEWS(i: PGstVideoInfo): Tgint;
begin
  GST_VIDEO_INFO_VIEWS := i^.views;
end;

function GST_VIDEO_INFO_PAR_N(i: PGstVideoInfo): Tgint;
begin
  GST_VIDEO_INFO_PAR_N := i^.par_n;
end;

function GST_VIDEO_INFO_PAR_D(i: PGstVideoInfo): Tgint;
begin
  GST_VIDEO_INFO_PAR_D := i^.par_d;
end;

function GST_VIDEO_INFO_FPS_N(i: PGstVideoInfo): Tgint;
begin
  GST_VIDEO_INFO_FPS_N := i^.fps_n;
end;

function GST_VIDEO_INFO_FIELD_RATE_N(i: PGstVideoInfo): Tgint;
begin
  if GST_VIDEO_INFO_INTERLACE_MODE(i) = GST_VIDEO_INTERLACE_MODE_ALTERNATE then begin
    Result := i^.fps_n * 2;
  end else begin
    Result := i^.fps_n;
  end;
end;

function GST_VIDEO_INFO_FPS_D(i: PGstVideoInfo): Tgint;
begin
  GST_VIDEO_INFO_FPS_D := i^.fps_d;
end;

function GST_VIDEO_INFO_COLORIMETRY(i: PGstVideoInfo): TGstVideoColorimetry;
begin
  GST_VIDEO_INFO_COLORIMETRY := i^.colorimetry;
end;

function GST_VIDEO_INFO_CHROMA_SITE(i: PGstVideoInfo): TGstVideoChromaSite;
begin
  GST_VIDEO_INFO_CHROMA_SITE := i^.chroma_site;
end;

function GST_VIDEO_INFO_MULTIVIEW_MODE(i: PGstVideoInfo): TGstVideoMultiviewMode;
begin
  GST_VIDEO_INFO_MULTIVIEW_MODE := i^.ABI.abi.multiview_mode;
end;

function GST_VIDEO_INFO_MULTIVIEW_FLAGS(i: PGstVideoInfo
  ): TGstVideoMultiviewFlags;
begin
  GST_VIDEO_INFO_MULTIVIEW_FLAGS := i^.ABI.abi.multiview_flags;
end;

function GST_VIDEO_INFO_FLAG_IS_SET(i: PGstVideoInfo; flag: longint): Tgboolean;
begin
  GST_VIDEO_INFO_FLAG_IS_SET := ((GST_VIDEO_INFO_FLAGS(i)) and flag) = flag;
end;

{#define GST_VIDEO_INFO_FLAG_SET(i,flag)    (GST_VIDEO_INFO_FLAGS(i) |= (flag)) }
procedure GST_VIDEO_INFO_FLAG_SET(var i: PGstVideoInfo; flag: TGstVideoFlags);
begin
  i^.flags := i^.flags or flag;
end;

{#define GST_VIDEO_INFO_FLAG_UNSET(i,flag)  (GST_VIDEO_INFO_FLAGS(i) &= ~(flag)) }
procedure GST_VIDEO_INFO_FLAG_UNSET(var i: PGstVideoInfo; flag: TGstVideoFlags);
begin
  i^.flags := i^.flags and not flag;
  ;
end;

function GST_VIDEO_INFO_N_PLANES(i: PGstVideoInfo): longint;
begin
  GST_VIDEO_INFO_N_PLANES := GST_VIDEO_FORMAT_INFO_N_PLANES(i^.finfo);
end;

function GST_VIDEO_INFO_PLANE_OFFSET(i: PGstVideoInfo; p: longint): Tgsize;
begin
  GST_VIDEO_INFO_PLANE_OFFSET := i^.offset[p];
end;

function GST_VIDEO_INFO_PLANE_STRIDE(i: PGstVideoInfo; p: longint): Tgint;
begin
  GST_VIDEO_INFO_PLANE_STRIDE := i^.stride[p];
end;

function GST_VIDEO_INFO_N_COMPONENTS(i: PGstVideoInfo): longint;
begin
  GST_VIDEO_INFO_N_COMPONENTS := GST_VIDEO_FORMAT_INFO_N_COMPONENTS(i^.finfo);
end;

function GST_VIDEO_INFO_COMP_DEPTH(i: PGstVideoInfo; c: longint): Tguint;
begin
  GST_VIDEO_INFO_COMP_DEPTH := GST_VIDEO_FORMAT_INFO_DEPTH(i^.finfo, c);
end;

function GST_VIDEO_INFO_COMP_WIDTH(i: PGstVideoInfo; c: longint): Tguint;
begin
  GST_VIDEO_INFO_COMP_WIDTH := GST_VIDEO_FORMAT_INFO_SCALE_WIDTH(i^.finfo, c, i^.Width);
end;

function GST_VIDEO_INFO_COMP_HEIGHT(i: PGstVideoInfo; c: longint): Tguint;
begin
  GST_VIDEO_INFO_COMP_HEIGHT := GST_VIDEO_FORMAT_INFO_SCALE_HEIGHT(i^.finfo, c, GST_VIDEO_INFO_FIELD_HEIGHT(i));
end;

function GST_VIDEO_INFO_COMP_PLANE(i: PGstVideoInfo; c: longint): Tguint;
begin
  GST_VIDEO_INFO_COMP_PLANE := GST_VIDEO_FORMAT_INFO_PLANE(i^.finfo, c);
end;

function GST_VIDEO_INFO_COMP_PSTRIDE(i: PGstVideoInfo; c: longint): Tguint;
begin
  GST_VIDEO_INFO_COMP_PSTRIDE := GST_VIDEO_FORMAT_INFO_PSTRIDE(i^.finfo, c);
end;

function GST_VIDEO_INFO_COMP_POFFSET(i: PGstVideoInfo; c: longint): Tguint;
begin
  GST_VIDEO_INFO_COMP_POFFSET := GST_VIDEO_FORMAT_INFO_POFFSET(i^.finfo, c);
end;


{$ENDIF read_implementation}
