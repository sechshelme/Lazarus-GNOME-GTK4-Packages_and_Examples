unit ges_test_clip;

interface

uses
  fp_glib2, fp_gst, ges_enums;

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

{GES_DECLARE_TYPE(TestClip, test_clip, TEST_CLIP); }
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


procedure ges_test_clip_set_mute(self:PGESTestClip; mute:Tgboolean);cdecl;external libges;
procedure ges_test_clip_set_vpattern(self:PGESTestClip; vpattern:TGESVideoTestPattern);cdecl;external libges;
procedure ges_test_clip_set_frequency(self:PGESTestClip; freq:Tgdouble);cdecl;external libges;
procedure ges_test_clip_set_volume(self:PGESTestClip; volume:Tgdouble);cdecl;external libges;
function ges_test_clip_get_vpattern(self:PGESTestClip):TGESVideoTestPattern;cdecl;external libges;
function ges_test_clip_is_muted(self:PGESTestClip):Tgboolean;cdecl;external libges;
function ges_test_clip_get_frequency(self:PGESTestClip):Tgdouble;cdecl;external libges;
function ges_test_clip_get_volume(self:PGESTestClip):Tgdouble;cdecl;external libges;
function ges_test_clip_new:PGESTestClip;cdecl;external libges;
function ges_test_clip_new_for_nick(nick:Pgchar):PGESTestClip;cdecl;external libges;

// === Konventiert am: 28-7-26 13:14:04 ===

function GES_TYPE_TEST_CLIP: TGType;
function GES_TEST_CLIP(obj: Pointer): PGESTestClip;
function GES_IS_TEST_CLIP(obj: Pointer): Tgboolean;
function GES_TEST_CLIP_CLASS(klass: Pointer): PGESTestClipClass;
function GES_IS_TEST_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_TEST_CLIP_GET_CLASS(obj: Pointer): PGESTestClipClass;

implementation

function GES_TYPE_TEST_CLIP: TGType;
begin
  Result := ges_test_clip_get_type;
end;

function GES_TEST_CLIP(obj: Pointer): PGESTestClip;
begin
  Result := PGESTestClip(g_type_check_instance_cast(obj, GES_TYPE_TEST_CLIP));
end;

function GES_IS_TEST_CLIP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_TEST_CLIP);
end;

function GES_TEST_CLIP_CLASS(klass: Pointer): PGESTestClipClass;
begin
  Result := PGESTestClipClass(g_type_check_class_cast(klass, GES_TYPE_TEST_CLIP));
end;

function GES_IS_TEST_CLIP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_TEST_CLIP);
end;

function GES_TEST_CLIP_GET_CLASS(obj: Pointer): PGESTestClipClass;
begin
  Result := PGESTestClipClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESTestClipPrivate = type Pointer

function ges_test_clip_get_type: TGType; cdecl; external libgxxxxxxx;



end.
