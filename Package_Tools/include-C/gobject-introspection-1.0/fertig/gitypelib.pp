
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
Pgchar  = ^gchar;
PGError  = ^GError;
PGITypelib  = ^GITypelib;
PGMappedFile  = ^GMappedFile;
Pgpointer  = ^gpointer;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Public typelib API
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
{$ifndef __GITYPELIB_H__}
{$define __GITYPELIB_H__}
{$if !defined (__GIREPOSITORY_H_INSIDE__) && !defined (GI_COMPILATION)}
{$error "Only <girepository.h> can be included directly."}
{$endif}
{$include <glib.h>}
{$include <giversionmacros.h>}
{*
 * SECTION:gitypelib
 * @title: GITypelib
 * @short_description: TODO
 *
 * TODO
  }
{*
 * GITypelib:
 *
 * TODO
  }
type

function g_typelib_new_from_memory(memory:Pguint8; len:Tgsize; error:PPGError):PGITypelib;cdecl;external;
(* Const before type ignored *)
function g_typelib_new_from_const_memory(memory:Pguint8; len:Tgsize; error:PPGError):PGITypelib;cdecl;external;
function g_typelib_new_from_mapped_file(mfile:PGMappedFile; error:PPGError):PGITypelib;cdecl;external;
procedure g_typelib_free(typelib:PGITypelib);cdecl;external;
(* Const before type ignored *)
function g_typelib_symbol(typelib:PGITypelib; symbol_name:Pgchar; symbol:Pgpointer):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_typelib_get_namespace(typelib:PGITypelib):Pgchar;cdecl;external;
{$endif}
{ __GITYPELIB_H__  }

implementation


end.
