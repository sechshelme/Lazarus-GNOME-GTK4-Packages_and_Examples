
unit ges_transition_clip;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_transition_clip.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_transition_clip.h
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
Pchar  = ^char;
PGESTransitionClip  = ^GESTransitionClip;
PGESTransitionClipClass  = ^GESTransitionClipClass;
PGESTransitionClipPrivate  = ^GESTransitionClipPrivate;
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
{$include <ges/ges-base-transition-clip.h>}

{ was #define dname def_expr }
function GES_TYPE_TRANSITION_CLIP : longint; { return type might be wrong }

{GES_DECLARE_TYPE (TransitionClip, transition_clip, TRANSITION_CLIP); }
{*
 * GESTransitionClip:
 * @vtype: a #GESVideoStandardTransitionType indicating the type of video transition
 * to apply.
 *
 * ### Children Properties
 *
 *   libs/GESTransitionClip-children-props.md 
  }
{< private > }
{< public > }
{< private > }
{ Padding for API extension  }
type
  PGESTransitionClip = ^TGESTransitionClip;
  TGESTransitionClip = record
      parent : TGESBaseTransitionClip;
      vtype : TGESVideoStandardTransitionType;
      priv : PGESTransitionClipPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESTransitionClipClass:
 *
  }
{< private > }
{ Padding for API extension  }
  PGESTransitionClipClass = ^TGESTransitionClipClass;
  TGESTransitionClipClass = record
      parent_class : TGESBaseTransitionClipClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


function ges_transition_clip_new(vtype:TGESVideoStandardTransitionType):PGESTransitionClip;cdecl;external;
function ges_transition_clip_new_for_nick(nick:Pchar):PGESTransitionClip;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_TRANSITION_CLIP : longint; { return type might be wrong }
  begin
    GES_TYPE_TRANSITION_CLIP:=ges_transition_clip_get_type;
  end;


end.
