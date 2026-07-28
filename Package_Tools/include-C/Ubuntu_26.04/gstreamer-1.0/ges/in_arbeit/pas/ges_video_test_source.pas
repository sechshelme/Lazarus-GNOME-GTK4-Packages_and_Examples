unit ges_video_test_source;

interface

uses
  fp_glib2, fp_gst, ges_enums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2010 Brandon Lewis <brandon.lewis@collabora.co.uk>
 *               2010 Nokia Corporation
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
{$include <ges/ges-video-source.h>}

{GES_DECLARE_TYPE(VideoTestSource, video_test_source, VIDEO_TEST_SOURCE); }
{*
 * GESVideoTestSource:
 *
 * ### Children Properties
 *
 *   libs/GESVideoTestSource-children-props.md 
  }
{< private > }
{ Padding for API extension  }
type
  PGESVideoTestSource = ^TGESVideoTestSource;
  TGESVideoTestSource = record
      parent : TGESVideoSource;
      priv : PGESVideoTestSourcePrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{ Padding for API extension  }
  PGESVideoTestSourceClass = ^TGESVideoTestSourceClass;
  TGESVideoTestSourceClass = record
      parent_class : TGESVideoSourceClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


procedure ges_video_test_source_set_pattern(self:PGESVideoTestSource; pattern:TGESVideoTestPattern);cdecl;external libges;
function ges_video_test_source_get_pattern(source:PGESVideoTestSource):TGESVideoTestPattern;cdecl;external libges;

// === Konventiert am: 28-7-26 13:21:37 ===

function GES_TYPE_VIDEO_TEST_SOURCE: TGType;
function GES_VIDEO_TEST_SOURCE(obj: Pointer): PGESVideoTestSource;
function GES_IS_VIDEO_TEST_SOURCE(obj: Pointer): Tgboolean;
function GES_VIDEO_TEST_SOURCE_CLASS(klass: Pointer): PGESVideoTestSourceClass;
function GES_IS_VIDEO_TEST_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GES_VIDEO_TEST_SOURCE_GET_CLASS(obj: Pointer): PGESVideoTestSourceClass;

implementation

function GES_TYPE_VIDEO_TEST_SOURCE: TGType;
begin
  Result := ges_video_test_source_get_type;
end;

function GES_VIDEO_TEST_SOURCE(obj: Pointer): PGESVideoTestSource;
begin
  Result := PGESVideoTestSource(g_type_check_instance_cast(obj, GES_TYPE_VIDEO_TEST_SOURCE));
end;

function GES_IS_VIDEO_TEST_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_VIDEO_TEST_SOURCE);
end;

function GES_VIDEO_TEST_SOURCE_CLASS(klass: Pointer): PGESVideoTestSourceClass;
begin
  Result := PGESVideoTestSourceClass(g_type_check_class_cast(klass, GES_TYPE_VIDEO_TEST_SOURCE));
end;

function GES_IS_VIDEO_TEST_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_VIDEO_TEST_SOURCE);
end;

function GES_VIDEO_TEST_SOURCE_GET_CLASS(obj: Pointer): PGESVideoTestSourceClass;
begin
  Result := PGESVideoTestSourceClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESVideoTestSourcePrivate = type Pointer

function ges_video_test_source_get_type: TGType; cdecl; external libgxxxxxxx;



end.
