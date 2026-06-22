unit gqueue;

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
{$ifndef __G_QUEUE_H__}
{$define __G_QUEUE_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/glist.h>}
type
{*
 * GQueue:
 * @head: a pointer to the first element of the queue
 * @tail: a pointer to the last element of the queue
 * @length: the number of elements in the queue
 *
 * Contains the public fields of a
 * [Queue](data-structures.html#double-ended-queues).
  }
  PGQueue = ^TGQueue;
  TGQueue = record
      head : PGList;
      tail : PGList;
      length : Tguint;
    end;

{*
 * G_QUEUE_INIT:
 *
 * A statically-allocated #GQueue must be initialized with this
 * macro before it can be used. This macro can be used to initialize
 * a variable, but it cannot be assigned to a variable. In that case
 * you have to use g_queue_init().
 *
 * |[
 * GQueue my_queue = G_QUEUE_INIT;
 * ]|
 *
 * Since: 2.14
  }
{xxxxxxxxx #define G_QUEUE_INIT  NULL, NULL, 0  }
{ Queues
  }

function g_queue_new:PGQueue;cdecl;external libglib2;
procedure g_queue_free(queue:PGQueue);cdecl;external libglib2;
procedure g_queue_free_full(queue:PGQueue; free_func:TGDestroyNotify);cdecl;external libglib2;
procedure g_queue_init(queue:PGQueue);cdecl;external libglib2;
procedure g_queue_clear(queue:PGQueue);cdecl;external libglib2;
function g_queue_is_empty(queue:PGQueue):Tgboolean;cdecl;external libglib2;
procedure g_queue_clear_full(queue:PGQueue; free_func:TGDestroyNotify);cdecl;external libglib2;
function g_queue_get_length(queue:PGQueue):Tguint;cdecl;external libglib2;
procedure g_queue_reverse(queue:PGQueue);cdecl;external libglib2;
function g_queue_copy(queue:PGQueue):PGQueue;cdecl;external libglib2;
procedure g_queue_foreach(queue:PGQueue; func:TGFunc; user_data:Tgpointer);cdecl;external libglib2;
function g_queue_find(queue:PGQueue; data:Tgconstpointer):PGList;cdecl;external libglib2;
function g_queue_find_custom(queue:PGQueue; data:Tgconstpointer; func:TGCompareFunc):PGList;cdecl;external libglib2;
procedure g_queue_sort(queue:PGQueue; compare_func:TGCompareDataFunc; user_data:Tgpointer);cdecl;external libglib2;
procedure g_queue_push_head(queue:PGQueue; data:Tgpointer);cdecl;external libglib2;
procedure g_queue_push_tail(queue:PGQueue; data:Tgpointer);cdecl;external libglib2;
procedure g_queue_push_nth(queue:PGQueue; data:Tgpointer; n:Tgint);cdecl;external libglib2;
function g_queue_pop_head(queue:PGQueue):Tgpointer;cdecl;external libglib2;
function g_queue_pop_tail(queue:PGQueue):Tgpointer;cdecl;external libglib2;
function g_queue_pop_nth(queue:PGQueue; n:Tguint):Tgpointer;cdecl;external libglib2;
function g_queue_peek_head(queue:PGQueue):Tgpointer;cdecl;external libglib2;
function g_queue_peek_tail(queue:PGQueue):Tgpointer;cdecl;external libglib2;
function g_queue_peek_nth(queue:PGQueue; n:Tguint):Tgpointer;cdecl;external libglib2;
function g_queue_index(queue:PGQueue; data:Tgconstpointer):Tgint;cdecl;external libglib2;
function g_queue_remove(queue:PGQueue; data:Tgconstpointer):Tgboolean;cdecl;external libglib2;
function g_queue_remove_all(queue:PGQueue; data:Tgconstpointer):Tguint;cdecl;external libglib2;
procedure g_queue_insert_before(queue:PGQueue; sibling:PGList; data:Tgpointer);cdecl;external libglib2;
procedure g_queue_insert_before_link(queue:PGQueue; sibling:PGList; link_:PGList);cdecl;external libglib2;
procedure g_queue_insert_after(queue:PGQueue; sibling:PGList; data:Tgpointer);cdecl;external libglib2;
procedure g_queue_insert_after_link(queue:PGQueue; sibling:PGList; link_:PGList);cdecl;external libglib2;
procedure g_queue_insert_sorted(queue:PGQueue; data:Tgpointer; func:TGCompareDataFunc; user_data:Tgpointer);cdecl;external libglib2;
procedure g_queue_push_head_link(queue:PGQueue; link_:PGList);cdecl;external libglib2;
procedure g_queue_push_tail_link(queue:PGQueue; link_:PGList);cdecl;external libglib2;
procedure g_queue_push_nth_link(queue:PGQueue; n:Tgint; link_:PGList);cdecl;external libglib2;
function g_queue_pop_head_link(queue:PGQueue):PGList;cdecl;external libglib2;
function g_queue_pop_tail_link(queue:PGQueue):PGList;cdecl;external libglib2;
function g_queue_pop_nth_link(queue:PGQueue; n:Tguint):PGList;cdecl;external libglib2;
function g_queue_peek_head_link(queue:PGQueue):PGList;cdecl;external libglib2;
function g_queue_peek_tail_link(queue:PGQueue):PGList;cdecl;external libglib2;
function g_queue_peek_nth_link(queue:PGQueue; n:Tguint):PGList;cdecl;external libglib2;
function g_queue_link_index(queue:PGQueue; link_:PGList):Tgint;cdecl;external libglib2;
procedure g_queue_unlink(queue:PGQueue; link_:PGList);cdecl;external libglib2;
procedure g_queue_delete_link(queue:PGQueue; link_:PGList);cdecl;external libglib2;
{$endif}
{ __G_QUEUE_H__  }

// === Konventiert am: 22-6-26 17:16:57 ===


implementation



end.
