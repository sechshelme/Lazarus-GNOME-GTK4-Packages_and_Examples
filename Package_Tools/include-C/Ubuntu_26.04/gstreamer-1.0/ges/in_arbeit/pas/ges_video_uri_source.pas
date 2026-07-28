unit ges_video_uri_source;

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
{$include <ges/ges-video-source.h>}
{*
 * GESUriSource: (attributes doc.skip=true):
  }
type

{GES_DECLARE_TYPE(VideoUriSource, video_uri_source, VIDEO_URI_SOURCE); }
{*
 * GESVideoUriSource:
 *
 * ### Children Properties
 *
 *   libs/GESVideoUriSource-children-props.md 
  }
{< private > }
{ Padding for API extension  }
type
  PGESVideoUriSource = ^TGESVideoUriSource;
  TGESVideoUriSource = record
      parent : TGESVideoSource;
      uri : Pgchar;
      priv : PGESUriSource;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{< private > }
{ Padding for API extension  }
  PGESVideoUriSourceClass = ^TGESVideoUriSourceClass;
  TGESVideoUriSourceClass = record
      parent_class : TGESVideoSourceClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


// === Konventiert am: 28-7-26 13:21:48 ===

function GES_TYPE_VIDEO_URI_SOURCE: TGType;
function GES_VIDEO_URI_SOURCE(obj: Pointer): PGESVideoUriSource;
function GES_IS_VIDEO_URI_SOURCE(obj: Pointer): Tgboolean;
function GES_VIDEO_URI_SOURCE_CLASS(klass: Pointer): PGESVideoUriSourceClass;
function GES_IS_VIDEO_URI_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GES_VIDEO_URI_SOURCE_GET_CLASS(obj: Pointer): PGESVideoUriSourceClass;

implementation

function GES_TYPE_VIDEO_URI_SOURCE: TGType;
begin
  Result := ges_video_uri_source_get_type;
end;

function GES_VIDEO_URI_SOURCE(obj: Pointer): PGESVideoUriSource;
begin
  Result := PGESVideoUriSource(g_type_check_instance_cast(obj, GES_TYPE_VIDEO_URI_SOURCE));
end;

function GES_IS_VIDEO_URI_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_VIDEO_URI_SOURCE);
end;

function GES_VIDEO_URI_SOURCE_CLASS(klass: Pointer): PGESVideoUriSourceClass;
begin
  Result := PGESVideoUriSourceClass(g_type_check_class_cast(klass, GES_TYPE_VIDEO_URI_SOURCE));
end;

function GES_IS_VIDEO_URI_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_VIDEO_URI_SOURCE);
end;

function GES_VIDEO_URI_SOURCE_GET_CLASS(obj: Pointer): PGESVideoUriSourceClass;
begin
  Result := PGESVideoUriSourceClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESVideoUriSourcePrivate = type Pointer

function ges_video_uri_source_get_type: TGType; cdecl; external libgxxxxxxx;



end.
