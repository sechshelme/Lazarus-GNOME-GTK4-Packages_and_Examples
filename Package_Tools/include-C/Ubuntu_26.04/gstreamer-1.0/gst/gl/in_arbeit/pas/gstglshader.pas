unit gstglshader;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstglslstage;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstGLShaderPrivate = type Pointer;

  PGstGLShader = ^TGstGLShader;
  TGstGLShader = record
    parent: TGstObject;
    context: PGstGLContext;
    priv: PGstGLShaderPrivate;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstGLShaderClass = ^TGstGLShaderClass;
  TGstGLShaderClass = record
    parent_class: TGstObjectClass;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_gl_shader_get_type: TGType; cdecl; external libgstgl;
function gst_gl_shader_new(context: PGstGLContext): PGstGLShader; cdecl; external libgstgl;
function gst_gl_shader_new_with_stages(context: PGstGLContext; error: PPGError; args: array of const): PGstGLShader; cdecl; external libgstgl;
function gst_gl_shader_new_with_stages(context: PGstGLContext; error: PPGError): PGstGLShader; cdecl; external libgstgl;
function gst_gl_shader_new_link_with_stages(context: PGstGLContext; error: PPGError; args: array of const): PGstGLShader; cdecl; external libgstgl;
function gst_gl_shader_new_link_with_stages(context: PGstGLContext; error: PPGError): PGstGLShader; cdecl; external libgstgl;
function gst_gl_shader_new_default(context: PGstGLContext; error: PPGError): PGstGLShader; cdecl; external libgstgl;
function gst_gl_shader_attach(shader: PGstGLShader; stage: PGstGLSLStage): Tgboolean; cdecl; external libgstgl;
function gst_gl_shader_attach_unlocked(shader: PGstGLShader; stage: PGstGLSLStage): Tgboolean; cdecl; external libgstgl;
procedure gst_gl_shader_detach(shader: PGstGLShader; stage: PGstGLSLStage); cdecl; external libgstgl;
procedure gst_gl_shader_detach_unlocked(shader: PGstGLShader; stage: PGstGLSLStage); cdecl; external libgstgl;
function gst_gl_shader_compile_attach_stage(shader: PGstGLShader; stage: PGstGLSLStage; error: PPGError): Tgboolean; cdecl; external libgstgl;
function gst_gl_shader_link(shader: PGstGLShader; error: PPGError): Tgboolean; cdecl; external libgstgl;
function gst_gl_shader_is_linked(shader: PGstGLShader): Tgboolean; cdecl; external libgstgl;
function gst_gl_shader_get_program_handle(shader: PGstGLShader): longint; cdecl; external libgstgl;
procedure gst_gl_shader_release(shader: PGstGLShader); cdecl; external libgstgl;
procedure gst_gl_shader_release_unlocked(shader: PGstGLShader); cdecl; external libgstgl;
procedure gst_gl_shader_use(shader: PGstGLShader); cdecl; external libgstgl;
procedure gst_gl_context_clear_shader(context: PGstGLContext); cdecl; external libgstgl;
procedure gst_gl_shader_set_uniform_1i(shader: PGstGLShader; name: Pgchar; value: Tgint); cdecl; external libgstgl;
procedure gst_gl_shader_set_uniform_1iv(shader: PGstGLShader; name: Pgchar; count: Tguint; value: Pgint); cdecl; external libgstgl;
procedure gst_gl_shader_set_uniform_1f(shader: PGstGLShader; name: Pgchar; value: Tgfloat); cdecl; external libgstgl;
procedure gst_gl_shader_set_uniform_1fv(shader: PGstGLShader; name: Pgchar; count: Tguint; value: Pgfloat); cdecl; external libgstgl;
procedure gst_gl_shader_set_uniform_2i(shader: PGstGLShader; name: Pgchar; v0: Tgint; v1: Tgint); cdecl; external libgstgl;
procedure gst_gl_shader_set_uniform_2iv(shader: PGstGLShader; name: Pgchar; count: Tguint; value: Pgint); cdecl; external libgstgl;
procedure gst_gl_shader_set_uniform_2f(shader: PGstGLShader; name: Pgchar; v0: Tgfloat; v1: Tgfloat); cdecl; external libgstgl;
procedure gst_gl_shader_set_uniform_2fv(shader: PGstGLShader; name: Pgchar; count: Tguint; value: Pgfloat); cdecl; external libgstgl;
procedure gst_gl_shader_set_uniform_3i(shader: PGstGLShader; name: Pgchar; v0: Tgint; v1: Tgint; v2: Tgint); cdecl; external libgstgl;
procedure gst_gl_shader_set_uniform_3iv(shader: PGstGLShader; name: Pgchar; count: Tguint; value: Pgint); cdecl; external libgstgl;
procedure gst_gl_shader_set_uniform_3f(shader: PGstGLShader; name: Pgchar; v0: Tgfloat; v1: Tgfloat; v2: Tgfloat); cdecl; external libgstgl;
procedure gst_gl_shader_set_uniform_3fv(shader: PGstGLShader; name: Pgchar; count: Tguint; value: Pgfloat); cdecl; external libgstgl;
procedure gst_gl_shader_set_uniform_4i(shader: PGstGLShader; name: Pgchar; v0: Tgint; v1: Tgint; v2: Tgint;
  v3: Tgint); cdecl; external libgstgl;
