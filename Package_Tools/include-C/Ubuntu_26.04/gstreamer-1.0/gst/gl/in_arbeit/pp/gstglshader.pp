
unit gstglshader;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstglshader.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstglshader
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pgchar  = ^gchar;
PGError  = ^GError;
Pgfloat  = ^gfloat;
Pgint  = ^gint;
PGstGLContext  = ^GstGLContext;
PGstGLShader  = ^GstGLShader;
PGstGLShaderClass  = ^GstGLShaderClass;
PGstGLShaderPrivate  = ^GstGLShaderPrivate;
PGstGLSLStage  = ^GstGLSLStage;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2008 Filippo Argiolas <filippo.argiolas@gmail.com>
 * Copyright (C) 2014 Julien Isorce <julien.isorce@collabora.co.uk>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_GL_SHADER_H__}
{$define __GST_GL_SHADER_H__}
{$include <gst/gl/gstgl_fwd.h>}

function gst_gl_shader_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_SHADER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_SHADER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_SHADER_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_SHADER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_SHADER_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_SHADER_GET_CLASS(o : longint) : longint;

{< private > }
type
  PGstGLShader = ^TGstGLShader;
  TGstGLShader = record
      parent : TGstObject;
      context : PGstGLContext;
      priv : PGstGLShaderPrivate;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{< private > }
  PGstGLShaderClass = ^TGstGLShaderClass;
  TGstGLShaderClass = record
      parent_class : TGstObjectClass;
    end;


