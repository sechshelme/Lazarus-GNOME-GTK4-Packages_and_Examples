unit glist;

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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
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
{$ifndef __G_LIST_H__}
{$define __G_LIST_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gmem.h>}
{$include <glib/gnode.h>}
type
  PGList = ^TGList;
  TGList = record
      data : Tgpointer;
      next : PGList;
      prev : PGList;
    end;

{ Doubly linked lists
  }

function g_list_alloc:PGList;cdecl;external libglib2;
procedure g_list_free(list:PGList);cdecl;external libglib2;
procedure g_list_free_1(list:PGList);cdecl;external libglib2;
procedure g_list_free_full(list:PGList; free_func:TGDestroyNotify);cdecl;external libglib2;
function g_list_append(list:PGList; data:Tgpointer):PGList;cdecl;external libglib2;
function g_list_prepend(list:PGList; data:Tgpointer):PGList;cdecl;external libglib2;
function g_list_insert(list:PGList; data:Tgpointer; position:Tgint):PGList;cdecl;external libglib2;
function g_list_insert_sorted(list:PGList; data:Tgpointer; func:TGCompareFunc):PGList;cdecl;external libglib2;
function g_list_insert_sorted_with_data(list:PGList; data:Tgpointer; func:TGCompareDataFunc; user_data:Tgpointer):PGList;cdecl;external libglib2;
function g_list_insert_before(list:PGList; sibling:PGList; data:Tgpointer):PGList;cdecl;external libglib2;
function g_list_insert_before_link(list:PGList; sibling:PGList; link_:PGList):PGList;cdecl;external libglib2;
function g_list_concat(list1:PGList; list2:PGList):PGList;cdecl;external libglib2;
function g_list_remove(list:PGList; data:Tgconstpointer):PGList;cdecl;external libglib2;
function g_list_remove_all(list:PGList; data:Tgconstpointer):PGList;cdecl;external libglib2;
function g_list_remove_link(list:PGList; llink:PGList):PGList;cdecl;external libglib2;
function g_list_delete_link(list:PGList; link_:PGList):PGList;cdecl;external libglib2;
function g_list_reverse(list:PGList):PGList;cdecl;external libglib2;
function g_list_copy(list:PGList):PGList;cdecl;external libglib2;
function g_list_copy_deep(list:PGList; func:TGCopyFunc; user_data:Tgpointer):PGList;cdecl;external libglib2;
function g_list_nth(list:PGList; n:Tguint):PGList;cdecl;external libglib2;
function g_list_nth_prev(list:PGList; n:Tguint):PGList;cdecl;external libglib2;
function g_list_find(list:PGList; data:Tgconstpointer):PGList;cdecl;external libglib2;
function g_list_find_custom(list:PGList; data:Tgconstpointer; func:TGCompareFunc):PGList;cdecl;external libglib2;
function g_list_position(list:PGList; llink:PGList):Tgint;cdecl;external libglib2;
function g_list_index(list:PGList; data:Tgconstpointer):Tgint;cdecl;external libglib2;
function g_list_last(list:PGList):PGList;cdecl;external libglib2;
function g_list_first(list:PGList):PGList;cdecl;external libglib2;
function g_list_length(list:PGList):Tguint;cdecl;external libglib2;
procedure g_list_foreach(list:PGList; func:TGFunc; user_data:Tgpointer);cdecl;external libglib2;
function g_list_sort(list:PGList; compare_func:TGCompareFunc):PGList;cdecl;external libglib2;
function g_list_sort_with_data(list:PGList; compare_func:TGCompareDataFunc; user_data:Tgpointer):PGList;cdecl;external libglib2;
function g_list_nth_data(list:PGList; n:Tguint):Tgpointer;cdecl;external libglib2;
procedure g_clear_list(list_ptr:PPGList; destroy:TGDestroyNotify);cdecl;external libglib2;
{xxxxxxxxx
#define  g_clear_list(list_ptr, destroy)       \
  G_STMT_START                                \
    GList *_list;                              \
                                               \
    _list = *(list_ptr);                       \
    if (_list)                                 \
                                              \
        *list_ptr = NULL;                      \
                                               \
        if ((destroy) != NULL)                 \
          g_list_free_full (_list, (destroy)); \
        else                                   \
          g_list_free (_list);                 \
                                              \
   G_STMT_END                                 \
  GLIB_AVAILABLE_MACRO_IN_2_64
 }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_list_previous(list : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_list_next(list : longint) : longint;

{$endif}
{ __G_LIST_H__  }

// === Konventiert am: 22-6-26 17:10:34 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_list_previous(list : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if list then
    if_local1:=(PGList(list))^.prev
  else
    if_local1:=NULL;
  g_list_previous:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_list_next(list : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if list then
    if_local1:=(PGList(list))^.next
  else
    if_local1:=NULL;
  g_list_next:=if_local1;
end;


end.
