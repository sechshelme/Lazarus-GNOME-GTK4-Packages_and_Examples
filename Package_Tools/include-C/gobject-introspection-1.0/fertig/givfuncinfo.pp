
unit givfuncinfo;
interface

{
  Automatically converted by H2Pas 1.0.0 from givfuncinfo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    givfuncinfo.h
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
PGError  = ^GError;
PGIArgument  = ^GIArgument;
PGIBaseInfo  = ^GIBaseInfo;
PGIFunctionInfo  = ^GIFunctionInfo;
PGISignalInfo  = ^GISignalInfo;
PGIVFuncInfo  = ^GIVFuncInfo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Virtual Functions
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
{$ifndef __GIVFUNCINFO_H__}
{$define __GIVFUNCINFO_H__}
{$if !defined (__GIREPOSITORY_H_INSIDE__) && !defined (GI_COMPILATION)}
{$error "Only <girepository.h> can be included directly."}
{$endif}
{$include <gitypes.h>}
{*
 * GI_IS_VFUNC_INFO
 * @info: an info structure
 *
 * Checks if @info is a #GIVfuncInfo.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GI_IS_VFUNC_INFO(info : longint) : longint;

function g_vfunc_info_get_flags(info:PGIVFuncInfo):TGIVFuncInfoFlags;cdecl;external;
function g_vfunc_info_get_offset(info:PGIVFuncInfo):Tgint;cdecl;external;
function g_vfunc_info_get_signal(info:PGIVFuncInfo):PGISignalInfo;cdecl;external;
function g_vfunc_info_get_invoker(info:PGIVFuncInfo):PGIFunctionInfo;cdecl;external;
function g_vfunc_info_get_address(info:PGIVFuncInfo; implementor_gtype:TGType; error:PPGError):Tgpointer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_vfunc_info_invoke(info:PGIVFuncInfo; implementor:TGType; in_args:PGIArgument; n_in_args:longint; out_args:PGIArgument; 
           n_out_args:longint; return_value:PGIArgument; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __GIVFUNCINFO_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_IS_VFUNC_INFO(info : longint) : longint;
begin
  GI_IS_VFUNC_INFO:=(g_base_info_get_type(PGIBaseInfo(info)))=GI_INFO_TYPE_VFUNC;
end;


end.
