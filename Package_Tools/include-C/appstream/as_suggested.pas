unit as_suggested;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2016 Lucas Moura <lucas.moura128@gmail.com>
 * Copyright (C) 2017-2024 Matthias Klumpp <matthias@tenstral.net>
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
{$ifndef __AS_SUGGESTED_H}
{$define __AS_SUGGESTED_H}
{$include <glib-object.h>}

{G_DECLARE_DERIVABLE_TYPE (AsSuggested, as_suggested, AS, SUGGESTED, GObject) }
{< private > }
type
  PAsSuggestedClass = ^TAsSuggestedClass;
  TAsSuggestedClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;

{*
 * AsSuggestedKind:
 * @AS_SUGGESTED_KIND_UNKNOWN:		Unknown suggested kind
 * @AS_SUGGESTED_KIND_UPSTREAM:		Suggestions provided by the upstream project.
 * @AS_SUGGESTED_KIND_HEURISTIC:	Suggestions provided by automatic heuristics.
 *
 * The suggested type.
 * }
{< private > }

  PAsSuggestedKind = ^TAsSuggestedKind;
  TAsSuggestedKind =  Longint;
  Const
    AS_SUGGESTED_KIND_UNKNOWN = 0;
    AS_SUGGESTED_KIND_UPSTREAM = 1;
    AS_SUGGESTED_KIND_HEURISTIC = 2;
    AS_SUGGESTED_KIND_LAST = 3;
;

function as_suggested_kind_from_string(kind_str:Pgchar):TAsSuggestedKind;cdecl;external libappstream;
function as_suggested_kind_to_string(kind:TAsSuggestedKind):Pgchar;cdecl;external libappstream;
function as_suggested_new:PAsSuggested;cdecl;external libappstream;
function as_suggested_get_kind(suggested:PAsSuggested):TAsSuggestedKind;cdecl;external libappstream;
procedure as_suggested_set_kind(suggested:PAsSuggested; kind:TAsSuggestedKind);cdecl;external libappstream;
function as_suggested_get_ids(suggested:PAsSuggested):PGPtrArray;cdecl;external libappstream;
procedure as_suggested_add_id(suggested:PAsSuggested; cid:Pgchar);cdecl;external libappstream;
function as_suggested_is_valid(suggested:PAsSuggested):Tgboolean;cdecl;external libappstream;
{$endif}
{ __AS_SUGGESTED_H  }

// === Konventiert am: 30-7-26 19:34:46 ===

function AS_TYPE_SUGGESTED: TGType;
function AS_SUGGESTED(obj: Pointer): PAsSuggested;
function AS_IS_SUGGESTED(obj: Pointer): Tgboolean;
function AS_SUGGESTED_CLASS(klass: Pointer): PAsSuggestedClass;
function AS_IS_SUGGESTED_CLASS(klass: Pointer): Tgboolean;
function AS_SUGGESTED_GET_CLASS(obj: Pointer): PAsSuggestedClass;

implementation

function AS_TYPE_SUGGESTED: TGType;
begin
  Result := as_suggested_get_type;
end;

function AS_SUGGESTED(obj: Pointer): PAsSuggested;
begin
  Result := PAsSuggested(g_type_check_instance_cast(obj, AS_TYPE_SUGGESTED));
end;

function AS_IS_SUGGESTED(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_SUGGESTED);
end;

function AS_SUGGESTED_CLASS(klass: Pointer): PAsSuggestedClass;
begin
  Result := PAsSuggestedClass(g_type_check_class_cast(klass, AS_TYPE_SUGGESTED));
end;

function AS_IS_SUGGESTED_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_SUGGESTED);
end;

function AS_SUGGESTED_GET_CLASS(obj: Pointer): PAsSuggestedClass;
begin
  Result := PAsSuggestedClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAsSuggested = record
    parent_instance: TGObject;
  end;
  PAsSuggested = ^TAsSuggested;

  PAsSuggestedClass = type Pointer;

function as_suggested_get_type: TGType; cdecl; external libgxxxxxxx;



end.
