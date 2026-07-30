
unit as_review;
interface

{
  Automatically converted by H2Pas 1.0.0 from as_review.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    as_review.h
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
PAsReview  = ^AsReview;
PAsReviewClass  = ^AsReviewClass;
PAsReviewFlags  = ^AsReviewFlags;
Pgchar  = ^gchar;
PGDateTime  = ^GDateTime;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2016 Canonical Ltd.
 * Copyright (C) 2016 Richard Hughes <richard@hughsie.com>
 * Copyright (C) 2020-2024 Matthias Klumpp <matthias@tenstral.net>
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
(** unsupported pragma#pragma once*)
{$if !defined(__APPSTREAM_H_INSIDE__) && !defined(AS_COMPILATION)}
{$error "Only <appstream.h> can be included directly."}
{$endif}
{$include <glib-object.h>}

{ was #define dname def_expr }
function AS_TYPE_REVIEW : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AsReview, as_review, AS, REVIEW, GObject) }
{< private > }
type
  PAsReviewClass = ^TAsReviewClass;
  TAsReviewClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
      _as_reserved7 : procedure ;cdecl;
      _as_reserved8 : procedure ;cdecl;
    end;

{*
 * AsReviewFlags:
 * @AS_REVIEW_FLAG_NONE:	No special flags set
 * @AS_REVIEW_FLAG_SELF:	The user wrote the review themselves
 * @AS_REVIEW_FLAG_VOTED:	The user voted on the review
 *
 * The flags for the review.
 *
 * Since: 0.14.0
 * }
{< private > }

  PAsReviewFlags = ^TAsReviewFlags;
  TAsReviewFlags =  Longint;
  Const
    AS_REVIEW_FLAG_NONE = 0;
    AS_REVIEW_FLAG_SELF = 1 shl 0;
    AS_REVIEW_FLAG_VOTED = 1 shl 1;
    AS_REVIEW_FLAG_LAST = (1 shl 1)+1;
;

function as_review_new:PAsReview;cdecl;external;
function as_review_get_priority(review:PAsReview):Tgint;cdecl;external;
procedure as_review_set_priority(review:PAsReview; priority:Tgint);cdecl;external;
(* Const before type ignored *)
function as_review_get_id(review:PAsReview):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_review_set_id(review:PAsReview; id:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_review_get_summary(review:PAsReview):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_review_set_summary(review:PAsReview; summary:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_review_get_description(review:PAsReview):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_review_set_description(review:PAsReview; description:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_review_get_locale(review:PAsReview):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_review_set_locale(review:PAsReview; locale:Pgchar);cdecl;external;
function as_review_get_rating(review:PAsReview):Tgint;cdecl;external;
procedure as_review_set_rating(review:PAsReview; rating:Tgint);cdecl;external;
(* Const before type ignored *)
function as_review_get_version(review:PAsReview):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_review_set_version(review:PAsReview; version:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_review_get_reviewer_id(review:PAsReview):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_review_set_reviewer_id(review:PAsReview; reviewer_id:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_review_get_reviewer_name(review:PAsReview):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_review_set_reviewer_name(review:PAsReview; reviewer_name:Pgchar);cdecl;external;
function as_review_get_date(review:PAsReview):PGDateTime;cdecl;external;
procedure as_review_set_date(review:PAsReview; date:PGDateTime);cdecl;external;
function as_review_get_flags(review:PAsReview):TAsReviewFlags;cdecl;external;
procedure as_review_set_flags(review:PAsReview; flags:TAsReviewFlags);cdecl;external;
procedure as_review_add_flags(review:PAsReview; flags:TAsReviewFlags);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function as_review_get_metadata_item(review:PAsReview; key:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure as_review_add_metadata(review:PAsReview; key:Pgchar; value:Pgchar);cdecl;external;
function as_review_equal(review1:PAsReview; review2:PAsReview):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function AS_TYPE_REVIEW : longint; { return type might be wrong }
  begin
    AS_TYPE_REVIEW:=as_review_get_type;
  end;


end.
