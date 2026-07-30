
unit as_issue;
interface

{
  Automatically converted by H2Pas 1.0.0 from as_issue.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    as_issue.h
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
PAsIssue  = ^AsIssue;
PAsIssueClass  = ^AsIssueClass;
PAsIssueKind  = ^AsIssueKind;
Pgchar  = ^gchar;
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

{ was #define dname def_expr }
function AS_TYPE_ISSUE : longint; { return type might be wrong }

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
(* Const before type ignored *)

function as_issue_kind_to_string(kind:TAsIssueKind):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_issue_kind_from_string(kind_str:Pgchar):TAsIssueKind;cdecl;external;
function as_issue_new:PAsIssue;cdecl;external;
function as_issue_get_kind(issue:PAsIssue):TAsIssueKind;cdecl;external;
procedure as_issue_set_kind(issue:PAsIssue; kind:TAsIssueKind);cdecl;external;
(* Const before type ignored *)
function as_issue_get_id(issue:PAsIssue):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_issue_set_id(issue:PAsIssue; id:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_issue_get_url(issue:PAsIssue):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_issue_set_url(issue:PAsIssue; url:Pgchar);cdecl;external;
{$endif}
{ __AS_ISSUE_H  }

implementation

{ was #define dname def_expr }
function AS_TYPE_ISSUE : longint; { return type might be wrong }
  begin
    AS_TYPE_ISSUE:=as_issue_get_type;
  end;


end.
