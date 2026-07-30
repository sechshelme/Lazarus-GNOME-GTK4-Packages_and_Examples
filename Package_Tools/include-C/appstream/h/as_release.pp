
unit as_release;
interface

{
  Automatically converted by H2Pas 1.0.0 from as_release.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    as_release
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
PAsContext  = ^AsContext;
PAsIssue  = ^AsIssue;
PAsRelease  = ^AsRelease;
PAsReleaseClass  = ^AsReleaseClass;
PAsReleaseKind  = ^AsReleaseKind;
PAsReleaseUrlKind  = ^AsReleaseUrlKind;
PAsUrgencyKind  = ^AsUrgencyKind;
Pgchar  = ^gchar;
PGPtrArray  = ^GPtrArray;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2014-2024 Matthias Klumpp <matthias@tenstral.net>
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
{$ifndef __AS_RELEASE_H}
{$define __AS_RELEASE_H}
{$include <glib-object.h>}
{$include "as-context.h"}
{$include "as-artifact.h"}
{$include "as-issue.h"}

{ was #define dname def_expr }
function AS_TYPE_RELEASE : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AsRelease, as_release, AS, RELEASE, GObject) }
{< private > }
type
  PAsReleaseClass = ^TAsReleaseClass;
  TAsReleaseClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;

{*
 * AsReleaseKind:
 * @AS_RELEASE_KIND_UNKNOWN:		Unknown release type
 * @AS_RELEASE_KIND_STABLE:		A stable release for end-users
 * @AS_RELEASE_KIND_DEVELOPMENT:	A development release or pre-release for testing
 * @AS_RELEASE_KIND_SNAPSHOT:		A snapshot of a software being worked on
 *
 * The release kind.
 *
 * Since: 0.12.0
 * }
{< private > }

  PAsReleaseKind = ^TAsReleaseKind;
  TAsReleaseKind =  Longint;
  Const
    AS_RELEASE_KIND_UNKNOWN = 0;
    AS_RELEASE_KIND_STABLE = 1;
    AS_RELEASE_KIND_DEVELOPMENT = 2;
    AS_RELEASE_KIND_SNAPSHOT = 3;
    AS_RELEASE_KIND_LAST = 4;
;
(* Const before type ignored *)

function as_release_kind_to_string(kind:TAsReleaseKind):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_release_kind_from_string(kind_str:Pgchar):TAsReleaseKind;cdecl;external;
{*
 * AsUrgencyKind:
 * @AS_URGENCY_KIND_UNKNOWN:	Urgency is unknown or not set
 * @AS_URGENCY_KIND_LOW:	Low urgency
 * @AS_URGENCY_KIND_MEDIUM:	Medium urgency
 * @AS_URGENCY_KIND_HIGH:	High urgency
 * @AS_URGENCY_KIND_CRITICAL:	Critical urgency
 *
 * The urgency of an #AsRelease
 * }
{< private > }
type
  PAsUrgencyKind = ^TAsUrgencyKind;
  TAsUrgencyKind =  Longint;
  Const
    AS_URGENCY_KIND_UNKNOWN = 0;
    AS_URGENCY_KIND_LOW = 1;
    AS_URGENCY_KIND_MEDIUM = 2;
    AS_URGENCY_KIND_HIGH = 3;
    AS_URGENCY_KIND_CRITICAL = 4;
    AS_URGENCY_KIND_LAST = 5;
;
(* Const before type ignored *)

function as_urgency_kind_to_string(urgency_kind:TAsUrgencyKind):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_urgency_kind_from_string(urgency_kind:Pgchar):TAsUrgencyKind;cdecl;external;
{*
 * AsReleaseUrlKind:
 * @AS_RELEASE_URL_KIND_UNKNOWN		Unknown release web URL type
 * @AS_RELEASE_URL_KIND_DETAILS:	Weblink to detailed release notes.
 *
 * The release URL kinds.
 *
 * Since: 0.12.5
 * }
{< private > }
type
  PAsReleaseUrlKind = ^TAsReleaseUrlKind;
  TAsReleaseUrlKind =  Longint;
  Const
    AS_RELEASE_URL_KIND_UNKNOWN = 0;
    AS_RELEASE_URL_KIND_DETAILS = 1;
    AS_RELEASE_URL_KIND_LAST = 2;
;
(* Const before type ignored *)

function as_release_url_kind_to_string(kind:TAsReleaseUrlKind):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_release_url_kind_from_string(kind_str:Pgchar):TAsReleaseUrlKind;cdecl;external;
function as_release_new:PAsRelease;cdecl;external;
function as_release_get_context(release:PAsRelease):PAsContext;cdecl;external;
procedure as_release_set_context(release:PAsRelease; context:PAsContext);cdecl;external;
function as_release_get_kind(release:PAsRelease):TAsReleaseKind;cdecl;external;
procedure as_release_set_kind(release:PAsRelease; kind:TAsReleaseKind);cdecl;external;
(* Const before type ignored *)
function as_release_get_version(release:PAsRelease):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_release_set_version(release:PAsRelease; version:Pgchar);cdecl;external;
function as_release_vercmp(rel1:PAsRelease; rel2:PAsRelease):Tgint;cdecl;external;
(* Const before type ignored *)
function as_release_get_date(release:PAsRelease):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_release_set_date(release:PAsRelease; date:Pgchar);cdecl;external;
function as_release_get_timestamp(release:PAsRelease):Tguint64;cdecl;external;
procedure as_release_set_timestamp(release:PAsRelease; timestamp:Tguint64);cdecl;external;
(* Const before type ignored *)
function as_release_get_date_eol(release:PAsRelease):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_release_set_date_eol(release:PAsRelease; date:Pgchar);cdecl;external;
function as_release_get_timestamp_eol(release:PAsRelease):Tguint64;cdecl;external;
procedure as_release_set_timestamp_eol(release:PAsRelease; timestamp:Tguint64);cdecl;external;
(* Const before type ignored *)
function as_release_get_description(release:PAsRelease):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure as_release_set_description(release:PAsRelease; description:Pgchar; locale:Pgchar);cdecl;external;
function as_release_get_urgency(release:PAsRelease):TAsUrgencyKind;cdecl;external;
procedure as_release_set_urgency(release:PAsRelease; urgency:TAsUrgencyKind);cdecl;external;
function as_release_get_issues(release:PAsRelease):PGPtrArray;cdecl;external;
procedure as_release_add_issue(release:PAsRelease; issue:PAsIssue);cdecl;external;
function as_release_get_artifacts(release:PAsRelease):PGPtrArray;cdecl;external;
procedure as_release_add_artifact(release:PAsRelease; artifact:PAsArtifact);cdecl;external;
(* Const before type ignored *)
function as_release_get_url(release:PAsRelease; url_kind:TAsReleaseUrlKind):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_release_set_url(release:PAsRelease; url_kind:TAsReleaseUrlKind; url:Pgchar);cdecl;external;
procedure as_release_clear_tags(release:PAsRelease);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function as_release_add_tag(release:PAsRelease; ns:Pgchar; tag:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function as_release_remove_tag(release:PAsRelease; ns:Pgchar; tag:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function as_release_has_tag(release:PAsRelease; ns:Pgchar; tag:Pgchar):Tgboolean;cdecl;external;
{$endif}
{ __AS_RELEASE_H  }

implementation

{ was #define dname def_expr }
function AS_TYPE_RELEASE : longint; { return type might be wrong }
  begin
    AS_TYPE_RELEASE:=as_release_get_type;
  end;


end.
