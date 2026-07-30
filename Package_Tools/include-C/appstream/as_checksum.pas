unit as_checksum;

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
{$ifndef __AS_CHECKSUM_H}
{$define __AS_CHECKSUM_H}
{$include <glib-object.h>}

{G_DECLARE_DERIVABLE_TYPE (AsChecksum, as_checksum, AS, CHECKSUM, GObject) }
{< private > }
type
  PAsChecksumClass = ^TAsChecksumClass;
  TAsChecksumClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;

{*
 * AsChecksumKind:
 * @AS_CHECKSUM_KIND_NONE:	No checksum
 * @AS_CHECKSUM_KIND_SHA1:	SHA1 checksum
 * @AS_CHECKSUM_KIND_SHA256:	SHA256 checksum
 * @AS_CHECKSUM_KIND_SHA512:	SHA512 checksum
 * @AS_CHECKSUM_KIND_BLAKE2B:	BLAKE2 checksum
 * @AS_CHECKSUM_KIND_BLAKE3:	BLAKE3 checksum
 *
 * Checksums supported by #AsRelease
 * }
{< private > }

  PAsChecksumKind = ^TAsChecksumKind;
  TAsChecksumKind =  Longint;
  Const
    AS_CHECKSUM_KIND_NONE = 0;
    AS_CHECKSUM_KIND_SHA1 = 1;
    AS_CHECKSUM_KIND_SHA256 = 2;
    AS_CHECKSUM_KIND_SHA512 = 3;
    AS_CHECKSUM_KIND_BLAKE2B = 4;
    AS_CHECKSUM_KIND_BLAKE3 = 5;
    AS_CHECKSUM_KIND_LAST = 6;
;

function as_checksum_kind_to_string(kind:TAsChecksumKind):Pgchar;cdecl;external libappstream;
function as_checksum_kind_from_string(kind_str:Pgchar):TAsChecksumKind;cdecl;external libappstream;
function as_checksum_new:PAsChecksum;cdecl;external libappstream;
function as_checksum_new_with_value(kind:TAsChecksumKind; value:Pgchar):PAsChecksum;cdecl;external libappstream;
function as_checksum_get_kind(cs:PAsChecksum):TAsChecksumKind;cdecl;external libappstream;
procedure as_checksum_set_kind(cs:PAsChecksum; kind:TAsChecksumKind);cdecl;external libappstream;
function as_checksum_get_value(cs:PAsChecksum):Pgchar;cdecl;external libappstream;
procedure as_checksum_set_value(cs:PAsChecksum; value:Pgchar);cdecl;external libappstream;
{$endif}
{ __AS_CHECKSUM_H  }

// === Konventiert am: 30-7-26 19:36:35 ===

function AS_TYPE_CHECKSUM: TGType;
function AS_CHECKSUM(obj: Pointer): PAsChecksum;
function AS_IS_CHECKSUM(obj: Pointer): Tgboolean;
function AS_CHECKSUM_CLASS(klass: Pointer): PAsChecksumClass;
function AS_IS_CHECKSUM_CLASS(klass: Pointer): Tgboolean;
function AS_CHECKSUM_GET_CLASS(obj: Pointer): PAsChecksumClass;

implementation

function AS_TYPE_CHECKSUM: TGType;
begin
  Result := as_checksum_get_type;
end;

function AS_CHECKSUM(obj: Pointer): PAsChecksum;
begin
  Result := PAsChecksum(g_type_check_instance_cast(obj, AS_TYPE_CHECKSUM));
end;

function AS_IS_CHECKSUM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_CHECKSUM);
end;

function AS_CHECKSUM_CLASS(klass: Pointer): PAsChecksumClass;
begin
  Result := PAsChecksumClass(g_type_check_class_cast(klass, AS_TYPE_CHECKSUM));
end;

function AS_IS_CHECKSUM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_CHECKSUM);
end;

function AS_CHECKSUM_GET_CLASS(obj: Pointer): PAsChecksumClass;
begin
  Result := PAsChecksumClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAsChecksum = record
    parent_instance: TGObject;
  end;
  PAsChecksum = ^TAsChecksum;

  PAsChecksumClass = type Pointer;

function as_checksum_get_type: TGType; cdecl; external libgxxxxxxx;



end.
