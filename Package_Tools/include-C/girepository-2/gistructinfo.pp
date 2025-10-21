
unit gistructinfo;
interface

{
  Automatically converted by H2Pas 1.0.0 from gistructinfo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gistructinfo.h
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
PGIFieldInfo  = ^GIFieldInfo;
PGIFunctionInfo  = ^GIFunctionInfo;
PGIStructInfo  = ^GIStructInfo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Struct
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
function GI_TYPE_STRUCT_INFO : longint; { return type might be wrong }

{*
 * GI_STRUCT_INFO:
 * @info: Info object which is subject to casting.
 *
 * Casts a [type@GIRepository.StructInfo] or derived pointer into a
 * `(GIStructInfo*)` pointer.
 *
 * Depending on the current debugging level, this function may invoke
 * certain runtime checks to identify invalid casts.
 *
 * Since: 2.80
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_STRUCT_INFO(info : longint) : longint;

{*
 * GI_IS_STRUCT_INFO:
 * @info: an info structure
 *
 * Checks if @info is a [class@GIRepository.StructInfo] (or a derived type).
 *
 * Since: 2.80
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_IS_STRUCT_INFO(info : longint) : longint;

function gi_struct_info_get_n_fields(info:PGIStructInfo):dword;cdecl;external;
function gi_struct_info_get_field(info:PGIStructInfo; n:dword):PGIFieldInfo;cdecl;external;
(* Const before type ignored *)
function gi_struct_info_find_field(info:PGIStructInfo; name:Pchar):PGIFieldInfo;cdecl;external;
function gi_struct_info_get_n_methods(info:PGIStructInfo):dword;cdecl;external;
function gi_struct_info_get_method(info:PGIStructInfo; n:dword):PGIFunctionInfo;cdecl;external;
(* Const before type ignored *)
function gi_struct_info_find_method(info:PGIStructInfo; name:Pchar):PGIFunctionInfo;cdecl;external;
function gi_struct_info_get_size(info:PGIStructInfo):Tsize_t;cdecl;external;
function gi_struct_info_get_alignment(info:PGIStructInfo):Tsize_t;cdecl;external;
function gi_struct_info_is_gtype_struct(info:PGIStructInfo):Tgboolean;cdecl;external;
function gi_struct_info_is_foreign(info:PGIStructInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gi_struct_info_get_copy_function_name(info:PGIStructInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function gi_struct_info_get_free_function_name(info:PGIStructInfo):Pchar;cdecl;external;

implementation

{ was #define dname def_expr }
function GI_TYPE_STRUCT_INFO : longint; { return type might be wrong }
  begin
    GI_TYPE_STRUCT_INFO:=gi_struct_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_STRUCT_INFO(info : longint) : longint;
begin
  GI_STRUCT_INFO:=G_TYPE_CHECK_INSTANCE_CAST(info,GI_TYPE_STRUCT_INFO,GIStructInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_IS_STRUCT_INFO(info : longint) : longint;
begin
  GI_IS_STRUCT_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(info,GI_TYPE_STRUCT_INFO);
end;


end.
