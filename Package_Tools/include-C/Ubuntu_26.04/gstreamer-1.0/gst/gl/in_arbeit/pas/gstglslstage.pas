unit gstglslstage;

interface

uses
  fp_glib2, fp_gst;

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


function gst_glsl_stage_get_type:TGType;cdecl;external libgstgl;
function gst_glsl_stage_new(context:PGstGLContext; _type:Tguint):PGstGLSLStage;cdecl;external libgstgl;
function gst_glsl_stage_new_with_string(context:PGstGLContext; _type:Tguint; version:TGstGLSLVersion; profile:TGstGLSLProfile; str:Pgchar):PGstGLSLStage;cdecl;external libgstgl;
function gst_glsl_stage_new_with_strings(context:PGstGLContext; _type:Tguint; version:TGstGLSLVersion; profile:TGstGLSLProfile; n_strings:Tgint; 
           str:PPgchar):PGstGLSLStage;cdecl;external libgstgl;
function gst_glsl_stage_new_default_fragment(context:PGstGLContext):PGstGLSLStage;cdecl;external libgstgl;
function gst_glsl_stage_new_default_vertex(context:PGstGLContext):PGstGLSLStage;cdecl;external libgstgl;
function gst_glsl_stage_get_handle(stage:PGstGLSLStage):Tguint;cdecl;external libgstgl;
function gst_glsl_stage_get_profile(stage:PGstGLSLStage):TGstGLSLProfile;cdecl;external libgstgl;
function gst_glsl_stage_get_version(stage:PGstGLSLStage):TGstGLSLVersion;cdecl;external libgstgl;
function gst_glsl_stage_get_shader_type(stage:PGstGLSLStage):Tguint;cdecl;external libgstgl;
function gst_glsl_stage_set_strings(stage:PGstGLSLStage; version:TGstGLSLVersion; profile:TGstGLSLProfile; n_strings:Tgint; str:PPgchar):Tgboolean;cdecl;external libgstgl;
function gst_glsl_stage_compile(stage:PGstGLSLStage; error:PPGError):Tgboolean;cdecl;external libgstgl;
{$endif}
{ __GST_GLSL_STAGE_H__  }

// === Konventiert am: 14-7-26 13:09:58 ===

function GST_TYPE_GLSL_STAGE : TGType;
function GST_GLSL_STAGE(obj : Pointer) : PGstGLSLStage;
function GST_GLSL_STAGE_CLASS(klass : Pointer) : PGstGLSLStageClass;
function GST_IS_GLSL_STAGE(obj : Pointer) : Tgboolean;
function GST_IS_GLSL_STAGE_CLASS(klass : Pointer) : Tgboolean;
function GST_GLSL_STAGE_GET_CLASS(obj : Pointer) : PGstGLSLStageClass;

implementation

function GST_TYPE_GLSL_STAGE : TGType;
  begin
    GST_TYPE_GLSL_STAGE:=gst_glsl_stage_get_type;
  end;

function GST_GLSL_STAGE(obj : Pointer) : PGstGLSLStage;
begin
  Result := PGstGLSLStage(g_type_check_instance_cast(obj, GST_TYPE_GLSL_STAGE));
end;

function GST_GLSL_STAGE_CLASS(klass : Pointer) : PGstGLSLStageClass;
begin
  Result := PGstGLSLStageClass(g_type_check_class_cast(klass, GST_TYPE_GLSL_STAGE));
end;

function GST_IS_GLSL_STAGE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_GLSL_STAGE);
end;

function GST_IS_GLSL_STAGE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_GLSL_STAGE);
end;

function GST_GLSL_STAGE_GET_CLASS(obj : Pointer) : PGstGLSLStageClass;
begin
  Result := PGstGLSLStageClass(PGTypeInstance(obj)^.g_class);
end;



end.
