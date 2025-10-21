
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
function GI_TYPE_VFUNC_INFO : longint; { return type might be wrong }

{*
 * GI_VFUNC_INFO:
 * @info: Info object which is subject to casting.
 *
 * Casts a [type@GIRepository.VFuncInfo] or derived pointer into a
 * `(GIVFuncInfo*)` pointer.
 *
 * Depending on the current debugging level, this function may invoke
 * certain runtime checks to identify invalid casts.
 *
 * Since: 2.80
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_VFUNC_INFO(info : longint) : longint;

{*
 * GI_IS_VFUNC_INFO:
 * @info: an info structure
 *
 * Checks if @info is a [struct@GIRepository.VFuncInfo] (or a derived type).
 *
 * Since: 2.80
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_IS_VFUNC_INFO(info : longint) : longint;

function gi_vfunc_info_get_flags(info:PGIVFuncInfo):TGIVFuncInfoFlags;cdecl;external;
function gi_vfunc_info_get_offset(info:PGIVFuncInfo):Tsize_t;cdecl;external;
function gi_vfunc_info_get_signal(info:PGIVFuncInfo):PGISignalInfo;cdecl;external;
function gi_vfunc_info_get_invoker(info:PGIVFuncInfo):PGIFunctionInfo;cdecl;external;
function gi_vfunc_info_get_address(info:PGIVFuncInfo; implementor_gtype:TGType; error:PPGError):pointer;cdecl;external;
(* Const before type ignored *)
function gi_vfunc_info_invoke(info:PGIVFuncInfo; implementor:TGType; in_args:PGIArgument; n_in_args:Tsize_t; out_args:PGIArgument; 
           n_out_args:Tsize_t; return_value:PGIArgument; error:PPGError):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GI_TYPE_VFUNC_INFO : longint; { return type might be wrong }
  begin
    GI_TYPE_VFUNC_INFO:=gi_vfunc_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_VFUNC_INFO(info : longint) : longint;
begin
  GI_VFUNC_INFO:=G_TYPE_CHECK_INSTANCE_CAST(info,GI_TYPE_VFUNC_INFO,GIVFuncInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_IS_VFUNC_INFO(info : longint) : longint;
begin
  GI_IS_VFUNC_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(info,GI_TYPE_VFUNC_INFO);
end;


end.
