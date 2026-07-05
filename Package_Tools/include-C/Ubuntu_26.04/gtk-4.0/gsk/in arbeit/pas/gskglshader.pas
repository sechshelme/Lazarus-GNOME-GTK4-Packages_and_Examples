unit gskglshader;

interface

uses
  fp_glib2, fp_graphene, fp_gtk4, gsktypes, gskenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGskShaderArgsBuilder = type Pointer;
  PGskGLShader = type Pointer;

  TGskGLShaderClass = record
    parent_class: TGObjectClass;
  end;
  PGskGLShaderClass = ^TGskGLShaderClass;

function gsk_gl_shader_get_type: TGType; cdecl; external libgtk4; deprecated;
function gsk_gl_shader_new_from_bytes(sourcecode: PGBytes): PGskGLShader; cdecl; external libgtk4; deprecated;
function gsk_gl_shader_new_from_resource(resource_path: pchar): PGskGLShader; cdecl; external libgtk4; deprecated;
function gsk_gl_shader_compile(shader: PGskGLShader; renderer: PGskRenderer; error: PPGError): Tgboolean; cdecl; external libgtk4; deprecated;
function gsk_gl_shader_get_source(shader: PGskGLShader): PGBytes; cdecl; external libgtk4; deprecated;
function gsk_gl_shader_get_resource(shader: PGskGLShader): pchar; cdecl; external libgtk4; deprecated;
function gsk_gl_shader_get_n_textures(shader: PGskGLShader): longint; cdecl; external libgtk4; deprecated;
function gsk_gl_shader_get_n_uniforms(shader: PGskGLShader): longint; cdecl; external libgtk4; deprecated;
function gsk_gl_shader_get_uniform_name(shader: PGskGLShader; idx: longint): pchar; cdecl; external libgtk4; deprecated;
function gsk_gl_shader_find_uniform_by_name(shader: PGskGLShader; name: pchar): longint; cdecl; external libgtk4; deprecated;
function gsk_gl_shader_get_uniform_type(shader: PGskGLShader; idx: longint): TGskGLUniformType; cdecl; external libgtk4; deprecated;
function gsk_gl_shader_get_uniform_offset(shader: PGskGLShader; idx: longint): longint; cdecl; external libgtk4; deprecated;
function gsk_gl_shader_get_args_size(shader: PGskGLShader): Tgsize; cdecl; external libgtk4; deprecated;
function gsk_gl_shader_format_args_va(shader: PGskGLShader; uniforms: Tva_list): PGBytes; cdecl; external libgtk4; deprecated;
function gsk_gl_shader_format_args(shader: PGskGLShader): PGBytes; cdecl; varargs; external libgtk4; deprecated;
function gsk_gl_shader_get_arg_float(shader: PGskGLShader; args: PGBytes; idx: longint): single; cdecl; external libgtk4; deprecated;
function gsk_gl_shader_get_arg_int(shader: PGskGLShader; args: PGBytes; idx: longint): Tgint32; cdecl; external libgtk4; deprecated;
function gsk_gl_shader_get_arg_uint(shader: PGskGLShader; args: PGBytes; idx: longint): Tguint32; cdecl; external libgtk4; deprecated;
function gsk_gl_shader_get_arg_bool(shader: PGskGLShader; args: PGBytes; idx: longint): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gsk_gl_shader_get_arg_vec2(shader: PGskGLShader; args: PGBytes; idx: longint; out_value: Pgraphene_vec2_t); cdecl; external libgtk4; deprecated;
procedure gsk_gl_shader_get_arg_vec3(shader: PGskGLShader; args: PGBytes; idx: longint; out_value: Pgraphene_vec3_t); cdecl; external libgtk4; deprecated;
procedure gsk_gl_shader_get_arg_vec4(shader: PGskGLShader; args: PGBytes; idx: longint; out_value: Pgraphene_vec4_t); cdecl; external libgtk4; deprecated;
function gsk_shader_args_builder_get_type: TGType; cdecl; external libgtk4; deprecated;
function gsk_shader_args_builder_new(shader: PGskGLShader; initial_values: PGBytes): PGskShaderArgsBuilder; cdecl; external libgtk4; deprecated;
function gsk_shader_args_builder_to_args(builder: PGskShaderArgsBuilder): PGBytes; cdecl; external libgtk4; deprecated;
function gsk_shader_args_builder_free_to_args(builder: PGskShaderArgsBuilder): PGBytes; cdecl; external libgtk4; deprecated;
function gsk_shader_args_builder_ref(builder: PGskShaderArgsBuilder): PGskShaderArgsBuilder; cdecl; external libgtk4; deprecated;
procedure gsk_shader_args_builder_unref(builder: PGskShaderArgsBuilder); cdecl; external libgtk4; deprecated;
procedure gsk_shader_args_builder_set_float(builder: PGskShaderArgsBuilder; idx: longint; value: single); cdecl; external libgtk4; deprecated;
procedure gsk_shader_args_builder_set_int(builder: PGskShaderArgsBuilder; idx: longint; value: Tgint32); cdecl; external libgtk4; deprecated;
procedure gsk_shader_args_builder_set_uint(builder: PGskShaderArgsBuilder; idx: longint; value: Tguint32); cdecl; external libgtk4; deprecated;
procedure gsk_shader_args_builder_set_bool(builder: PGskShaderArgsBuilder; idx: longint; value: Tgboolean); cdecl; external libgtk4; deprecated;
procedure gsk_shader_args_builder_set_vec2(builder: PGskShaderArgsBuilder; idx: longint; value: Pgraphene_vec2_t); cdecl; external libgtk4; deprecated;
procedure gsk_shader_args_builder_set_vec3(builder: PGskShaderArgsBuilder; idx: longint; value: Pgraphene_vec3_t); cdecl; external libgtk4; deprecated;
procedure gsk_shader_args_builder_set_vec4(builder: PGskShaderArgsBuilder; idx: longint; value: Pgraphene_vec4_t); cdecl; external libgtk4; deprecated;

function GSK_TYPE_SHADER_ARGS_BUILDER: TGType;


// === Konventiert am: 5-7-26 13:28:18 ===

function GSK_TYPE_GL_SHADER: TGType;
function GSK_GL_SHADER(obj: Pointer): PGskGLShader;
function GSK_IS_GL_SHADER(obj: Pointer): Tgboolean;

implementation

function GSK_TYPE_GL_SHADER: TGType;
begin
  Result := gsk_gl_shader_get_type;
end;

function GSK_GL_SHADER(obj: Pointer): PGskGLShader;
begin
  Result := PGskGLShader(g_type_check_instance_cast(obj, GSK_TYPE_GL_SHADER));
end;

function GSK_IS_GL_SHADER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GSK_TYPE_GL_SHADER);
end;


function GSK_TYPE_SHADER_ARGS_BUILDER: TGType;
begin
  GSK_TYPE_SHADER_ARGS_BUILDER := gsk_shader_args_builder_get_type;
end;


end.
