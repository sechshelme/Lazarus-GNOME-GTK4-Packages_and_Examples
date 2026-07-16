unit gstvideometa;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, video_frame, video_format, video_info, video, gstvideotimecode;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  GST_CAPS_FEATURE_META_GST_VIDEO_META = 'meta:GstVideoMeta';
  GST_CAPS_FEATURE_META_GST_VIDEO_GL_TEXTURE_UPLOAD_META = 'meta:GstVideoGLTextureUploadMeta';
  GST_BUFFER_POOL_OPTION_VIDEO_GL_TEXTURE_UPLOAD_META = 'GstBufferPoolOptionVideoGLTextureUploadMeta';


type
  PGstVideoGLTextureType = ^TGstVideoGLTextureType;
  TGstVideoGLTextureType = longint;
const
  GST_VIDEO_GL_TEXTURE_TYPE_LUMINANCE = 0;
  GST_VIDEO_GL_TEXTURE_TYPE_LUMINANCE_ALPHA = 1;
  GST_VIDEO_GL_TEXTURE_TYPE_RGB16 = 2;
  GST_VIDEO_GL_TEXTURE_TYPE_RGB = 3;
  GST_VIDEO_GL_TEXTURE_TYPE_RGBA = 4;
  GST_VIDEO_GL_TEXTURE_TYPE_R = 5;
  GST_VIDEO_GL_TEXTURE_TYPE_RG = 6;

type
  PGstVideoGLTextureOrientation = ^TGstVideoGLTextureOrientation;
  TGstVideoGLTextureOrientation = longint;
const
  GST_VIDEO_GL_TEXTURE_ORIENTATION_X_NORMAL_Y_NORMAL = 0;
  GST_VIDEO_GL_TEXTURE_ORIENTATION_X_NORMAL_Y_FLIP = 1;
  GST_VIDEO_GL_TEXTURE_ORIENTATION_X_FLIP_Y_NORMAL = 2;
  GST_VIDEO_GL_TEXTURE_ORIENTATION_X_FLIP_Y_FLIP = 3;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstVideoMeta = ^TGstVideoMeta;
  TGstVideoMeta = record
    meta: TGstMeta;
    buffer: PGstBuffer;
    flags: TGstVideoFrameFlags;
    format: TGstVideoFormat;
    id: Tgint;
    width: Tguint;
    height: Tguint;
    n_planes: Tguint;
    offset: array[0..(GST_VIDEO_MAX_PLANES) - 1] of Tgsize;
    stride: array[0..(GST_VIDEO_MAX_PLANES) - 1] of Tgint;
    map: function(meta: PGstVideoMeta; plane: Tguint; info: PGstMapInfo; data: Pgpointer; stride: Pgint;
      flags: TGstMapFlags): Tgboolean; cdecl;
    unmap: function(meta: PGstVideoMeta; plane: Tguint; info: PGstMapInfo): Tgboolean; cdecl;
    alignment: TGstVideoAlignment;
  end;

  PGstVideoCropMeta = ^TGstVideoCropMeta;
  TGstVideoCropMeta = record
    meta: TGstMeta;
    x: Tguint;
    y: Tguint;
    width: Tguint;
    height: Tguint;
  end;

  PGstVideoMetaTransform = ^TGstVideoMetaTransform;
  TGstVideoMetaTransform = record
    in_info: PGstVideoInfo;
    out_info: PGstVideoInfo;
  end;

  PGstVideoMetaTransformMatrix = ^TGstVideoMetaTransformMatrix;
  TGstVideoMetaTransformMatrix = record
    in_info: PGstVideoInfo;
    in_rectangle: TGstVideoRectangle;
    out_info: PGstVideoInfo;
    out_rectangle: TGstVideoRectangle;
    matrix: array[0..2] of array[0..2] of Tgfloat;
  end;

  PGstVideoGLTextureUploadMeta = ^TGstVideoGLTextureUploadMeta;

  TGstVideoGLTextureUpload = function(meta: PGstVideoGLTextureUploadMeta; texture_id: Pguint): Tgboolean; cdecl;

  TGstVideoGLTextureUploadMeta = record
    meta: TGstMeta;
    texture_orientation: TGstVideoGLTextureOrientation;
    n_textures: Tguint;
    texture_type: array[0..3] of TGstVideoGLTextureType;
    buffer: PGstBuffer;
    upload: TGstVideoGLTextureUpload;
    user_data: Tgpointer;
    user_data_copy: TGBoxedCopyFunc;
    user_data_free: TGBoxedFreeFunc;
  end;

  PGstVideoRegionOfInterestMeta = ^TGstVideoRegionOfInterestMeta;
  TGstVideoRegionOfInterestMeta = record
    meta: TGstMeta;
    roi_type: TGQuark;
    id: Tgint;
    parent_id: Tgint;
    x: Tguint;
    y: Tguint;
    w: Tguint;
    h: Tguint;
    params: PGList;
  end;

  PGstVideoTimeCodeMeta = ^TGstVideoTimeCodeMeta;
  TGstVideoTimeCodeMeta = record
    meta: TGstMeta;
    tc: TGstVideoTimeCode;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_video_meta_api_get_type: TGType; cdecl; external libgstvideo;
