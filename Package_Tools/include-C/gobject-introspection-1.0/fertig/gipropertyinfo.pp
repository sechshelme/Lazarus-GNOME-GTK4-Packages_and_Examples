
unit gipropertyinfo;
interface

{
  Automatically converted by H2Pas 1.0.0 from gipropertyinfo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gipropertyinfo.h
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
PGIBaseInfo  = ^GIBaseInfo;
PGIFunctionInfo  = ^GIFunctionInfo;
PGIPropertyInfo  = ^GIPropertyInfo;
PGITypeInfo  = ^GITypeInfo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Property
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
{$ifndef __GIPROPERTYINFO_H__}
{$define __GIPROPERTYINFO_H__}
{$if !defined (__GIREPOSITORY_H_INSIDE__) && !defined (GI_COMPILATION)}
{$error "Only <girepository.h> can be included directly."}
{$endif}
{$include <gitypes.h>}
{*
 * GI_IS_PROPERTY_INFO
 * @info: an info structure
 *
 * Checks if @info is a #GIPropertyInfo.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GI_IS_PROPERTY_INFO(info : longint) : longint;

function g_property_info_get_flags(info:PGIPropertyInfo):TGParamFlags;cdecl;external;
function g_property_info_get_type(info:PGIPropertyInfo):PGITypeInfo;cdecl;external;
function g_property_info_get_ownership_transfer(info:PGIPropertyInfo):TGITransfer;cdecl;external;
function g_property_info_get_setter(info:PGIPropertyInfo):PGIFunctionInfo;cdecl;external;
function g_property_info_get_getter(info:PGIPropertyInfo):PGIFunctionInfo;cdecl;external;
{$endif}
{ __GIPROPERTYINFO_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_IS_PROPERTY_INFO(info : longint) : longint;
begin
  GI_IS_PROPERTY_INFO:=(g_base_info_get_type(PGIBaseInfo(info)))=GI_INFO_TYPE_PROPERTY;
end;


end.
