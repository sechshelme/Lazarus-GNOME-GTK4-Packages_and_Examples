
unit giunioninfo;
interface

{
  Automatically converted by H2Pas 1.0.0 from giunioninfo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    giunioninfo.h
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
Pgchar  = ^gchar;
PGIBaseInfo  = ^GIBaseInfo;
PGIConstantInfo  = ^GIConstantInfo;
PGIFieldInfo  = ^GIFieldInfo;
PGIFunctionInfo  = ^GIFunctionInfo;
PGITypeInfo  = ^GITypeInfo;
PGIUnionInfo  = ^GIUnionInfo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Union
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
{$ifndef __GIUNIONINFO_H__}
{$define __GIUNIONINFO_H__}
{$if !defined (__GIREPOSITORY_H_INSIDE__) && !defined (GI_COMPILATION)}
{$error "Only <girepository.h> can be included directly."}
{$endif}
{$include <gitypes.h>}
{*
 * GI_IS_UNION_INFO
 * @info: an info structure
 *
 * Checks if @info is a #GIUnionInfo.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GI_IS_UNION_INFO(info : longint) : longint;

function g_union_info_get_n_fields(info:PGIUnionInfo):Tgint;cdecl;external;
function g_union_info_get_field(info:PGIUnionInfo; n:Tgint):PGIFieldInfo;cdecl;external;
function g_union_info_get_n_methods(info:PGIUnionInfo):Tgint;cdecl;external;
function g_union_info_get_method(info:PGIUnionInfo; n:Tgint):PGIFunctionInfo;cdecl;external;
function g_union_info_is_discriminated(info:PGIUnionInfo):Tgboolean;cdecl;external;
function g_union_info_get_discriminator_offset(info:PGIUnionInfo):Tgint;cdecl;external;
function g_union_info_get_discriminator_type(info:PGIUnionInfo):PGITypeInfo;cdecl;external;
function g_union_info_get_discriminator(info:PGIUnionInfo; n:Tgint):PGIConstantInfo;cdecl;external;
(* Const before type ignored *)
function g_union_info_find_method(info:PGIUnionInfo; name:Pgchar):PGIFunctionInfo;cdecl;external;
function g_union_info_get_size(info:PGIUnionInfo):Tgsize;cdecl;external;
function g_union_info_get_alignment(info:PGIUnionInfo):Tgsize;cdecl;external;
(* Const before type ignored *)
function g_union_info_get_copy_function(info:PGIUnionInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function g_union_info_get_free_function(info:PGIUnionInfo):Pchar;cdecl;external;
{$endif}
{ __GIUNIONINFO_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_IS_UNION_INFO(info : longint) : longint;
begin
  GI_IS_UNION_INFO:=(g_base_info_get_type(PGIBaseInfo(info)))=GI_INFO_TYPE_UNION;
end;


end.
