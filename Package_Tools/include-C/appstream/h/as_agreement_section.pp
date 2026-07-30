
unit as_agreement_section;
interface

{
  Automatically converted by H2Pas 1.0.0 from as_agreement_section.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    as_agreement_section.h
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
PAsAgreementSection  = ^AsAgreementSection;
PAsAgreementSectionClass  = ^AsAgreementSectionClass;
PAsContext  = ^AsContext;
Pgchar  = ^gchar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2018 Richard Hughes <richard@hughsie.com>
 * Copyright (C) 2018-2024 Matthias Klumpp <matthias@tenstral.net>
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
{$ifndef __AS_AGREEMENT_SECTION_H}
{$define __AS_AGREEMENT_SECTION_H}
{$include <glib-object.h>}
{$include "as-context.h"}

{ was #define dname def_expr }
function AS_TYPE_AGREEMENT_SECTION : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AsAgreementSection, as_agreement_section, AS, AGREEMENT_SECTION, GObject) }
{< private > }
type
  PAsAgreementSectionClass = ^TAsAgreementSectionClass;
  TAsAgreementSectionClass = record
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


function as_agreement_section_new:PAsAgreementSection;cdecl;external;
function as_agreement_section_get_context(agreement_section:PAsAgreementSection):PAsContext;cdecl;external;
procedure as_agreement_section_set_context(agreement_section:PAsAgreementSection; context:PAsContext);cdecl;external;
(* Const before type ignored *)
function as_agreement_section_get_kind(agreement_section:PAsAgreementSection):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_agreement_section_set_kind(agreement_section:PAsAgreementSection; kind:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_agreement_section_get_name(agreement_section:PAsAgreementSection):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure as_agreement_section_set_name(agreement_section:PAsAgreementSection; name:Pgchar; locale:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_agreement_section_get_description(agreement_section:PAsAgreementSection):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure as_agreement_section_set_description(agreement_section:PAsAgreementSection; desc:Pgchar; locale:Pgchar);cdecl;external;
{$endif}
{ __AS_AGREEMENT_SECTION_H  }

implementation

{ was #define dname def_expr }
function AS_TYPE_AGREEMENT_SECTION : longint; { return type might be wrong }
  begin
    AS_TYPE_AGREEMENT_SECTION:=as_agreement_section_get_type;
  end;


end.
