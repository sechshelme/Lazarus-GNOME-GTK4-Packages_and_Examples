
unit giconstantinfo;
interface

{
  Automatically converted by H2Pas 1.0.0 from giconstantinfo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    giconstantinfo.h
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
PGIArgument  = ^GIArgument;
PGIBaseInfo  = ^GIBaseInfo;
PGIConstantInfo  = ^GIConstantInfo;
PGITypeInfo  = ^GITypeInfo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Constant
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
{$ifndef __GICONSTANTINFO_H__}
{$define __GICONSTANTINFO_H__}
{$if !defined (__GIREPOSITORY_H_INSIDE__) && !defined (GI_COMPILATION)}
{$error "Only <girepository.h> can be included directly."}
{$endif}
{$include <gitypes.h>}
{*
 * GI_IS_CONSTANT_INFO
 * @info: an info structure
 *
 * Checks if @info is a #GIConstantInfo.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GI_IS_CONSTANT_INFO(info : longint) : longint;

function g_constant_info_get_type(info:PGIConstantInfo):PGITypeInfo;cdecl;external;
procedure g_constant_info_free_value(info:PGIConstantInfo; value:PGIArgument);cdecl;external;
function g_constant_info_get_value(info:PGIConstantInfo; value:PGIArgument):Tgint;cdecl;external;
{$endif}
{ __GICONSTANTINFO_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_IS_CONSTANT_INFO(info : longint) : longint;
begin
  GI_IS_CONSTANT_INFO:=(g_base_info_get_type(PGIBaseInfo(info)))=GI_INFO_TYPE_CONSTANT;
end;


end.
