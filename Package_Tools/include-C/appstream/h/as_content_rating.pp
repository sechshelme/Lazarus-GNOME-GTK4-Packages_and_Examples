
unit as_content_rating;
interface

{
  Automatically converted by H2Pas 1.0.0 from as_content_rating.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    as_content_rating.h
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
PAsContentRating  = ^AsContentRating;
PAsContentRatingClass  = ^AsContentRatingClass;
PAsContentRatingSystem  = ^AsContentRatingSystem;
PAsContentRatingValue  = ^AsContentRatingValue;
Pgchar  = ^gchar;
Pgsize  = ^gsize;
Pguint  = ^guint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2016-2024 Matthias Klumpp <matthias@tenstral.net>
 * Copyright (C) 2016-2020 Richard Hughes <richard@hughsie.com>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$if !defined(__APPSTREAM_H) && !defined(AS_COMPILATION)}
{$error "Only <appstream.h> can be included directly."}
{$endif}
{$ifndef __AS_CONTENT_RATING_H}
{$define __AS_CONTENT_RATING_H}
{$include <glib-object.h>}

{ was #define dname def_expr }
function AS_TYPE_CONTENT_RATING : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AsContentRating, as_content_rating, AS, CONTENT_RATING, GObject) }
{< private > }
type
  PAsContentRatingClass = ^TAsContentRatingClass;
  TAsContentRatingClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;

{*
 * AsContentRatingSystem:
 * @AS_CONTENT_RATING_SYSTEM_UNKNOWN: Unknown ratings system
 * @AS_CONTENT_RATING_SYSTEM_INCAA: INCAA
 * @AS_CONTENT_RATING_SYSTEM_ACB: ACB
 * @AS_CONTENT_RATING_SYSTEM_DJCTQ: DJCTQ
 * @AS_CONTENT_RATING_SYSTEM_GSRR: GSRR
 * @AS_CONTENT_RATING_SYSTEM_PEGI: PEGI
 * @AS_CONTENT_RATING_SYSTEM_KAVI: KAVI
 * @AS_CONTENT_RATING_SYSTEM_USK: USK
 * @AS_CONTENT_RATING_SYSTEM_ESRA: ESRA
 * @AS_CONTENT_RATING_SYSTEM_CERO: CERO
 * @AS_CONTENT_RATING_SYSTEM_OFLCNZ: OFLCNZ
 * @AS_CONTENT_RATING_SYSTEM_RUSSIA: Russia
 * @AS_CONTENT_RATING_SYSTEM_MDA: MDA
 * @AS_CONTENT_RATING_SYSTEM_GRAC: GRAC
 * @AS_CONTENT_RATING_SYSTEM_ESRB: ESRB
 * @AS_CONTENT_RATING_SYSTEM_IARC: IARC
 *
 * A content rating system for a particular territory.
 *
 * Since: 0.12.12
  }
{< private > }

  PAsContentRatingSystem = ^TAsContentRatingSystem;
  TAsContentRatingSystem =  Longint;
  Const
    AS_CONTENT_RATING_SYSTEM_UNKNOWN = 0;
    AS_CONTENT_RATING_SYSTEM_INCAA = 1;
    AS_CONTENT_RATING_SYSTEM_ACB = 2;
    AS_CONTENT_RATING_SYSTEM_DJCTQ = 3;
    AS_CONTENT_RATING_SYSTEM_GSRR = 4;
    AS_CONTENT_RATING_SYSTEM_PEGI = 5;
    AS_CONTENT_RATING_SYSTEM_KAVI = 6;
    AS_CONTENT_RATING_SYSTEM_USK = 7;
    AS_CONTENT_RATING_SYSTEM_ESRA = 8;
    AS_CONTENT_RATING_SYSTEM_CERO = 9;
    AS_CONTENT_RATING_SYSTEM_OFLCNZ = 10;
    AS_CONTENT_RATING_SYSTEM_RUSSIA = 11;
    AS_CONTENT_RATING_SYSTEM_MDA = 12;
    AS_CONTENT_RATING_SYSTEM_GRAC = 13;
    AS_CONTENT_RATING_SYSTEM_ESRB = 14;
    AS_CONTENT_RATING_SYSTEM_IARC = 15;
    AS_CONTENT_RATING_SYSTEM_LAST = 16;
