
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
Pgchar  = ^gchar;
PGError  = ^GError;
PGIArgument  = ^GIArgument;
PGIBaseInfo  = ^GIBaseInfo;
PGIFunctionInfo  = ^GIFunctionInfo;
PGInvokeError  = ^GInvokeError;
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
{$ifndef __GIFUNCTIONINFO_H__}
{$define __GIFUNCTIONINFO_H__}
{$if !defined (__GIREPOSITORY_H_INSIDE__) && !defined (GI_COMPILATION)}
{$error "Only <girepository.h> can be included directly."}
{$endif}
{$include <gitypes.h>}
{*
 * GI_IS_FUNCTION_INFO
 * @info: an info structure
 *
 * Checks if @info is a #GIFunctionInfo.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GI_IS_FUNCTION_INFO(info : longint) : longint;

(* Const before type ignored *)
function g_function_info_get_symbol(info:PGIFunctionInfo):Pgchar;cdecl;external;
function g_function_info_get_flags(info:PGIFunctionInfo):TGIFunctionInfoFlags;cdecl;external;
function g_function_info_get_property(info:PGIFunctionInfo):PGIPropertyInfo;cdecl;external;
function g_function_info_get_vfunc(info:PGIFunctionInfo):PGIVFuncInfo;cdecl;external;
{*
 * G_INVOKE_ERROR:
 *
 * TODO
  }
{ was #define dname def_expr }
function G_INVOKE_ERROR : longint; { return type might be wrong }

function g_invoke_error_quark:TGQuark;cdecl;external;
{*
 * GInvokeError:
 * @G_INVOKE_ERROR_FAILED: invokation failed, unknown error.
 * @G_INVOKE_ERROR_SYMBOL_NOT_FOUND: symbol couldn't be found in any of the
 * libraries associated with the typelib of the function.
 * @G_INVOKE_ERROR_ARGUMENT_MISMATCH: the arguments provided didn't match
 * the expected arguments for the functions type signature.
 *
 * An error occuring while invoking a function via
 * g_function_info_invoke().
  }
type
  PGInvokeError = ^TGInvokeError;
  TGInvokeError =  Longint;
  Const
    G_INVOKE_ERROR_FAILED = 0;
    G_INVOKE_ERROR_SYMBOL_NOT_FOUND = 1;
    G_INVOKE_ERROR_ARGUMENT_MISMATCH = 2;
;
(* Const before type ignored *)
(* Const before type ignored *)

function g_function_info_invoke(info:PGIFunctionInfo; in_args:PGIArgument; n_in_args:longint; out_args:PGIArgument; n_out_args:longint; 
           return_value:PGIArgument; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __GIFUNCTIONINFO_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_IS_FUNCTION_INFO(info : longint) : longint;
begin
  GI_IS_FUNCTION_INFO:=(g_base_info_get_type(PGIBaseInfo(info)))=GI_INFO_TYPE_FUNCTION;
end;

{ was #define dname def_expr }
function G_INVOKE_ERROR : longint; { return type might be wrong }
  begin
    G_INVOKE_ERROR:=g_invoke_error_quark;
  end;


end.
