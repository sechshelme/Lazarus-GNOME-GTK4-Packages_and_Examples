
unit gicallableinfo;
interface

{
  Automatically converted by H2Pas 1.0.0 from gicallableinfo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gicallableinfo.h
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
PGError  = ^GError;
PGIArgInfo  = ^GIArgInfo;
PGIArgument  = ^GIArgument;
PGIAttributeIter  = ^GIAttributeIter;
PGICallableInfo  = ^GICallableInfo;
PGITypeInfo  = ^GITypeInfo;
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

{ was #define dname def_expr }
function GI_TYPE_CALLABLE_INFO : longint; { return type might be wrong }

{*
 * GI_CALLABLE_INFO:
 * @info: Info object which is subject to casting.
 *
 * Casts a [type@GIRepository.CallableInfo] or derived pointer into a
 * `(GICallableInfo*)` pointer.
 *
 * Depending on the current debugging level, this function may invoke
 * certain runtime checks to identify invalid casts.
 *
 * Since: 2.80
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_CALLABLE_INFO(info : longint) : longint;

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
function GI_IS_CALLABLE_INFO(info : longint) : longint;

function gi_callable_info_is_method(info:PGICallableInfo):Tgboolean;cdecl;external;
function gi_callable_info_can_throw_gerror(info:PGICallableInfo):Tgboolean;cdecl;external;
function gi_callable_info_get_return_type(info:PGICallableInfo):PGITypeInfo;cdecl;external;
procedure gi_callable_info_load_return_type(info:PGICallableInfo; _type:PGITypeInfo);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gi_callable_info_get_return_attribute(info:PGICallableInfo; name:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gi_callable_info_iterate_return_attributes(info:PGICallableInfo; iterator:PGIAttributeIter; name:PPchar; value:PPchar):Tgboolean;cdecl;external;
function gi_callable_info_get_caller_owns(info:PGICallableInfo):TGITransfer;cdecl;external;
function gi_callable_info_may_return_null(info:PGICallableInfo):Tgboolean;cdecl;external;
function gi_callable_info_skip_return(info:PGICallableInfo):Tgboolean;cdecl;external;
function gi_callable_info_get_n_args(info:PGICallableInfo):dword;cdecl;external;
function gi_callable_info_get_arg(info:PGICallableInfo; n:dword):PGIArgInfo;cdecl;external;
procedure gi_callable_info_load_arg(info:PGICallableInfo; n:dword; arg:PGIArgInfo);cdecl;external;
(* Const before type ignored *)
function gi_callable_info_invoke(info:PGICallableInfo; _function:pointer; in_args:PGIArgument; n_in_args:Tsize_t; out_args:PGIArgument; 
           n_out_args:Tsize_t; return_value:PGIArgument; error:PPGError):Tgboolean;cdecl;external;
function gi_callable_info_get_instance_ownership_transfer(info:PGICallableInfo):TGITransfer;cdecl;external;

implementation

{ was #define dname def_expr }
function GI_TYPE_CALLABLE_INFO : longint; { return type might be wrong }
  begin
    GI_TYPE_CALLABLE_INFO:=gi_callable_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_CALLABLE_INFO(info : longint) : longint;
begin
  GI_CALLABLE_INFO:=G_TYPE_CHECK_INSTANCE_CAST(info,GI_TYPE_CALLABLE_INFO,GICallableInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_IS_CALLABLE_INFO(info : longint) : longint;
begin
  GI_IS_CALLABLE_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(info,GI_TYPE_CALLABLE_INFO);
end;


end.
