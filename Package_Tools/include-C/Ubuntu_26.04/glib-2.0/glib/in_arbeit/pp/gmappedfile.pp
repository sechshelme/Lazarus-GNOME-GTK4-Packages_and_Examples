
unit gmappedfile;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmappedfile.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmappedfile.h
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
PGBytes  = ^GBytes;
Pgchar  = ^gchar;
PGError  = ^GError;
PGMappedFile  = ^GMappedFile;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GLIB - Library of useful routines for C programming
 * gmappedfile.h: Simplified wrapper around the mmap function
 *
 * Copyright 2005 Matthias Clasen
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef __G_MAPPED_FILE_H__}
{$define __G_MAPPED_FILE_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gbytes.h>}
{$include <glib/gerror.h>}
type
(* Const before type ignored *)

function g_mapped_file_new(filename:Pgchar; writable:Tgboolean; error:PPGError):PGMappedFile;cdecl;external;
function g_mapped_file_new_from_fd(fd:Tgint; writable:Tgboolean; error:PPGError):PGMappedFile;cdecl;external;
function g_mapped_file_get_length(file:PGMappedFile):Tgsize;cdecl;external;
function g_mapped_file_get_contents(file:PGMappedFile):Pgchar;cdecl;external;
function g_mapped_file_get_bytes(file:PGMappedFile):PGBytes;cdecl;external;
function g_mapped_file_ref(file:PGMappedFile):PGMappedFile;cdecl;external;
procedure g_mapped_file_unref(file:PGMappedFile);cdecl;external;
{xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxGLIB_DEPRECATED_FOR(g_mapped_file_unref) }
procedure g_mapped_file_free(file:PGMappedFile);cdecl;external;
{$endif}
{ __G_MAPPED_FILE_H__  }

implementation


end.
