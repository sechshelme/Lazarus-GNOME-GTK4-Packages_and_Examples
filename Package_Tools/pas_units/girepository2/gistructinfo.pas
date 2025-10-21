unit gistructinfo;

interface

uses
  fp_glib2, fp_girepository, gitypes, gibaseinfo;

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

 * Since: 2.80
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_STRUCT_INFO(obj : longint) : longint;

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
function GI_IS_STRUCT_INFO(obj : longint) : longint;

function gi_struct_info_get_n_fields(info:PGIStructInfo):dword;cdecl;external libgirepository2;
function gi_struct_info_get_field(info:PGIStructInfo; n:dword):PGIFieldInfo;cdecl;external libgirepository2;
function gi_struct_info_find_field(info:PGIStructInfo; name:Pchar):PGIFieldInfo;cdecl;external libgirepository2;
function gi_struct_info_get_n_methods(info:PGIStructInfo):dword;cdecl;external libgirepository2;
function gi_struct_info_get_method(info:PGIStructInfo; n:dword):PGIFunctionInfo;cdecl;external libgirepository2;
function gi_struct_info_find_method(info:PGIStructInfo; name:Pchar):PGIFunctionInfo;cdecl;external libgirepository2;
function gi_struct_info_get_size(info:PGIStructInfo):Tsize_t;cdecl;external libgirepository2;
function gi_struct_info_get_alignment(info:PGIStructInfo):Tsize_t;cdecl;external libgirepository2;
function gi_struct_info_is_gtype_struct(info:PGIStructInfo):Tgboolean;cdecl;external libgirepository2;
function gi_struct_info_is_foreign(info:PGIStructInfo):Tgboolean;cdecl;external libgirepository2;
function gi_struct_info_get_copy_function_name(info:PGIStructInfo):Pchar;cdecl;external libgirepository2;
function gi_struct_info_get_free_function_name(info:PGIStructInfo):Pchar;cdecl;external libgirepository2;

// === Konventiert am: 21-10-25 13:36:32 ===

function GI_TYPE_STRUCT_INFO : TGType;
function GI_STRUCT_INFO(obj : Pointer) : PGIStructInfo;
function GI_IS_STRUCT_INFO(obj : Pointer) : Tgboolean;

implementation

function GI_TYPE_STRUCT_INFO : TGType;
  begin
    GI_TYPE_STRUCT_INFO:=gi_struct_info_get_type;
  end;

function GI_STRUCT_INFO(obj : Pointer) : PGIStructInfo;
begin
  Result := PGIStructInfo(g_type_check_instance_cast(obj, GI_TYPE_STRUCT_INFO));
end;

function GI_IS_STRUCT_INFO(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GI_TYPE_STRUCT_INFO);
end;



end.
