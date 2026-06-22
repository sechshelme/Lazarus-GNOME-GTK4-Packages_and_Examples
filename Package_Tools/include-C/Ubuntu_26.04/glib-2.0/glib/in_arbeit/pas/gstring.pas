unit gstring;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GLIB - Library of useful routines for C programming
 * Copyright (C) 1995-1997  Peter Mattis, Spencer Kimball and Josh MacDonald
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
{
 * Modified by the GLib Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GLib Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GLib at ftp://ftp.gtk.org/pub/gtk/.
  }
{$ifndef __G_STRING_H__}
{$define __G_STRING_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}
{$include <glib/gunicode.h>}
{$include <glib/gbytes.h>}
{$include <glib/gstrfuncs.h>}
{$include <glib/gutils.h>  /* for G_CAN_INLINE */}
{$include <string.h>}
type
  PGString = ^TGString;
  TGString = record
      str : Pgchar;
      len : Tgsize;
      allocated_len : Tgsize;
    end;


function g_string_new(init:Pgchar):PGString;cdecl;external libglib2;
function g_string_new_take(init:Pgchar):PGString;cdecl;external libglib2;
function g_string_new_len(init:Pgchar; len:Tgssize):PGString;cdecl;external libglib2;
function g_string_sized_new(dfl_size:Tgsize):PGString;cdecl;external libglib2;
function g_string_copy(_string:PGString):PGString;cdecl;external libglib2;
function g_string_free(_string:PGString; free_segment:Tgboolean):Pgchar;cdecl;external libglib2;
function g_string_free_and_steal(_string:PGString):Pgchar;cdecl;external libglib2;
function g_string_free_to_bytes(_string:PGString):PGBytes;cdecl;external libglib2;
function g_string_equal(v:PGString; v2:PGString):Tgboolean;cdecl;external libglib2;
function g_string_hash(str:PGString):Tguint;cdecl;external libglib2;
function g_string_assign(_string:PGString; rval:Pgchar):PGString;cdecl;external libglib2;
function g_string_truncate(_string:PGString; len:Tgsize):PGString;cdecl;external libglib2;
function g_string_set_size(_string:PGString; len:Tgsize):PGString;cdecl;external libglib2;
function g_string_insert_len(_string:PGString; pos:Tgssize; val:Pgchar; len:Tgssize):PGString;cdecl;external libglib2;
function g_string_append(_string:PGString; val:Pgchar):PGString;cdecl;external libglib2;
function g_string_append_len(_string:PGString; val:Pgchar; len:Tgssize):PGString;cdecl;external libglib2;
function g_string_append_c(_string:PGString; c:Tgchar):PGString;cdecl;external libglib2;
function g_string_append_unichar(_string:PGString; wc:Tgunichar):PGString;cdecl;external libglib2;
function g_string_prepend(_string:PGString; val:Pgchar):PGString;cdecl;external libglib2;
function g_string_prepend_c(_string:PGString; c:Tgchar):PGString;cdecl;external libglib2;
function g_string_prepend_unichar(_string:PGString; wc:Tgunichar):PGString;cdecl;external libglib2;
function g_string_prepend_len(_string:PGString; val:Pgchar; len:Tgssize):PGString;cdecl;external libglib2;
function g_string_insert(_string:PGString; pos:Tgssize; val:Pgchar):PGString;cdecl;external libglib2;
function g_string_insert_c(_string:PGString; pos:Tgssize; c:Tgchar):PGString;cdecl;external libglib2;
function g_string_insert_unichar(_string:PGString; pos:Tgssize; wc:Tgunichar):PGString;cdecl;external libglib2;
function g_string_overwrite(_string:PGString; pos:Tgsize; val:Pgchar):PGString;cdecl;external libglib2;
function g_string_overwrite_len(_string:PGString; pos:Tgsize; val:Pgchar; len:Tgssize):PGString;cdecl;external libglib2;
function g_string_erase(_string:PGString; pos:Tgssize; len:Tgssize):PGString;cdecl;external libglib2;
function g_string_replace(_string:PGString; find:Pgchar; replace:Pgchar; limit:Tguint):Tguint;cdecl;external libglib2;
function g_string_ascii_down(_string:PGString):PGString;cdecl;external libglib2;
function g_string_ascii_up(_string:PGString):PGString;cdecl;external libglib2;
procedure g_string_vprintf(_string:PGString; format:Pgchar; args:Tva_list);cdecl;external libglib2;
procedure g_string_printf(_string:PGString; format:Pgchar; args:array of const);cdecl;external libglib2;
procedure g_string_printf(_string:PGString; format:Pgchar);cdecl;external libglib2;
procedure g_string_append_vprintf(_string:PGString; format:Pgchar; args:Tva_list);cdecl;external libglib2;
procedure g_string_append_printf(_string:PGString; format:Pgchar; args:array of const);cdecl;external libglib2;
procedure g_string_append_printf(_string:PGString; format:Pgchar);cdecl;external libglib2;
function g_string_append_uri_escaped(_string:PGString; unescaped:Pgchar; reserved_chars_allowed:Pgchar; allow_utf8:Tgboolean):PGString;cdecl;external libglib2;
function g_string_down(_string:PGString):PGString;cdecl;external libglib2;
function g_string_up(_string:PGString):PGString;cdecl;external libglib2;
{$endif}
{ __G_STRING_H__  }

// === Konventiert am: 22-6-26 19:40:10 ===


implementation



end.
