
unit as_validator_issue;
interface

{
  Automatically converted by H2Pas 1.0.0 from as_validator_issue.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    as_validator_issue.h
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
PAsIssueSeverity  = ^AsIssueSeverity;
PAsValidatorIssue  = ^AsValidatorIssue;
PAsValidatorIssueClass  = ^AsValidatorIssueClass;
Pgchar  = ^gchar;
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

{ was #define dname def_expr }
function AS_TYPE_VALIDATOR_ISSUE : longint; { return type might be wrong }

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
(* Const before type ignored *)

function as_issue_severity_from_string(str:Pgchar):TAsIssueSeverity;cdecl;external;
(* Const before type ignored *)
function as_issue_severity_to_string(severity:TAsIssueSeverity):Pgchar;cdecl;external;
function as_validator_issue_new:PAsValidatorIssue;cdecl;external;
(* Const before type ignored *)
function as_validator_issue_get_tag(issue:PAsValidatorIssue):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_validator_issue_set_tag(issue:PAsValidatorIssue; tag:Pgchar);cdecl;external;
function as_validator_issue_get_severity(issue:PAsValidatorIssue):TAsIssueSeverity;cdecl;external;
procedure as_validator_issue_set_severity(issue:PAsValidatorIssue; severity:TAsIssueSeverity);cdecl;external;
(* Const before type ignored *)
function as_validator_issue_get_hint(issue:PAsValidatorIssue):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_validator_issue_set_hint(issue:PAsValidatorIssue; hint:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_validator_issue_get_explanation(issue:PAsValidatorIssue):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_validator_issue_set_explanation(issue:PAsValidatorIssue; explanation:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_validator_issue_get_cid(issue:PAsValidatorIssue):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_validator_issue_set_cid(issue:PAsValidatorIssue; cid:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_validator_issue_get_filename(issue:PAsValidatorIssue):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_validator_issue_set_filename(issue:PAsValidatorIssue; fname:Pgchar);cdecl;external;
function as_validator_issue_get_line(issue:PAsValidatorIssue):Tglong;cdecl;external;
procedure as_validator_issue_set_line(issue:PAsValidatorIssue; line:Tglong);cdecl;external;
function as_validator_issue_get_location(issue:PAsValidatorIssue):Pgchar;cdecl;external;
{$endif}
{ __AS_VALIDATOR_ISSUE_H  }

implementation

{ was #define dname def_expr }
function AS_TYPE_VALIDATOR_ISSUE : longint; { return type might be wrong }
  begin
    AS_TYPE_VALIDATOR_ISSUE:=as_validator_issue_get_type;
  end;


end.
