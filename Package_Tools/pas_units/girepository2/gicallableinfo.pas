unit gicallableinfo;

interface

uses
  fp_glib2, fp_girepository, gitypes, gibaseinfo;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Callable
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
function GI_CALLABLE_INFO(obj : longint) : longint;

{*
 * GI_IS_CALLABLE_INFO:
 * @info: an info structure
 *
 * Checks if @info is a [class@GIRepository.CallableInfo] or derived from it.
 *
 * Since: 2.80
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_IS_CALLABLE_INFO(obj : longint) : longint;

function gi_callable_info_is_method(info:PGICallableInfo):Tgboolean;cdecl;external libgirepository2;
function gi_callable_info_can_throw_gerror(info:PGICallableInfo):Tgboolean;cdecl;external libgirepository2;
function gi_callable_info_get_return_type(info:PGICallableInfo):PGITypeInfo;cdecl;external libgirepository2;
procedure gi_callable_info_load_return_type(info:PGICallableInfo; _type:PGITypeInfo);cdecl;external libgirepository2;
function gi_callable_info_get_return_attribute(info:PGICallableInfo; name:Pchar):Pchar;cdecl;external libgirepository2;
function gi_callable_info_iterate_return_attributes(info:PGICallableInfo; iterator:PGIAttributeIter; name:PPchar; value:PPchar):Tgboolean;cdecl;external libgirepository2;
function gi_callable_info_get_caller_owns(info:PGICallableInfo):TGITransfer;cdecl;external libgirepository2;
function gi_callable_info_may_return_null(info:PGICallableInfo):Tgboolean;cdecl;external libgirepository2;
function gi_callable_info_skip_return(info:PGICallableInfo):Tgboolean;cdecl;external libgirepository2;
function gi_callable_info_get_n_args(info:PGICallableInfo):dword;cdecl;external libgirepository2;
function gi_callable_info_get_arg(info:PGICallableInfo; n:dword):PGIArgInfo;cdecl;external libgirepository2;
procedure gi_callable_info_load_arg(info:PGICallableInfo; n:dword; arg:PGIArgInfo);cdecl;external libgirepository2;
function gi_callable_info_invoke(info:PGICallableInfo; _function:pointer; in_args:PGIArgument; n_in_args:Tsize_t; out_args:PGIArgument; 
           n_out_args:Tsize_t; return_value:PGIArgument; error:PPGError):Tgboolean;cdecl;external libgirepository2;
function gi_callable_info_get_instance_ownership_transfer(info:PGICallableInfo):TGITransfer;cdecl;external libgirepository2;

// === Konventiert am: 21-10-25 13:34:34 ===

function GI_TYPE_CALLABLE_INFO : TGType;
function GI_CALLABLE_INFO(obj : Pointer) : PGICallableInfo;
function GI_IS_CALLABLE_INFO(obj : Pointer) : Tgboolean;

implementation

function GI_TYPE_CALLABLE_INFO : TGType;
  begin
    GI_TYPE_CALLABLE_INFO:=gi_callable_info_get_type;
  end;

function GI_CALLABLE_INFO(obj : Pointer) : PGICallableInfo;
begin
  Result := PGICallableInfo(g_type_check_instance_cast(obj, GI_TYPE_CALLABLE_INFO));
end;

function GI_IS_CALLABLE_INFO(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GI_TYPE_CALLABLE_INFO);
end;



end.
