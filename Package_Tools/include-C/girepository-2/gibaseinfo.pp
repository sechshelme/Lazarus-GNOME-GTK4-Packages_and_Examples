
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
{$include <glib-object.h>}
{$include <girepository/gitypelib.h>}
{$include <girepository/gitypes.h>}
{*
 * GIAttributeIter:
 *
 * An opaque structure used to iterate over attributes
 * in a [class@GIRepository.BaseInfo] struct.
 *
 * Since: 2.80
  }
{< private > }
type
  PGIAttributeIter = ^TGIAttributeIter;
  TGIAttributeIter = record
      data : pointer;
      _dummy : array[0..3] of pointer;
    end;
{*
 * GI_ATTRIBUTE_ITER_INIT:
 *
 * Initialise a stack-allocated [type@GIRepository.AttributeIter] to a value
 * suitable for passing to the first call to an ‘iterate’ function.
 *
 * Since: 2.80
  }
{ xxxxxxxx #define GI_ATTRIBUTE_ITER_INIT  NULL,  NULL,   }

{ was #define dname def_expr }
function GI_TYPE_BASE_INFO : longint; { return type might be wrong }

{*
 * GI_BASE_INFO:
 * @info: Info object which is subject to casting.
 *
 * Casts a [type@GIRepository.BaseInfo] or derived pointer into a
 * `(GIBaseInfo*)` pointer.
 *
 * Depending on the current debugging level, this function may invoke
 * certain runtime checks to identify invalid casts.
 *
 * Since: 2.80
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_BASE_INFO(info : longint) : longint;

{*
 * GI_IS_BASE_INFO:
 * @info: Instance to check for being a `GI_TYPE_BASE_INFO`.
 *
 * Checks whether a valid [type@GObject.TypeInstance] pointer is of type
 * `GI_TYPE_BASE_INFO` (or a derived type).
 *
 * Since: 2.80
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_IS_BASE_INFO(info : longint) : longint;

function gi_base_info_get_type:TGType;cdecl;external;
function gi_base_info_ref(info:pointer):PGIBaseInfo;cdecl;external;
procedure gi_base_info_unref(info:pointer);cdecl;external;
procedure gi_base_info_clear(info:pointer);cdecl;external;
(* Const before type ignored *)
function gi_base_info_get_name(info:PGIBaseInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function gi_base_info_get_namespace(info:PGIBaseInfo):Pchar;cdecl;external;
function gi_base_info_is_deprecated(info:PGIBaseInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gi_base_info_get_attribute(info:PGIBaseInfo; name:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gi_base_info_iterate_attributes(info:PGIBaseInfo; iterator:PGIAttributeIter; name:PPchar; value:PPchar):Tgboolean;cdecl;external;
function gi_base_info_get_container(info:PGIBaseInfo):PGIBaseInfo;cdecl;external;
function gi_base_info_get_typelib(info:PGIBaseInfo):PGITypelib;cdecl;external;
function gi_base_info_equal(info1:PGIBaseInfo; info2:PGIBaseInfo):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GI_TYPE_BASE_INFO : longint; { return type might be wrong }
  begin
    GI_TYPE_BASE_INFO:=gi_base_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_BASE_INFO(info : longint) : longint;
begin
  GI_BASE_INFO:=G_TYPE_CHECK_INSTANCE_CAST(info,GI_TYPE_BASE_INFO,GIBaseInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_IS_BASE_INFO(info : longint) : longint;
begin
  GI_IS_BASE_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(info,GI_TYPE_BASE_INFO);
end;


end.
