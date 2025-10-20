
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
Pgpointer  = ^gpointer;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Helper functions for ffi integration
 *
 * Copyright (C) 2008 Red Hat, Inc
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
{$ifndef __GIRFFI_H__}
{$define __GIRFFI_H__}
{$include <ffi.h>}
{$include "girepository.h"}
{*
 * GIFFIClosureCallback:
 * @Param1: TODO
 * @Param2: TODO
 * @Param3: TODO
 * @Param4: TODO
 *
 * TODO
  }
type

  TGIFFIClosureCallback = procedure (para1:Pffi_cif; para2:pointer; para3:Ppointer; para4:pointer);cdecl;
{*
 * GIFunctionInvoker:
 * @cif: the cif
 * @native_address: the native address
 *
 * TODO
  }
{< private > }
  PGIFunctionInvoker = ^TGIFunctionInvoker;
  TGIFunctionInvoker = record
      cif : Tffi_cif;cdecl;
      native_address : Tgpointer;
      padding : array[0..2] of Tgpointer;
    end;

{*
 * GIFFIReturnValue:
 *
 * TODO
  }

  PGIFFIReturnValue = ^TGIFFIReturnValue;
  TGIFFIReturnValue = TGIArgument;

function gi_type_tag_get_ffi_type(type_tag:TGITypeTag; is_pointer:Tgboolean):Pffi_type;cdecl;external;
function g_type_info_get_ffi_type(info:PGITypeInfo):Pffi_type;cdecl;external;
procedure gi_type_info_extract_ffi_return_value(return_info:PGITypeInfo; ffi_value:PGIFFIReturnValue; arg:PGIArgument);cdecl;external;
procedure gi_type_tag_extract_ffi_return_value(return_tag:TGITypeTag; interface_type:TGIInfoType; ffi_value:PGIFFIReturnValue; arg:PGIArgument);cdecl;external;
function g_function_info_prep_invoker(info:PGIFunctionInfo; invoker:PGIFunctionInvoker; error:PPGError):Tgboolean;cdecl;external;
function g_function_invoker_new_for_address(addr:Tgpointer; info:PGICallableInfo; invoker:PGIFunctionInvoker; error:PPGError):Tgboolean;cdecl;external;
procedure g_function_invoker_destroy(invoker:PGIFunctionInvoker);cdecl;external;
{xxxxx GI_DEPRECATED_IN_1_72_FOR(g_callable_info_create_closure) }
function g_callable_info_prepare_closure(callable_info:PGICallableInfo; cif:Pffi_cif; callback:TGIFFIClosureCallback; user_data:Tgpointer):Pffi_closure;cdecl;external;
{xxxxxxxxxxx GI_DEPRECATED_IN_1_72_FOR(g_callable_info_destroy_closure) }
procedure g_callable_info_free_closure(callable_info:PGICallableInfo; closure:Pffi_closure);cdecl;external;
function g_callable_info_create_closure(callable_info:PGICallableInfo; cif:Pffi_cif; callback:TGIFFIClosureCallback; user_data:Tgpointer):Pffi_closure;cdecl;external;
function g_callable_info_get_closure_native_address(callable_info:PGICallableInfo; closure:Pffi_closure):Pgpointer;cdecl;external;
procedure g_callable_info_destroy_closure(callable_info:PGICallableInfo; closure:Pffi_closure);cdecl;external;
{$endif}
{ __GIRFFI_H__  }

implementation


end.
