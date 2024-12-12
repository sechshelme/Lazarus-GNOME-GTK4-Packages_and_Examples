
unit ges_track;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_track.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_track.h
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
PGESCreateElementForGapFunc  = ^GESCreateElementForGapFunc;
PGESTimeline  = ^GESTimeline;
PGESTrack  = ^GESTrack;
PGESTrackClass  = ^GESTrackClass;
PGESTrackElement  = ^GESTrackElement;
PGESTrackPrivate  = ^GESTrackPrivate;
PGList  = ^GList;
PGstCaps  = ^GstCaps;
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
{$include <ges/ges-types.h>}
{$include <ges/ges-enums.h>}

{ was #define dname def_expr }
function GES_TYPE_TRACK : longint; { return type might be wrong }

{GES_DECLARE_TYPE (Track, track, TRACK); }
{*
 * GESCreateElementForGapFunc:
 * @track: The #GESTrack
 *
 * A function that creates a #GstElement that can be used as a source to
 * fill the gaps of the track. A gap is a timeline region where the track
 * has no #GESTrackElement sources.
 *
 * Returns: A source #GstElement to fill gaps in @track.
  }
type
  PGESCreateElementForGapFunc = ^TGESCreateElementForGapFunc;
  TGESCreateElementForGapFunc = function (track:PGESTrack):PGstElement;cdecl;
{*
 * GESTrack:
 * @type: The #GESTrack:track-type of the track
  }
{< public > }
{ READ-ONLY  }
{< private > }
{ Padding for API extension  }
  PGESTrack = ^TGESTrack;
  TGESTrack = record
      parent : TGstBin;cdecl;
      _type : TGESTrackType;
      priv : PGESTrackPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESTrackClass:
  }
{< private > }
{ Padding for API extension  }
  PGESTrackClass = ^TGESTrackClass;
  TGESTrackClass = record
      parent_class : TGstBinClass;
      get_mixing_element : function (track:PGESTrack):PGstElement;cdecl;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

(* Const before type ignored *)

function ges_track_get_caps(track:PGESTrack):PGstCaps;cdecl;external;
function ges_track_get_elements(track:PGESTrack):PGList;cdecl;external;
(* Const before type ignored *)
function ges_track_get_timeline(track:PGESTrack):PGESTimeline;cdecl;external;
function ges_track_commit(track:PGESTrack):Tgboolean;cdecl;external;
procedure ges_track_set_timeline(track:PGESTrack; timeline:PGESTimeline);cdecl;external;
function ges_track_add_element(track:PGESTrack; object:PGESTrackElement):Tgboolean;cdecl;external;
function ges_track_add_element_full(track:PGESTrack; object:PGESTrackElement; error:PPGError):Tgboolean;cdecl;external;
function ges_track_remove_element(track:PGESTrack; object:PGESTrackElement):Tgboolean;cdecl;external;
function ges_track_remove_element_full(track:PGESTrack; object:PGESTrackElement; error:PPGError):Tgboolean;cdecl;external;
procedure ges_track_set_create_element_for_gap_func(track:PGESTrack; func:TGESCreateElementForGapFunc);cdecl;external;
procedure ges_track_set_mixing(track:PGESTrack; mixing:Tgboolean);cdecl;external;
function ges_track_get_mixing(track:PGESTrack):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure ges_track_set_restriction_caps(track:PGESTrack; caps:PGstCaps);cdecl;external;
(* Const before type ignored *)
procedure ges_track_update_restriction_caps(track:PGESTrack; caps:PGstCaps);cdecl;external;
function ges_track_get_restriction_caps(track:PGESTrack):PGstCaps;cdecl;external;
function ges_track_new(_type:TGESTrackType; caps:PGstCaps):PGESTrack;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_TRACK : longint; { return type might be wrong }
  begin
    GES_TYPE_TRACK:=ges_track_get_type;
  end;


end.
