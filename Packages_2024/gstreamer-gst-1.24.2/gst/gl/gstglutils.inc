
{$IFDEF read_interface}

function gst_gl_ensure_element_data(element: Tgpointer; display_ptr: PPGstGLDisplay; other_context_ptr: PPGstGLContext): Tgboolean; cdecl; external libgstgl;
function gst_gl_handle_set_context(element: PGstElement; context: PGstContext; display: PPGstGLDisplay; other_context: PPGstGLContext): Tgboolean; cdecl; external libgstgl;
function gst_gl_handle_context_query(element: PGstElement; query: PGstQuery; display: PGstGLDisplay; context: PGstGLContext; other_context: PGstGLContext): Tgboolean; cdecl; external libgstgl;
function gst_gl_query_local_gl_context(element: PGstElement; direction: TGstPadDirection; context_ptr: PPGstGLContext): Tgboolean; cdecl; external libgstgl;
procedure gst_gl_element_propagate_display_context(element: PGstElement; display: PGstGLDisplay); cdecl; external libgstgl;
function gst_gl_get_plane_data_size(info: PGstVideoInfo; align: PGstVideoAlignment; plane: Tguint): Tgsize; cdecl; external libgstgl;
function gst_gl_get_plane_start(info: PGstVideoInfo; valign: PGstVideoAlignment; plane: Tguint): Tgsize; cdecl; external libgstgl;
function gst_gl_value_set_texture_target_from_mask(Value: PGValue; target_mask: TGstGLTextureTarget): Tgboolean; cdecl; external libgstgl;
function gst_gl_value_set_texture_target(Value: PGValue; target: TGstGLTextureTarget): Tgboolean; cdecl; external libgstgl;
function gst_gl_value_get_texture_target_mask(Value: PGValue): TGstGLTextureTarget; cdecl; external libgstgl;
procedure gst_gl_get_affine_transformation_meta_as_ndc(meta: PGstVideoAffineTransformationMeta; matrix: Pgfloat); cdecl; external libgstgl;
procedure gst_gl_set_affine_transformation_meta_from_ndc(meta: PGstVideoAffineTransformationMeta; matrix: Pgfloat); cdecl; external libgstgl;
procedure gst_gl_multiply_matrix4(a: Pgfloat; b: Pgfloat; Result: Pgfloat); cdecl; external libgstgl;

// === Konventiert am: 9-10-24 14:59:15 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
