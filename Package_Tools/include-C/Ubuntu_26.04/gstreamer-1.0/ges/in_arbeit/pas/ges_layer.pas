unit ges_layer;

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
{$include <ges/ges-types.h>}

{GES_DECLARE_TYPE(Layer, layer, LAYER); }
{*
 * GESLayer:
 * @timeline: the #GESTimeline where this layer is being used.
  }
{< public > }
{< protected > }
{ Padding for API extension  }
type
  PGESLayer = ^TGESLayer;
  TGESLayer = record
      parent : TGInitiallyUnowned;
      timeline : PGESTimeline;
      min_nle_priority : Tguint32;
      max_nle_priority : Tguint32;
      priv : PGESLayerPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESLayerClass:
 * @get_objects: method to get the objects contained in the layer
 *
 * Subclasses can override the @get_objects if they can provide a more
 * efficient way of providing the list of contained #GESClip-s.
  }
{< private > }
{< public > }
{ virtual methods for subclasses  }
{< private > }
{ Signals  }
{ Padding for API extension  }
  PGESLayerClass = ^TGESLayerClass;
  TGESLayerClass = record
      parent_class : TGInitiallyUnownedClass;
      get_objects : function (layer:PGESLayer):PGList;cdecl;
      object_added : procedure (layer:PGESLayer; object:PGESClip);cdecl;
      object_removed : procedure (layer:PGESLayer; object:PGESClip);cdecl;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


function ges_layer_new:PGESLayer;cdecl;external libges;
procedure ges_layer_set_timeline(layer:PGESLayer; timeline:PGESTimeline);cdecl;external libges;
function ges_layer_get_timeline(layer:PGESLayer):PGESTimeline;cdecl;external libges;
function ges_layer_add_clip(layer:PGESLayer; clip:PGESClip):Tgboolean;cdecl;external libges;
function ges_layer_add_clip_full(layer:PGESLayer; clip:PGESClip; error:PPGError):Tgboolean;cdecl;external libges;
function ges_layer_add_asset(layer:PGESLayer; asset:PGESAsset; start:TGstClockTime; inpoint:TGstClockTime; duration:TGstClockTime; 
           track_types:TGESTrackType):PGESClip;cdecl;external libges;
function ges_layer_add_asset_full(layer:PGESLayer; asset:PGESAsset; start:TGstClockTime; inpoint:TGstClockTime; duration:TGstClockTime; 
           track_types:TGESTrackType; error:PPGError):PGESClip;cdecl;external libges;
function ges_layer_remove_clip(layer:PGESLayer; clip:PGESClip):Tgboolean;cdecl;external libges;
{xxxxxxGES_DEPRECATED_FOR(ges_timeline_move_layer) }
procedure ges_layer_set_priority(layer:PGESLayer; priority:Tguint);cdecl;external libges;
function ges_layer_is_empty(layer:PGESLayer):Tgboolean;cdecl;external libges;
function ges_layer_get_clips_in_interval(layer:PGESLayer; start:TGstClockTime; end:TGstClockTime):PGList;cdecl;external libges;
function ges_layer_get_priority(layer:PGESLayer):Tguint;cdecl;external libges;
function ges_layer_get_auto_transition(layer:PGESLayer):Tgboolean;cdecl;external libges;
procedure ges_layer_set_auto_transition(layer:PGESLayer; auto_transition:Tgboolean);cdecl;external libges;
function ges_layer_get_clips(layer:PGESLayer):PGList;cdecl;external libges;
function ges_layer_get_duration(layer:PGESLayer):TGstClockTime;cdecl;external libges;
function ges_layer_set_active_for_tracks(layer:PGESLayer; active:Tgboolean; tracks:PGList):Tgboolean;cdecl;external libges;
function ges_layer_get_active_for_track(layer:PGESLayer; track:PGESTrack):Tgboolean;cdecl;external libges;

// === Konventiert am: 27-7-26 20:01:09 ===

function GES_TYPE_LAYER: TGType;
function GES_LAYER(obj: Pointer): PGESLayer;
function GES_IS_LAYER(obj: Pointer): Tgboolean;
function GES_LAYER_CLASS(klass: Pointer): PGESLayerClass;
function GES_IS_LAYER_CLASS(klass: Pointer): Tgboolean;
function GES_LAYER_GET_CLASS(obj: Pointer): PGESLayerClass;

implementation

function GES_TYPE_LAYER: TGType;
begin
  Result := ges_layer_get_type;
end;

function GES_LAYER(obj: Pointer): PGESLayer;
begin
  Result := PGESLayer(g_type_check_instance_cast(obj, GES_TYPE_LAYER));
end;

function GES_IS_LAYER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_LAYER);
end;

function GES_LAYER_CLASS(klass: Pointer): PGESLayerClass;
begin
  Result := PGESLayerClass(g_type_check_class_cast(klass, GES_TYPE_LAYER));
end;

function GES_IS_LAYER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_LAYER);
end;

function GES_LAYER_GET_CLASS(obj: Pointer): PGESLayerClass;
begin
  Result := PGESLayerClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESLayerPrivate = type Pointer

function ges_layer_get_type: TGType; cdecl; external libgxxxxxxx;



end.
