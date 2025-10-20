
unit giregisteredtypeinfo;
interface

{
  Automatically converted by H2Pas 1.0.0 from giregisteredtypeinfo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    giregisteredtypeinfo.h
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
PGIRegisteredTypeInfo  = ^GIRegisteredTypeInfo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Registered Type
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
{$ifndef __GIREGISTEREDTYPEINFO_H__}
{$define __GIREGISTEREDTYPEINFO_H__}
{$if !defined (__GIREPOSITORY_H_INSIDE__) && !defined (GI_COMPILATION)}
{$error "Only <girepository.h> can be included directly."}
{$endif}
{$include <glib-object.h>}
{$include <gitypes.h>}
{*
 * GI_IS_REGISTERED_TYPE_INFO
 * @info: an info structure
 *
 * Checks if @info is a #GIRegisteredTypeInfo or derived from it.
  }
{ xxxxxxxxxxx
#define GI_IS_REGISTERED_TYPE_INFO(info) \
    ((g_base_info_get_type((GIBaseInfo*)info) == GI_INFO_TYPE_BOXED) || \
     (g_base_info_get_type((GIBaseInfo*)info) == GI_INFO_TYPE_ENUM) || \
     (g_base_info_get_type((GIBaseInfo*)info) == GI_INFO_TYPE_FLAGS) ||	\
     (g_base_info_get_type((GIBaseInfo*)info) == GI_INFO_TYPE_INTERFACE) || \
     (g_base_info_get_type((GIBaseInfo*)info) == GI_INFO_TYPE_OBJECT) || \
     (g_base_info_get_type((GIBaseInfo*)info) == GI_INFO_TYPE_STRUCT) || \
     (g_base_info_get_type((GIBaseInfo*)info) == GI_INFO_TYPE_UNION) || \
     (g_base_info_get_type((GIBaseInfo*)info) == GI_INFO_TYPE_BOXED))
 }
(* Const before type ignored *)

function g_registered_type_info_get_type_name(info:PGIRegisteredTypeInfo):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_registered_type_info_get_type_init(info:PGIRegisteredTypeInfo):Pgchar;cdecl;external;
function g_registered_type_info_get_g_type(info:PGIRegisteredTypeInfo):TGType;cdecl;external;
{$endif}
{ __GIREGISTEREDTYPEINFO_H__  }

implementation


end.
