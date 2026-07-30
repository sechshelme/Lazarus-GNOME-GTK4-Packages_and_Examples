
unit as_image;
interface

{
  Automatically converted by H2Pas 1.0.0 from as_image.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    as_image.h
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
PAsImage  = ^AsImage;
PAsImageClass  = ^AsImageClass;
PAsImageKind  = ^AsImageKind;
Pgchar  = ^gchar;
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

{ was #define dname def_expr }
function AS_TYPE_IMAGE : longint; { return type might be wrong }

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
(* Const before type ignored *)

function as_image_kind_from_string(kind:Pgchar):TAsImageKind;cdecl;external;
(* Const before type ignored *)
function as_image_kind_to_string(kind:TAsImageKind):Pgchar;cdecl;external;
function as_image_new:PAsImage;cdecl;external;
function as_image_get_kind(image:PAsImage):TAsImageKind;cdecl;external;
procedure as_image_set_kind(image:PAsImage; kind:TAsImageKind);cdecl;external;
(* Const before type ignored *)
function as_image_get_url(image:PAsImage):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_image_set_url(image:PAsImage; url:Pgchar);cdecl;external;
function as_image_get_width(image:PAsImage):Tguint;cdecl;external;
procedure as_image_set_width(image:PAsImage; width:Tguint);cdecl;external;
function as_image_get_height(image:PAsImage):Tguint;cdecl;external;
procedure as_image_set_height(image:PAsImage; height:Tguint);cdecl;external;
function as_image_get_scale(image:PAsImage):Tguint;cdecl;external;
procedure as_image_set_scale(image:PAsImage; scale:Tguint);cdecl;external;
(* Const before type ignored *)
function as_image_get_locale(image:PAsImage):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_image_set_locale(image:PAsImage; locale:Pgchar);cdecl;external;
{$endif}
{ __AS_IMAGE_H  }

implementation

{ was #define dname def_expr }
function AS_TYPE_IMAGE : longint; { return type might be wrong }
  begin
    AS_TYPE_IMAGE:=as_image_get_type;
  end;


end.
