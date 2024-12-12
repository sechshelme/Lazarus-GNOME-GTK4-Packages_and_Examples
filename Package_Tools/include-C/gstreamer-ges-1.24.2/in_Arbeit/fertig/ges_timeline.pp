
unit ges_timeline;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_timeline.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_timeline.h
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
PGESAsset  = ^GESAsset;
PGESGroup  = ^GESGroup;
PGESLayer  = ^GESLayer;
PGESTimeline  = ^GESTimeline;
PGESTimelineClass  = ^GESTimelineClass;
PGESTimelineElement  = ^GESTimelineElement;
PGESTimelinePrivate  = ^GESTimelinePrivate;
PGESTrack  = ^GESTrack;
PGList  = ^GList;
PGPtrArray  = ^GPtrArray;
PGstPad  = ^GstPad;
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
{$include <gst/gst.h>}
{$include <gst/pbutils/gstdiscoverer.h>}
{$include <ges/ges-types.h>}

{ was #define dname def_expr }
function GES_TYPE_TIMELINE : longint; { return type might be wrong }

{GES_DECLARE_TYPE (Timeline, timeline, TIMELINE); }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TIMELINE_GET_TRACKS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TIMELINE_GET_LAYERS(obj : longint) : longint;

{*
 * ges_timeline_get_project:
 * @obj: The #GESTimeline from which to retrieve the project
 *
 * Helper macro to retrieve the project from which @obj was extracted
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ges_timeline_get_project(obj : longint) : longint;

type
{*
 * GESTimeline:
 * @layers: (element-type GES.Layer): A list of #GESLayer-s sorted by
 * priority. NOTE: Do not modify.
 * @tracks: Deprecated:1.10: (element-type GES.Track): This is not thread
 * safe, use #ges_timeline_get_tracks instead.
  }
{< public >  }
{ <readonly>  }
{< private > }
{ Padding for API extension  }
  PGESTimeline = ^TGESTimeline;
  TGESTimeline = record
      parent : TGstBin;
      layers : PGList;
      tracks : PGList;
      priv : PGESTimelinePrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESTimelineClass:
 * @parent_class: parent class
  }
{< private > }
{ Padding for API extension  }
  PGESTimelineClass = ^TGESTimelineClass;
  TGESTimelineClass = record
      parent_class : TGstBinClass;
      track_added : procedure (timeline:PGESTimeline; track:PGESTrack);cdecl;
      track_removed : procedure (timeline:PGESTimeline; track:PGESTrack);cdecl;
      layer_added : procedure (timeline:PGESTimeline; layer:PGESLayer);cdecl;
      layer_removed : procedure (timeline:PGESTimeline; layer:PGESLayer);cdecl;
      group_added : procedure (timeline:PGESTimeline; group:PGESGroup);cdecl;
      group_removed : procedure (timeline:PGESTimeline; group:PGESGroup; children:PGPtrArray);cdecl;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


function ges_timeline_new:PGESTimeline;cdecl;external;
(* Const before type ignored *)
function ges_timeline_new_from_uri(uri:Pgchar; error:PPGError):PGESTimeline;cdecl;external;
(* Const before type ignored *)
function ges_timeline_load_from_uri(timeline:PGESTimeline; uri:Pgchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_timeline_save_to_uri(timeline:PGESTimeline; uri:Pgchar; formatter_asset:PGESAsset; overwrite:Tgboolean; error:PPGError):Tgboolean;cdecl;external;
function ges_timeline_add_layer(timeline:PGESTimeline; layer:PGESLayer):Tgboolean;cdecl;external;
function ges_timeline_append_layer(timeline:PGESTimeline):PGESLayer;cdecl;external;
function ges_timeline_remove_layer(timeline:PGESTimeline; layer:PGESLayer):Tgboolean;cdecl;external;
function ges_timeline_get_layers(timeline:PGESTimeline):PGList;cdecl;external;
function ges_timeline_get_layer(timeline:PGESTimeline; priority:Tguint):PGESLayer;cdecl;external;
function ges_timeline_add_track(timeline:PGESTimeline; track:PGESTrack):Tgboolean;cdecl;external;
function ges_timeline_remove_track(timeline:PGESTimeline; track:PGESTrack):Tgboolean;cdecl;external;
function ges_timeline_get_track_for_pad(timeline:PGESTimeline; pad:PGstPad):PGESTrack;cdecl;external;
function ges_timeline_get_pad_for_track(timeline:PGESTimeline; track:PGESTrack):PGstPad;cdecl;external;
function ges_timeline_get_tracks(timeline:PGESTimeline):PGList;cdecl;external;
function ges_timeline_get_groups(timeline:PGESTimeline):PGList;cdecl;external;
function ges_timeline_commit(timeline:PGESTimeline):Tgboolean;cdecl;external;
function ges_timeline_commit_sync(timeline:PGESTimeline):Tgboolean;cdecl;external;
procedure ges_timeline_freeze_commit(timeline:PGESTimeline);cdecl;external;
procedure ges_timeline_thaw_commit(timeline:PGESTimeline);cdecl;external;
function ges_timeline_get_duration(timeline:PGESTimeline):TGstClockTime;cdecl;external;
function ges_timeline_get_auto_transition(timeline:PGESTimeline):Tgboolean;cdecl;external;
procedure ges_timeline_set_auto_transition(timeline:PGESTimeline; auto_transition:Tgboolean);cdecl;external;
function ges_timeline_get_snapping_distance(timeline:PGESTimeline):TGstClockTime;cdecl;external;
procedure ges_timeline_set_snapping_distance(timeline:PGESTimeline; snapping_distance:TGstClockTime);cdecl;external;
(* Const before type ignored *)
function ges_timeline_get_element(timeline:PGESTimeline; name:Pgchar):PGESTimelineElement;cdecl;external;
function ges_timeline_is_empty(timeline:PGESTimeline):Tgboolean;cdecl;external;
function ges_timeline_paste_element(timeline:PGESTimeline; element:PGESTimelineElement; position:TGstClockTime; layer_priority:Tgint):PGESTimelineElement;cdecl;external;
function ges_timeline_move_layer(timeline:PGESTimeline; layer:PGESLayer; new_layer_priority:Tguint):Tgboolean;cdecl;external;
function ges_timeline_get_frame_time(self:PGESTimeline; frame_number:TGESFrameNumber):TGstClockTime;cdecl;external;
function ges_timeline_get_frame_at(self:PGESTimeline; timestamp:TGstClockTime):TGESFrameNumber;cdecl;external;
procedure ges_timeline_disable_edit_apis(self:PGESTimeline; disable_edit_apis:Tgboolean);cdecl;external;
function ges_timeline_get_edit_apis_disabled(self:PGESTimeline):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_TIMELINE : longint; { return type might be wrong }
  begin
    GES_TYPE_TIMELINE:=ges_timeline_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TIMELINE_GET_TRACKS(obj : longint) : longint;
begin
  GES_TIMELINE_GET_TRACKS:=(GES_TIMELINE(obj))^.tracks;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_TIMELINE_GET_LAYERS(obj : longint) : longint;
begin
  GES_TIMELINE_GET_LAYERS:=(GES_TIMELINE(obj))^.layers;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ges_timeline_get_project(obj : longint) : longint;
begin
  ges_timeline_get_project:=GES_PROJECT(ges_extractable_get_asset(GES_EXTRACTABLE(obj)));
end;


end.
