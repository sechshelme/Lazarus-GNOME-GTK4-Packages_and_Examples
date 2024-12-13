
unit ges_video_transition;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_video_transition.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_video_transition.h
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
PGESVideoTransition  = ^GESVideoTransition;
PGESVideoTransitionClass  = ^GESVideoTransitionClass;
PGESVideoTransitionPrivate  = ^GESVideoTransitionPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2010 Brandon Lewis <brandon.lewis@collabora.co.uk>
 *               2010 Nokia Corporation
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
{$include <ges/ges-transition.h>}

{ was #define dname def_expr }
function GES_TYPE_VIDEO_TRANSITION : longint; { return type might be wrong }

{GES_DECLARE_TYPE (VideoTransition, video_transition, VIDEO_TRANSITION); }
{*
 * GESVideoTransition:
  }
{< private > }
{ Padding for API extension  }
type
  PGESVideoTransition = ^TGESVideoTransition;
  TGESVideoTransition = record
      parent : TGESTransition;
      priv : PGESVideoTransitionPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESVideoTransitionClass:
 * @parent_class: parent class
 *
  }
{< private > }
{ Padding for API extension  }
  PGESVideoTransitionClass = ^TGESVideoTransitionClass;
  TGESVideoTransitionClass = record
      parent_class : TGESTransitionClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


function ges_video_transition_new:PGESVideoTransition;cdecl;external;
function ges_video_transition_set_transition_type(self:PGESVideoTransition; _type:TGESVideoStandardTransitionType):Tgboolean;cdecl;external;
function ges_video_transition_get_transition_type(trans:PGESVideoTransition):TGESVideoStandardTransitionType;cdecl;external;
procedure ges_video_transition_set_border(self:PGESVideoTransition; value:Tguint);cdecl;external;
function ges_video_transition_get_border(self:PGESVideoTransition):Tgint;cdecl;external;
procedure ges_video_transition_set_inverted(self:PGESVideoTransition; inverted:Tgboolean);cdecl;external;
function ges_video_transition_is_inverted(self:PGESVideoTransition):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_VIDEO_TRANSITION : longint; { return type might be wrong }
  begin
    GES_TYPE_VIDEO_TRANSITION:=ges_video_transition_get_type;
  end;


end.
