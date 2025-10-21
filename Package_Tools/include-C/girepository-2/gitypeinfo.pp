
unit gitypeinfo;
interface

{
  Automatically converted by H2Pas 1.0.0 from gitypeinfo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gitypeinfo.h
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
Pchar  = ^char;
Pdword  = ^dword;
PGIArgument  = ^GIArgument;
PGIBaseInfo  = ^GIBaseInfo;
PGITypeInfo  = ^GITypeInfo;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Type
 *
 * Copyright (C) 2005 Matthias Clasen
 * Copyright (C) 2008,2009 Red Hat, Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GIREPOSITORY_H_INSIDE__) && !defined (GI_COMPILATION)}
{$error "Only <girepository.h> can be included directly."}
{$endif}
{$include <girepository/gitypes.h>}

{ was #define dname def_expr }
function GI_TYPE_TYPE_INFO : longint; { return type might be wrong }

{*
 * GI_TYPE_INFO:
 * @info: Info object which is subject to casting.
 *
 * Casts a [type@GIRepository.TypeInfo] or derived pointer into a
 * `(GITypeInfo*)` pointer.
 *
 * Depending on the current debugging level, this function may invoke
 * certain runtime checks to identify invalid casts.
 *
 * Since: 2.80
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_TYPE_INFO(info : longint) : longint;

{*
 * GI_IS_TYPE_INFO:
 * @info: an info structure
 *
 * Checks if @info is a [alias@GIRepository.TypeInfo] (or a derived type).
 *
 * Since: 2.80
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_IS_TYPE_INFO(info : longint) : longint;

{*
 * GI_TYPE_TAG_IS_BASIC:
 * @tag: a type tag
 *
 * Checks if @tag is a basic type.
 *
 * Since: 2.80
  }
{xxxxxxx #define GI_TYPE_TAG_IS_BASIC(tag) ((tag) < GI_TYPE_TAG_ARRAY || (tag) == GI_TYPE_TAG_UNICHAR) }
{*
 * GI_TYPE_TAG_IS_NUMERIC:
 * @tag: a type tag
 *
 * Checks if @tag is a numeric type. That is, integer or floating point.
 *
 * Since: 2.80
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_TYPE_TAG_IS_NUMERIC(tag : longint) : longint;

{*
 * GI_TYPE_TAG_IS_CONTAINER:
 * @tag: a type tag
 *
 * Checks if @tag is a container type. That is, a type which may have a nonnull
 * return from [method@GIRepository.TypeInfo.get_param_type].
 *
 * Since: 2.80
  }
{ xxxxxxxxxx  #define GI_TYPE_TAG_IS_CONTAINER(tag) ((tag) == GI_TYPE_TAG_ARRAY ((tag) >= GI_TYPE_TAG_GLIST && (tag) <= GI_TYPE_TAG_GHASH)) }
(* Const before type ignored *)
function gi_type_tag_to_string(_type:TGITypeTag):Pchar;cdecl;external;
function gi_type_info_is_pointer(info:PGITypeInfo):Tgboolean;cdecl;external;
function gi_type_info_get_tag(info:PGITypeInfo):TGITypeTag;cdecl;external;
function gi_type_info_get_param_type(info:PGITypeInfo; n:dword):PGITypeInfo;cdecl;external;
function gi_type_info_get_interface(info:PGITypeInfo):PGIBaseInfo;cdecl;external;
function gi_type_info_get_array_length_index(info:PGITypeInfo; out_length_index:Pdword):Tgboolean;cdecl;external;
function gi_type_info_get_array_fixed_size(info:PGITypeInfo; out_size:Psize_t):Tgboolean;cdecl;external;
function gi_type_info_is_zero_terminated(info:PGITypeInfo):Tgboolean;cdecl;external;
function gi_type_info_get_array_type(info:PGITypeInfo):TGIArrayType;cdecl;external;
function gi_type_info_get_storage_type(info:PGITypeInfo):TGITypeTag;cdecl;external;
procedure gi_type_info_argument_from_hash_pointer(info:PGITypeInfo; hash_pointer:pointer; arg:PGIArgument);cdecl;external;
function gi_type_info_hash_pointer_from_argument(info:PGITypeInfo; arg:PGIArgument):pointer;cdecl;external;
procedure gi_type_tag_argument_from_hash_pointer(storage_type:TGITypeTag; hash_pointer:pointer; arg:PGIArgument);cdecl;external;
function gi_type_tag_hash_pointer_from_argument(storage_type:TGITypeTag; arg:PGIArgument):pointer;cdecl;external;

implementation

{ was #define dname def_expr }
function GI_TYPE_TYPE_INFO : longint; { return type might be wrong }
  begin
    GI_TYPE_TYPE_INFO:=gi_type_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_TYPE_INFO(info : longint) : longint;
begin
  GI_TYPE_INFO:=G_TYPE_CHECK_INSTANCE_CAST(info,GI_TYPE_TYPE_INFO,GITypeInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_IS_TYPE_INFO(info : longint) : longint;
begin
  GI_IS_TYPE_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(info,GI_TYPE_TYPE_INFO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_TYPE_TAG_IS_NUMERIC(tag : longint) : longint;
begin
  GI_TYPE_TAG_IS_NUMERIC:=(tag>=(GI_TYPE_TAG_INT8 and (@(tag))))<=GI_TYPE_TAG_DOUBLE;
end;


end.
