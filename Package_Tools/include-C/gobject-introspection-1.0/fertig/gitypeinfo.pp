
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
Pgchar  = ^gchar;
PGIArgument  = ^GIArgument;
PGIBaseInfo  = ^GIBaseInfo;
PGITypeInfo  = ^GITypeInfo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Type
 *
 * Copyright (C) 2005 Matthias Clasen
 * Copyright (C) 2008,2009 Red Hat, Inc.
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
{$ifndef __GITYPEINFO_H__}
{$define __GITYPEINFO_H__}
{$if !defined (__GIREPOSITORY_H_INSIDE__) && !defined (GI_COMPILATION)}
{$error "Only <girepository.h> can be included directly."}
{$endif}
{$include <gitypes.h>}
{*
 * GI_IS_TYPE_INFO
 * @info: an info structure
 *
 * Checks if @info is a #GITypeInfo.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GI_IS_TYPE_INFO(info : longint) : longint;

{*
 * G_TYPE_TAG_IS_BASIC
 * @tag: a type tag
 *
 * Checks if @tag is a basic type.
 *
 * Deprecated: 1.72: Use GI_TYPE_TAG_IS_BASIC() instead
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_TAG_IS_BASIC(tag : longint) : longint;

{*
 * GI_TYPE_TAG_IS_BASIC
 * @tag: a type tag
 *
 * Checks if @tag is a basic type.
 *
 * Since: 1.72
  }
{xxxxxxxxxxx #define GI_TYPE_TAG_IS_BASIC(tag) ((tag) < GI_TYPE_TAG_ARRAY || (tag) == GI_TYPE_TAG_UNICHAR) }
{*
 * GI_TYPE_TAG_IS_NUMERIC:
 * @tag: a type tag
 *
 * Checks if @tag is a numeric type. That is, integer or floating point.
 *
 * Since: 1.72
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_TYPE_TAG_IS_NUMERIC(tag : longint) : longint;

{*
 * GI_TYPE_TAG_IS_NUMERIC:
 * @tag: a type tag
 *
 * Checks if @tag is a numeric type. That is, integer or floating point.
 *
 * Since: 1.72
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_TYPE_TAG_IS_NUMERIC(tag : longint) : longint;

{*
 * GI_TYPE_TAG_IS_NUMERIC:
 * @tag: a type tag
 *
 * Checks if @tag is a numeric type. That is, integer or floating point.
 *
 * Since: 1.72
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
 * return from g_type_info_get_param_type().
 *
 * Since: 1.72
  }
{ xxxxxxxxxxxxx #define GI_TYPE_TAG_IS_CONTAINER(tag) ((tag) == GI_TYPE_TAG_ARRAY || ((tag) >= GI_TYPE_TAG_GLIST && (tag) <= GI_TYPE_TAG_GHASH)) }
(* Const before type ignored *)
function g_type_tag_to_string(_type:TGITypeTag):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_info_type_to_string(_type:TGIInfoType):Pgchar;cdecl;external;
function g_type_info_is_pointer(info:PGITypeInfo):Tgboolean;cdecl;external;
function g_type_info_get_tag(info:PGITypeInfo):TGITypeTag;cdecl;external;
function g_type_info_get_param_type(info:PGITypeInfo; n:Tgint):PGITypeInfo;cdecl;external;
function g_type_info_get_interface(info:PGITypeInfo):PGIBaseInfo;cdecl;external;
function g_type_info_get_array_length(info:PGITypeInfo):Tgint;cdecl;external;
function g_type_info_get_array_fixed_size(info:PGITypeInfo):Tgint;cdecl;external;
function g_type_info_is_zero_terminated(info:PGITypeInfo):Tgboolean;cdecl;external;
function g_type_info_get_array_type(info:PGITypeInfo):TGIArrayType;cdecl;external;
function g_type_info_get_storage_type(info:PGITypeInfo):TGITypeTag;cdecl;external;
procedure g_type_info_argument_from_hash_pointer(info:PGITypeInfo; hash_pointer:Tgpointer; arg:PGIArgument);cdecl;external;
function g_type_info_hash_pointer_from_argument(info:PGITypeInfo; arg:PGIArgument):Tgpointer;cdecl;external;
procedure gi_type_tag_argument_from_hash_pointer(storage_type:TGITypeTag; hash_pointer:Tgpointer; arg:PGIArgument);cdecl;external;
function gi_type_tag_hash_pointer_from_argument(storage_type:TGITypeTag; arg:PGIArgument):Tgpointer;cdecl;external;
{$endif}
{ __GITYPEINFO_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_IS_TYPE_INFO(info : longint) : longint;
begin
  GI_IS_TYPE_INFO:=(g_base_info_get_type(PGIBaseInfo(info)))=GI_INFO_TYPE_TYPE;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_TAG_IS_BASIC(tag : longint) : longint;
begin
  G_TYPE_TAG_IS_BASIC:=GI_TYPE_TAG_IS_BASIC(tag);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_TYPE_TAG_IS_NUMERIC(tag : longint) : longint;
begin
  GI_TYPE_TAG_IS_NUMERIC:=(tag>=(GI_TYPE_TAG_INT8 and (@(tag))))<=GI_TYPE_TAG_DOUBLE;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_TYPE_TAG_IS_NUMERIC(tag : longint) : longint;
begin
  GI_TYPE_TAG_IS_NUMERIC:=(tag>=(GI_TYPE_TAG_INT8 and (@(tag))))<=GI_TYPE_TAG_DOUBLE;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_TYPE_TAG_IS_NUMERIC(tag : longint) : longint;
begin
  GI_TYPE_TAG_IS_NUMERIC:=(tag>=(GI_TYPE_TAG_INT8 and (@(tag))))<=GI_TYPE_TAG_DOUBLE;
end;


end.
