unit as_issue;

interface

uses
  fp_glib2, fp_appstream;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2019-2024 Matthias Klumpp <matthias@tenstral.net>
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
{$ifndef __AS_ISSUE_H}
{$define __AS_ISSUE_H}
{$include <glib-object.h>}

{G_DECLARE_DERIVABLE_TYPE (AsIssue, as_issue, AS, ISSUE, GObject) }
{< private > }
type
  PAsIssueClass = ^TAsIssueClass;
  TAsIssueClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;

{*
 * AsIssueKind:
 * @AS_ISSUE_KIND_UNKNOWN:	Unknown issue type
 * @AS_ISSUE_KIND_GENERIC:	Generic issue type
 * @AS_ISSUE_KIND_CVE:		Common Vulnerabilities and Exposures issue
 *
 * Checksums supported by #AsRelease
 * }
{< private > }

  PAsIssueKind = ^TAsIssueKind;
  TAsIssueKind =  Longint;
  Const
    AS_ISSUE_KIND_UNKNOWN = 0;
    AS_ISSUE_KIND_GENERIC = 1;
    AS_ISSUE_KIND_CVE = 2;
    AS_ISSUE_KIND_LAST = 3;
;

function as_issue_kind_to_string(kind:TAsIssueKind):Pgchar;cdecl;external libappstream;
function as_issue_kind_from_string(kind_str:Pgchar):TAsIssueKind;cdecl;external libappstream;
function as_issue_new:PAsIssue;cdecl;external libappstream;
function as_issue_get_kind(issue:PAsIssue):TAsIssueKind;cdecl;external libappstream;
procedure as_issue_set_kind(issue:PAsIssue; kind:TAsIssueKind);cdecl;external libappstream;
function as_issue_get_id(issue:PAsIssue):Pgchar;cdecl;external libappstream;
procedure as_issue_set_id(issue:PAsIssue; id:Pgchar);cdecl;external libappstream;
function as_issue_get_url(issue:PAsIssue):Pgchar;cdecl;external libappstream;
procedure as_issue_set_url(issue:PAsIssue; url:Pgchar);cdecl;external libappstream;
{$endif}
{ __AS_ISSUE_H  }

// === Konventiert am: 30-7-26 19:35:53 ===

function AS_TYPE_ISSUE: TGType;
function AS_ISSUE(obj: Pointer): PAsIssue;
function AS_IS_ISSUE(obj: Pointer): Tgboolean;
function AS_ISSUE_CLASS(klass: Pointer): PAsIssueClass;
function AS_IS_ISSUE_CLASS(klass: Pointer): Tgboolean;
function AS_ISSUE_GET_CLASS(obj: Pointer): PAsIssueClass;

implementation

function AS_TYPE_ISSUE: TGType;
begin
  Result := as_issue_get_type;
end;

function AS_ISSUE(obj: Pointer): PAsIssue;
begin
  Result := PAsIssue(g_type_check_instance_cast(obj, AS_TYPE_ISSUE));
end;

function AS_IS_ISSUE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_ISSUE);
end;

function AS_ISSUE_CLASS(klass: Pointer): PAsIssueClass;
begin
  Result := PAsIssueClass(g_type_check_class_cast(klass, AS_TYPE_ISSUE));
end;

function AS_IS_ISSUE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_ISSUE);
end;

function AS_ISSUE_GET_CLASS(obj: Pointer): PAsIssueClass;
begin
  Result := PAsIssueClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAsIssue = record
    parent_instance: TGObject;
  end;
  PAsIssue = ^TAsIssue;

  PAsIssueClass = type Pointer;

function as_issue_get_type: TGType; cdecl; external libgxxxxxxx;



end.
