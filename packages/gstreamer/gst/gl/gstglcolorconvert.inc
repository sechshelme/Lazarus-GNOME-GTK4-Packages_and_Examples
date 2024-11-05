/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 09-10-2024   19:05                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_gl_color_convert_get_type: TGType; cdecl; external libgstgl;

type
  TGstGLColorConvertPrivate = record
  end;
  PGstGLColorConvertPrivate = ^TGstGLColorConvertPrivate;

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
  PGstGLColorConvert = ^TGstGLColorConvert;

  TGstGLColorConvertClass = record
    object_class: TGstObjectClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLColorConvertClass = ^TGstGLColorConvertClass;

function gst_gl_color_convert_new(context: PGstGLContext): PGstGLColorConvert; cdecl; external libgstgl;
function gst_gl_color_convert_transform_caps(context: PGstGLContext; direction: TGstPadDirection; caps: PGstCaps; filter: PGstCaps): PGstCaps; cdecl; external libgstgl;
function gst_gl_color_convert_fixate_caps(context: PGstGLContext; direction: TGstPadDirection; caps: PGstCaps; other: PGstCaps): PGstCaps; cdecl; external libgstgl;
function gst_gl_color_convert_set_caps(convert: PGstGLColorConvert; in_caps: PGstCaps; out_caps: PGstCaps): Tgboolean; cdecl; external libgstgl;
function gst_gl_color_convert_decide_allocation(convert: PGstGLColorConvert; query: PGstQuery): Tgboolean; cdecl; external libgstgl;
function gst_gl_color_convert_perform(convert: PGstGLColorConvert; inbuf: PGstBuffer): PGstBuffer; cdecl; external libgstgl;
function gst_gl_color_convert_swizzle_shader_string(context: PGstGLContext): Pgchar; cdecl; external libgstgl;
function gst_gl_color_convert_yuv_to_rgb_shader_string(context: PGstGLContext): Pgchar; cdecl; external libgstgl;

function GST_GL_COLOR_CONVERT_CAST(obj: Pointer): PGstGLColorConvert;

// === Konventiert am: 9-10-24 12:14:56 ===

function GST_TYPE_GL_COLOR_CONVERT: TGType;
function GST_GL_COLOR_CONVERT(obj: Pointer): PGstGLColorConvert;
function GST_GL_COLOR_CONVERT_CLASS(klass: Pointer): PGstGLColorConvertClass;
function GST_IS_GL_COLOR_CONVERT(obj: Pointer): Tgboolean;
function GST_IS_GL_COLOR_CONVERT_CLASS(klass: Pointer): Tgboolean;

{$ENDIF read_interface}


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

// ====

function GST_GL_COLOR_CONVERT_CAST(obj: Pointer): PGstGLColorConvert;
begin
  GST_GL_COLOR_CONVERT_CAST := PGstGLColorConvert(obj);
end;


{$ENDIF read_implementation}
