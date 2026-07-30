unit as_image;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2014-2024 Matthias Klumpp <matthias@tenstral.net>
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
{$ifndef __AS_IMAGE_H}
{$define __AS_IMAGE_H}
{$include <glib-object.h>}

{G_DECLARE_DERIVABLE_TYPE (AsImage, as_image, AS, IMAGE, GObject) }
{< private > }
type
  PAsImageClass = ^TAsImageClass;
  TAsImageClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;

{*
 * AsImageKind:
 * @AS_IMAGE_KIND_UNKNOWN:	Type invalid or not known
 * @AS_IMAGE_KIND_SOURCE:	The source image at full resolution
 * @AS_IMAGE_KIND_THUMBNAIL:	A thumbnail at reduced resolution
 *
 * The image type.
 * }
{< private > }

  PAsImageKind = ^TAsImageKind;
  TAsImageKind =  Longint;
  Const
    AS_IMAGE_KIND_UNKNOWN = 0;
    AS_IMAGE_KIND_SOURCE = 1;
    AS_IMAGE_KIND_THUMBNAIL = 2;
    AS_IMAGE_KIND_LAST = 3;
;

function as_image_kind_from_string(kind:Pgchar):TAsImageKind;cdecl;external libappstream;
function as_image_kind_to_string(kind:TAsImageKind):Pgchar;cdecl;external libappstream;
function as_image_new:PAsImage;cdecl;external libappstream;
function as_image_get_kind(image:PAsImage):TAsImageKind;cdecl;external libappstream;
procedure as_image_set_kind(image:PAsImage; kind:TAsImageKind);cdecl;external libappstream;
function as_image_get_url(image:PAsImage):Pgchar;cdecl;external libappstream;
procedure as_image_set_url(image:PAsImage; url:Pgchar);cdecl;external libappstream;
function as_image_get_width(image:PAsImage):Tguint;cdecl;external libappstream;
procedure as_image_set_width(image:PAsImage; width:Tguint);cdecl;external libappstream;
function as_image_get_height(image:PAsImage):Tguint;cdecl;external libappstream;
procedure as_image_set_height(image:PAsImage; height:Tguint);cdecl;external libappstream;
function as_image_get_scale(image:PAsImage):Tguint;cdecl;external libappstream;
procedure as_image_set_scale(image:PAsImage; scale:Tguint);cdecl;external libappstream;
function as_image_get_locale(image:PAsImage):Pgchar;cdecl;external libappstream;
procedure as_image_set_locale(image:PAsImage; locale:Pgchar);cdecl;external libappstream;
{$endif}
{ __AS_IMAGE_H  }

// === Konventiert am: 30-7-26 19:35:56 ===

function AS_TYPE_IMAGE: TGType;
function AS_IMAGE(obj: Pointer): PAsImage;
function AS_IS_IMAGE(obj: Pointer): Tgboolean;
function AS_IMAGE_CLASS(klass: Pointer): PAsImageClass;
function AS_IS_IMAGE_CLASS(klass: Pointer): Tgboolean;
function AS_IMAGE_GET_CLASS(obj: Pointer): PAsImageClass;

implementation

function AS_TYPE_IMAGE: TGType;
begin
  Result := as_image_get_type;
end;

function AS_IMAGE(obj: Pointer): PAsImage;
begin
  Result := PAsImage(g_type_check_instance_cast(obj, AS_TYPE_IMAGE));
end;

function AS_IS_IMAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_IMAGE);
end;

function AS_IMAGE_CLASS(klass: Pointer): PAsImageClass;
begin
  Result := PAsImageClass(g_type_check_class_cast(klass, AS_TYPE_IMAGE));
end;

function AS_IS_IMAGE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_IMAGE);
end;

function AS_IMAGE_GET_CLASS(obj: Pointer): PAsImageClass;
begin
  Result := PAsImageClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAsImage = record
    parent_instance: TGObject;
  end;
  PAsImage = ^TAsImage;

  PAsImageClass = type Pointer;

function as_image_get_type: TGType; cdecl; external libgxxxxxxx;



end.
