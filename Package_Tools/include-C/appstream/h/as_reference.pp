
unit as_reference;
interface

{
  Automatically converted by H2Pas 1.0.0 from as_reference.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    as_reference.h
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
PAsReference  = ^AsReference;
PAsReferenceClass  = ^AsReferenceClass;
PAsReferenceKind  = ^AsReferenceKind;
Pgchar  = ^gchar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2022-2024 Matthias Klumpp <matthias@tenstral.net>
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
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}

{ was #define dname def_expr }
function AS_TYPE_REFERENCE : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AsReference, as_reference, AS, REFERENCE, GObject) }
{< private > }
type
  PAsReferenceClass = ^TAsReferenceClass;
  TAsReferenceClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;

{*
 * AsReferenceKind:
 * @AS_REFERENCE_KIND_UNKNOWN:		Unknown reference kind.
 * @AS_REFERENCE_KIND_DOI:		Digital Object Identifier
 * @AS_REFERENCE_KIND_CITATION_CFF:	Web URL to a Citation File Format file
 * @AS_REFERENCE_KIND_REGISTRY:		A generic registry.
 *
 * A reference type.
 * }
{< private > }

  PAsReferenceKind = ^TAsReferenceKind;
  TAsReferenceKind =  Longint;
  Const
    AS_REFERENCE_KIND_UNKNOWN = 0;
    AS_REFERENCE_KIND_DOI = 1;
    AS_REFERENCE_KIND_CITATION_CFF = 2;
    AS_REFERENCE_KIND_REGISTRY = 3;
    AS_REFERENCE_KIND_LAST = 4;
;
(* Const before type ignored *)

function as_reference_kind_to_string(kind:TAsReferenceKind):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_reference_kind_from_string(str:Pgchar):TAsReferenceKind;cdecl;external;
function as_reference_new:PAsReference;cdecl;external;
function as_reference_get_kind(reference:PAsReference):TAsReferenceKind;cdecl;external;
procedure as_reference_set_kind(reference:PAsReference; kind:TAsReferenceKind);cdecl;external;
(* Const before type ignored *)
function as_reference_get_value(reference:PAsReference):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_reference_set_value(reference:PAsReference; value:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_reference_get_registry_name(reference:PAsReference):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_reference_set_registry_name(reference:PAsReference; name:Pgchar);cdecl;external;

implementation

{ was #define dname def_expr }
function AS_TYPE_REFERENCE : longint; { return type might be wrong }
  begin
    AS_TYPE_REFERENCE:=as_reference_get_type;
  end;


end.
