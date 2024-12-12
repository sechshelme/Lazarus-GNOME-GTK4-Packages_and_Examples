
unit ges_layer;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_layer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_layer.h
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
PGError  = ^GError;
PGESAsset  = ^GESAsset;
PGESClip  = ^GESClip;
PGESLayer  = ^GESLayer;
PGESLayerClass  = ^GESLayerClass;
PGESLayerPrivate  = ^GESLayerPrivate;
PGESTimeline  = ^GESTimeline;
PGESTrack  = ^GESTrack;
PGList  = ^GList;
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

{ was #define dname def_expr }
function GES_TYPE_LAYER : longint; { return type might be wrong }

{GES_DECLARE_TYPE (Layer, layer, LAYER); }
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


function ges_layer_new:PGESLayer;cdecl;external;
procedure ges_layer_set_timeline(layer:PGESLayer; timeline:PGESTimeline);cdecl;external;
function ges_layer_get_timeline(layer:PGESLayer):PGESTimeline;cdecl;external;
function ges_layer_add_clip(layer:PGESLayer; clip:PGESClip):Tgboolean;cdecl;external;
function ges_layer_add_clip_full(layer:PGESLayer; clip:PGESClip; error:PPGError):Tgboolean;cdecl;external;
function ges_layer_add_asset(layer:PGESLayer; asset:PGESAsset; start:TGstClockTime; inpoint:TGstClockTime; duration:TGstClockTime; 
           track_types:TGESTrackType):PGESClip;cdecl;external;
function ges_layer_add_asset_full(layer:PGESLayer; asset:PGESAsset; start:TGstClockTime; inpoint:TGstClockTime; duration:TGstClockTime; 
           track_types:TGESTrackType; error:PPGError):PGESClip;cdecl;external;
function ges_layer_remove_clip(layer:PGESLayer; clip:PGESClip):Tgboolean;cdecl;external;
procedure ges_layer_set_priority(layer:PGESLayer; priority:Tguint);cdecl;external;
function ges_layer_is_empty(layer:PGESLayer):Tgboolean;cdecl;external;
function ges_layer_get_clips_in_interval(layer:PGESLayer; start:TGstClockTime; end:TGstClockTime):PGList;cdecl;external;
function ges_layer_get_priority(layer:PGESLayer):Tguint;cdecl;external;
function ges_layer_get_auto_transition(layer:PGESLayer):Tgboolean;cdecl;external;
procedure ges_layer_set_auto_transition(layer:PGESLayer; auto_transition:Tgboolean);cdecl;external;
function ges_layer_get_clips(layer:PGESLayer):PGList;cdecl;external;
function ges_layer_get_duration(layer:PGESLayer):TGstClockTime;cdecl;external;
function ges_layer_set_active_for_tracks(layer:PGESLayer; active:Tgboolean; tracks:PGList):Tgboolean;cdecl;external;
function ges_layer_get_active_for_track(layer:PGESLayer; track:PGESTrack):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_LAYER : longint; { return type might be wrong }
  begin
    GES_TYPE_LAYER:=ges_layer_get_type;
  end;


end.
