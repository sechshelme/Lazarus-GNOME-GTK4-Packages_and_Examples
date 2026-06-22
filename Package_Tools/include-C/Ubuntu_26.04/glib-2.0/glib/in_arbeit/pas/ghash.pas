unit ghash;

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
{$ifndef __G_HASH_H__}
{$define __G_HASH_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}
{$include <glib/garray.h>}
{$include <glib/glist.h>}
type

  TGHRFunc = function (key:Tgpointer; value:Tgpointer; user_data:Tgpointer):Tgboolean;cdecl;
{< private > }
  PGHashTableIter = ^TGHashTableIter;
  TGHashTableIter = record
      dummy1 : Tgpointer;cdecl;
      dummy2 : Tgpointer;
      dummy3 : Tgpointer;
      dummy4 : longint;
      dummy5 : Tgboolean;
      dummy6 : Tgpointer;
    end;


function g_hash_table_new(hash_func:TGHashFunc; key_equal_func:TGEqualFunc):PGHashTable;cdecl;external libglib2;
function g_hash_table_new_full(hash_func:TGHashFunc; key_equal_func:TGEqualFunc; key_destroy_func:TGDestroyNotify; value_destroy_func:TGDestroyNotify):PGHashTable;cdecl;external libglib2;
function g_hash_table_new_similar(other_hash_table:PGHashTable):PGHashTable;cdecl;external libglib2;
procedure g_hash_table_destroy(hash_table:PGHashTable);cdecl;external libglib2;
function g_hash_table_insert(hash_table:PGHashTable; key:Tgpointer; value:Tgpointer):Tgboolean;cdecl;external libglib2;
function g_hash_table_replace(hash_table:PGHashTable; key:Tgpointer; value:Tgpointer):Tgboolean;cdecl;external libglib2;
function g_hash_table_add(hash_table:PGHashTable; key:Tgpointer):Tgboolean;cdecl;external libglib2;
function g_hash_table_remove(hash_table:PGHashTable; key:Tgconstpointer):Tgboolean;cdecl;external libglib2;
procedure g_hash_table_remove_all(hash_table:PGHashTable);cdecl;external libglib2;
function g_hash_table_steal(hash_table:PGHashTable; key:Tgconstpointer):Tgboolean;cdecl;external libglib2;
function g_hash_table_steal_extended(hash_table:PGHashTable; lookup_key:Tgconstpointer; stolen_key:Pgpointer; stolen_value:Pgpointer):Tgboolean;cdecl;external libglib2;
procedure g_hash_table_steal_all(hash_table:PGHashTable);cdecl;external libglib2;
function g_hash_table_steal_all_keys(hash_table:PGHashTable):PGPtrArray;cdecl;external libglib2;
function g_hash_table_steal_all_values(hash_table:PGHashTable):PGPtrArray;cdecl;external libglib2;
function g_hash_table_lookup(hash_table:PGHashTable; key:Tgconstpointer):Tgpointer;cdecl;external libglib2;
function g_hash_table_contains(hash_table:PGHashTable; key:Tgconstpointer):Tgboolean;cdecl;external libglib2;
function g_hash_table_lookup_extended(hash_table:PGHashTable; lookup_key:Tgconstpointer; orig_key:Pgpointer; value:Pgpointer):Tgboolean;cdecl;external libglib2;
procedure g_hash_table_foreach(hash_table:PGHashTable; func:TGHFunc; user_data:Tgpointer);cdecl;external libglib2;
function g_hash_table_find(hash_table:PGHashTable; predicate:TGHRFunc; user_data:Tgpointer):Tgpointer;cdecl;external libglib2;
function g_hash_table_foreach_remove(hash_table:PGHashTable; func:TGHRFunc; user_data:Tgpointer):Tguint;cdecl;external libglib2;
function g_hash_table_foreach_steal(hash_table:PGHashTable; func:TGHRFunc; user_data:Tgpointer):Tguint;cdecl;external libglib2;
function g_hash_table_size(hash_table:PGHashTable):Tguint;cdecl;external libglib2;
function g_hash_table_get_keys(hash_table:PGHashTable):PGList;cdecl;external libglib2;
function g_hash_table_get_values(hash_table:PGHashTable):PGList;cdecl;external libglib2;
function g_hash_table_get_keys_as_array(hash_table:PGHashTable; length:Pguint):Pgpointer;cdecl;external libglib2;
function g_hash_table_get_keys_as_ptr_array(hash_table:PGHashTable):PGPtrArray;cdecl;external libglib2;
function g_hash_table_get_values_as_ptr_array(hash_table:PGHashTable):PGPtrArray;cdecl;external libglib2;
procedure g_hash_table_iter_init(iter:PGHashTableIter; hash_table:PGHashTable);cdecl;external libglib2;
function g_hash_table_iter_next(iter:PGHashTableIter; key:Pgpointer; value:Pgpointer):Tgboolean;cdecl;external libglib2;
function g_hash_table_iter_get_hash_table(iter:PGHashTableIter):PGHashTable;cdecl;external libglib2;
procedure g_hash_table_iter_remove(iter:PGHashTableIter);cdecl;external libglib2;
procedure g_hash_table_iter_replace(iter:PGHashTableIter; value:Tgpointer);cdecl;external libglib2;
procedure g_hash_table_iter_steal(iter:PGHashTableIter);cdecl;external libglib2;
function g_hash_table_ref(hash_table:PGHashTable):PGHashTable;cdecl;external libglib2;
procedure g_hash_table_unref(hash_table:PGHashTable);cdecl;external libglib2;
{ Hash Functions
  }
function g_str_equal(v1:Tgconstpointer; v2:Tgconstpointer):Tgboolean;cdecl;external libglib2;
function g_str_hash(v:Tgconstpointer):Tguint;cdecl;external libglib2;
function g_int_equal(v1:Tgconstpointer; v2:Tgconstpointer):Tgboolean;cdecl;external libglib2;
function g_int_hash(v:Tgconstpointer):Tguint;cdecl;external libglib2;
function g_int64_equal(v1:Tgconstpointer; v2:Tgconstpointer):Tgboolean;cdecl;external libglib2;
function g_int64_hash(v:Tgconstpointer):Tguint;cdecl;external libglib2;
function g_double_equal(v1:Tgconstpointer; v2:Tgconstpointer):Tgboolean;cdecl;external libglib2;
function g_double_hash(v:Tgconstpointer):Tguint;cdecl;external libglib2;
function g_direct_hash(v:Tgconstpointer):Tguint;cdecl;external libglib2;
function g_direct_equal(v1:Tgconstpointer; v2:Tgconstpointer):Tgboolean;cdecl;external libglib2;
{$endif}
{ __G_HASH_H__  }

// === Konventiert am: 22-6-26 16:17:30 ===


implementation



end.