;
{*
 * AsContentRatingValue:
 * @AS_CONTENT_RATING_VALUE_UNKNOWN:		Unknown value
 * @AS_CONTENT_RATING_VALUE_NONE:		None
 * @AS_CONTENT_RATING_VALUE_MILD:		A small amount
 * @AS_CONTENT_RATING_VALUE_MODERATE:		A moderate amount
 * @AS_CONTENT_RATING_VALUE_INTENSE:		An intense amount
 *
 * The specified level of an content_rating rating ID.
 * }
{< private > }
type
  PAsContentRatingValue = ^TAsContentRatingValue;
  TAsContentRatingValue =  Longint;
  Const
    AS_CONTENT_RATING_VALUE_UNKNOWN = 0;
    AS_CONTENT_RATING_VALUE_NONE = 1;
    AS_CONTENT_RATING_VALUE_MILD = 2;
    AS_CONTENT_RATING_VALUE_MODERATE = 3;
    AS_CONTENT_RATING_VALUE_INTENSE = 4;
    AS_CONTENT_RATING_VALUE_LAST = 5;
;
(* Const before type ignored *)

function as_content_rating_value_to_string(value:TAsContentRatingValue):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_content_rating_value_from_string(value:Pgchar):TAsContentRatingValue;cdecl;external;
(* Const before type ignored *)
function as_content_rating_attribute_to_csm_age(id:Pgchar; value:TAsContentRatingValue):Tguint;cdecl;external;
(* Const before type ignored *)
function as_content_rating_get_all_rating_ids:^Pgchar;cdecl;external;
(* Const before type ignored *)
function as_content_rating_system_to_string(system:TAsContentRatingSystem):Pgchar;cdecl;external;
function as_content_rating_system_format_age(system:TAsContentRatingSystem; age:Tguint):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_content_rating_system_from_locale(locale:Pgchar):TAsContentRatingSystem;cdecl;external;
function as_content_rating_system_get_formatted_ages(system:TAsContentRatingSystem):^Pgchar;cdecl;external;
(* Const before type ignored *)
function as_content_rating_system_get_csm_ages(system:TAsContentRatingSystem; length_out:Pgsize):Pguint;cdecl;external;
(* Const before type ignored *)
function as_content_rating_attribute_from_csm_age(id:Pgchar; age:Tguint):TAsContentRatingValue;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function as_content_rating_attribute_get_description(id:Pgchar; value:TAsContentRatingValue):Pgchar;cdecl;external;
function as_content_rating_new:PAsContentRating;cdecl;external;
(* Const before type ignored *)
function as_content_rating_get_kind(content_rating:PAsContentRating):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_content_rating_set_kind(content_rating:PAsContentRating; kind:Pgchar);cdecl;external;
function as_content_rating_get_minimum_age(content_rating:PAsContentRating):Tguint;cdecl;external;
(* Const before type ignored *)
function as_content_rating_get_value(content_rating:PAsContentRating; id:Pgchar):TAsContentRatingValue;cdecl;external;
(* Const before type ignored *)
procedure as_content_rating_set_value(content_rating:PAsContentRating; id:Pgchar; value:TAsContentRatingValue);cdecl;external;
(* Const before type ignored *)
function as_content_rating_get_rating_ids(content_rating:PAsContentRating):^Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_content_rating_add_attribute(content_rating:PAsContentRating; id:Pgchar; value:TAsContentRatingValue);cdecl;external;
{$endif}
{ __AS_CONTENT_RATING_H  }

implementation

{ was #define dname def_expr }
function AS_TYPE_CONTENT_RATING : longint; { return type might be wrong }
  begin
    AS_TYPE_CONTENT_RATING:=as_content_rating_get_type;
  end;


end.
