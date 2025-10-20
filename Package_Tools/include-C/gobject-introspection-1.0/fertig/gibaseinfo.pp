
unit gibaseinfo;
interface

{
  Automatically converted by H2Pas 1.0.0 from gibaseinfo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gibaseinfo.h
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
PGIAttributeIter  = ^GIAttributeIter;
PGIBaseInfo  = ^GIBaseInfo;
PGITypelib  = ^GITypelib;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: GIBaseInfo
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
{$ifndef __GIBASEINFO_H__}
{$define __GIBASEINFO_H__}
{$if !defined (__GIREPOSITORY_H_INSIDE__) && !defined (GI_COMPILATION)}
{$error "Only <girepository.h> can be included directly."}
{$endif}
{$include <glib-object.h>}
{$include <gitypelib.h>}
{$include <gitypes.h>}
{*
 * GIAttributeIter:
 *
 * An opaque structure used to iterate over attributes
 * in a #GIBaseInfo struct.
  }
{< private > }
type
  PGIAttributeIter = ^TGIAttributeIter;
  TGIAttributeIter = record
      data : Tgpointer;
      data2 : Tgpointer;
      data3 : Tgpointer;
      data4 : Tgpointer;
    end;

{ was #define dname def_expr }
function GI_TYPE_BASE_INFO : longint; { return type might be wrong }

function g_base_info_gtype_get_type:TGType;cdecl;external;
function g_base_info_ref(info:PGIBaseInfo):PGIBaseInfo;cdecl;external;
procedure g_base_info_unref(info:PGIBaseInfo);cdecl;external;
function g_base_info_get_type(info:PGIBaseInfo):TGIInfoType;cdecl;external;
(* Const before type ignored *)
function g_base_info_get_name(info:PGIBaseInfo):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_base_info_get_namespace(info:PGIBaseInfo):Pgchar;cdecl;external;
function g_base_info_is_deprecated(info:PGIBaseInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_base_info_get_attribute(info:PGIBaseInfo; name:Pgchar):Pgchar;cdecl;external;
function g_base_info_iterate_attributes(info:PGIBaseInfo; iterator:PGIAttributeIter; name:PPchar; value:PPchar):Tgboolean;cdecl;external;
function g_base_info_get_container(info:PGIBaseInfo):PGIBaseInfo;cdecl;external;
function g_base_info_get_typelib(info:PGIBaseInfo):PGITypelib;cdecl;external;
function g_base_info_equal(info1:PGIBaseInfo; info2:PGIBaseInfo):Tgboolean;cdecl;external;
function g_info_new(_type:TGIInfoType; container:PGIBaseInfo; typelib:PGITypelib; offset:Tguint32):PGIBaseInfo;cdecl;external;
{$endif}
{ __GIBASEINFO_H__  }

implementation

{ was #define dname def_expr }
function GI_TYPE_BASE_INFO : longint; { return type might be wrong }
  begin
    GI_TYPE_BASE_INFO:=g_base_info_gtype_get_type;
  end;


end.
