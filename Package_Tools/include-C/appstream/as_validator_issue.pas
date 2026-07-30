unit as_validator_issue;

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
{$ifndef __AS_VALIDATOR_ISSUE_H}
{$define __AS_VALIDATOR_ISSUE_H}
{$include <glib-object.h>}

{G_DECLARE_DERIVABLE_TYPE (AsValidatorIssue, as_validator_issue, AS, VALIDATOR_ISSUE, GObject) }
{< private > }
type
  PAsValidatorIssueClass = ^TAsValidatorIssueClass;
  TAsValidatorIssueClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;

{*
 * AsIssueSeverity:
 * @AS_ISSUE_SEVERITY_UNKNOWN:	The severity is unknown.
 * @AS_ISSUE_SEVERITY_PEDANTIC:	Pedantic information about ways to improve the data, but could also be ignored.
 * @AS_ISSUE_SEVERITY_INFO:	Non-essential information on how to improve metadata, no immediate action needed.
 * @AS_ISSUE_SEVERITY_WARNING:	Something metadata issue which should be fixed as soon as possible.
 * @AS_ISSUE_SEVERITY_ERROR:	There is a serious, fatal error in your metadata
 *
 * The severity of an issue found by #AsValidator
 * }
{< private > }

  PAsIssueSeverity = ^TAsIssueSeverity;
  TAsIssueSeverity =  Longint;
  Const
    AS_ISSUE_SEVERITY_UNKNOWN = 0;
    AS_ISSUE_SEVERITY_PEDANTIC = 1;
    AS_ISSUE_SEVERITY_INFO = 2;
    AS_ISSUE_SEVERITY_WARNING = 3;
    AS_ISSUE_SEVERITY_ERROR = 4;
    AS_ISSUE_SEVERITY_LAST = 5;
;

function as_issue_severity_from_string(str:Pgchar):TAsIssueSeverity;cdecl;external libappstream;
function as_issue_severity_to_string(severity:TAsIssueSeverity):Pgchar;cdecl;external libappstream;
function as_validator_issue_new:PAsValidatorIssue;cdecl;external libappstream;
function as_validator_issue_get_tag(issue:PAsValidatorIssue):Pgchar;cdecl;external libappstream;
procedure as_validator_issue_set_tag(issue:PAsValidatorIssue; tag:Pgchar);cdecl;external libappstream;
function as_validator_issue_get_severity(issue:PAsValidatorIssue):TAsIssueSeverity;cdecl;external libappstream;
procedure as_validator_issue_set_severity(issue:PAsValidatorIssue; severity:TAsIssueSeverity);cdecl;external libappstream;
function as_validator_issue_get_hint(issue:PAsValidatorIssue):Pgchar;cdecl;external libappstream;
procedure as_validator_issue_set_hint(issue:PAsValidatorIssue; hint:Pgchar);cdecl;external libappstream;
function as_validator_issue_get_explanation(issue:PAsValidatorIssue):Pgchar;cdecl;external libappstream;
procedure as_validator_issue_set_explanation(issue:PAsValidatorIssue; explanation:Pgchar);cdecl;external libappstream;
function as_validator_issue_get_cid(issue:PAsValidatorIssue):Pgchar;cdecl;external libappstream;
procedure as_validator_issue_set_cid(issue:PAsValidatorIssue; cid:Pgchar);cdecl;external libappstream;
function as_validator_issue_get_filename(issue:PAsValidatorIssue):Pgchar;cdecl;external libappstream;
procedure as_validator_issue_set_filename(issue:PAsValidatorIssue; fname:Pgchar);cdecl;external libappstream;
function as_validator_issue_get_line(issue:PAsValidatorIssue):Tglong;cdecl;external libappstream;
procedure as_validator_issue_set_line(issue:PAsValidatorIssue; line:Tglong);cdecl;external libappstream;
function as_validator_issue_get_location(issue:PAsValidatorIssue):Pgchar;cdecl;external libappstream;
{$endif}
{ __AS_VALIDATOR_ISSUE_H  }

// === Konventiert am: 30-7-26 19:34:18 ===

function AS_TYPE_VALIDATOR_ISSUE: TGType;
function AS_VALIDATOR_ISSUE(obj: Pointer): PAsValidatorIssue;
function AS_IS_VALIDATOR_ISSUE(obj: Pointer): Tgboolean;
function AS_VALIDATOR_ISSUE_CLASS(klass: Pointer): PAsValidatorIssueClass;
function AS_IS_VALIDATOR_ISSUE_CLASS(klass: Pointer): Tgboolean;
function AS_VALIDATOR_ISSUE_GET_CLASS(obj: Pointer): PAsValidatorIssueClass;

implementation

function AS_TYPE_VALIDATOR_ISSUE: TGType;
begin
  Result := as_validator_issue_get_type;
end;

function AS_VALIDATOR_ISSUE(obj: Pointer): PAsValidatorIssue;
begin
  Result := PAsValidatorIssue(g_type_check_instance_cast(obj, AS_TYPE_VALIDATOR_ISSUE));
end;

function AS_IS_VALIDATOR_ISSUE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_VALIDATOR_ISSUE);
end;

function AS_VALIDATOR_ISSUE_CLASS(klass: Pointer): PAsValidatorIssueClass;
begin
  Result := PAsValidatorIssueClass(g_type_check_class_cast(klass, AS_TYPE_VALIDATOR_ISSUE));
end;

function AS_IS_VALIDATOR_ISSUE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_VALIDATOR_ISSUE);
end;

function AS_VALIDATOR_ISSUE_GET_CLASS(obj: Pointer): PAsValidatorIssueClass;
begin
  Result := PAsValidatorIssueClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAsValidatorIssue = record
    parent_instance: TGObject;
  end;
  PAsValidatorIssue = ^TAsValidatorIssue;

  PAsValidatorIssueClass = type Pointer;

function as_validator_issue_get_type: TGType; cdecl; external libgxxxxxxx;



end.
