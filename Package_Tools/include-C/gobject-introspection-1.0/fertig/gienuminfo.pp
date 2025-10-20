
unit gienuminfo;
interface

{
  Automatically converted by H2Pas 1.0.0 from gienuminfo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gienuminfo.h
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
PGIBaseInfo  = ^GIBaseInfo;
PGIEnumInfo  = ^GIEnumInfo;
PGIFunctionInfo  = ^GIFunctionInfo;
PGIValueInfo  = ^GIValueInfo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Enum and Enum values
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
{$ifndef __GIENUMINFO_H__}
{$define __GIENUMINFO_H__}
{$if !defined (__GIREPOSITORY_H_INSIDE__) && !defined (GI_COMPILATION)}
{$error "Only <girepository.h> can be included directly."}
{$endif}
{$include <gitypes.h>}
{*
 * GI_IS_ENUM_INFO
 * @info: an info structure
 *
 * Checks if @info is a #GIEnumInfo.
  }
{xxxxx
#define GI_IS_ENUM_INFO(info) \
    ((g_base_info_get_type((GIBaseInfo*)info) ==  GI_INFO_TYPE_ENUM) || \
     (g_base_info_get_type((GIBaseInfo*)info) ==  GI_INFO_TYPE_FLAGS))
 }
{*
 * GI_IS_VALUE_INFO
 * @info: an info structure
 *
 * Checks if @info is a #GIValueInfo.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GI_IS_VALUE_INFO(info : longint) : longint;

function g_enum_info_get_n_values(info:PGIEnumInfo):Tgint;cdecl;external;
function g_enum_info_get_value(info:PGIEnumInfo; n:Tgint):PGIValueInfo;cdecl;external;
function g_enum_info_get_n_methods(info:PGIEnumInfo):Tgint;cdecl;external;
function g_enum_info_get_method(info:PGIEnumInfo; n:Tgint):PGIFunctionInfo;cdecl;external;
function g_enum_info_get_storage_type(info:PGIEnumInfo):TGITypeTag;cdecl;external;
(* Const before type ignored *)
function g_enum_info_get_error_domain(info:PGIEnumInfo):Pgchar;cdecl;external;
function g_value_info_get_value(info:PGIValueInfo):Tgint64;cdecl;external;
{$endif}
{ __GIENUMINFO_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_IS_VALUE_INFO(info : longint) : longint;
begin
  GI_IS_VALUE_INFO:=(g_base_info_get_type(PGIBaseInfo(info)))=GI_INFO_TYPE_VALUE;
end;


end.
