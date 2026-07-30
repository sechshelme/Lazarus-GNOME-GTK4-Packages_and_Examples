
unit as_translation;
interface

{
  Automatically converted by H2Pas 1.0.0 from as_translation.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    as_translation.h
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
PAsTranslation  = ^AsTranslation;
PAsTranslationClass  = ^AsTranslationClass;
PAsTranslationKind  = ^AsTranslationKind;
Pgchar  = ^gchar;
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

{ was #define dname def_expr }
function AS_TYPE_TRANSLATION : longint; { return type might be wrong }

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
(* Const before type ignored *)

function as_translation_kind_to_string(kind:TAsTranslationKind):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_translation_kind_from_string(kind_str:Pgchar):TAsTranslationKind;cdecl;external;
function as_translation_new:PAsTranslation;cdecl;external;
function as_translation_get_kind(tr:PAsTranslation):TAsTranslationKind;cdecl;external;
procedure as_translation_set_kind(tr:PAsTranslation; kind:TAsTranslationKind);cdecl;external;
(* Const before type ignored *)
function as_translation_get_id(tr:PAsTranslation):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_translation_set_id(tr:PAsTranslation; id:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_translation_get_source_locale(tr:PAsTranslation):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_translation_set_source_locale(tr:PAsTranslation; locale:Pgchar);cdecl;external;
{$endif}
{ __AS_TRANSLATION_H  }

implementation

{ was #define dname def_expr }
function AS_TYPE_TRANSLATION : longint; { return type might be wrong }
  begin
    AS_TYPE_TRANSLATION:=as_translation_get_type;
  end;


end.
