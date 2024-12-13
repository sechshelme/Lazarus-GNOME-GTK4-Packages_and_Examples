
unit ges_pipeline;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_pipeline.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_pipeline.h
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
PGESPipeline  = ^GESPipeline;
PGESPipelineClass  = ^GESPipelineClass;
PGESPipelinePrivate  = ^GESPipelinePrivate;
PGESTimeline  = ^GESTimeline;
PGstCaps  = ^GstCaps;
PGstElement  = ^GstElement;
PGstEncodingProfile  = ^GstEncodingProfile;
PGstSample  = ^GstSample;
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

{ was #define dname def_expr }
function GES_TYPE_PIPELINE : longint; { return type might be wrong }

{GES_DECLARE_TYPE (Pipeline, pipeline, PIPELINE); }
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


function ges_pipeline_new:PGESPipeline;cdecl;external;
function ges_pipeline_set_timeline(pipeline:PGESPipeline; timeline:PGESTimeline):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_pipeline_set_render_settings(pipeline:PGESPipeline; output_uri:Pgchar; profile:PGstEncodingProfile):Tgboolean;cdecl;external;
function ges_pipeline_set_mode(pipeline:PGESPipeline; mode:TGESPipelineFlags):Tgboolean;cdecl;external;
function ges_pipeline_get_mode(pipeline:PGESPipeline):TGESPipelineFlags;cdecl;external;
function ges_pipeline_get_thumbnail(self:PGESPipeline; caps:PGstCaps):PGstSample;cdecl;external;
function ges_pipeline_get_thumbnail_rgb24(self:PGESPipeline; width:Tgint; height:Tgint):PGstSample;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ges_pipeline_save_thumbnail(self:PGESPipeline; width:longint; height:longint; format:Pgchar; location:Pgchar; 
           error:PPGError):Tgboolean;cdecl;external;
function ges_pipeline_preview_get_video_sink(self:PGESPipeline):PGstElement;cdecl;external;
procedure ges_pipeline_preview_set_video_sink(self:PGESPipeline; sink:PGstElement);cdecl;external;
function ges_pipeline_preview_get_audio_sink(self:PGESPipeline):PGstElement;cdecl;external;
procedure ges_pipeline_preview_set_audio_sink(self:PGESPipeline; sink:PGstElement);cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_PIPELINE : longint; { return type might be wrong }
  begin
    GES_TYPE_PIPELINE:=ges_pipeline_get_type;
  end;


end.