function gst_gl_shader_new(context:PGstGLContext):PGstGLShader;cdecl;external;
function gst_gl_shader_new_with_stages(context:PGstGLContext; error:PPGError; args:array of const):PGstGLShader;cdecl;external;
function gst_gl_shader_new_with_stages(context:PGstGLContext; error:PPGError):PGstGLShader;cdecl;external;
function gst_gl_shader_new_link_with_stages(context:PGstGLContext; error:PPGError; args:array of const):PGstGLShader;cdecl;external;
function gst_gl_shader_new_link_with_stages(context:PGstGLContext; error:PPGError):PGstGLShader;cdecl;external;
function gst_gl_shader_new_default(context:PGstGLContext; error:PPGError):PGstGLShader;cdecl;external;
function gst_gl_shader_attach(shader:PGstGLShader; stage:PGstGLSLStage):Tgboolean;cdecl;external;
function gst_gl_shader_attach_unlocked(shader:PGstGLShader; stage:PGstGLSLStage):Tgboolean;cdecl;external;
procedure gst_gl_shader_detach(shader:PGstGLShader; stage:PGstGLSLStage);cdecl;external;
procedure gst_gl_shader_detach_unlocked(shader:PGstGLShader; stage:PGstGLSLStage);cdecl;external;
function gst_gl_shader_compile_attach_stage(shader:PGstGLShader; stage:PGstGLSLStage; error:PPGError):Tgboolean;cdecl;external;
function gst_gl_shader_link(shader:PGstGLShader; error:PPGError):Tgboolean;cdecl;external;
function gst_gl_shader_is_linked(shader:PGstGLShader):Tgboolean;cdecl;external;
function gst_gl_shader_get_program_handle(shader:PGstGLShader):longint;cdecl;external;
procedure gst_gl_shader_release(shader:PGstGLShader);cdecl;external;
procedure gst_gl_shader_release_unlocked(shader:PGstGLShader);cdecl;external;
procedure gst_gl_shader_use(shader:PGstGLShader);cdecl;external;
procedure gst_gl_context_clear_shader(context:PGstGLContext);cdecl;external;
(* Const before type ignored *)
procedure gst_gl_shader_set_uniform_1i(shader:PGstGLShader; name:Pgchar; value:Tgint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_gl_shader_set_uniform_1iv(shader:PGstGLShader; name:Pgchar; count:Tguint; value:Pgint);cdecl;external;
(* Const before type ignored *)
procedure gst_gl_shader_set_uniform_1f(shader:PGstGLShader; name:Pgchar; value:Tgfloat);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_gl_shader_set_uniform_1fv(shader:PGstGLShader; name:Pgchar; count:Tguint; value:Pgfloat);cdecl;external;
(* Const before type ignored *)
procedure gst_gl_shader_set_uniform_2i(shader:PGstGLShader; name:Pgchar; v0:Tgint; v1:Tgint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_gl_shader_set_uniform_2iv(shader:PGstGLShader; name:Pgchar; count:Tguint; value:Pgint);cdecl;external;
(* Const before type ignored *)
procedure gst_gl_shader_set_uniform_2f(shader:PGstGLShader; name:Pgchar; v0:Tgfloat; v1:Tgfloat);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_gl_shader_set_uniform_2fv(shader:PGstGLShader; name:Pgchar; count:Tguint; value:Pgfloat);cdecl;external;
(* Const before type ignored *)
procedure gst_gl_shader_set_uniform_3i(shader:PGstGLShader; name:Pgchar; v0:Tgint; v1:Tgint; v2:Tgint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_gl_shader_set_uniform_3iv(shader:PGstGLShader; name:Pgchar; count:Tguint; value:Pgint);cdecl;external;
(* Const before type ignored *)
procedure gst_gl_shader_set_uniform_3f(shader:PGstGLShader; name:Pgchar; v0:Tgfloat; v1:Tgfloat; v2:Tgfloat);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_gl_shader_set_uniform_3fv(shader:PGstGLShader; name:Pgchar; count:Tguint; value:Pgfloat);cdecl;external;
(* Const before type ignored *)
procedure gst_gl_shader_set_uniform_4i(shader:PGstGLShader; name:Pgchar; v0:Tgint; v1:Tgint; v2:Tgint; 
            v3:Tgint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_gl_shader_set_uniform_4iv(shader:PGstGLShader; name:Pgchar; count:Tguint; value:Pgint);cdecl;external;
(* Const before type ignored *)
procedure gst_gl_shader_set_uniform_4f(shader:PGstGLShader; name:Pgchar; v0:Tgfloat; v1:Tgfloat; v2:Tgfloat; 
            v3:Tgfloat);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_gl_shader_set_uniform_4fv(shader:PGstGLShader; name:Pgchar; count:Tguint; value:Pgfloat);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_gl_shader_set_uniform_matrix_2fv(shader:PGstGLShader; name:Pgchar; count:Tgint; transpose:Tgboolean; value:Pgfloat);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_gl_shader_set_uniform_matrix_3fv(shader:PGstGLShader; name:Pgchar; count:Tgint; transpose:Tgboolean; value:Pgfloat);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_gl_shader_set_uniform_matrix_4fv(shader:PGstGLShader; name:Pgchar; count:Tgint; transpose:Tgboolean; value:Pgfloat);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_gl_shader_set_uniform_matrix_2x3fv(shader:PGstGLShader; name:Pgchar; count:Tgint; transpose:Tgboolean; value:Pgfloat);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_gl_shader_set_uniform_matrix_2x4fv(shader:PGstGLShader; name:Pgchar; count:Tgint; transpose:Tgboolean; value:Pgfloat);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_gl_shader_set_uniform_matrix_3x2fv(shader:PGstGLShader; name:Pgchar; count:Tgint; transpose:Tgboolean; value:Pgfloat);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_gl_shader_set_uniform_matrix_3x4fv(shader:PGstGLShader; name:Pgchar; count:Tgint; transpose:Tgboolean; value:Pgfloat);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_gl_shader_set_uniform_matrix_4x2fv(shader:PGstGLShader; name:Pgchar; count:Tgint; transpose:Tgboolean; value:Pgfloat);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_gl_shader_set_uniform_matrix_4x3fv(shader:PGstGLShader; name:Pgchar; count:Tgint; transpose:Tgboolean; value:Pgfloat);cdecl;external;
(* Const before type ignored *)
function gst_gl_shader_get_attribute_location(shader:PGstGLShader; name:Pgchar):Tgint;cdecl;external;
(* Const before type ignored *)
procedure gst_gl_shader_bind_attribute_location(shader:PGstGLShader; index:Tguint; name:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure gst_gl_shader_bind_frag_data_location(shader:PGstGLShader; index:Tguint; name:Pgchar);cdecl;external;
{$endif}
{ __GST_GL_SHADER_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_GL_SHADER : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_SHADER:=gst_gl_shader_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_SHADER(o : longint) : longint;
begin
  GST_GL_SHADER:=G_TYPE_CHECK_INSTANCE_CAST(o,GST_TYPE_GL_SHADER,GstGLShader);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_SHADER_CLASS(k : longint) : longint;
begin
  GST_GL_SHADER_CLASS:=G_TYPE_CHECK_CLASS(k,GST_TYPE_GL_SHADER,GstGLShaderClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_SHADER(o : longint) : longint;
begin
  GST_IS_GL_SHADER:=G_TYPE_CHECK_INSTANCE_TYPE(o,GST_TYPE_GL_SHADER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_SHADER_CLASS(k : longint) : longint;
begin
  GST_IS_GL_SHADER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,GST_TYPE_GL_SHADER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_SHADER_GET_CLASS(o : longint) : longint;
begin
  GST_GL_SHADER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GST_TYPE_GL_SHADER,GstGLShaderClass);
end;


end.