function gst_video_meta_get_info: PGstMetaInfo; cdecl; external libgstvideo;
function gst_buffer_get_video_meta(buffer: PGstBuffer): PGstVideoMeta; cdecl; external libgstvideo;
function gst_buffer_get_video_meta_id(buffer: PGstBuffer; id: Tgint): PGstVideoMeta; cdecl; external libgstvideo;
function gst_buffer_add_video_meta(buffer: PGstBuffer; flags: TGstVideoFrameFlags; format: TGstVideoFormat; width: Tguint; height: Tguint): PGstVideoMeta; cdecl; external libgstvideo;
function gst_buffer_add_video_meta_full(buffer: PGstBuffer; flags: TGstVideoFrameFlags; format: TGstVideoFormat; width: Tguint; height: Tguint;
  n_planes: Tguint; offset: Pgsize; stride: Pgint): PGstVideoMeta; cdecl; external libgstvideo;
function gst_video_meta_map(meta: PGstVideoMeta; plane: Tguint; info: PGstMapInfo; data: Pgpointer; stride: Pgint;
  flags: TGstMapFlags): Tgboolean; cdecl; external libgstvideo;
function gst_video_meta_unmap(meta: PGstVideoMeta; plane: Tguint; info: PGstMapInfo): Tgboolean; cdecl; external libgstvideo;
function gst_video_meta_set_alignment(meta: PGstVideoMeta; alignment: TGstVideoAlignment): Tgboolean; cdecl; external libgstvideo; deprecated;
function gst_video_meta_set_alignment_full(meta: PGstVideoMeta; alignment: PGstVideoAlignment): Tgboolean; cdecl; external libgstvideo;
function gst_video_meta_get_plane_size(meta: PGstVideoMeta; plane_size: Pgsize): Tgboolean; cdecl; external libgstvideo;
function gst_video_meta_get_plane_height(meta: PGstVideoMeta; plane_height: Pguint): Tgboolean; cdecl; external libgstvideo;

function gst_video_crop_meta_api_get_type: TGType; cdecl; external libgstvideo;
function gst_video_crop_meta_get_info: PGstMetaInfo; cdecl; external libgstvideo;

function gst_video_meta_transform_scale_get_quark: TGQuark; cdecl; external libgstvideo;

function gst_video_meta_transform_matrix_get_quark: TGQuark; cdecl; external libgstvideo;

procedure gst_video_meta_transform_matrix_init(trans: PGstVideoMetaTransformMatrix; in_info: PGstVideoInfo; in_rectangle: PGstVideoRectangle; out_info: PGstVideoInfo; out_rectangle: PGstVideoRectangle); cdecl; external libgstvideo;
function gst_video_meta_transform_matrix_point(transform: PGstVideoMetaTransformMatrix; x: Pgint; y: Pgint): Tgboolean; cdecl; external libgstvideo;
function gst_video_meta_transform_matrix_point_clipped(transform: PGstVideoMetaTransformMatrix; x: Pgint; y: Pgint): Tgboolean; cdecl; external libgstvideo;
function gst_video_meta_transform_matrix_rectangle(transform: PGstVideoMetaTransformMatrix; rect: PGstVideoRectangle): Tgboolean; cdecl; external libgstvideo;
function gst_video_meta_transform_matrix_rectangle_clipped(transform: PGstVideoMetaTransformMatrix; rect: PGstVideoRectangle): Tgboolean; cdecl; external libgstvideo;

