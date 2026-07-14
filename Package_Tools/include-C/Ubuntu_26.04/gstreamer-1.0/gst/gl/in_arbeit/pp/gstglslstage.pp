
unit gstglslstage;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstglslstage.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstglslstage.h
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
PGstGLContext  = ^GstGLContext;
PGstGLSLStage  = ^GstGLSLStage;
PGstGLSLStageClass  = ^GstGLSLStageClass;
PGstGLSLStagePrivate  = ^GstGLSLStagePrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2015 Matthew Waters <matthew@centricular.com>
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
{$ifndef __GST_GLSL_STAGE_H__}
{$define __GST_GLSL_STAGE_H__}
{$include <gst/gl/gstglsl.h>}

{ was #define dname def_expr }
function GST_TYPE_GLSL_STAGE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GLSL_STAGE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GLSL_STAGE_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GLSL_STAGE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GLSL_STAGE_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GLSL_STAGE_GET_CLASS(o : longint) : longint;

{*
 * GstGLSLStage:
 *
 * Opaque #GstGLSLStage struct
  }
{< private > }
type
  PGstGLSLStage = ^TGstGLSLStage;
  TGstGLSLStage = record
      parent : TGstObject;
      context : PGstGLContext;
      priv : PGstGLSLStagePrivate;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstGLSLStageClass:
 *
 * Opaque #GstGLSLStageClass struct
  }
{< private > }
  PGstGLSLStageClass = ^TGstGLSLStageClass;
  TGstGLSLStageClass = record
      parent : TGstObjectClass;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_glsl_stage_get_type:TGType;cdecl;external;
function gst_glsl_stage_new(context:PGstGLContext; _type:Tguint):PGstGLSLStage;cdecl;external;
(* Const before type ignored *)
function gst_glsl_stage_new_with_string(context:PGstGLContext; _type:Tguint; version:TGstGLSLVersion; profile:TGstGLSLProfile; str:Pgchar):PGstGLSLStage;cdecl;external;
(* Const before type ignored *)
function gst_glsl_stage_new_with_strings(context:PGstGLContext; _type:Tguint; version:TGstGLSLVersion; profile:TGstGLSLProfile; n_strings:Tgint; 
           str:PPgchar):PGstGLSLStage;cdecl;external;
function gst_glsl_stage_new_default_fragment(context:PGstGLContext):PGstGLSLStage;cdecl;external;
function gst_glsl_stage_new_default_vertex(context:PGstGLContext):PGstGLSLStage;cdecl;external;
function gst_glsl_stage_get_handle(stage:PGstGLSLStage):Tguint;cdecl;external;
function gst_glsl_stage_get_profile(stage:PGstGLSLStage):TGstGLSLProfile;cdecl;external;
function gst_glsl_stage_get_version(stage:PGstGLSLStage):TGstGLSLVersion;cdecl;external;
function gst_glsl_stage_get_shader_type(stage:PGstGLSLStage):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_glsl_stage_set_strings(stage:PGstGLSLStage; version:TGstGLSLVersion; profile:TGstGLSLProfile; n_strings:Tgint; str:PPgchar):Tgboolean;cdecl;external;
function gst_glsl_stage_compile(stage:PGstGLSLStage; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __GST_GLSL_STAGE_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_GLSL_STAGE : longint; { return type might be wrong }
  begin
    GST_TYPE_GLSL_STAGE:=gst_glsl_stage_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GLSL_STAGE(o : longint) : longint;
begin
  GST_GLSL_STAGE:=G_TYPE_CHECK_INSTANCE_CAST(o,GST_TYPE_GLSL_STAGE,GstGLSLStage);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GLSL_STAGE_CLASS(k : longint) : longint;
begin
  GST_GLSL_STAGE_CLASS:=G_TYPE_CHECK_CLASS(k,GST_TYPE_GLSL_STAGE,GstGLSLStageClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GLSL_STAGE(o : longint) : longint;
begin
  GST_IS_GLSL_STAGE:=G_TYPE_CHECK_INSTANCE_TYPE(o,GST_TYPE_GLSL_STAGE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GLSL_STAGE_CLASS(k : longint) : longint;
begin
  GST_IS_GLSL_STAGE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,GST_TYPE_GLSL_STAGE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GLSL_STAGE_GET_CLASS(o : longint) : longint;
begin
  GST_GLSL_STAGE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GST_TYPE_GLSL_STAGE,GstGLSLStageClass);
end;


end.
