
{$IFDEF read_interface}

const
  GST_GL_TEXTURE_TARGET_2D_STR = '2D';
  GST_GL_TEXTURE_TARGET_RECTANGLE_STR = 'rectangle';
  GST_GL_TEXTURE_TARGET_EXTERNAL_OES_STR = 'external-oes';
  GST_BUFFER_POOL_OPTION_GL_TEXTURE_TARGET_2D = 'GstBufferPoolOptionGLTextureTarget2D';
  GST_BUFFER_POOL_OPTION_GL_TEXTURE_TARGET_RECTANGLE = 'GstBufferPoolOptionGLTextureTargetRectangle';
  GST_BUFFER_POOL_OPTION_GL_TEXTURE_TARGET_EXTERNAL_OES = 'GstBufferPoolOptionGLTextureTargetExternalOES';

type
  PGstGLFormat = ^TGstGLFormat;
  TGstGLFormat = longint;

const
  GST_GL_LUMINANCE = $1909;
  GST_GL_ALPHA = $1906;
  GST_GL_LUMINANCE_ALPHA = $190A;
  GST_GL_RED = $1903;
  GST_GL_R8 = $8229;
  GST_GL_RG = $8227;
  GST_GL_RG8 = $822B;
  GST_GL_RGB = $1907;
  GST_GL_RGB8 = $8051;
  GST_GL_RGB565 = $8D62;
  GST_GL_RGB16 = $8054;
  GST_GL_RGBA = $1908;
  GST_GL_RGBA8 = $8058;
  GST_GL_RGBA16 = $805B;
  GST_GL_DEPTH_COMPONENT16 = $81A5;
  GST_GL_DEPTH24_STENCIL8 = $88F0;
  GST_GL_RGB10_A2 = $8059;
  GST_GL_R16 = $822A;
  GST_GL_RG16 = $822C;

function gst_gl_format_type_n_bytes(format: Tguint; _type: Tguint): Tguint; cdecl; external libgstgl;
function gst_gl_format_from_video_info(context: PGstGLContext; vinfo: PGstVideoInfo; plane: Tguint): TGstGLFormat; cdecl; external libgstgl;
function gst_gl_sized_gl_format_from_gl_format_type(context: PGstGLContext; format: Tguint; _type: Tguint): Tguint; cdecl; external libgstgl;
procedure gst_gl_format_type_from_sized_gl_format(format: TGstGLFormat; unsized_format: PGstGLFormat; gl_type: Pguint); cdecl; external libgstgl;
function gst_gl_video_format_swizzle(video_format: TGstVideoFormat; swizzle: Plongint): Tgboolean; cdecl; external libgstgl;
function gst_gl_format_is_supported(context: PGstGLContext; format: TGstGLFormat): Tgboolean; cdecl; external libgstgl;
function gst_gl_format_n_components(gl_format: TGstGLFormat): Tguint; cdecl; external libgstgl;
procedure gst_gl_swizzle_invert(swizzle: Pgint; inversion: Pgint); cdecl; external libgstgl;
function gst_gl_texture_target_from_string(str: Pgchar): TGstGLTextureTarget; cdecl; external libgstgl;
function gst_gl_texture_target_to_string(target: TGstGLTextureTarget): Pgchar; cdecl; external libgstgl;
function gst_gl_texture_target_to_gl(target: TGstGLTextureTarget): Tguint; cdecl; external libgstgl;
function gst_gl_texture_target_from_gl(target: Tguint): TGstGLTextureTarget; cdecl; external libgstgl;
function gst_gl_texture_target_to_buffer_pool_option(target: TGstGLTextureTarget): Pgchar; cdecl; external libgstgl;

// === Konventiert am: 9-10-24 10:27:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
