unit as_agreement;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2018-2024 Matthias Klumpp <matthias@tenstral.net>
 * Copyright (C) 2018 Richard Hughes <richard@hughsie.com>
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
{$ifndef __AS_AGREEMENT_H}
{$define __AS_AGREEMENT_H}
{$include <glib-object.h>}
{$include "as-agreement-section.h"}

{G_DECLARE_DERIVABLE_TYPE (AsAgreement, as_agreement, AS, AGREEMENT, GObject) }
{< private > }
type
  PAsAgreementClass = ^TAsAgreementClass;
  TAsAgreementClass = record
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
 * AsAgreementKind:
 * @AS_AGREEMENT_KIND_UNKNOWN:		Unknown value
 * @AS_AGREEMENT_KIND_GENERIC:		A generic agreement without a specific type
 * @AS_AGREEMENT_KIND_EULA:		An End User License Agreement
 * @AS_AGREEMENT_KIND_PRIVACY:		A privacy agreement, typically a GDPR statement
 *
 * The kind of the agreement.
 * }
{< private > }

  PAsAgreementKind = ^TAsAgreementKind;
  TAsAgreementKind =  Longint;
  Const
    AS_AGREEMENT_KIND_UNKNOWN = 0;
    AS_AGREEMENT_KIND_GENERIC = 1;
    AS_AGREEMENT_KIND_EULA = 2;
    AS_AGREEMENT_KIND_PRIVACY = 3;
    AS_AGREEMENT_KIND_LAST = 4;
;

function as_agreement_new:PAsAgreement;cdecl;external libappstream;
function as_agreement_kind_to_string(value:TAsAgreementKind):Pgchar;cdecl;external libappstream;
function as_agreement_kind_from_string(value:Pgchar):TAsAgreementKind;cdecl;external libappstream;
function as_agreement_get_kind(agreement:PAsAgreement):TAsAgreementKind;cdecl;external libappstream;
procedure as_agreement_set_kind(agreement:PAsAgreement; kind:TAsAgreementKind);cdecl;external libappstream;
function as_agreement_get_version_id(agreement:PAsAgreement):Pgchar;cdecl;external libappstream;
procedure as_agreement_set_version_id(agreement:PAsAgreement; version_id:Pgchar);cdecl;external libappstream;
function as_agreement_get_section_default(agreement:PAsAgreement):PAsAgreementSection;cdecl;external libappstream;
function as_agreement_get_sections(agreement:PAsAgreement):PGPtrArray;cdecl;external libappstream;
procedure as_agreement_add_section(agreement:PAsAgreement; agreement_section:PAsAgreementSection);cdecl;external libappstream;
{$endif}
{ __AS_AGREEMENT_H  }

// === Konventiert am: 30-7-26 19:37:03 ===

function AS_TYPE_AGREEMENT: TGType;
function AS_AGREEMENT(obj: Pointer): PAsAgreement;
function AS_IS_AGREEMENT(obj: Pointer): Tgboolean;
function AS_AGREEMENT_CLASS(klass: Pointer): PAsAgreementClass;
function AS_IS_AGREEMENT_CLASS(klass: Pointer): Tgboolean;
function AS_AGREEMENT_GET_CLASS(obj: Pointer): PAsAgreementClass;

implementation

function AS_TYPE_AGREEMENT: TGType;
begin
  Result := as_agreement_get_type;
end;

function AS_AGREEMENT(obj: Pointer): PAsAgreement;
begin
  Result := PAsAgreement(g_type_check_instance_cast(obj, AS_TYPE_AGREEMENT));
end;

function AS_IS_AGREEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_AGREEMENT);
end;

function AS_AGREEMENT_CLASS(klass: Pointer): PAsAgreementClass;
begin
  Result := PAsAgreementClass(g_type_check_class_cast(klass, AS_TYPE_AGREEMENT));
end;

function AS_IS_AGREEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_AGREEMENT);
end;

function AS_AGREEMENT_GET_CLASS(obj: Pointer): PAsAgreementClass;
begin
  Result := PAsAgreementClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAsAgreement = record
    parent_instance: TGObject;
  end;
  PAsAgreement = ^TAsAgreement;

  PAsAgreementClass = type Pointer;

function as_agreement_get_type: TGType; cdecl; external libgxxxxxxx;



end.
