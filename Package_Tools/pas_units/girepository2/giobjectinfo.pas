unit giobjectinfo;

interface

uses
  fp_glib2, fp_girepository, gitypes, gibaseinfo;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Object
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
{*
 * GIObjectInfoRefFunction: (skip)
 * @object: object instance pointer
 *
 * Increases the reference count of an object instance.
 *
 * Returns: (transfer full): the object instance
 * Since: 2.80
  }
type
  PGIObjectInfoRefFunction = ^TGIObjectInfoRefFunction;
  TGIObjectInfoRefFunction = function (object:pointer):pointer;cdecl;
{*
 * GIObjectInfoUnrefFunction: (skip)
 * @object: (transfer full): object instance pointer
 *
 * Decreases the reference count of an object instance.
 *
 * Since: 2.80
  }

  TGIObjectInfoUnrefFunction = procedure (object:pointer);cdecl;
{*
 * GIObjectInfoSetValueFunction: (skip)
 * @value: a [type@GObject.Value]
 * @object: object instance pointer
 *
 * Update @value and attach the object instance pointer @object to it.
 *
 * Since: 2.80
  }

  TGIObjectInfoSetValueFunction = procedure (value:PGValue; object:pointer);cdecl;
{*
 * GIObjectInfoGetValueFunction: (skip)
 * @value: a [type@GObject.Value]
 *
 * Extract an object instance out of @value.
 *
 * Returns: (transfer full): the object instance
 * Since: 2.80
  }

  PGIObjectInfoGetValueFunction = ^TGIObjectInfoGetValueFunction;
  TGIObjectInfoGetValueFunction = function (value:PGValue):pointer;cdecl;

 * Since: 2.80
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_OBJECT_INFO(obj : longint) : longint;

{*
 * GI_IS_OBJECT_INFO:
 * @info: an info structure
 *
 * Checks if @info is a [class@GIRepository.ObjectInfo] (or a derived type).
 *
 * Since: 2.80
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_IS_OBJECT_INFO(obj : longint) : longint;

function gi_object_info_get_type_name(info:PGIObjectInfo):Pchar;cdecl;external libgirepository2;
function gi_object_info_get_type_init_function_name(info:PGIObjectInfo):Pchar;cdecl;external libgirepository2;
function gi_object_info_get_abstract(info:PGIObjectInfo):Tgboolean;cdecl;external libgirepository2;
function gi_object_info_get_final(info:PGIObjectInfo):Tgboolean;cdecl;external libgirepository2;
function gi_object_info_get_fundamental(info:PGIObjectInfo):Tgboolean;cdecl;external libgirepository2;
function gi_object_info_get_parent(info:PGIObjectInfo):PGIObjectInfo;cdecl;external libgirepository2;
function gi_object_info_get_n_interfaces(info:PGIObjectInfo):dword;cdecl;external libgirepository2;
function gi_object_info_get_interface(info:PGIObjectInfo; n:dword):PGIInterfaceInfo;cdecl;external libgirepository2;
function gi_object_info_get_n_fields(info:PGIObjectInfo):dword;cdecl;external libgirepository2;
function gi_object_info_get_field(info:PGIObjectInfo; n:dword):PGIFieldInfo;cdecl;external libgirepository2;
function gi_object_info_get_n_properties(info:PGIObjectInfo):dword;cdecl;external libgirepository2;
function gi_object_info_get_property(info:PGIObjectInfo; n:dword):PGIPropertyInfo;cdecl;external libgirepository2;
function gi_object_info_get_n_methods(info:PGIObjectInfo):dword;cdecl;external libgirepository2;
function gi_object_info_get_method(info:PGIObjectInfo; n:dword):PGIFunctionInfo;cdecl;external libgirepository2;
function gi_object_info_find_method(info:PGIObjectInfo; name:Pchar):PGIFunctionInfo;cdecl;external libgirepository2;
function gi_object_info_find_method_using_interfaces(info:PGIObjectInfo; name:Pchar; declarer:PPGIBaseInfo):PGIFunctionInfo;cdecl;external libgirepository2;
function gi_object_info_get_n_signals(info:PGIObjectInfo):dword;cdecl;external libgirepository2;
function gi_object_info_get_signal(info:PGIObjectInfo; n:dword):PGISignalInfo;cdecl;external libgirepository2;
function gi_object_info_find_signal(info:PGIObjectInfo; name:Pchar):PGISignalInfo;cdecl;external libgirepository2;
function gi_object_info_get_n_vfuncs(info:PGIObjectInfo):dword;cdecl;external libgirepository2;
function gi_object_info_get_vfunc(info:PGIObjectInfo; n:dword):PGIVFuncInfo;cdecl;external libgirepository2;
function gi_object_info_find_vfunc(info:PGIObjectInfo; name:Pchar):PGIVFuncInfo;cdecl;external libgirepository2;
function gi_object_info_find_vfunc_using_interfaces(info:PGIObjectInfo; name:Pchar; declarer:PPGIBaseInfo):PGIVFuncInfo;cdecl;external libgirepository2;
function gi_object_info_get_n_constants(info:PGIObjectInfo):dword;cdecl;external libgirepository2;
function gi_object_info_get_constant(info:PGIObjectInfo; n:dword):PGIConstantInfo;cdecl;external libgirepository2;
function gi_object_info_get_class_struct(info:PGIObjectInfo):PGIStructInfo;cdecl;external libgirepository2;
function gi_object_info_get_ref_function_name(info:PGIObjectInfo):Pchar;cdecl;external libgirepository2;
function gi_object_info_get_ref_function_pointer(info:PGIObjectInfo):TGIObjectInfoRefFunction;cdecl;external libgirepository2;
function gi_object_info_get_unref_function_name(info:PGIObjectInfo):Pchar;cdecl;external libgirepository2;
function gi_object_info_get_unref_function_pointer(info:PGIObjectInfo):TGIObjectInfoUnrefFunction;cdecl;external libgirepository2;
function gi_object_info_get_set_value_function_name(info:PGIObjectInfo):Pchar;cdecl;external libgirepository2;
function gi_object_info_get_set_value_function_pointer(info:PGIObjectInfo):TGIObjectInfoSetValueFunction;cdecl;external libgirepository2;
function gi_object_info_get_get_value_function_name(info:PGIObjectInfo):Pchar;cdecl;external libgirepository2;
function gi_object_info_get_get_value_function_pointer(info:PGIObjectInfo):TGIObjectInfoGetValueFunction;cdecl;external libgirepository2;

// === Konventiert am: 21-10-25 13:35:32 ===

function GI_TYPE_OBJECT_INFO : TGType;
function GI_OBJECT_INFO(obj : Pointer) : PGIObjectInfo;
function GI_IS_OBJECT_INFO(obj : Pointer) : Tgboolean;

implementation

function GI_TYPE_OBJECT_INFO : TGType;
  begin
    GI_TYPE_OBJECT_INFO:=gi_object_info_get_type;
  end;

function GI_OBJECT_INFO(obj : Pointer) : PGIObjectInfo;
begin
  Result := PGIObjectInfo(g_type_check_instance_cast(obj, GI_TYPE_OBJECT_INFO));
end;

function GI_IS_OBJECT_INFO(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GI_TYPE_OBJECT_INFO);
end;



end.