function gst_video_gl_texture_upload_meta_api_get_type: TGType; cdecl; external libgstvideo;
function gst_video_gl_texture_upload_meta_get_info: PGstMetaInfo; cdecl; external libgstvideo;

function gst_buffer_add_video_gl_texture_upload_meta(buffer: PGstBuffer; texture_orientation: TGstVideoGLTextureOrientation; n_textures: Tguint; texture_type: PGstVideoGLTextureType; upload: TGstVideoGLTextureUpload;
  user_data: Tgpointer; user_data_copy: TGBoxedCopyFunc; user_data_free: TGBoxedFreeFunc): PGstVideoGLTextureUploadMeta; cdecl; external libgstvideo;
function gst_video_gl_texture_upload_meta_upload(meta: PGstVideoGLTextureUploadMeta; texture_id: Pguint): Tgboolean; cdecl; external libgstvideo;

function gst_video_region_of_interest_meta_api_get_type: TGType; cdecl; external libgstvideo;
function gst_video_region_of_interest_meta_get_info: PGstMetaInfo; cdecl; external libgstvideo;

function gst_buffer_get_video_region_of_interest_meta_id(buffer: PGstBuffer; id: Tgint): PGstVideoRegionOfInterestMeta; cdecl; external libgstvideo;
function gst_buffer_add_video_region_of_interest_meta(buffer: PGstBuffer; roi_type: Pgchar; x: Tguint; y: Tguint; w: Tguint;
  h: Tguint): PGstVideoRegionOfInterestMeta; cdecl; external libgstvideo;
function gst_buffer_add_video_region_of_interest_meta_id(buffer: PGstBuffer; roi_type: TGQuark; x: Tguint; y: Tguint; w: Tguint;
  h: Tguint): PGstVideoRegionOfInterestMeta; cdecl; external libgstvideo;
procedure gst_video_region_of_interest_meta_add_param(meta: PGstVideoRegionOfInterestMeta; s: PGstStructure); cdecl; external libgstvideo;
function gst_video_region_of_interest_meta_get_param(meta: PGstVideoRegionOfInterestMeta; name: Pgchar): PGstStructure; cdecl; external libgstvideo;
function gst_video_time_code_meta_api_get_type: TGType; cdecl; external libgstvideo;
function gst_video_time_code_meta_get_info: PGstMetaInfo; cdecl; external libgstvideo;
function gst_buffer_add_video_time_code_meta(buffer: PGstBuffer; tc: PGstVideoTimeCode): PGstVideoTimeCodeMeta; cdecl; external libgstvideo;
function gst_buffer_add_video_time_code_meta_full(buffer: PGstBuffer; fps_n: Tguint; fps_d: Tguint; latest_daily_jam: PGDateTime; flags: TGstVideoTimeCodeFlags;
  hours: Tguint; minutes: Tguint; seconds: Tguint; frames: Tguint; field_count: Tguint): PGstVideoTimeCodeMeta; cdecl; external libgstvideo;

// === Konventiert am: 15-7-26 13:20:34 ===

function GST_VIDEO_META_API_TYPE: TGType;
function GST_VIDEO_META_INFO: PGstMetaInfo;
function GST_VIDEO_CROP_META_API_TYPE: TGType;
function GST_VIDEO_CROP_META_INFO: PGstMetaInfo;
function gst_buffer_get_video_crop_meta(b: PGstBuffer): PGstVideoCropMeta;
function gst_buffer_add_video_crop_meta(b: PGstBuffer): PGstVideoCropMeta;
function GST_VIDEO_META_TRANSFORM_IS_SCALE(_type: TGQuark): Tgboolean;
function GST_VIDEO_GL_TEXTURE_UPLOAD_META_API_TYPE: TGType;
function GST_VIDEO_GL_TEXTURE_UPLOAD_META_INFO: PGstMetaInfo;
function gst_buffer_get_video_gl_texture_upload_meta(b: PGstBuffer): PGstVideoGLTextureUploadMeta;
function GST_VIDEO_REGION_OF_INTEREST_META_API_TYPE: TGType;
function GST_VIDEO_REGION_OF_INTEREST_META_INFO: PGstMetaInfo;
function gst_buffer_get_video_region_of_interest_meta(b: PGstBuffer): PGstVideoRegionOfInterestMeta;
function GST_VIDEO_TIME_CODE_META_API_TYPE: TGType;
function GST_VIDEO_TIME_CODE_META_INFO: PGstMetaInfo;
function gst_buffer_get_video_time_code_meta(b: PGstBuffer): PGstVideoTimeCodeMeta;
{$ENDIF read_function}

