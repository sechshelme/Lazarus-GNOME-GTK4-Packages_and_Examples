
unit as_artifact;
interface

{
  Automatically converted by H2Pas 1.0.0 from as_artifact.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    as_artifact.h
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
PAsArtifact  = ^AsArtifact;
PAsArtifactClass  = ^AsArtifactClass;
PAsArtifactKind  = ^AsArtifactKind;
PAsChecksum  = ^AsChecksum;
PAsSizeKind  = ^AsSizeKind;
Pgchar  = ^gchar;
PGPtrArray  = ^GPtrArray;
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

{ was #define dname def_expr }
function AS_TYPE_ARTIFACT : longint; { return type might be wrong }

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
(* Const before type ignored *)

function as_size_kind_to_string(size_kind:TAsSizeKind):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_size_kind_from_string(size_kind:Pgchar):TAsSizeKind;cdecl;external;
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
(* Const before type ignored *)

function as_artifact_kind_from_string(kind:Pgchar):TAsArtifactKind;cdecl;external;
(* Const before type ignored *)
function as_artifact_kind_to_string(kind:TAsArtifactKind):Pgchar;cdecl;external;
function as_artifact_new:PAsArtifact;cdecl;external;
function as_artifact_get_kind(artifact:PAsArtifact):TAsArtifactKind;cdecl;external;
procedure as_artifact_set_kind(artifact:PAsArtifact; kind:TAsArtifactKind);cdecl;external;
function as_artifact_get_locations(artifact:PAsArtifact):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure as_artifact_add_location(artifact:PAsArtifact; location:Pgchar);cdecl;external;
function as_artifact_get_checksums(artifact:PAsArtifact):PGPtrArray;cdecl;external;
function as_artifact_get_checksum(artifact:PAsArtifact; kind:TAsChecksumKind):PAsChecksum;cdecl;external;
procedure as_artifact_add_checksum(artifact:PAsArtifact; cs:PAsChecksum);cdecl;external;
function as_artifact_get_size(artifact:PAsArtifact; kind:TAsSizeKind):Tguint64;cdecl;external;
procedure as_artifact_set_size(artifact:PAsArtifact; size:Tguint64; kind:TAsSizeKind);cdecl;external;
(* Const before type ignored *)
function as_artifact_get_platform(artifact:PAsArtifact):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_artifact_set_platform(artifact:PAsArtifact; platform:Pgchar);cdecl;external;
function as_artifact_get_bundle_kind(artifact:PAsArtifact):TAsBundleKind;cdecl;external;
procedure as_artifact_set_bundle_kind(artifact:PAsArtifact; kind:TAsBundleKind);cdecl;external;
(* Const before type ignored *)
function as_artifact_get_filename(artifact:PAsArtifact):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_artifact_set_filename(artifact:PAsArtifact; filename:Pgchar);cdecl;external;
{$endif}
{ __AS_ARTIFACT_H  }

implementation

{ was #define dname def_expr }
function AS_TYPE_ARTIFACT : longint; { return type might be wrong }
  begin
    AS_TYPE_ARTIFACT:=as_artifact_get_type;
  end;


end.
