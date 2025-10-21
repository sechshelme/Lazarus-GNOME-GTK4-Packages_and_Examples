unit giinterfaceinfo;

interface

uses
  fp_glib2, fp_girepository, gitypes, gibaseinfo;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Interface
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
function GI_INTERFACE_INFO(obj : longint) : longint;

{*
 * GI_IS_INTERFACE_INFO:
 * @info: an info structure
 *
 * Checks if @info is a [class@GIRepository.InterfaceInfo] (or a derived type).
 *
 * Since: 2.80
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_IS_INTERFACE_INFO(obj : longint) : longint;

function gi_interface_info_get_n_prerequisites(info:PGIInterfaceInfo):dword;cdecl;external libgirepository2;
function gi_interface_info_get_prerequisite(info:PGIInterfaceInfo; n:dword):PGIBaseInfo;cdecl;external libgirepository2;
function gi_interface_info_get_n_properties(info:PGIInterfaceInfo):dword;cdecl;external libgirepository2;
function gi_interface_info_get_property(info:PGIInterfaceInfo; n:dword):PGIPropertyInfo;cdecl;external libgirepository2;
function gi_interface_info_get_n_methods(info:PGIInterfaceInfo):dword;cdecl;external libgirepository2;
function gi_interface_info_get_method(info:PGIInterfaceInfo; n:dword):PGIFunctionInfo;cdecl;external libgirepository2;
function gi_interface_info_find_method(info:PGIInterfaceInfo; name:Pchar):PGIFunctionInfo;cdecl;external libgirepository2;
function gi_interface_info_get_n_signals(info:PGIInterfaceInfo):dword;cdecl;external libgirepository2;
function gi_interface_info_get_signal(info:PGIInterfaceInfo; n:dword):PGISignalInfo;cdecl;external libgirepository2;
function gi_interface_info_find_signal(info:PGIInterfaceInfo; name:Pchar):PGISignalInfo;cdecl;external libgirepository2;
function gi_interface_info_get_n_vfuncs(info:PGIInterfaceInfo):dword;cdecl;external libgirepository2;
function gi_interface_info_get_vfunc(info:PGIInterfaceInfo; n:dword):PGIVFuncInfo;cdecl;external libgirepository2;
function gi_interface_info_find_vfunc(info:PGIInterfaceInfo; name:Pchar):PGIVFuncInfo;cdecl;external libgirepository2;
function gi_interface_info_get_n_constants(info:PGIInterfaceInfo):dword;cdecl;external libgirepository2;
function gi_interface_info_get_constant(info:PGIInterfaceInfo; n:dword):PGIConstantInfo;cdecl;external libgirepository2;
function gi_interface_info_get_iface_struct(info:PGIInterfaceInfo):PGIStructInfo;cdecl;external libgirepository2;

// === Konventiert am: 21-10-25 13:35:25 ===

function GI_TYPE_INTERFACE_INFO : TGType;
function GI_INTERFACE_INFO(obj : Pointer) : PGIInterfaceInfo;
function GI_IS_INTERFACE_INFO(obj : Pointer) : Tgboolean;

implementation

function GI_TYPE_INTERFACE_INFO : TGType;
  begin
    GI_TYPE_INTERFACE_INFO:=gi_interface_info_get_type;
  end;

function GI_INTERFACE_INFO(obj : Pointer) : PGIInterfaceInfo;
begin
  Result := PGIInterfaceInfo(g_type_check_instance_cast(obj, GI_TYPE_INTERFACE_INFO));
end;

function GI_IS_INTERFACE_INFO(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GI_TYPE_INTERFACE_INFO);
end;



end.
