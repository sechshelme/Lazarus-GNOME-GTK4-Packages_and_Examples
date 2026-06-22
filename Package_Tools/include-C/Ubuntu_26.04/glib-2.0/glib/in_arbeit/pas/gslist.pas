unit gslist;

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
{$ifndef __G_SLIST_H__}
{$define __G_SLIST_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gmem.h>}
{$include <glib/gnode.h>}
type
  PGSList = ^TGSList;
  TGSList = record
      data : Tgpointer;
      next : PGSList;
    end;

{ Singly linked lists
  }

function g_slist_alloc:PGSList;cdecl;external libglib2;
procedure g_slist_free(list:PGSList);cdecl;external libglib2;
procedure g_slist_free_1(list:PGSList);cdecl;external libglib2;
const
  g_slist_free1 = g_slist_free_1;  

procedure g_slist_free_full(list:PGSList; free_func:TGDestroyNotify);cdecl;external libglib2;
function g_slist_append(list:PGSList; data:Tgpointer):PGSList;cdecl;external libglib2;
function g_slist_prepend(list:PGSList; data:Tgpointer):PGSList;cdecl;external libglib2;
function g_slist_insert(list:PGSList; data:Tgpointer; position:Tgint):PGSList;cdecl;external libglib2;
function g_slist_insert_sorted(list:PGSList; data:Tgpointer; func:TGCompareFunc):PGSList;cdecl;external libglib2;
function g_slist_insert_sorted_with_data(list:PGSList; data:Tgpointer; func:TGCompareDataFunc; user_data:Tgpointer):PGSList;cdecl;external libglib2;
function g_slist_insert_before(slist:PGSList; sibling:PGSList; data:Tgpointer):PGSList;cdecl;external libglib2;
function g_slist_concat(list1:PGSList; list2:PGSList):PGSList;cdecl;external libglib2;
function g_slist_remove(list:PGSList; data:Tgconstpointer):PGSList;cdecl;external libglib2;
function g_slist_remove_all(list:PGSList; data:Tgconstpointer):PGSList;cdecl;external libglib2;
function g_slist_remove_link(list:PGSList; link_:PGSList):PGSList;cdecl;external libglib2;
function g_slist_delete_link(list:PGSList; link_:PGSList):PGSList;cdecl;external libglib2;
function g_slist_reverse(list:PGSList):PGSList;cdecl;external libglib2;
function g_slist_copy(list:PGSList):PGSList;cdecl;external libglib2;
function g_slist_copy_deep(list:PGSList; func:TGCopyFunc; user_data:Tgpointer):PGSList;cdecl;external libglib2;
function g_slist_nth(list:PGSList; n:Tguint):PGSList;cdecl;external libglib2;
function g_slist_find(list:PGSList; data:Tgconstpointer):PGSList;cdecl;external libglib2;
function g_slist_find_custom(list:PGSList; data:Tgconstpointer; func:TGCompareFunc):PGSList;cdecl;external libglib2;
function g_slist_position(list:PGSList; llink:PGSList):Tgint;cdecl;external libglib2;
function g_slist_index(list:PGSList; data:Tgconstpointer):Tgint;cdecl;external libglib2;
function g_slist_last(list:PGSList):PGSList;cdecl;external libglib2;
function g_slist_length(list:PGSList):Tguint;cdecl;external libglib2;
procedure g_slist_foreach(list:PGSList; func:TGFunc; user_data:Tgpointer);cdecl;external libglib2;
function g_slist_sort(list:PGSList; compare_func:TGCompareFunc):PGSList;cdecl;external libglib2;
function g_slist_sort_with_data(list:PGSList; compare_func:TGCompareDataFunc; user_data:Tgpointer):PGSList;cdecl;external libglib2;
function g_slist_nth_data(list:PGSList; n:Tguint):Tgpointer;cdecl;external libglib2;
procedure g_clear_slist(slist_ptr:PPGSList; destroy:TGDestroyNotify);cdecl;external libglib2;
{xxxxxxxxxxxxxxxxxxxx
#define  g_clear_slist(slist_ptr, destroy)       \
  G_STMT_START                                  \
    GSList *_slist;                              \
                                                 \
    _slist = *(slist_ptr);                       \
    if (_slist)                                  \
                                                \
        *slist_ptr = NULL;                       \
                                                 \
        if ((destroy) != NULL)                   \
          g_slist_free_full (_slist, (destroy)); \
        else                                     \
          g_slist_free (_slist);                 \
                                                \
   G_STMT_END                                   \
  GLIB_AVAILABLE_MACRO_IN_2_64
 }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_slist_next(slist : longint) : longint;

{$endif}
{ __G_SLIST_H__  }

// === Konventiert am: 22-6-26 19:22:57 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_slist_next(slist : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if slist then
    if_local1:=(PGSList(slist))^.next
  else
    if_local1:=NULL;
  g_slist_next:=if_local1;
end;


end.
