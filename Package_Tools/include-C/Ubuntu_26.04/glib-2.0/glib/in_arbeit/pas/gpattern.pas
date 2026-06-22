unit gpattern;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GLIB - Library of useful routines for C programming
 * Copyright (C) 1995-1997, 1999  Peter Mattis, Red Hat, Inc.
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
{$ifndef __G_PATTERN_H__}
{$define __G_PATTERN_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}
type

function g_pattern_spec_new(pattern:Pgchar):PGPatternSpec;cdecl;external libglib2;
procedure g_pattern_spec_free(pspec:PGPatternSpec);cdecl;external libglib2;
function g_pattern_spec_copy(pspec:PGPatternSpec):PGPatternSpec;cdecl;external libglib2;
function g_pattern_spec_equal(pspec1:PGPatternSpec; pspec2:PGPatternSpec):Tgboolean;cdecl;external libglib2;
function g_pattern_spec_match(pspec:PGPatternSpec; string_length:Tgsize; _string:Pgchar; string_reversed:Pgchar):Tgboolean;cdecl;external libglib2;
function g_pattern_spec_match_string(pspec:PGPatternSpec; _string:Pgchar):Tgboolean;cdecl;external libglib2;
{xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_70_FOR (g_pattern_spec_match) }
function g_pattern_match(pspec:PGPatternSpec; string_length:Tguint; _string:Pgchar; string_reversed:Pgchar):Tgboolean;cdecl;external libglib2;
{xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_70_FOR (g_pattern_spec_match_string) }
function g_pattern_match_string(pspec:PGPatternSpec; _string:Pgchar):Tgboolean;cdecl;external libglib2;
function g_pattern_match_simple(pattern:Pgchar; _string:Pgchar):Tgboolean;cdecl;external libglib2;
{$endif}
{ __G_PATTERN_H__  }

// === Konventiert am: 22-6-26 17:16:39 ===


implementation



end.
