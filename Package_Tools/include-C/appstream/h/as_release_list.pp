
unit as_release_list;
interface

{
  Automatically converted by H2Pas 1.0.0 from as_release_list.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    as_release_list.h
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
PAsContext  = ^AsContext;
PAsRelease  = ^AsRelease;
PAsReleaseList  = ^AsReleaseList;
PAsReleaseListClass  = ^AsReleaseListClass;
PAsReleaseListKind  = ^AsReleaseListKind;
PGBytes  = ^GBytes;
Pgchar  = ^gchar;
PGError  = ^GError;
PGPtrArray  = ^GPtrArray;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2022-2024 Matthias Klumpp <matthias@tenstral.net>
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
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include "as-release.h"}
type
{< private > }
  PAsReleaseList = ^TAsReleaseList;
  TAsReleaseList = record
      parent_instance : TGObject;
      entries : PGPtrArray;
    end;

{< private > }
  PAsReleaseListClass = ^TAsReleaseListClass;
  TAsReleaseListClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;


function as_release_list_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function AS_TYPE_RELEASE_LIST : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AS_RELEASE_LIST(obj : longint) : longint;

{G_DEFINE_AUTOPTR_CLEANUP_FUNC  (AsReleaseList, g_object_unref) }
{*
 * AsReleaseListKind:
 * @AS_RELEASE_LIST_KIND_UNKNOWN:		Unknown releases type
 * @AS_RELEASE_LIST_KIND_EMBEDDED:		Release info is embedded in metainfo file
 * @AS_RELEASE_LIST_KIND_EXTERNAL:		Release info is split to a separate file
 *
 * The kind of a releases block.
 *
 * Since: 0.16.0
 * }
{< private > }
type
  PAsReleaseListKind = ^TAsReleaseListKind;
  TAsReleaseListKind =  Longint;
  Const
    AS_RELEASE_LIST_KIND_UNKNOWN = 0;
    AS_RELEASE_LIST_KIND_EMBEDDED = 1;
    AS_RELEASE_LIST_KIND_EXTERNAL = 2;
    AS_RELEASE_LIST_KIND_LAST = 3;
;
(* Const before type ignored *)

function as_release_list_kind_to_string(kind:TAsReleaseListKind):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_release_list_kind_from_string(kind_str:Pgchar):TAsReleaseListKind;cdecl;external;
function as_release_list_new:PAsReleaseList;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function as_release_list_index(rels,index_ : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function as_release_list_len(rels : longint) : longint;

function as_release_list_get_entries(rels:PAsReleaseList):PGPtrArray;cdecl;external;
function as_release_list_get_size(rels:PAsReleaseList):Tguint;cdecl;external;
procedure as_release_list_set_size(rels:PAsReleaseList; size:Tguint);cdecl;external;
function as_release_list_index_safe(rels:PAsReleaseList; index:Tguint):PAsRelease;cdecl;external;
function as_release_list_is_empty(rels:PAsReleaseList):Tgboolean;cdecl;external;
procedure as_release_list_add(rels:PAsReleaseList; release:PAsRelease);cdecl;external;
procedure as_release_list_clear(rels:PAsReleaseList);cdecl;external;
procedure as_release_list_sort(rels:PAsReleaseList);cdecl;external;
function as_release_list_get_context(rels:PAsReleaseList):PAsContext;cdecl;external;
procedure as_release_list_set_context(rels:PAsReleaseList; context:PAsContext);cdecl;external;
function as_release_list_get_kind(rels:PAsReleaseList):TAsReleaseListKind;cdecl;external;
procedure as_release_list_set_kind(rels:PAsReleaseList; kind:TAsReleaseListKind);cdecl;external;
(* Const before type ignored *)
function as_release_list_get_url(rels:PAsReleaseList):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_release_list_set_url(rels:PAsReleaseList; url:Pgchar);cdecl;external;
function as_release_list_load_from_bytes(rels:PAsReleaseList; context:PAsContext; bytes:PGBytes; error:PPGError):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function AS_TYPE_RELEASE_LIST : longint; { return type might be wrong }
  begin
    AS_TYPE_RELEASE_LIST:=as_release_list_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AS_RELEASE_LIST(obj : longint) : longint;
begin
  AS_RELEASE_LIST:=G_TYPE_CHECK_INSTANCE_CAST(obj,AS_TYPE_RELEASE_LIST,AsReleaseList);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function as_release_list_index(rels,index_ : longint) : longint;
begin
  as_release_list_index:=AS_RELEASE(g_ptr_array_index(rels^.entries,index_));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function as_release_list_len(rels : longint) : longint;
begin
  as_release_list_len:=rels^.(entries^.len);
end;


end.
