unit as_artifact;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
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
{$ifndef __AS_ARTIFACT_H}
{$define __AS_ARTIFACT_H}
{$include <glib-object.h>}
{$include "as-checksum.h"}
{$include "as-bundle.h"}

{G_DECLARE_DERIVABLE_TYPE (AsArtifact, as_artifact, AS, ARTIFACT, GObject) }
{< private > }
type
  PAsArtifactClass = ^TAsArtifactClass;
  TAsArtifactClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;

{*
 * AsSizeKind:
 * @AS_SIZE_KIND_UNKNOWN:	Unknown size
 * @AS_SIZE_KIND_DOWNLOAD:	Size of download of component
 * @AS_SIZE_KIND_INSTALLED:	Size of installed component
 *
 * The artifact size kind.
 *
 * Since: 0.8.6
 * }
{< private > }

  PAsSizeKind = ^TAsSizeKind;
  TAsSizeKind =  Longint;
  Const
    AS_SIZE_KIND_UNKNOWN = 0;
    AS_SIZE_KIND_DOWNLOAD = 1;
    AS_SIZE_KIND_INSTALLED = 2;
    AS_SIZE_KIND_LAST = 3;
;

function as_size_kind_to_string(size_kind:TAsSizeKind):Pgchar;cdecl;external libappstream;
function as_size_kind_from_string(size_kind:Pgchar):TAsSizeKind;cdecl;external libappstream;
{*
 * AsArtifactKind:
 * @AS_ARTIFACT_KIND_UNKNOWN:	Type invalid or not known
 * @AS_ARTIFACT_KIND_SOURCE:	The artifact describes software sources.
 * @AS_ARTIFACT_KIND_BINARY:	The artifact describes a binary distribution of the component.
 *
 * The artifact type.
 * }
{< private > }
type
  PAsArtifactKind = ^TAsArtifactKind;
  TAsArtifactKind =  Longint;
  Const
    AS_ARTIFACT_KIND_UNKNOWN = 0;
    AS_ARTIFACT_KIND_SOURCE = 1;
    AS_ARTIFACT_KIND_BINARY = 2;
    AS_ARTIFACT_KIND_LAST = 3;
;

function as_artifact_kind_from_string(kind:Pgchar):TAsArtifactKind;cdecl;external libappstream;
function as_artifact_kind_to_string(kind:TAsArtifactKind):Pgchar;cdecl;external libappstream;
function as_artifact_new:PAsArtifact;cdecl;external libappstream;
function as_artifact_get_kind(artifact:PAsArtifact):TAsArtifactKind;cdecl;external libappstream;
procedure as_artifact_set_kind(artifact:PAsArtifact; kind:TAsArtifactKind);cdecl;external libappstream;
function as_artifact_get_locations(artifact:PAsArtifact):PGPtrArray;cdecl;external libappstream;
procedure as_artifact_add_location(artifact:PAsArtifact; location:Pgchar);cdecl;external libappstream;
function as_artifact_get_checksums(artifact:PAsArtifact):PGPtrArray;cdecl;external libappstream;
function as_artifact_get_checksum(artifact:PAsArtifact; kind:TAsChecksumKind):PAsChecksum;cdecl;external libappstream;
procedure as_artifact_add_checksum(artifact:PAsArtifact; cs:PAsChecksum);cdecl;external libappstream;
function as_artifact_get_size(artifact:PAsArtifact; kind:TAsSizeKind):Tguint64;cdecl;external libappstream;
procedure as_artifact_set_size(artifact:PAsArtifact; size:Tguint64; kind:TAsSizeKind);cdecl;external libappstream;
function as_artifact_get_platform(artifact:PAsArtifact):Pgchar;cdecl;external libappstream;
procedure as_artifact_set_platform(artifact:PAsArtifact; platform:Pgchar);cdecl;external libappstream;
function as_artifact_get_bundle_kind(artifact:PAsArtifact):TAsBundleKind;cdecl;external libappstream;
procedure as_artifact_set_bundle_kind(artifact:PAsArtifact; kind:TAsBundleKind);cdecl;external libappstream;
function as_artifact_get_filename(artifact:PAsArtifact):Pgchar;cdecl;external libappstream;
procedure as_artifact_set_filename(artifact:PAsArtifact; filename:Pgchar);cdecl;external libappstream;
{$endif}
{ __AS_ARTIFACT_H  }

// === Konventiert am: 30-7-26 19:36:55 ===

function AS_TYPE_ARTIFACT: TGType;
function AS_ARTIFACT(obj: Pointer): PAsArtifact;
function AS_IS_ARTIFACT(obj: Pointer): Tgboolean;
function AS_ARTIFACT_CLASS(klass: Pointer): PAsArtifactClass;
function AS_IS_ARTIFACT_CLASS(klass: Pointer): Tgboolean;
function AS_ARTIFACT_GET_CLASS(obj: Pointer): PAsArtifactClass;

implementation

function AS_TYPE_ARTIFACT: TGType;
begin
  Result := as_artifact_get_type;
end;

function AS_ARTIFACT(obj: Pointer): PAsArtifact;
begin
  Result := PAsArtifact(g_type_check_instance_cast(obj, AS_TYPE_ARTIFACT));
end;

function AS_IS_ARTIFACT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_ARTIFACT);
end;

function AS_ARTIFACT_CLASS(klass: Pointer): PAsArtifactClass;
begin
  Result := PAsArtifactClass(g_type_check_class_cast(klass, AS_TYPE_ARTIFACT));
end;

function AS_IS_ARTIFACT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_ARTIFACT);
end;

function AS_ARTIFACT_GET_CLASS(obj: Pointer): PAsArtifactClass;
begin
  Result := PAsArtifactClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAsArtifact = record
    parent_instance: TGObject;
  end;
  PAsArtifact = ^TAsArtifact;

  PAsArtifactClass = type Pointer;

function as_artifact_get_type: TGType; cdecl; external libgxxxxxxx;



end.
