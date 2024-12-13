
unit ges_test_clip;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_test_clip.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_test_clip.h
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
PGESTestClip  = ^GESTestClip;
PGESTestClipClass  = ^GESTestClipClass;
PGESTestClipPrivate  = ^GESTestClipPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2009 Brandon Lewis <brandon.lewis@collabora.co.uk>
 *               2009 Nokia Corporation
 * Copyright (C) 2020 Igalia S.L
 *     Author: 2020 Thibault Saunier <tsaunier@igalia.com>
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
{$include <ges/ges-enums.h>}
{$include <ges/ges-types.h>}
{$include <ges/ges-source-clip.h>}
{$include <ges/ges-track.h>}

{ was #define dname def_expr }
function GES_TYPE_TEST_CLIP : longint; { return type might be wrong }

{GES_DECLARE_TYPE (TestClip, test_clip, TEST_CLIP); }
{*
 * GESTestClip:
  }
{< private > }
{ Padding for API extension  }
type
  PGESTestClip = ^TGESTestClip;
  TGESTestClip = record
      parent : TGESSourceClip;
      priv : PGESTestClipPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESTestClipClass:
  }
{< private > }
{ Padding for API extension  }
  PGESTestClipClass = ^TGESTestClipClass;
  TGESTestClipClass = record
      parent_class : TGESSourceClipClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


procedure ges_test_clip_set_mute(self:PGESTestClip; mute:Tgboolean);cdecl;external;
procedure ges_test_clip_set_vpattern(self:PGESTestClip; vpattern:TGESVideoTestPattern);cdecl;external;
procedure ges_test_clip_set_frequency(self:PGESTestClip; freq:Tgdouble);cdecl;external;
procedure ges_test_clip_set_volume(self:PGESTestClip; volume:Tgdouble);cdecl;external;
function ges_test_clip_get_vpattern(self:PGESTestClip):TGESVideoTestPattern;cdecl;external;
function ges_test_clip_is_muted(self:PGESTestClip):Tgboolean;cdecl;external;
function ges_test_clip_get_frequency(self:PGESTestClip):Tgdouble;cdecl;external;
function ges_test_clip_get_volume(self:PGESTestClip):Tgdouble;cdecl;external;
function ges_test_clip_new:PGESTestClip;cdecl;external;
function ges_test_clip_new_for_nick(nick:Pgchar):PGESTestClip;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_TEST_CLIP : longint; { return type might be wrong }
  begin
    GES_TYPE_TEST_CLIP:=ges_test_clip_get_type;
  end;


end.
