/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 09-10-2024   19:05                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_gl_filter_get_type: TGType; cdecl; external libgstgl;

type
  PGstGLFilter = ^TGstGLFilter;
  TGstGLFilterRenderFunc = function(filter: PGstGLFilter; in_tex: PGstGLMemory; user_data: Tgpointer): Tgboolean; cdecl;

  TGstGLFilter = record
    parent: TGstGLBaseFilter;
    in_info: TGstVideoInfo;
    out_info: TGstVideoInfo;
    in_texture_target: TGstGLTextureTarget;
    out_texture_target: TGstGLTextureTarget;
    out_caps: PGstCaps;
    fbo: PGstGLFramebuffer;
    gl_result: Tgboolean;
    inbuf: PGstBuffer;
    outbuf: PGstBuffer;
    default_shader: PGstGLShader;
    valid_attributes: Tgboolean;
    vao: Tguint;
    vbo_indices: Tguint;
    vertex_buffer: Tguint;
    draw_attr_position_loc: Tgint;
    draw_attr_texture_loc: Tgint;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  TGstGLFilterClass = record
    parent_class: TGstGLBaseFilterClass;
    set_caps: function(filter: PGstGLFilter; incaps: PGstCaps; outcaps: PGstCaps): Tgboolean; cdecl;
    filter: function(filter: PGstGLFilter; inbuf: PGstBuffer; outbuf: PGstBuffer): Tgboolean; cdecl;
    filter_texture: function(filter: PGstGLFilter; input: PGstGLMemory; output: PGstGLMemory): Tgboolean; cdecl;
    init_fbo: function(filter: PGstGLFilter): Tgboolean; cdecl;
    transform_internal_caps: function(filter: PGstGLFilter; direction: TGstPadDirection; caps: PGstCaps; filter_caps: PGstCaps): PGstCaps; cdecl;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLFilterClass = ^TGstGLFilterClass;


procedure gst_gl_filter_add_rgba_pad_templates(klass: PGstGLFilterClass); cdecl; external libgstgl;
function gst_gl_filter_filter_texture(filter: PGstGLFilter; input: PGstBuffer; output: PGstBuffer): Tgboolean; cdecl; external libgstgl;
function gst_gl_filter_render_to_target(filter: PGstGLFilter; input: PGstGLMemory; output: PGstGLMemory; func: TGstGLFilterRenderFunc; Data: Tgpointer): Tgboolean; cdecl; external libgstgl;
procedure gst_gl_filter_draw_fullscreen_quad(filter: PGstGLFilter); cdecl; external libgstgl;
procedure gst_gl_filter_render_to_target_with_shader(filter: PGstGLFilter; input: PGstGLMemory; output: PGstGLMemory; shader: PGstGLShader); cdecl; external libgstgl;

// === Konventiert am: 9-10-24 14:57:17 ===

function GST_TYPE_GL_FILTER: TGType;
function GST_GL_FILTER(obj: Pointer): PGstGLFilter;
function GST_GL_FILTER_CLASS(klass: Pointer): PGstGLFilterClass;
function GST_IS_GL_FILTER(obj: Pointer): Tgboolean;
function GST_IS_GL_FILTER_CLASS(klass: Pointer): Tgboolean;
function GST_GL_FILTER_GET_CLASS(obj: Pointer): PGstGLFilterClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_GL_FILTER: TGType;
begin
  GST_TYPE_GL_FILTER := gst_gl_filter_get_type;
end;

function GST_GL_FILTER(obj: Pointer): PGstGLFilter;
begin
  Result := PGstGLFilter(g_type_check_instance_cast(obj, GST_TYPE_GL_FILTER));
end;

function GST_GL_FILTER_CLASS(klass: Pointer): PGstGLFilterClass;
begin
  Result := PGstGLFilterClass(g_type_check_class_cast(klass, GST_TYPE_GL_FILTER));
end;

function GST_IS_GL_FILTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_FILTER);
end;

function GST_IS_GL_FILTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GL_FILTER);
end;

function GST_GL_FILTER_GET_CLASS(obj: Pointer): PGstGLFilterClass;
begin
  Result := PGstGLFilterClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
