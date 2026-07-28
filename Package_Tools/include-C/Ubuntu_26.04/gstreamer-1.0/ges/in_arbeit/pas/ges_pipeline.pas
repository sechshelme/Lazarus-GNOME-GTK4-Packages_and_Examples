unit ges_pipeline;

interface

uses
  fp_glib2, fp_gst, ges_enums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2009 Edward Hervey <edward.hervey@collabora.co.uk>
 *               2009 Nokia Corporation
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
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include <ges/ges.h>}
{$include <gst/pbutils/encoding-profile.h>}

{GES_DECLARE_TYPE(Pipeline, pipeline, PIPELINE); }
{*
 * GESPipeline:
 *
  }
{< private > }
{ Padding for API extension  }
type
  PGESPipeline = ^TGESPipeline;
  TGESPipeline = record
      parent : TGstPipeline;
      priv : PGESPipelinePrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESPipelineClass:
 * @parent_class: parent class
 *
  }
{< private > }
{ Padding for API extension  }
  PGESPipelineClass = ^TGESPipelineClass;
  TGESPipelineClass = record
      parent_class : TGstPipelineClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


function ges_pipeline_new:PGESPipeline;cdecl;external libges;
function ges_pipeline_set_timeline(pipeline:PGESPipeline; timeline:PGESTimeline):Tgboolean;cdecl;external libges;
function ges_pipeline_set_render_settings(pipeline:PGESPipeline; output_uri:Pgchar; profile:PGstEncodingProfile):Tgboolean;cdecl;external libges;
function ges_pipeline_set_mode(pipeline:PGESPipeline; mode:TGESPipelineFlags):Tgboolean;cdecl;external libges;
function ges_pipeline_get_mode(pipeline:PGESPipeline):TGESPipelineFlags;cdecl;external libges;
function ges_pipeline_get_thumbnail(self:PGESPipeline; caps:PGstCaps):PGstSample;cdecl;external libges;
function ges_pipeline_get_thumbnail_rgb24(self:PGESPipeline; width:Tgint; height:Tgint):PGstSample;cdecl;external libges;
function ges_pipeline_save_thumbnail(self:PGESPipeline; width:longint; height:longint; format:Pgchar; location:Pgchar; 
           error:PPGError):Tgboolean;cdecl;external libges;
function ges_pipeline_preview_get_video_sink(self:PGESPipeline):PGstElement;cdecl;external libges;
procedure ges_pipeline_preview_set_video_sink(self:PGESPipeline; sink:PGstElement);cdecl;external libges;
function ges_pipeline_preview_get_audio_sink(self:PGESPipeline):PGstElement;cdecl;external libges;
procedure ges_pipeline_preview_set_audio_sink(self:PGESPipeline; sink:PGstElement);cdecl;external libges;

// === Konventiert am: 28-7-26 13:05:59 ===

function GES_TYPE_PIPELINE: TGType;
function GES_PIPELINE(obj: Pointer): PGESPipeline;
function GES_IS_PIPELINE(obj: Pointer): Tgboolean;
function GES_PIPELINE_CLASS(klass: Pointer): PGESPipelineClass;
function GES_IS_PIPELINE_CLASS(klass: Pointer): Tgboolean;
function GES_PIPELINE_GET_CLASS(obj: Pointer): PGESPipelineClass;

implementation

function GES_TYPE_PIPELINE: TGType;
begin
  Result := ges_pipeline_get_type;
end;

function GES_PIPELINE(obj: Pointer): PGESPipeline;
begin
  Result := PGESPipeline(g_type_check_instance_cast(obj, GES_TYPE_PIPELINE));
end;

function GES_IS_PIPELINE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_PIPELINE);
end;

function GES_PIPELINE_CLASS(klass: Pointer): PGESPipelineClass;
begin
  Result := PGESPipelineClass(g_type_check_class_cast(klass, GES_TYPE_PIPELINE));
end;

function GES_IS_PIPELINE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_PIPELINE);
end;

function GES_PIPELINE_GET_CLASS(obj: Pointer): PGESPipelineClass;
begin
  Result := PGESPipelineClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESPipelinePrivate = type Pointer

function ges_pipeline_get_type: TGType; cdecl; external libgxxxxxxx;



end.
