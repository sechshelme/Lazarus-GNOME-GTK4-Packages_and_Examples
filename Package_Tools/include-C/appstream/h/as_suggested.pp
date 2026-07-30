
unit as_suggested;
interface

{
  Automatically converted by H2Pas 1.0.0 from as_suggested.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    as_suggested.h
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
PAsSuggested  = ^AsSuggested;
PAsSuggestedClass  = ^AsSuggestedClass;
PAsSuggestedKind  = ^AsSuggestedKind;
Pgchar  = ^gchar;
PGPtrArray  = ^GPtrArray;
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

{ was #define dname def_expr }
function AS_TYPE_SUGGESTED : longint; { return type might be wrong }

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
(* Const before type ignored *)

function as_suggested_kind_from_string(kind_str:Pgchar):TAsSuggestedKind;cdecl;external;
(* Const before type ignored *)
function as_suggested_kind_to_string(kind:TAsSuggestedKind):Pgchar;cdecl;external;
function as_suggested_new:PAsSuggested;cdecl;external;
function as_suggested_get_kind(suggested:PAsSuggested):TAsSuggestedKind;cdecl;external;
procedure as_suggested_set_kind(suggested:PAsSuggested; kind:TAsSuggestedKind);cdecl;external;
function as_suggested_get_ids(suggested:PAsSuggested):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure as_suggested_add_id(suggested:PAsSuggested; cid:Pgchar);cdecl;external;
function as_suggested_is_valid(suggested:PAsSuggested):Tgboolean;cdecl;external;
{$endif}
{ __AS_SUGGESTED_H  }

implementation

{ was #define dname def_expr }
function AS_TYPE_SUGGESTED : longint; { return type might be wrong }
  begin
    AS_TYPE_SUGGESTED:=as_suggested_get_type;
  end;


end.