procedure gst_gl_shader_set_uniform_4iv(shader: PGstGLShader; name: Pgchar; count: Tguint; value: Pgint); cdecl; external libgstgl;
procedure gst_gl_shader_set_uniform_4f(shader: PGstGLShader; name: Pgchar; v0: Tgfloat; v1: Tgfloat; v2: Tgfloat;
  v3: Tgfloat); cdecl; external libgstgl;
procedure gst_gl_shader_set_uniform_4fv(shader: PGstGLShader; name: Pgchar; count: Tguint; value: Pgfloat); cdecl; external libgstgl;
procedure gst_gl_shader_set_uniform_matrix_2fv(shader: PGstGLShader; name: Pgchar; count: Tgint; transpose: Tgboolean; value: Pgfloat); cdecl; external libgstgl;
procedure gst_gl_shader_set_uniform_matrix_3fv(shader: PGstGLShader; name: Pgchar; count: Tgint; transpose: Tgboolean; value: Pgfloat); cdecl; external libgstgl;
procedure gst_gl_shader_set_uniform_matrix_4fv(shader: PGstGLShader; name: Pgchar; count: Tgint; transpose: Tgboolean; value: Pgfloat); cdecl; external libgstgl;
procedure gst_gl_shader_set_uniform_matrix_2x3fv(shader: PGstGLShader; name: Pgchar; count: Tgint; transpose: Tgboolean; value: Pgfloat); cdecl; external libgstgl;
procedure gst_gl_shader_set_uniform_matrix_2x4fv(shader: PGstGLShader; name: Pgchar; count: Tgint; transpose: Tgboolean; value: Pgfloat); cdecl; external libgstgl;
procedure gst_gl_shader_set_uniform_matrix_3x2fv(shader: PGstGLShader; name: Pgchar; count: Tgint; transpose: Tgboolean; value: Pgfloat); cdecl; external libgstgl;
procedure gst_gl_shader_set_uniform_matrix_3x4fv(shader: PGstGLShader; name: Pgchar; count: Tgint; transpose: Tgboolean; value: Pgfloat); cdecl; external libgstgl;
procedure gst_gl_shader_set_uniform_matrix_4x2fv(shader: PGstGLShader; name: Pgchar; count: Tgint; transpose: Tgboolean; value: Pgfloat); cdecl; external libgstgl;
procedure gst_gl_shader_set_uniform_matrix_4x3fv(shader: PGstGLShader; name: Pgchar; count: Tgint; transpose: Tgboolean; value: Pgfloat); cdecl; external libgstgl;
function gst_gl_shader_get_attribute_location(shader: PGstGLShader; name: Pgchar): Tgint; cdecl; external libgstgl;
procedure gst_gl_shader_bind_attribute_location(shader: PGstGLShader; index: Tguint; name: Pgchar); cdecl; external libgstgl;
procedure gst_gl_shader_bind_frag_data_location(shader: PGstGLShader; index: Tguint; name: Pgchar); cdecl; external libgstgl;

// === Konventiert am: 14-7-26 13:06:29 ===

function GST_TYPE_GL_SHADER: TGType;
function GST_GL_SHADER(obj: Pointer): PGstGLShader;
function GST_GL_SHADER_CLASS(klass: Pointer): PGstGLShaderClass;
function GST_IS_GL_SHADER(obj: Pointer): Tgboolean;
function GST_IS_GL_SHADER_CLASS(klass: Pointer): Tgboolean;
function GST_GL_SHADER_GET_CLASS(obj: Pointer): PGstGLShaderClass;
{$ENDIF read_struct}

implementation

function GST_TYPE_GL_SHADER: TGType;
begin
  GST_TYPE_GL_SHADER := gst_gl_shader_get_type;
end;

function GST_GL_SHADER(obj: Pointer): PGstGLShader;
begin
  Result := PGstGLShader(g_type_check_instance_cast(obj, GST_TYPE_GL_SHADER));
end;

function GST_GL_SHADER_CLASS(klass: Pointer): PGstGLShaderClass;
begin
  Result := PGstGLShaderClass(g_type_check_class_cast(klass, GST_TYPE_GL_SHADER));
end;

function GST_IS_GL_SHADER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_SHADER);
end;

function GST_IS_GL_SHADER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GL_SHADER);
end;

function GST_GL_SHADER_GET_CLASS(obj: Pointer): PGstGLShaderClass;
begin
  Result := PGstGLShaderClass(PGTypeInstance(obj)^.g_class);
end;



end.
