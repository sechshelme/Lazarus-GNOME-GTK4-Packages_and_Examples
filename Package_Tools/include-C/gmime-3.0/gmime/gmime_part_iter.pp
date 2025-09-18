
unit gmime_part_iter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_part_iter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_part_iter.h
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
PGMimeObject  = ^GMimeObject;
PGMimePartIter  = ^GMimePartIter;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-  }
{  GMime
 *  Copyright (C) 2000-2022 Jeffrey Stedfast
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public License
 *  as published by the Free Software Foundation; either version 2.1
 *  of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free
 *  Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
 *  02110-1301, USA.
  }
{$ifndef __GMIME_PART_ITER_H__}
{$define __GMIME_PART_ITER_H__}
{$include <gmime/gmime-object.h>}

{ was #define dname def_expr }
function GMIME_TYPE_PART_ITER : longint; { return type might be wrong }

{*
 * GMimePartIter:
 *
 * A MIME part iterator.
 * }
type

function g_mime_part_iter_get_type:TGType;cdecl;external;
function g_mime_part_iter_new(toplevel:PGMimeObject):PGMimePartIter;cdecl;external;
procedure g_mime_part_iter_free(iter:PGMimePartIter);cdecl;external;
function g_mime_part_iter_clone(iter:PGMimePartIter):PGMimePartIter;cdecl;external;
procedure g_mime_part_iter_reset(iter:PGMimePartIter);cdecl;external;
(* Const before type ignored *)
function g_mime_part_iter_jump_to(iter:PGMimePartIter; path:Pchar):Tgboolean;cdecl;external;
function g_mime_part_iter_is_valid(iter:PGMimePartIter):Tgboolean;cdecl;external;
function g_mime_part_iter_next(iter:PGMimePartIter):Tgboolean;cdecl;external;
function g_mime_part_iter_prev(iter:PGMimePartIter):Tgboolean;cdecl;external;
function g_mime_part_iter_get_toplevel(iter:PGMimePartIter):PGMimeObject;cdecl;external;
function g_mime_part_iter_get_current(iter:PGMimePartIter):PGMimeObject;cdecl;external;
function g_mime_part_iter_get_parent(iter:PGMimePartIter):PGMimeObject;cdecl;external;
function g_mime_part_iter_get_path(iter:PGMimePartIter):Pchar;cdecl;external;
function g_mime_part_iter_replace(iter:PGMimePartIter; replacement:PGMimeObject):Tgboolean;cdecl;external;
function g_mime_part_iter_remove(iter:PGMimePartIter):Tgboolean;cdecl;external;
{$endif}
{ __GMIME_PART_ITER_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_PART_ITER : longint; { return type might be wrong }
  begin
    GMIME_TYPE_PART_ITER:=g_mime_part_iter_get_type;
  end;


end.
