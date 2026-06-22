unit gdir;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GLIB - Library of useful routines for C programming
 * Copyright (C) 1995-1997  Peter Mattis, Spencer Kimball and Josh MacDonald
 *
 * gdir.c: Simplified wrapper around the DIRENT functions.
 *
 * Copyright 2001 Hans Breuer
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
{$ifndef __G_DIR_H__}
{$define __G_DIR_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gerror.h>}
{$ifdef G_OS_UNIX}
{$include <dirent.h>}
{$endif}
type

function g_dir_open(path:Pgchar; flags:Tguint; error:PPGError):PGDir;cdecl;external libglib2;
function g_dir_read_name(dir:PGDir):Pgchar;cdecl;external libglib2;
procedure g_dir_rewind(dir:PGDir);cdecl;external libglib2;
procedure g_dir_close(dir:PGDir);cdecl;external libglib2;
function g_dir_ref(dir:PGDir):PGDir;cdecl;external libglib2;
procedure g_dir_unref(dir:PGDir);cdecl;external libglib2;
{$endif}
{ __G_DIR_H__  }

// === Konventiert am: 22-6-26 16:17:18 ===


implementation



end.
