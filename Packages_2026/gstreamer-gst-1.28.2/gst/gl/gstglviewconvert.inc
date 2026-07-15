

  {$IFDEF read_enum}
type
  PGstGLStereoDownmix = ^TGstGLStereoDownmix;
  TGstGLStereoDownmix = longint;
const
  GST_GL_STEREO_DOWNMIX_ANAGLYPH_GREEN_MAGENTA_DUBOIS = 0;
  GST_GL_STEREO_DOWNMIX_ANAGLYPH_RED_CYAN_DUBOIS = 1;
  GST_GL_STEREO_DOWNMIX_ANAGLYPH_AMBER_BLUE_DUBOIS = 2;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstGLViewConvertPrivate = type Pointer;

  PGstGLViewConvert = ^TGstGLViewConvert;
  TGstGLViewConvert = record
    obj: TGstObject;
    context: PGstGLContext;
    shader: PGstGLShader;
    input_mode_override: TGstVideoMultiviewMode;
    input_flags_override: TGstVideoMultiviewFlags;
    output_mode_override: TGstVideoMultiviewMode;
    output_flags_override: TGstVideoMultiviewFlags;
    downmix_mode: TGstGLStereoDownmix;
    in_info: TGstVideoInfo;
    out_info: TGstVideoInfo;
    from_texture_target: TGstGLTextureTarget;
    to_texture_target: TGstGLTextureTarget;
    caps_passthrough: Tgboolean;
    initted: Tgboolean;
    reconfigure: Tgboolean;
    fbo: PGstGLFramebuffer;
    priv: PGstGLViewConvertPrivate;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstGLViewConvertClass = ^TGstGLViewConvertClass;
  TGstGLViewConvertClass = record
    object_class: TGstObjectClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_gl_stereo_downmix_mode_get_type: TGType; cdecl; external libgstgl;
function gst_gl_view_convert_get_type: TGType; cdecl; external libgstgl;
function gst_gl_view_convert_new: PGstGLViewConvert; cdecl; external libgstgl;
function gst_gl_view_convert_set_caps(viewconvert: PGstGLViewConvert; in_caps: PGstCaps; out_caps: PGstCaps): Tgboolean; cdecl; external libgstgl;
function gst_gl_view_convert_transform_caps(viewconvert: PGstGLViewConvert; direction: TGstPadDirection; caps: PGstCaps; filter: PGstCaps): PGstCaps; cdecl; external libgstgl;
function gst_gl_view_convert_fixate_caps(viewconvert: PGstGLViewConvert; direction: TGstPadDirection; caps: PGstCaps; othercaps: PGstCaps): PGstCaps; cdecl; external libgstgl;
function gst_gl_view_convert_submit_input_buffer(viewconvert: PGstGLViewConvert; is_discont: Tgboolean; input: PGstBuffer): TGstFlowReturn; cdecl; external libgstgl;
function gst_gl_view_convert_get_output(viewconvert: PGstGLViewConvert; outbuf_ptr: PPGstBuffer): TGstFlowReturn; cdecl; external libgstgl;
function gst_gl_view_convert_perform(viewconvert: PGstGLViewConvert; inbuf: PGstBuffer): PGstBuffer; cdecl; external libgstgl;
procedure gst_gl_view_convert_reset(viewconvert: PGstGLViewConvert); cdecl; external libgstgl;
procedure gst_gl_view_convert_set_context(viewconvert: PGstGLViewConvert; context: PGstGLContext); cdecl; external libgstgl;

// === Konventiert am: 14-7-26 13:09:23 ===

function GST_TYPE_GL_STEREO_DOWNMIX_MODE_TYPE: TGType;

function GST_TYPE_GL_VIEW_CONVERT: TGType;
function GST_GL_VIEW_CONVERT(obj: Pointer): PGstGLViewConvert;
function GST_GL_VIEW_CONVERT_CLASS(klass: Pointer): PGstGLViewConvertClass;
function GST_IS_GL_VIEW_CONVERT(obj: Pointer): Tgboolean;
function GST_IS_GL_VIEW_CONVERT_CLASS(klass: Pointer): Tgboolean;
function GST_GL_VIEW_CONVERT_GET_CLASS(obj: Pointer): PGstGLViewConvertClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_GL_VIEW_CONVERT: TGType;
begin
  GST_TYPE_GL_VIEW_CONVERT := gst_gl_view_convert_get_type;
end;

function GST_GL_VIEW_CONVERT(obj: Pointer): PGstGLViewConvert;
begin
  Result := PGstGLViewConvert(g_type_check_instance_cast(obj, GST_TYPE_GL_VIEW_CONVERT));
end;

function GST_GL_VIEW_CONVERT_CLASS(klass: Pointer): PGstGLViewConvertClass;
begin
  Result := PGstGLViewConvertClass(g_type_check_class_cast(klass, GST_TYPE_GL_VIEW_CONVERT));
end;

function GST_IS_GL_VIEW_CONVERT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_VIEW_CONVERT);
end;

function GST_IS_GL_VIEW_CONVERT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GL_VIEW_CONVERT);
end;

function GST_GL_VIEW_CONVERT_GET_CLASS(obj: Pointer): PGstGLViewConvertClass;
begin
  Result := PGstGLViewConvertClass(PGTypeInstance(obj)^.g_class);
end;


function GST_TYPE_GL_STEREO_DOWNMIX_MODE_TYPE: TGType;
begin
  Result := GST_TYPE_GL_STEREO_DOWNMIX;
end;

{$ENDIF read_implementation}
