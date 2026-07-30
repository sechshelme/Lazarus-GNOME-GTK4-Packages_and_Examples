unit as_video;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2019-2024 Matthias Klumpp <matthias@tenstral.net>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 2.1 of the license, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
  }
{$if !defined(__APPSTREAM_H) && !defined(AS_COMPILATION)}
{$error "Only <appstream.h> can be included directly."}
{$endif}
{$ifndef __AS_VIDEO_H}
{$define __AS_VIDEO_H}
{$include <glib-object.h>}

{G_DECLARE_DERIVABLE_TYPE (AsVideo, as_video, AS, VIDEO, GObject) }
{< private > }
type
  PAsVideoClass = ^TAsVideoClass;
  TAsVideoClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;

{*
 * AsVideoCodecKind:
 * @AS_VIDEO_CODEC_KIND_UNKNOWN:	Unknown video codec
 * @AS_VIDEO_CODEC_KIND_VP9:		The VP9 video codec
 * @AS_VIDEO_CODEC_KIND_AV1:		The AV1 video codec
 *
 * Supported video codecs.
 * }
{< private > }

  PAsVideoCodecKind = ^TAsVideoCodecKind;
  TAsVideoCodecKind =  Longint;
  Const
    AS_VIDEO_CODEC_KIND_UNKNOWN = 0;
    AS_VIDEO_CODEC_KIND_VP9 = 1;
    AS_VIDEO_CODEC_KIND_AV1 = 2;
    AS_VIDEO_CODEC_KIND_LAST = 3;
;
{*
 * AsVideoContainerKind:
 * @AS_VIDEO_CONTAINER_KIND_UNKNOWN:		Unknown video container
 * @AS_VIDEO_CONTAINER_KIND_MKV:		The Matroska video (MKV) container
 * @AS_VIDEO_CONTAINER_KIND_WEBM:		The WebM video container
 *
 * Supported video codecs.
 * }
{< private > }
type
  PAsVideoContainerKind = ^TAsVideoContainerKind;
  TAsVideoContainerKind =  Longint;
  Const
    AS_VIDEO_CONTAINER_KIND_UNKNOWN = 0;
    AS_VIDEO_CONTAINER_KIND_MKV = 1;
    AS_VIDEO_CONTAINER_KIND_WEBM = 2;
    AS_VIDEO_CONTAINER_KIND_LAST = 3;
;

function as_video_codec_kind_from_string(str:Pgchar):TAsVideoCodecKind;cdecl;external libappstream;
function as_video_codec_kind_to_string(kind:TAsVideoCodecKind):Pgchar;cdecl;external libappstream;
function as_video_container_kind_from_string(str:Pgchar):TAsVideoContainerKind;cdecl;external libappstream;
function as_video_container_kind_to_string(kind:TAsVideoContainerKind):Pgchar;cdecl;external libappstream;
function as_video_new:PAsVideo;cdecl;external libappstream;
function as_video_get_codec_kind(video:PAsVideo):TAsVideoCodecKind;cdecl;external libappstream;
procedure as_video_set_codec_kind(video:PAsVideo; kind:TAsVideoCodecKind);cdecl;external libappstream;
function as_video_get_container_kind(video:PAsVideo):TAsVideoContainerKind;cdecl;external libappstream;
procedure as_video_set_container_kind(video:PAsVideo; kind:TAsVideoContainerKind);cdecl;external libappstream;
function as_video_get_url(video:PAsVideo):Pgchar;cdecl;external libappstream;
procedure as_video_set_url(video:PAsVideo; url:Pgchar);cdecl;external libappstream;
function as_video_get_width(video:PAsVideo):Tguint;cdecl;external libappstream;
procedure as_video_set_width(video:PAsVideo; width:Tguint);cdecl;external libappstream;
function as_video_get_height(video:PAsVideo):Tguint;cdecl;external libappstream;
procedure as_video_set_height(video:PAsVideo; height:Tguint);cdecl;external libappstream;
function as_video_get_locale(video:PAsVideo):Pgchar;cdecl;external libappstream;
procedure as_video_set_locale(video:PAsVideo; locale:Pgchar);cdecl;external libappstream;
{$endif}
{ __AS_VIDEO_H  }

// === Konventiert am: 30-7-26 19:34:05 ===

function AS_TYPE_VIDEO: TGType;
function AS_VIDEO(obj: Pointer): PAsVideo;
function AS_IS_VIDEO(obj: Pointer): Tgboolean;
function AS_VIDEO_CLASS(klass: Pointer): PAsVideoClass;
function AS_IS_VIDEO_CLASS(klass: Pointer): Tgboolean;
function AS_VIDEO_GET_CLASS(obj: Pointer): PAsVideoClass;

implementation

function AS_TYPE_VIDEO: TGType;
begin
  Result := as_video_get_type;
end;

function AS_VIDEO(obj: Pointer): PAsVideo;
begin
  Result := PAsVideo(g_type_check_instance_cast(obj, AS_TYPE_VIDEO));
end;

function AS_IS_VIDEO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_VIDEO);
end;

function AS_VIDEO_CLASS(klass: Pointer): PAsVideoClass;
begin
  Result := PAsVideoClass(g_type_check_class_cast(klass, AS_TYPE_VIDEO));
end;

function AS_IS_VIDEO_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_VIDEO);
end;

function AS_VIDEO_GET_CLASS(obj: Pointer): PAsVideoClass;
begin
  Result := PAsVideoClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAsVideo = record
    parent_instance: TGObject;
  end;
  PAsVideo = ^TAsVideo;

  PAsVideoClass = type Pointer;

function as_video_get_type: TGType; cdecl; external libgxxxxxxx;



end.
