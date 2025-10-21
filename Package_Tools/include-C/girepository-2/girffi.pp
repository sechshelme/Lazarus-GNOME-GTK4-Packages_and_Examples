
unit girffi;
interface

{
  Automatically converted by H2Pas 1.0.0 from girffi.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    girffi.h
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
Pffi_cif  = ^ffi_cif;
Pffi_closure  = ^ffi_closure;
Pffi_type  = ^ffi_type;
PGError  = ^GError;
PGIArgument  = ^GIArgument;
PGICallableInfo  = ^GICallableInfo;
PGIFFIReturnValue  = ^GIFFIReturnValue;
PGIFunctionInfo  = ^GIFunctionInfo;
PGIFunctionInvoker  = ^GIFunctionInvoker;
PGITypeInfo  = ^GITypeInfo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Helper functions for ffi integration
 *
 * Copyright (C) 2008 Red Hat, Inc
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
{$include <ffi.h>}
{$include "girepository.h"}
{*
 * GIFFIClosureCallback:
 * @cif: the `ffi_cif` passed to
 *   [method@GIRepository.CallableInfo.create_closure]
 * @ret: (out caller-allocates): a pointer to the memory used for the function’s
 *   return value
 * @args: a vector of pointers to memory holding the arguments to the function
 * @user_data: the user data passed to
 *   [method@GIRepository.CallableInfo.create_closure]
 *
 * The function which will be called when a closure created with
 * [method@GIRepository.CallableInfo.create_closure] is invoked.
 *
 * The value of @ret is undefined if the function returns `void`.
 *
 * Since: 2.80
  }
type

  TGIFFIClosureCallback = procedure (cif:Pffi_cif; ret:pointer; args:Ppointer; user_data:pointer);cdecl;
{*
 * GIFunctionInvoker:
 * @cif: the cif
 * @native_address: the native address
 *
 * Structure containing the data necessary to invoke a callable function.
 *
 * Since: 2.80
  }
{< private > }

  PGIFunctionInvoker = ^TGIFunctionInvoker;
  TGIFunctionInvoker = record
      cif : Tffi_cif;
      native_address : pointer;
      padding : array[0..2] of pointer;
    end;
{*
 * GIFFIReturnValue:
 *
 * The type of a return value from a callable invocation closure.
 *
 * Since: 2.80
  }

  PGIFFIReturnValue = ^TGIFFIReturnValue;
  TGIFFIReturnValue = TGIArgument;

function gi_type_tag_get_ffi_type(type_tag:TGITypeTag; is_pointer:Tgboolean):Pffi_type;cdecl;external;
function gi_type_info_get_ffi_type(info:PGITypeInfo):Pffi_type;cdecl;external;
procedure gi_type_info_extract_ffi_return_value(return_info:PGITypeInfo; ffi_value:PGIFFIReturnValue; arg:PGIArgument);cdecl;external;
procedure gi_type_tag_extract_ffi_return_value(return_tag:TGITypeTag; interface_type:TGType; ffi_value:PGIFFIReturnValue; arg:PGIArgument);cdecl;external;
function gi_function_info_prep_invoker(info:PGIFunctionInfo; invoker:PGIFunctionInvoker; error:PPGError):Tgboolean;cdecl;external;
function gi_function_invoker_new_for_address(addr:pointer; info:PGICallableInfo; invoker:PGIFunctionInvoker; error:PPGError):Tgboolean;cdecl;external;
procedure gi_function_invoker_clear(invoker:PGIFunctionInvoker);cdecl;external;
function gi_callable_info_create_closure(callable_info:PGICallableInfo; cif:Pffi_cif; callback:TGIFFIClosureCallback; user_data:pointer):Pffi_closure;cdecl;external;
function gi_callable_info_get_closure_native_address(callable_info:PGICallableInfo; closure:Pffi_closure):^pointer;cdecl;external;
procedure gi_callable_info_destroy_closure(callable_info:PGICallableInfo; closure:Pffi_closure);cdecl;external;

implementation


end.
