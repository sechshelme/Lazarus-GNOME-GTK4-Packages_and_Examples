

  {$IFDEF read_struct}
type
  PGstGLColorConvertPrivate = type Pointer;

  PGstGLColorConvert = ^TGstGLColorConvert;
  TGstGLColorConvert = record
    parent: TGstObject;
    context: PGstGLContext;
    in_info: TGstVideoInfo;
    out_info: TGstVideoInfo;
    initted: Tgboolean;
    passthrough: Tgboolean;
    inbuf: PGstBuffer;
    outbuf: PGstBuffer;
    fbo: PGstGLFramebuffer;
    shader: PGstGLShader;
    priv: PGstGLColorConvertPrivate;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstGLColorConvertClass = ^TGstGLColorConvertClass;
  TGstGLColorConvertClass = record
    object_class: TGstObjectClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_gl_color_convert_get_type: TGType; cdecl; external libgstgl;
function gst_gl_color_convert_new(context: PGstGLContext): PGstGLColorConvert; cdecl; external libgstgl;
function gst_gl_color_convert_transform_caps(context: PGstGLContext; direction: TGstPadDirection; caps: PGstCaps; filter: PGstCaps): PGstCaps; cdecl; external libgstgl;
function gst_gl_color_convert_fixate_caps(context: PGstGLContext; direction: TGstPadDirection; caps: PGstCaps; other: PGstCaps): PGstCaps; cdecl; external libgstgl;
function gst_gl_color_convert_set_caps(convert: PGstGLColorConvert; in_caps: PGstCaps; out_caps: PGstCaps): Tgboolean; cdecl; external libgstgl;
function gst_gl_color_convert_decide_allocation(convert: PGstGLColorConvert; query: PGstQuery): Tgboolean; cdecl; external libgstgl;
function gst_gl_color_convert_perform(convert: PGstGLColorConvert; inbuf: PGstBuffer): PGstBuffer; cdecl; external libgstgl;
function gst_gl_color_convert_swizzle_shader_string(context: PGstGLContext): Pgchar; cdecl; external libgstgl;
function gst_gl_color_convert_yuv_to_rgb_shader_string(context: PGstGLContext): Pgchar; cdecl; external libgstgl;

// === Konventiert am: 14-7-26 12:54:12 ===

function GST_TYPE_GL_COLOR_CONVERT: TGType;
function GST_GL_COLOR_CONVERT(obj: Pointer): PGstGLColorConvert;
function GST_GL_COLOR_CONVERT_CLASS(klass: Pointer): PGstGLColorConvertClass;
function GST_IS_GL_COLOR_CONVERT(obj: Pointer): Tgboolean;
function GST_IS_GL_COLOR_CONVERT_CLASS(klass: Pointer): Tgboolean;
function GST_GL_COLOR_CONVERT_CAST(obj: Pointer): PGstGLColorConvert;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_GL_COLOR_CONVERT: TGType;
begin
  GST_TYPE_GL_COLOR_CONVERT := gst_gl_color_convert_get_type;
end;

function GST_GL_COLOR_CONVERT(obj: Pointer): PGstGLColorConvert;
begin
  Result := PGstGLColorConvert(g_type_check_instance_cast(obj, GST_TYPE_GL_COLOR_CONVERT));
end;

function GST_GL_COLOR_CONVERT_CLASS(klass: Pointer): PGstGLColorConvertClass;
begin
  Result := PGstGLColorConvertClass(g_type_check_class_cast(klass, GST_TYPE_GL_COLOR_CONVERT));
end;

function GST_IS_GL_COLOR_CONVERT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_COLOR_CONVERT);
end;

function GST_IS_GL_COLOR_CONVERT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GL_COLOR_CONVERT);
end;

function GST_GL_COLOR_CONVERT_CAST(obj: Pointer): PGstGLColorConvert;
begin
  GST_GL_COLOR_CONVERT_CAST := PGstGLColorConvert(obj);
end;


{$ENDIF read_implementation}
