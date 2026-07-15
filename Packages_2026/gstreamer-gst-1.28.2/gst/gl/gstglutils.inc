
  {$IFDEF read_enum}
type
  PGstGLDrmFormatFlags = ^TGstGLDrmFormatFlags;
  TGstGLDrmFormatFlags = longint;
const
  GST_GL_DRM_FORMAT_INCLUDE_EXTERNAL = 1 shl 0;
  GST_GL_DRM_FORMAT_LINEAR_ONLY = 1 shl 1;
  GST_GL_DRM_FORMAT_INCLUDE_EMULATED = 1 shl 2;
  GST_GL_DRM_FORMAT_DIRECT_IMPORT = 1 shl 3;
  {$ENDIF read_enum}

{$IFDEF read_function}
function gst_gl_ensure_element_data(element: Tgpointer; display_ptr: PPGstGLDisplay; other_context_ptr: PPGstGLContext): Tgboolean; cdecl; external libgstgl;
function gst_gl_handle_set_context(element: PGstElement; context: PGstContext; display: PPGstGLDisplay; other_context: PPGstGLContext): Tgboolean; cdecl; external libgstgl;
function gst_gl_handle_context_query(element: PGstElement; query: PGstQuery; display: PGstGLDisplay; context: PGstGLContext; other_context: PGstGLContext): Tgboolean; cdecl; external libgstgl;
function gst_gl_query_local_gl_context(element: PGstElement; direction: TGstPadDirection; context_ptr: PPGstGLContext): Tgboolean; cdecl; external libgstgl;
procedure gst_gl_element_propagate_display_context(element: PGstElement; display: PGstGLDisplay); cdecl; external libgstgl;
function gst_gl_get_plane_data_size(info: PGstVideoInfo; align: PGstVideoAlignment; plane: Tguint): Tgsize; cdecl; external libgstgl;
function gst_gl_get_plane_start(info: PGstVideoInfo; valign: PGstVideoAlignment; plane: Tguint): Tgsize; cdecl; external libgstgl;
function gst_gl_value_set_texture_target_from_mask(value: PGValue; target_mask: TGstGLTextureTarget): Tgboolean; cdecl; external libgstgl;
function gst_gl_value_set_texture_target(value: PGValue; target: TGstGLTextureTarget): Tgboolean; cdecl; external libgstgl;
function gst_gl_value_get_texture_target_mask(value: PGValue): TGstGLTextureTarget; cdecl; external libgstgl;
procedure gst_gl_get_affine_transformation_meta_as_ndc(meta: PGstVideoAffineTransformationMeta; matrix: Pgfloat); cdecl; external libgstgl;
procedure gst_gl_set_affine_transformation_meta_from_ndc(meta: PGstVideoAffineTransformationMeta; matrix: Pgfloat); cdecl; external libgstgl;
procedure gst_gl_multiply_matrix4(a: Pgfloat; b: Pgfloat; result: Pgfloat); cdecl; external libgstgl;

function gst_gl_dma_buf_transform_gst_formats_to_drm_formats(context: PGstGLContext; src: PGValue; flags: TGstGLDrmFormatFlags; dst: PGValue): Tgboolean; cdecl; external libgstgl;
function gst_gl_dma_buf_transform_drm_formats_to_gst_formats(context: PGstGLContext; src: PGValue; flags: TGstGLDrmFormatFlags; dst: PGValue): Tgboolean; cdecl; external libgstgl;
{$ENDIF read_function}

// === Konventiert am: 14-7-26 13:09:26 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
