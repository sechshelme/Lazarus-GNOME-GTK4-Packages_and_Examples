
unit ges_clip;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_clip.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_clip.h
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
PGESBaseEffect  = ^GESBaseEffect;
PGESClip  = ^GESClip;
PGESClipClass  = ^GESClipClass;
PGESClipPrivate  = ^GESClipPrivate;
PGESCreateTrackElementFunc  = ^GESCreateTrackElementFunc;
PGESCreateTrackElementsFunc  = ^GESCreateTrackElementsFunc;
PGESLayer  = ^GESLayer;
PGESTrack  = ^GESTrack;
PGESTrackElement  = ^GESTrackElement;
PGList  = ^GList;
PGstElement  = ^GstElement;
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
{$include <ges/ges-timeline-element.h>}
{$include <ges/ges-container.h>}
{$include <ges/ges-types.h>}
{$include <ges/ges-track.h>}

{ was #define dname def_expr }
function GES_TYPE_CLIP : longint; { return type might be wrong }

{GES_DECLARE_TYPE (Clip, clip, CLIP); }
{*
 * GES_CLIP_CLASS_CAN_ADD_EFFECTS:
 * @klass: A #GESClipClass
 *
 * Whether the class allows for the user to add additional non-core
 * #GESBaseEffect-s to clips from this class.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_CLIP_CLASS_CAN_ADD_EFFECTS(klass : longint) : longint;

{*
 * GESFillTrackElementFunc:
 * @clip: The #GESClip controlling the track elements
 * @track_element: The #GESTrackElement
 * @nleobj: The nleobject that needs to be filled
 *
 * A function that will be called when the nleobject of a corresponding
 * track element needs to be filled.
 *
 * The implementer of this function shall add the proper #GstElement to @nleobj
 * using gst_bin_add().
 *
 * Deprecated: 1.18: This method type is no longer used.
 *
 * Returns: %TRUE if the implementer successfully filled the @nleobj.
  }
type

  TGESFillTrackElementFunc = function (clip:PGESClip; track_element:PGESTrackElement; nleobj:PGstElement):Tgboolean;cdecl;
{*
 * GESCreateTrackElementFunc:
 * @clip: A #GESClip
 * @type: A #GESTrackType to create a #GESTrackElement for
 *
 * A method for creating the core #GESTrackElement of a clip, to be added
 * to a #GESTrack of the given track type.
 *
 * If a clip may produce several track elements per track type,
 * #GESCreateTrackElementsFunc is more appropriate.
 *
 * Returns: (transfer floating) (nullable): The #GESTrackElement created
 * by @clip, or %NULL if @clip can not provide a track element for the
 * given @type or an error occurred.
  }

  PGESCreateTrackElementFunc = ^TGESCreateTrackElementFunc;
  TGESCreateTrackElementFunc = function (clip:PGESClip; _type:TGESTrackType):PGESTrackElement;cdecl;
{*
 * GESCreateTrackElementsFunc:
 * @clip: A #GESClip
 * @type: A #GESTrackType to create #GESTrackElement-s for
 *
 * A method for creating the core #GESTrackElement-s of a clip, to be
 * added to #GESTrack-s of the given track type.
 *
 * Returns: (transfer container) (element-type GESTrackElement): A list of
 * the #GESTrackElement-s created by @clip for the given @type, or %NULL
 * if no track elements are created or an error occurred.
  }

  PGESCreateTrackElementsFunc = ^TGESCreateTrackElementsFunc;
  TGESCreateTrackElementsFunc = function (clip:PGESClip; _type:TGESTrackType):PGList;cdecl;
{*
 * GESClip:
  }
{< private > }
{ Padding for API extension  }
  PGESClip = ^TGESClip;
  TGESClip = record
      parent : TGESContainer;cdecl;
      priv : PGESClipPrivate;
      _ges_reserved : array[0..(GES_PADDING_LARGE)-1] of Tgpointer;
    end;

{*
 * GESClipClass:
 * @create_track_element: Method to create the core #GESTrackElement of a clip
 * of this class. If a clip of this class may create several track elements per
 * track type, this should be left as %NULL, and
 * GESClipClass::create_track_elements should be used instead. Otherwise, you
 * should implement this class method and leave
 * GESClipClass::create_track_elements as the default implementation
 * @create_track_elements: Method to create the (multiple) core
 * #GESTrackElement-s of a clip of this class. If
 * GESClipClass::create_track_element is implemented, this should be kept as the
 * default implementation
 * @can_add_effects: Whether the user can add additional non-core
 * #GESBaseEffect-s to clips from this class, to be applied to the output data
 * of the core elements.
  }
{< private >  }
{< public >  }
{< private > }
{ Padding for API extension  }
  PGESClipClass = ^TGESClipClass;
  TGESClipClass = record
      parent_class : TGESContainerClass;
      create_track_element : TGESCreateTrackElementFunc;
      create_track_elements : TGESCreateTrackElementsFunc;
      ABI : record
          case longint of
            0 : ( _ges_reserved : array[0..(GES_PADDING_LARGE)-1] of Tgpointer );
            1 : ( abi : record
                can_add_effects : Tgboolean;
              end );
          end;
    end;

{***************************************************
 *                TrackElement handling             *
 *************************************************** }

function ges_clip_get_supported_formats(clip:PGESClip):TGESTrackType;cdecl;external;
procedure ges_clip_set_supported_formats(clip:PGESClip; supportedformats:TGESTrackType);cdecl;external;
function ges_clip_add_asset(clip:PGESClip; asset:PGESAsset):PGESTrackElement;cdecl;external;
function ges_clip_find_track_element(clip:PGESClip; track:PGESTrack; _type:TGType):PGESTrackElement;cdecl;external;
function ges_clip_find_track_elements(clip:PGESClip; track:PGESTrack; track_type:TGESTrackType; _type:TGType):PGList;cdecl;external;
function ges_clip_add_child_to_track(clip:PGESClip; child:PGESTrackElement; track:PGESTrack; error:PPGError):PGESTrackElement;cdecl;external;
{***************************************************
 *                     Layer                        *
 *************************************************** }
function ges_clip_get_layer(clip:PGESClip):PGESLayer;cdecl;external;
function ges_clip_move_to_layer(clip:PGESClip; layer:PGESLayer):Tgboolean;cdecl;external;
function ges_clip_move_to_layer_full(clip:PGESClip; layer:PGESLayer; error:PPGError):Tgboolean;cdecl;external;
{***************************************************
 *                   Effects                        *
 *************************************************** }
function ges_clip_add_top_effect(clip:PGESClip; effect:PGESBaseEffect; index:Tgint; error:PPGError):Tgboolean;cdecl;external;
function ges_clip_remove_top_effect(clip:PGESClip; effect:PGESBaseEffect; error:PPGError):Tgboolean;cdecl;external;
function ges_clip_get_top_effects(clip:PGESClip):PGList;cdecl;external;
function ges_clip_get_top_effect_position(clip:PGESClip; effect:PGESBaseEffect):Tgint;cdecl;external;
function ges_clip_get_top_effect_index(clip:PGESClip; effect:PGESBaseEffect):Tgint;cdecl;external;
function ges_clip_set_top_effect_priority(clip:PGESClip; effect:PGESBaseEffect; newpriority:Tguint):Tgboolean;cdecl;external;
function ges_clip_set_top_effect_index(clip:PGESClip; effect:PGESBaseEffect; newindex:Tguint):Tgboolean;cdecl;external;
function ges_clip_set_top_effect_index_full(clip:PGESClip; effect:PGESBaseEffect; newindex:Tguint; error:PPGError):Tgboolean;cdecl;external;
{***************************************************
 *                   Editing                        *
 *************************************************** }
function ges_clip_split(clip:PGESClip; position:Tguint64):PGESClip;cdecl;external;
function ges_clip_split_full(clip:PGESClip; position:Tguint64; error:PPGError):PGESClip;cdecl;external;
function ges_clip_get_internal_time_from_timeline_time(clip:PGESClip; child:PGESTrackElement; timeline_time:TGstClockTime; error:PPGError):TGstClockTime;cdecl;external;
function ges_clip_get_timeline_time_from_internal_time(clip:PGESClip; child:PGESTrackElement; internal_time:TGstClockTime; error:PPGError):TGstClockTime;cdecl;external;
function ges_clip_get_timeline_time_from_source_frame(clip:PGESClip; frame_number:TGESFrameNumber; error:PPGError):TGstClockTime;cdecl;external;
function ges_clip_get_duration_limit(clip:PGESClip):TGstClockTime;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_CLIP : longint; { return type might be wrong }
  begin
    GES_TYPE_CLIP:=ges_clip_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_CLIP_CLASS_CAN_ADD_EFFECTS(klass : longint) : longint;
begin
  GES_CLIP_CLASS_CAN_ADD_EFFECTS:=(GES_CLIP_CLASS(klass))^.(ABI.(abi.can_add_effects));
end;


end.
