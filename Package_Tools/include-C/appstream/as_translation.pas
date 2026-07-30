unit as_translation;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2016-2024 Matthias Klumpp <matthias@tenstral.net>
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
{$ifndef __AS_TRANSLATION_H}
{$define __AS_TRANSLATION_H}
{$include <glib-object.h>}

{G_DECLARE_DERIVABLE_TYPE (AsTranslation, as_translation, AS, TRANSLATION, GObject) }
{< private > }
type
  PAsTranslationClass = ^TAsTranslationClass;
  TAsTranslationClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;

{*
 * AsTranslationKind:
 * @AS_TRANSLATION_KIND_UNKNOWN:	Type invalid or not known
 * @AS_TRANSLATION_KIND_GETTEXT:	Gettext translation domain
 * @AS_TRANSLATION_KIND_QT:		Qt translation domain
 *
 * The translation type.
 * }
{< private > }

  PAsTranslationKind = ^TAsTranslationKind;
  TAsTranslationKind =  Longint;
  Const
    AS_TRANSLATION_KIND_UNKNOWN = 0;
    AS_TRANSLATION_KIND_GETTEXT = 1;
    AS_TRANSLATION_KIND_QT = 2;
    AS_TRANSLATION_KIND_LAST = 3;
;

function as_translation_kind_to_string(kind:TAsTranslationKind):Pgchar;cdecl;external libappstream;
function as_translation_kind_from_string(kind_str:Pgchar):TAsTranslationKind;cdecl;external libappstream;
function as_translation_new:PAsTranslation;cdecl;external libappstream;
function as_translation_get_kind(tr:PAsTranslation):TAsTranslationKind;cdecl;external libappstream;
procedure as_translation_set_kind(tr:PAsTranslation; kind:TAsTranslationKind);cdecl;external libappstream;
function as_translation_get_id(tr:PAsTranslation):Pgchar;cdecl;external libappstream;
procedure as_translation_set_id(tr:PAsTranslation; id:Pgchar);cdecl;external libappstream;
function as_translation_get_source_locale(tr:PAsTranslation):Pgchar;cdecl;external libappstream;
procedure as_translation_set_source_locale(tr:PAsTranslation; locale:Pgchar);cdecl;external libappstream;
{$endif}
{ __AS_TRANSLATION_H  }

// === Konventiert am: 30-7-26 19:34:33 ===

function AS_TYPE_TRANSLATION: TGType;
function AS_TRANSLATION(obj: Pointer): PAsTranslation;
function AS_IS_TRANSLATION(obj: Pointer): Tgboolean;
function AS_TRANSLATION_CLASS(klass: Pointer): PAsTranslationClass;
function AS_IS_TRANSLATION_CLASS(klass: Pointer): Tgboolean;
function AS_TRANSLATION_GET_CLASS(obj: Pointer): PAsTranslationClass;

implementation

function AS_TYPE_TRANSLATION: TGType;
begin
  Result := as_translation_get_type;
end;

function AS_TRANSLATION(obj: Pointer): PAsTranslation;
begin
  Result := PAsTranslation(g_type_check_instance_cast(obj, AS_TYPE_TRANSLATION));
end;

function AS_IS_TRANSLATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_TRANSLATION);
end;

function AS_TRANSLATION_CLASS(klass: Pointer): PAsTranslationClass;
begin
  Result := PAsTranslationClass(g_type_check_class_cast(klass, AS_TYPE_TRANSLATION));
end;

function AS_IS_TRANSLATION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_TRANSLATION);
end;

function AS_TRANSLATION_GET_CLASS(obj: Pointer): PAsTranslationClass;
begin
  Result := PAsTranslationClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAsTranslation = record
    parent_instance: TGObject;
  end;
  PAsTranslation = ^TAsTranslation;

  PAsTranslationClass = type Pointer;

function as_translation_get_type: TGType; cdecl; external libgxxxxxxx;



end.
