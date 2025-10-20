
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
Pgchar  = ^gchar;
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
{$ifndef __GICALLABLEINFO_H__}
{$define __GICALLABLEINFO_H__}
{$if !defined (__GIREPOSITORY_H_INSIDE__) && !defined (GI_COMPILATION)}
{$error "Only <girepository.h> can be included directly."}
{$endif}
{$include <gitypes.h>}
{*
 * GI_IS_CALLABLE_INFO
 * @info: an info structure
 *
 * Checks if @info is a #GICallableInfo or derived from it.
  }
{ xxxxxxxxxxx
#define GI_IS_CALLABLE_INFO(info)					\
    ((g_base_info_get_type((GIBaseInfo*)info) == GI_INFO_TYPE_FUNCTION) || \
     (g_base_info_get_type((GIBaseInfo*)info) == GI_INFO_TYPE_CALLBACK) || \
     (g_base_info_get_type((GIBaseInfo*)info) == GI_INFO_TYPE_SIGNAL) || \
     (g_base_info_get_type((GIBaseInfo*)info) == GI_INFO_TYPE_VFUNC))
 }

function g_callable_info_is_method(info:PGICallableInfo):Tgboolean;cdecl;external;
function g_callable_info_can_throw_gerror(info:PGICallableInfo):Tgboolean;cdecl;external;
function g_callable_info_get_return_type(info:PGICallableInfo):PGITypeInfo;cdecl;external;
procedure g_callable_info_load_return_type(info:PGICallableInfo; _type:PGITypeInfo);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_callable_info_get_return_attribute(info:PGICallableInfo; name:Pgchar):Pgchar;cdecl;external;
function g_callable_info_iterate_return_attributes(info:PGICallableInfo; iterator:PGIAttributeIter; name:PPchar; value:PPchar):Tgboolean;cdecl;external;
function g_callable_info_get_caller_owns(info:PGICallableInfo):TGITransfer;cdecl;external;
function g_callable_info_may_return_null(info:PGICallableInfo):Tgboolean;cdecl;external;
function g_callable_info_skip_return(info:PGICallableInfo):Tgboolean;cdecl;external;
function g_callable_info_get_n_args(info:PGICallableInfo):Tgint;cdecl;external;
function g_callable_info_get_arg(info:PGICallableInfo; n:Tgint):PGIArgInfo;cdecl;external;
procedure g_callable_info_load_arg(info:PGICallableInfo; n:Tgint; arg:PGIArgInfo);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_callable_info_invoke(info:PGICallableInfo; _function:Tgpointer; in_args:PGIArgument; n_in_args:longint; out_args:PGIArgument; 
           n_out_args:longint; return_value:PGIArgument; is_method:Tgboolean; throws:Tgboolean; error:PPGError):Tgboolean;cdecl;external;
function g_callable_info_get_instance_ownership_transfer(info:PGICallableInfo):TGITransfer;cdecl;external;
{$endif}
{ __GICALLABLEINFO_H__  }

implementation


end.
