unit as_release;

interface

uses
  fp_glib2;

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

function as_release_kind_to_string(kind:TAsReleaseKind):Pgchar;cdecl;external libappstream;
function as_release_kind_from_string(kind_str:Pgchar):TAsReleaseKind;cdecl;external libappstream;
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

function as_urgency_kind_to_string(urgency_kind:TAsUrgencyKind):Pgchar;cdecl;external libappstream;
function as_urgency_kind_from_string(urgency_kind:Pgchar):TAsUrgencyKind;cdecl;external libappstream;
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

function as_release_url_kind_to_string(kind:TAsReleaseUrlKind):Pgchar;cdecl;external libappstream;
function as_release_url_kind_from_string(kind_str:Pgchar):TAsReleaseUrlKind;cdecl;external libappstream;
function as_release_new:PAsRelease;cdecl;external libappstream;
function as_release_get_context(release:PAsRelease):PAsContext;cdecl;external libappstream;
procedure as_release_set_context(release:PAsRelease; context:PAsContext);cdecl;external libappstream;
function as_release_get_kind(release:PAsRelease):TAsReleaseKind;cdecl;external libappstream;
procedure as_release_set_kind(release:PAsRelease; kind:TAsReleaseKind);cdecl;external libappstream;
function as_release_get_version(release:PAsRelease):Pgchar;cdecl;external libappstream;
procedure as_release_set_version(release:PAsRelease; version:Pgchar);cdecl;external libappstream;
function as_release_vercmp(rel1:PAsRelease; rel2:PAsRelease):Tgint;cdecl;external libappstream;
function as_release_get_date(release:PAsRelease):Pgchar;cdecl;external libappstream;
procedure as_release_set_date(release:PAsRelease; date:Pgchar);cdecl;external libappstream;
function as_release_get_timestamp(release:PAsRelease):Tguint64;cdecl;external libappstream;
procedure as_release_set_timestamp(release:PAsRelease; timestamp:Tguint64);cdecl;external libappstream;
function as_release_get_date_eol(release:PAsRelease):Pgchar;cdecl;external libappstream;
procedure as_release_set_date_eol(release:PAsRelease; date:Pgchar);cdecl;external libappstream;
function as_release_get_timestamp_eol(release:PAsRelease):Tguint64;cdecl;external libappstream;
procedure as_release_set_timestamp_eol(release:PAsRelease; timestamp:Tguint64);cdecl;external libappstream;
function as_release_get_description(release:PAsRelease):Pgchar;cdecl;external libappstream;
procedure as_release_set_description(release:PAsRelease; description:Pgchar; locale:Pgchar);cdecl;external libappstream;
function as_release_get_urgency(release:PAsRelease):TAsUrgencyKind;cdecl;external libappstream;
procedure as_release_set_urgency(release:PAsRelease; urgency:TAsUrgencyKind);cdecl;external libappstream;
function as_release_get_issues(release:PAsRelease):PGPtrArray;cdecl;external libappstream;
procedure as_release_add_issue(release:PAsRelease; issue:PAsIssue);cdecl;external libappstream;
function as_release_get_artifacts(release:PAsRelease):PGPtrArray;cdecl;external libappstream;
procedure as_release_add_artifact(release:PAsRelease; artifact:PAsArtifact);cdecl;external libappstream;
function as_release_get_url(release:PAsRelease; url_kind:TAsReleaseUrlKind):Pgchar;cdecl;external libappstream;
procedure as_release_set_url(release:PAsRelease; url_kind:TAsReleaseUrlKind; url:Pgchar);cdecl;external libappstream;
procedure as_release_clear_tags(release:PAsRelease);cdecl;external libappstream;
function as_release_add_tag(release:PAsRelease; ns:Pgchar; tag:Pgchar):Tgboolean;cdecl;external libappstream;
function as_release_remove_tag(release:PAsRelease; ns:Pgchar; tag:Pgchar):Tgboolean;cdecl;external libappstream;
function as_release_has_tag(release:PAsRelease; ns:Pgchar; tag:Pgchar):Tgboolean;cdecl;external libappstream;
{$endif}
{ __AS_RELEASE_H  }

// === Konventiert am: 30-7-26 19:35:26 ===

function AS_TYPE_RELEASE: TGType;
function AS_RELEASE(obj: Pointer): PAsRelease;
function AS_IS_RELEASE(obj: Pointer): Tgboolean;
function AS_RELEASE_CLASS(klass: Pointer): PAsReleaseClass;
function AS_IS_RELEASE_CLASS(klass: Pointer): Tgboolean;
function AS_RELEASE_GET_CLASS(obj: Pointer): PAsReleaseClass;

implementation

function AS_TYPE_RELEASE: TGType;
begin
  Result := as_release_get_type;
end;

function AS_RELEASE(obj: Pointer): PAsRelease;
begin
  Result := PAsRelease(g_type_check_instance_cast(obj, AS_TYPE_RELEASE));
end;

function AS_IS_RELEASE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_RELEASE);
end;

function AS_RELEASE_CLASS(klass: Pointer): PAsReleaseClass;
begin
  Result := PAsReleaseClass(g_type_check_class_cast(klass, AS_TYPE_RELEASE));
end;

function AS_IS_RELEASE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_RELEASE);
end;

function AS_RELEASE_GET_CLASS(obj: Pointer): PAsReleaseClass;
begin
  Result := PAsReleaseClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAsRelease = record
    parent_instance: TGObject;
  end;
  PAsRelease = ^TAsRelease;

  PAsReleaseClass = type Pointer;

function as_release_get_type: TGType; cdecl; external libgxxxxxxx;



end.
