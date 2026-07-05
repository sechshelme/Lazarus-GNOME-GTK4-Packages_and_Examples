unit gskglshader;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GSK - The GTK Scene Kit
 *
 * Copyright 2020  Red Hat Inc
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GSK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gsk/gsk.h> can be included directly."}
{$endif}
{$include <stdarg.h>}
{$include <gsk/gsktypes.h>}
{$include <gsk/gskenums.h>}

 * GskShaderArgsBuilder:
 *
 * Builds the uniforms data for a `GskGLShader`.
 *
 * Deprecated: 4.16
  }
type

{ was #define dname def_expr }
function GSK_TYPE_GL_SHADER : longint; { return type might be wrong }



{extern //xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
{G_DECLARE_FINAL_TYPE (GskGLShader, gsk_gl_shader, GSK, GL_SHADER, GObject) }
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_gl_shader_new_from_bytes(sourcecode:PGBytes):PGskGLShader;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_gl_shader_new_from_resource(resource_path:Pchar):PGskGLShader;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_gl_shader_compile(shader:PGskGLShader; renderer:PGskRenderer; error:PPGError):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_gl_shader_get_source(shader:PGskGLShader):PGBytes;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_gl_shader_get_resource(shader:PGskGLShader):Pchar;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_gl_shader_get_n_textures(shader:PGskGLShader):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_gl_shader_get_n_uniforms(shader:PGskGLShader):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_gl_shader_get_uniform_name(shader:PGskGLShader; idx:longint):Pchar;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_gl_shader_find_uniform_by_name(shader:PGskGLShader; name:Pchar):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_gl_shader_get_uniform_type(shader:PGskGLShader; idx:longint):TGskGLUniformType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_gl_shader_get_uniform_offset(shader:PGskGLShader; idx:longint):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_gl_shader_get_args_size(shader:PGskGLShader):Tgsize;cdecl;external libgtk4;
{ Helpers for managing shader args  }
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_gl_shader_format_args_va(shader:PGskGLShader; uniforms:Tva_list):PGBytes;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_gl_shader_format_args(shader:PGskGLShader; args:array of const):PGBytes;cdecl;external libgtk4;
function gsk_gl_shader_format_args(shader:PGskGLShader):PGBytes;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_gl_shader_get_arg_float(shader:PGskGLShader; args:PGBytes; idx:longint):single;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_gl_shader_get_arg_int(shader:PGskGLShader; args:PGBytes; idx:longint):Tgint32;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_gl_shader_get_arg_uint(shader:PGskGLShader; args:PGBytes; idx:longint):Tguint32;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_gl_shader_get_arg_bool(shader:PGskGLShader; args:PGBytes; idx:longint):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
procedure gsk_gl_shader_get_arg_vec2(shader:PGskGLShader; args:PGBytes; idx:longint; out_value:Pgraphene_vec2_t);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
procedure gsk_gl_shader_get_arg_vec3(shader:PGskGLShader; args:PGBytes; idx:longint; out_value:Pgraphene_vec3_t);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
procedure gsk_gl_shader_get_arg_vec4(shader:PGskGLShader; args:PGBytes; idx:longint; out_value:Pgraphene_vec4_t);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_shader_args_builder_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_shader_args_builder_new(shader:PGskGLShader; initial_values:PGBytes):PGskShaderArgsBuilder;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_shader_args_builder_to_args(builder:PGskShaderArgsBuilder):PGBytes;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_shader_args_builder_free_to_args(builder:PGskShaderArgsBuilder):PGBytes;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_shader_args_builder_ref(builder:PGskShaderArgsBuilder):PGskShaderArgsBuilder;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
procedure gsk_shader_args_builder_unref(builder:PGskShaderArgsBuilder);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
procedure gsk_shader_args_builder_set_float(builder:PGskShaderArgsBuilder; idx:longint; value:single);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
procedure gsk_shader_args_builder_set_int(builder:PGskShaderArgsBuilder; idx:longint; value:Tgint32);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
procedure gsk_shader_args_builder_set_uint(builder:PGskShaderArgsBuilder; idx:longint; value:Tguint32);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
procedure gsk_shader_args_builder_set_bool(builder:PGskShaderArgsBuilder; idx:longint; value:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
procedure gsk_shader_args_builder_set_vec2(builder:PGskShaderArgsBuilder; idx:longint; value:Pgraphene_vec2_t);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
procedure gsk_shader_args_builder_set_vec3(builder:PGskShaderArgsBuilder; idx:longint; value:Pgraphene_vec3_t);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
procedure gsk_shader_args_builder_set_vec4(builder:PGskShaderArgsBuilder; idx:longint; value:Pgraphene_vec4_t);cdecl;external libgtk4;

function GSK_TYPE_SHADER_ARGS_BUILDER : longint; { return type might be wrong }


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

type 
  TGskGLShader = record
  end;
  PGskGLShader = ^TGskGLShader;

  TGskGLShaderClass = record
    parent_class: TGObjectClass;
  end;
  PGskGLShaderClass = ^TGskGLShaderClass;

function gsk_gl_shader_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname def_expr }
function GSK_TYPE_SHADER_ARGS_BUILDER : longint; { return type might be wrong }
  begin
    GSK_TYPE_SHADER_ARGS_BUILDER:=gsk_shader_args_builder_get_type;
  end;


end.
