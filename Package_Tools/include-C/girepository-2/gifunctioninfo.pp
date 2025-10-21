
unit gifunctioninfo;
interface

{
  Automatically converted by H2Pas 1.0.0 from gifunctioninfo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gifunctioninfo.h
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
PGIArgument  = ^GIArgument;
PGIFunctionInfo  = ^GIFunctionInfo;
PGIInvokeError  = ^GIInvokeError;
PGIPropertyInfo  = ^GIPropertyInfo;
PGIVFuncInfo  = ^GIVFuncInfo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Function
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
function GI_TYPE_FUNCTION_INFO : longint; { return type might be wrong }

{*
 * GI_FUNCTION_INFO:
 * @info: Info object which is subject to casting.
 *
 * Casts a [type@GIRepository.FunctionInfo] or derived pointer into a
 * `(GIFunctionInfo*)` pointer.
 *
 * Depending on the current debugging level, this function may invoke
 * certain runtime checks to identify invalid casts.
 *
 * Since: 2.80
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_FUNCTION_INFO(info : longint) : longint;

{*
 * GI_IS_FUNCTION_INFO:
 * @info: an info structure
 *
 * Checks if @info is a [class@GIRepository.FunctionInfo] (or a derived type).
 *
 * Since: 2.80
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_IS_FUNCTION_INFO(info : longint) : longint;

(* Const before type ignored *)
function gi_function_info_get_symbol(info:PGIFunctionInfo):Pchar;cdecl;external;
function gi_function_info_get_flags(info:PGIFunctionInfo):TGIFunctionInfoFlags;cdecl;external;
function gi_function_info_get_property(info:PGIFunctionInfo):PGIPropertyInfo;cdecl;external;
function gi_function_info_get_vfunc(info:PGIFunctionInfo):PGIVFuncInfo;cdecl;external;
{*
 * GI_INVOKE_ERROR:
 *
 * Type quark function for [enum@GIRepository.InvokeError].
 *
 * Since: 2.80
  }
{ was #define dname def_expr }
function GI_INVOKE_ERROR : longint; { return type might be wrong }

function gi_invoke_error_quark:TGQuark;cdecl;external;
{*
 * GIInvokeError:
 * @GI_INVOKE_ERROR_FAILED: invocation failed, unknown error.
 * @GI_INVOKE_ERROR_SYMBOL_NOT_FOUND: symbol couldn’t be found in any of the
 *   libraries associated with the typelib of the function.
 * @GI_INVOKE_ERROR_ARGUMENT_MISMATCH: the arguments provided didn’t match
 *   the expected arguments for the function’s type signature.
 *
 * An error occurring while invoking a function via
 * [method@GIRepository.FunctionInfo.invoke].
 *
 * Since: 2.80
  }
type
  PGIInvokeError = ^TGIInvokeError;
  TGIInvokeError =  Longint;
  Const
    GI_INVOKE_ERROR_FAILED = 0;
    GI_INVOKE_ERROR_SYMBOL_NOT_FOUND = 1;
    GI_INVOKE_ERROR_ARGUMENT_MISMATCH = 2;
;
(* Const before type ignored *)

function gi_function_info_invoke(info:PGIFunctionInfo; in_args:PGIArgument; n_in_args:Tsize_t; out_args:PGIArgument; n_out_args:Tsize_t; 
           return_value:PGIArgument; error:PPGError):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GI_TYPE_FUNCTION_INFO : longint; { return type might be wrong }
  begin
    GI_TYPE_FUNCTION_INFO:=gi_function_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_FUNCTION_INFO(info : longint) : longint;
begin
  GI_FUNCTION_INFO:=G_TYPE_CHECK_INSTANCE_CAST(info,GI_TYPE_FUNCTION_INFO,GIFunctionInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_IS_FUNCTION_INFO(info : longint) : longint;
begin
  GI_IS_FUNCTION_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(info,GI_TYPE_FUNCTION_INFO);
end;

{ was #define dname def_expr }
function GI_INVOKE_ERROR : longint; { return type might be wrong }
  begin
    GI_INVOKE_ERROR:=gi_invoke_error_quark;
  end;


end.
