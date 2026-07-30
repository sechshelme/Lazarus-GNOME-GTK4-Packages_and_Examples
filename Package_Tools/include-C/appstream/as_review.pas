unit as_review;

interface

uses
  fp_glib2, fp_appstream;

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

function as_review_new:PAsReview;cdecl;external libappstream;
function as_review_get_priority(review:PAsReview):Tgint;cdecl;external libappstream;
procedure as_review_set_priority(review:PAsReview; priority:Tgint);cdecl;external libappstream;
function as_review_get_id(review:PAsReview):Pgchar;cdecl;external libappstream;
procedure as_review_set_id(review:PAsReview; id:Pgchar);cdecl;external libappstream;
function as_review_get_summary(review:PAsReview):Pgchar;cdecl;external libappstream;
procedure as_review_set_summary(review:PAsReview; summary:Pgchar);cdecl;external libappstream;
function as_review_get_description(review:PAsReview):Pgchar;cdecl;external libappstream;
procedure as_review_set_description(review:PAsReview; description:Pgchar);cdecl;external libappstream;
function as_review_get_locale(review:PAsReview):Pgchar;cdecl;external libappstream;
procedure as_review_set_locale(review:PAsReview; locale:Pgchar);cdecl;external libappstream;
function as_review_get_rating(review:PAsReview):Tgint;cdecl;external libappstream;
procedure as_review_set_rating(review:PAsReview; rating:Tgint);cdecl;external libappstream;
function as_review_get_version(review:PAsReview):Pgchar;cdecl;external libappstream;
procedure as_review_set_version(review:PAsReview; version:Pgchar);cdecl;external libappstream;
function as_review_get_reviewer_id(review:PAsReview):Pgchar;cdecl;external libappstream;
procedure as_review_set_reviewer_id(review:PAsReview; reviewer_id:Pgchar);cdecl;external libappstream;
function as_review_get_reviewer_name(review:PAsReview):Pgchar;cdecl;external libappstream;
procedure as_review_set_reviewer_name(review:PAsReview; reviewer_name:Pgchar);cdecl;external libappstream;
function as_review_get_date(review:PAsReview):PGDateTime;cdecl;external libappstream;
procedure as_review_set_date(review:PAsReview; date:PGDateTime);cdecl;external libappstream;
function as_review_get_flags(review:PAsReview):TAsReviewFlags;cdecl;external libappstream;
procedure as_review_set_flags(review:PAsReview; flags:TAsReviewFlags);cdecl;external libappstream;
procedure as_review_add_flags(review:PAsReview; flags:TAsReviewFlags);cdecl;external libappstream;
function as_review_get_metadata_item(review:PAsReview; key:Pgchar):Pgchar;cdecl;external libappstream;
procedure as_review_add_metadata(review:PAsReview; key:Pgchar; value:Pgchar);cdecl;external libappstream;
function as_review_equal(review1:PAsReview; review2:PAsReview):Tgboolean;cdecl;external libappstream;

// === Konventiert am: 30-7-26 19:34:58 ===

function AS_TYPE_REVIEW: TGType;
function AS_REVIEW(obj: Pointer): PAsReview;
function AS_IS_REVIEW(obj: Pointer): Tgboolean;
function AS_REVIEW_CLASS(klass: Pointer): PAsReviewClass;
function AS_IS_REVIEW_CLASS(klass: Pointer): Tgboolean;
function AS_REVIEW_GET_CLASS(obj: Pointer): PAsReviewClass;

implementation

function AS_TYPE_REVIEW: TGType;
begin
  Result := as_review_get_type;
end;

function AS_REVIEW(obj: Pointer): PAsReview;
begin
  Result := PAsReview(g_type_check_instance_cast(obj, AS_TYPE_REVIEW));
end;

function AS_IS_REVIEW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_REVIEW);
end;

function AS_REVIEW_CLASS(klass: Pointer): PAsReviewClass;
begin
  Result := PAsReviewClass(g_type_check_class_cast(klass, AS_TYPE_REVIEW));
end;

function AS_IS_REVIEW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_REVIEW);
end;

function AS_REVIEW_GET_CLASS(obj: Pointer): PAsReviewClass;
begin
  Result := PAsReviewClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAsReview = record
    parent_instance: TGObject;
  end;
  PAsReview = ^TAsReview;

  PAsReviewClass = type Pointer;

function as_review_get_type: TGType; cdecl; external libgxxxxxxx;



end.
