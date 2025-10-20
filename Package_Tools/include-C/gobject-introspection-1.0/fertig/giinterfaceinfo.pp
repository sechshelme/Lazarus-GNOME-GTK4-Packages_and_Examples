
unit giinterfaceinfo;
interface

{
  Automatically converted by H2Pas 1.0.0 from giinterfaceinfo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    giinterfaceinfo.h
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
PGIConstantInfo  = ^GIConstantInfo;
PGIFunctionInfo  = ^GIFunctionInfo;
PGIInterfaceInfo  = ^GIInterfaceInfo;
PGIPropertyInfo  = ^GIPropertyInfo;
PGISignalInfo  = ^GISignalInfo;
PGIStructInfo  = ^GIStructInfo;
PGIVFuncInfo  = ^GIVFuncInfo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Interface
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
{$ifndef __GIINTERFACEINFO_H__}
{$define __GIINTERFACEINFO_H__}
{$if !defined (__GIREPOSITORY_H_INSIDE__) && !defined (GI_COMPILATION)}
{$error "Only <girepository.h> can be included directly."}
{$endif}
{$include <gitypes.h>}
{*
 * GI_IS_INTERFACE_INFO
 * @info: an info structure
 *
 * Checks if @info is a #GIInterfaceInfo.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GI_IS_INTERFACE_INFO(info : longint) : longint;

function g_interface_info_get_n_prerequisites(info:PGIInterfaceInfo):Tgint;cdecl;external;
function g_interface_info_get_prerequisite(info:PGIInterfaceInfo; n:Tgint):PGIBaseInfo;cdecl;external;
function g_interface_info_get_n_properties(info:PGIInterfaceInfo):Tgint;cdecl;external;
function g_interface_info_get_property(info:PGIInterfaceInfo; n:Tgint):PGIPropertyInfo;cdecl;external;
function g_interface_info_get_n_methods(info:PGIInterfaceInfo):Tgint;cdecl;external;
function g_interface_info_get_method(info:PGIInterfaceInfo; n:Tgint):PGIFunctionInfo;cdecl;external;
(* Const before type ignored *)
function g_interface_info_find_method(info:PGIInterfaceInfo; name:Pgchar):PGIFunctionInfo;cdecl;external;
function g_interface_info_get_n_signals(info:PGIInterfaceInfo):Tgint;cdecl;external;
function g_interface_info_get_signal(info:PGIInterfaceInfo; n:Tgint):PGISignalInfo;cdecl;external;
(* Const before type ignored *)
function g_interface_info_find_signal(info:PGIInterfaceInfo; name:Pgchar):PGISignalInfo;cdecl;external;
function g_interface_info_get_n_vfuncs(info:PGIInterfaceInfo):Tgint;cdecl;external;
function g_interface_info_get_vfunc(info:PGIInterfaceInfo; n:Tgint):PGIVFuncInfo;cdecl;external;
(* Const before type ignored *)
function g_interface_info_find_vfunc(info:PGIInterfaceInfo; name:Pgchar):PGIVFuncInfo;cdecl;external;
function g_interface_info_get_n_constants(info:PGIInterfaceInfo):Tgint;cdecl;external;
function g_interface_info_get_constant(info:PGIInterfaceInfo; n:Tgint):PGIConstantInfo;cdecl;external;
function g_interface_info_get_iface_struct(info:PGIInterfaceInfo):PGIStructInfo;cdecl;external;
{$endif}
{ __GIINTERFACEINFO_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_IS_INTERFACE_INFO(info : longint) : longint;
begin
  GI_IS_INTERFACE_INFO:=(g_base_info_get_type(PGIBaseInfo(info)))=GI_INFO_TYPE_INTERFACE;
end;


end.
