
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
PGESClip  = ^GESClip;
PGESTrackElement  = ^GESTrackElement;
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

{GES_DECLARE_TYPE(Clip, clip, CLIP); }
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
