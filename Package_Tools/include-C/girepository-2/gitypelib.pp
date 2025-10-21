
unit gitypelib;
interface

{
  Automatically converted by H2Pas 1.0.0 from gitypelib.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gitypelib.h
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
PGBytes  = ^GBytes;
PGError  = ^GError;
PGITypelib  = ^GITypelib;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Public typelib API
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
{$include <glib.h>}
{$include <girepository/gi-visibility.h>}
type

{ was #define dname def_expr }
function GI_TYPE_TYPELIB : longint; { return type might be wrong }

function gi_typelib_get_type:TGType;cdecl;external;
function gi_typelib_new_from_bytes(bytes:PGBytes; error:PPGError):PGITypelib;cdecl;external;
function gi_typelib_ref(typelib:PGITypelib):PGITypelib;cdecl;external;
procedure gi_typelib_unref(typelib:PGITypelib);cdecl;external;
(* Const before type ignored *)
function gi_typelib_symbol(typelib:PGITypelib; symbol_name:Pchar; symbol:Ppointer):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gi_typelib_get_namespace(typelib:PGITypelib):Pchar;cdecl;external;

implementation

{ was #define dname def_expr }
function GI_TYPE_TYPELIB : longint; { return type might be wrong }
  begin
    GI_TYPE_TYPELIB:=gi_typelib_get_type;
  end;


end.
