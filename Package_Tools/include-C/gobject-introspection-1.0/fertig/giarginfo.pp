
unit giarginfo;
interface

{
  Automatically converted by H2Pas 1.0.0 from giarginfo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    giarginfo.h
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
PGIArgInfo  = ^GIArgInfo;
PGIBaseInfo  = ^GIBaseInfo;
PGITypeInfo  = ^GITypeInfo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Argument
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
{$ifndef __GIARGINFO_H__}
{$define __GIARGINFO_H__}
{$if !defined (__GIREPOSITORY_H_INSIDE__) && !defined (GI_COMPILATION)}
{$error "Only <girepository.h> can be included directly."}
{$endif}
{$include <gitypes.h>}
{*
 * GI_IS_ARG_INFO
 * @info: an info structure
 *
 * Checks if @info is a GIArgInfo.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GI_IS_ARG_INFO(info : longint) : longint;

function g_arg_info_get_direction(info:PGIArgInfo):TGIDirection;cdecl;external;
function g_arg_info_is_return_value(info:PGIArgInfo):Tgboolean;cdecl;external;
function g_arg_info_is_optional(info:PGIArgInfo):Tgboolean;cdecl;external;
function g_arg_info_is_caller_allocates(info:PGIArgInfo):Tgboolean;cdecl;external;
function g_arg_info_may_be_null(info:PGIArgInfo):Tgboolean;cdecl;external;
function g_arg_info_is_skip(info:PGIArgInfo):Tgboolean;cdecl;external;
function g_arg_info_get_ownership_transfer(info:PGIArgInfo):TGITransfer;cdecl;external;
function g_arg_info_get_scope(info:PGIArgInfo):TGIScopeType;cdecl;external;
function g_arg_info_get_closure(info:PGIArgInfo):Tgint;cdecl;external;
function g_arg_info_get_destroy(info:PGIArgInfo):Tgint;cdecl;external;
function g_arg_info_get_type(info:PGIArgInfo):PGITypeInfo;cdecl;external;
procedure g_arg_info_load_type(info:PGIArgInfo; _type:PGITypeInfo);cdecl;external;
{$endif}
{ __GIARGINFO_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_IS_ARG_INFO(info : longint) : longint;
begin
  GI_IS_ARG_INFO:=(g_base_info_get_type(PGIBaseInfo(info)))=GI_INFO_TYPE_ARG;
end;


end.
