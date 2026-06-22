unit gsequence;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GLIB - Library of useful routines for C programming
 * Copyright (C) 2002, 2003, 2004, 2005, 2006, 2007
 * Soeren Sandmann (sandmann@daimi.au.dk)
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
{$ifndef __G_SEQUENCE_H__}
{$define __G_SEQUENCE_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}
type
  TGSequenceNode = TGSequenceIter;

  TGSequenceIterCompareFunc = function (a:PGSequenceIter; b:PGSequenceIter; data:Tgpointer):Tgint;cdecl;
{ GSequence  }

function g_sequence_new(data_destroy:TGDestroyNotify):PGSequence;cdecl;external libglib2;
procedure g_sequence_free(seq:PGSequence);cdecl;external libglib2;
function g_sequence_get_length(seq:PGSequence):Tgint;cdecl;external libglib2;
procedure g_sequence_foreach(seq:PGSequence; func:TGFunc; user_data:Tgpointer);cdecl;external libglib2;
procedure g_sequence_foreach_range(begin:PGSequenceIter; end:PGSequenceIter; func:TGFunc; user_data:Tgpointer);cdecl;external libglib2;
procedure g_sequence_sort(seq:PGSequence; cmp_func:TGCompareDataFunc; cmp_data:Tgpointer);cdecl;external libglib2;
procedure g_sequence_sort_iter(seq:PGSequence; cmp_func:TGSequenceIterCompareFunc; cmp_data:Tgpointer);cdecl;external libglib2;
function g_sequence_is_empty(seq:PGSequence):Tgboolean;cdecl;external libglib2;
{ Getting iters  }
function g_sequence_get_begin_iter(seq:PGSequence):PGSequenceIter;cdecl;external libglib2;
function g_sequence_get_end_iter(seq:PGSequence):PGSequenceIter;cdecl;external libglib2;
function g_sequence_get_iter_at_pos(seq:PGSequence; pos:Tgint):PGSequenceIter;cdecl;external libglib2;
function g_sequence_append(seq:PGSequence; data:Tgpointer):PGSequenceIter;cdecl;external libglib2;
function g_sequence_prepend(seq:PGSequence; data:Tgpointer):PGSequenceIter;cdecl;external libglib2;
function g_sequence_insert_before(iter:PGSequenceIter; data:Tgpointer):PGSequenceIter;cdecl;external libglib2;
procedure g_sequence_move(src:PGSequenceIter; dest:PGSequenceIter);cdecl;external libglib2;
procedure g_sequence_swap(a:PGSequenceIter; b:PGSequenceIter);cdecl;external libglib2;
function g_sequence_insert_sorted(seq:PGSequence; data:Tgpointer; cmp_func:TGCompareDataFunc; cmp_data:Tgpointer):PGSequenceIter;cdecl;external libglib2;
function g_sequence_insert_sorted_iter(seq:PGSequence; data:Tgpointer; iter_cmp:TGSequenceIterCompareFunc; cmp_data:Tgpointer):PGSequenceIter;cdecl;external libglib2;
procedure g_sequence_sort_changed(iter:PGSequenceIter; cmp_func:TGCompareDataFunc; cmp_data:Tgpointer);cdecl;external libglib2;
procedure g_sequence_sort_changed_iter(iter:PGSequenceIter; iter_cmp:TGSequenceIterCompareFunc; cmp_data:Tgpointer);cdecl;external libglib2;
procedure g_sequence_remove(iter:PGSequenceIter);cdecl;external libglib2;
procedure g_sequence_remove_range(begin:PGSequenceIter; end:PGSequenceIter);cdecl;external libglib2;
procedure g_sequence_move_range(dest:PGSequenceIter; begin:PGSequenceIter; end:PGSequenceIter);cdecl;external libglib2;
function g_sequence_search(seq:PGSequence; data:Tgpointer; cmp_func:TGCompareDataFunc; cmp_data:Tgpointer):PGSequenceIter;cdecl;external libglib2;
function g_sequence_search_iter(seq:PGSequence; data:Tgpointer; iter_cmp:TGSequenceIterCompareFunc; cmp_data:Tgpointer):PGSequenceIter;cdecl;external libglib2;
function g_sequence_lookup(seq:PGSequence; data:Tgpointer; cmp_func:TGCompareDataFunc; cmp_data:Tgpointer):PGSequenceIter;cdecl;external libglib2;
function g_sequence_lookup_iter(seq:PGSequence; data:Tgpointer; iter_cmp:TGSequenceIterCompareFunc; cmp_data:Tgpointer):PGSequenceIter;cdecl;external libglib2;
{ Dereferencing  }
function g_sequence_get(iter:PGSequenceIter):Tgpointer;cdecl;external libglib2;
procedure g_sequence_set(iter:PGSequenceIter; data:Tgpointer);cdecl;external libglib2;
{ Operations on GSequenceIter *  }
function g_sequence_iter_is_begin(iter:PGSequenceIter):Tgboolean;cdecl;external libglib2;
function g_sequence_iter_is_end(iter:PGSequenceIter):Tgboolean;cdecl;external libglib2;
function g_sequence_iter_next(iter:PGSequenceIter):PGSequenceIter;cdecl;external libglib2;
function g_sequence_iter_prev(iter:PGSequenceIter):PGSequenceIter;cdecl;external libglib2;
function g_sequence_iter_get_position(iter:PGSequenceIter):Tgint;cdecl;external libglib2;
function g_sequence_iter_move(iter:PGSequenceIter; delta:Tgint):PGSequenceIter;cdecl;external libglib2;
function g_sequence_iter_get_sequence(iter:PGSequenceIter):PGSequence;cdecl;external libglib2;
{ Search  }
function g_sequence_iter_compare(a:PGSequenceIter; b:PGSequenceIter):Tgint;cdecl;external libglib2;
function g_sequence_range_get_midpoint(begin:PGSequenceIter; end:PGSequenceIter):PGSequenceIter;cdecl;external libglib2;
{$endif}
{ __G_SEQUENCE_H__  }

// === Konventiert am: 22-6-26 19:22:49 ===


implementation



end.
