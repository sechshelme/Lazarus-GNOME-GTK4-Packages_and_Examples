

  {$IFDEF read_enum}
const
  GST_CAPS_FEATURE_META_GST_VIDEO_AFFINE_TRANSFORMATION_META = 'meta:GstVideoAffineTransformation';
  GST_BUFFER_POOL_OPTION_VIDEO_AFFINE_TRANSFORMATION_META = 'GstBufferPoolOptionVideoAffineTransformation';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstVideoAffineTransformationMeta = ^TGstVideoAffineTransformationMeta;

  TGstVideoAffineTransformationGetMatrix = function(meta: PGstVideoAffineTransformationMeta; matrix: Pgfloat): Tgboolean; cdecl;

  TGstVideoAffineTransformationMeta = record
    meta: TGstMeta;
    matrix: array[0..15] of Tgfloat;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_video_affine_transformation_meta_api_get_type: TGType; cdecl; external libgstvideo;
function gst_video_affine_transformation_meta_get_info: PGstMetaInfo; cdecl; external libgstvideo;

function gst_buffer_add_video_affine_transformation_meta(buffer: PGstBuffer): PGstVideoAffineTransformationMeta; cdecl; external libgstvideo;
procedure gst_video_affine_transformation_meta_apply_matrix(meta: PGstVideoAffineTransformationMeta; matrix: Pgfloat); cdecl; external libgstvideo;

// === Konventiert am: 15-7-26 13:22:05 ===

function GST_VIDEO_AFFINE_TRANSFORMATION_META_API_TYPE: TGType;
function GST_VIDEO_AFFINE_TRANSFORMATION_META_INFO: PGstMetaInfo;

function gst_buffer_get_video_affine_transformation_meta(b: PGstBuffer): PGstVideoAffineTransformationMeta;
{$ENDIF read_function}



{$IFDEF read_implementation}


function GST_VIDEO_AFFINE_TRANSFORMATION_META_API_TYPE: TGType;
begin
  GST_VIDEO_AFFINE_TRANSFORMATION_META_API_TYPE := gst_video_affine_transformation_meta_api_get_type;
end;

function GST_VIDEO_AFFINE_TRANSFORMATION_META_INFO: PGstMetaInfo;
begin
  GST_VIDEO_AFFINE_TRANSFORMATION_META_INFO := gst_video_affine_transformation_meta_get_info;
end;

function gst_buffer_get_video_affine_transformation_meta(b: PGstBuffer): PGstVideoAffineTransformationMeta;
begin
  gst_buffer_get_video_affine_transformation_meta := PGstVideoAffineTransformationMeta(gst_buffer_get_meta(b, GST_VIDEO_AFFINE_TRANSFORMATION_META_API_TYPE));
end;

{$ENDIF read_implementation}