implementation

function GST_VIDEO_META_API_TYPE: TGType;
begin
  GST_VIDEO_META_API_TYPE := gst_video_meta_api_get_type;
end;

function GST_VIDEO_META_INFO: PGstMetaInfo;
begin
  GST_VIDEO_META_INFO := gst_video_meta_get_info;
end;

function GST_VIDEO_CROP_META_API_TYPE: TGType;
begin
  GST_VIDEO_CROP_META_API_TYPE := gst_video_crop_meta_api_get_type;
end;

function GST_VIDEO_CROP_META_INFO: PGstMetaInfo;
begin
  GST_VIDEO_CROP_META_INFO := gst_video_crop_meta_get_info;
end;

function gst_buffer_get_video_crop_meta(b: PGstBuffer): PGstVideoCropMeta;
begin
  gst_buffer_get_video_crop_meta := PGstVideoCropMeta(gst_buffer_get_meta(b, GST_VIDEO_CROP_META_API_TYPE));
end;

function gst_buffer_add_video_crop_meta(b: PGstBuffer): PGstVideoCropMeta;
begin
  gst_buffer_add_video_crop_meta := PGstVideoCropMeta(gst_buffer_add_meta(b, GST_VIDEO_CROP_META_INFO, nil));
end;

function GST_VIDEO_META_TRANSFORM_IS_SCALE(_type: TGQuark): Tgboolean;
begin
  GST_VIDEO_META_TRANSFORM_IS_SCALE := _type = (gst_video_meta_transform_scale_get_quark);
end;

function GST_VIDEO_GL_TEXTURE_UPLOAD_META_API_TYPE: TGType;
begin
  GST_VIDEO_GL_TEXTURE_UPLOAD_META_API_TYPE := gst_video_gl_texture_upload_meta_api_get_type;
end;

function GST_VIDEO_GL_TEXTURE_UPLOAD_META_INFO: PGstMetaInfo;
begin
  GST_VIDEO_GL_TEXTURE_UPLOAD_META_INFO := gst_video_gl_texture_upload_meta_get_info;
end;

function gst_buffer_get_video_gl_texture_upload_meta(b: PGstBuffer): PGstVideoGLTextureUploadMeta;
begin
  gst_buffer_get_video_gl_texture_upload_meta := PGstVideoGLTextureUploadMeta(gst_buffer_get_meta(b, GST_VIDEO_GL_TEXTURE_UPLOAD_META_API_TYPE));
end;

function GST_VIDEO_REGION_OF_INTEREST_META_API_TYPE: TGType;
begin
  GST_VIDEO_REGION_OF_INTEREST_META_API_TYPE := gst_video_region_of_interest_meta_api_get_type;
end;

function GST_VIDEO_REGION_OF_INTEREST_META_INFO: PGstMetaInfo;
begin
  GST_VIDEO_REGION_OF_INTEREST_META_INFO := gst_video_region_of_interest_meta_get_info;
end;

function gst_buffer_get_video_region_of_interest_meta(b: PGstBuffer): PGstVideoRegionOfInterestMeta;
begin
  gst_buffer_get_video_region_of_interest_meta := PGstVideoRegionOfInterestMeta(gst_buffer_get_meta(b, GST_VIDEO_REGION_OF_INTEREST_META_API_TYPE));
end;

function GST_VIDEO_TIME_CODE_META_API_TYPE: TGType;
begin
  GST_VIDEO_TIME_CODE_META_API_TYPE := gst_video_time_code_meta_api_get_type;
end;

function GST_VIDEO_TIME_CODE_META_INFO: PGstMetaInfo;
begin
  GST_VIDEO_TIME_CODE_META_INFO := gst_video_time_code_meta_get_info;
end;

function gst_buffer_get_video_time_code_meta(b: PGstBuffer): PGstVideoTimeCodeMeta;
begin
  gst_buffer_get_video_time_code_meta := PGstVideoTimeCodeMeta(gst_buffer_get_meta(b, GST_VIDEO_TIME_CODE_META_API_TYPE));
end;

end.
