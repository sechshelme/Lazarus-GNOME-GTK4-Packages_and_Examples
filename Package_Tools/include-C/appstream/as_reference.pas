unit as_reference;

interface

uses
  fp_glib2, fp_appstream;

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

function as_reference_kind_to_string(kind:TAsReferenceKind):Pgchar;cdecl;external libappstream;
function as_reference_kind_from_string(str:Pgchar):TAsReferenceKind;cdecl;external libappstream;
function as_reference_new:PAsReference;cdecl;external libappstream;
function as_reference_get_kind(reference:PAsReference):TAsReferenceKind;cdecl;external libappstream;
procedure as_reference_set_kind(reference:PAsReference; kind:TAsReferenceKind);cdecl;external libappstream;
function as_reference_get_value(reference:PAsReference):Pgchar;cdecl;external libappstream;
procedure as_reference_set_value(reference:PAsReference; value:Pgchar);cdecl;external libappstream;
function as_reference_get_registry_name(reference:PAsReference):Pgchar;cdecl;external libappstream;
procedure as_reference_set_registry_name(reference:PAsReference; name:Pgchar);cdecl;external libappstream;

// === Konventiert am: 30-7-26 19:35:36 ===

function AS_TYPE_REFERENCE: TGType;
function AS_REFERENCE(obj: Pointer): PAsReference;
function AS_IS_REFERENCE(obj: Pointer): Tgboolean;
function AS_REFERENCE_CLASS(klass: Pointer): PAsReferenceClass;
function AS_IS_REFERENCE_CLASS(klass: Pointer): Tgboolean;
function AS_REFERENCE_GET_CLASS(obj: Pointer): PAsReferenceClass;

implementation

function AS_TYPE_REFERENCE: TGType;
begin
  Result := as_reference_get_type;
end;

function AS_REFERENCE(obj: Pointer): PAsReference;
begin
  Result := PAsReference(g_type_check_instance_cast(obj, AS_TYPE_REFERENCE));
end;

function AS_IS_REFERENCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_REFERENCE);
end;

function AS_REFERENCE_CLASS(klass: Pointer): PAsReferenceClass;
begin
  Result := PAsReferenceClass(g_type_check_class_cast(klass, AS_TYPE_REFERENCE));
end;

function AS_IS_REFERENCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_REFERENCE);
end;

function AS_REFERENCE_GET_CLASS(obj: Pointer): PAsReferenceClass;
begin
  Result := PAsReferenceClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAsReference = record
    parent_instance: TGObject;
  end;
  PAsReference = ^TAsReference;

  PAsReferenceClass = type Pointer;

function as_reference_get_type: TGType; cdecl; external libgxxxxxxx;



end.
