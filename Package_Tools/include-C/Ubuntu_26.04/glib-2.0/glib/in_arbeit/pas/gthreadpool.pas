unit gthreadpool;

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
{$ifndef __G_THREADPOOL_H__}
{$define __G_THREADPOOL_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gthread.h>}
type
{ Thread Pools
  }
  PGThreadPool = ^TGThreadPool;
  TGThreadPool = record
      func : TGFunc;
      user_data : Tgpointer;
      exclusive : Tgboolean;
    end;


function g_thread_pool_new(func:TGFunc; user_data:Tgpointer; max_threads:Tgint; exclusive:Tgboolean; error:PPGError):PGThreadPool;cdecl;external libglib2;
function g_thread_pool_new_full(func:TGFunc; user_data:Tgpointer; item_free_func:TGDestroyNotify; max_threads:Tgint; exclusive:Tgboolean; 
           error:PPGError):PGThreadPool;cdecl;external libglib2;
procedure g_thread_pool_free(pool:PGThreadPool; immediate:Tgboolean; wait_:Tgboolean);cdecl;external libglib2;
function g_thread_pool_push(pool:PGThreadPool; data:Tgpointer; error:PPGError):Tgboolean;cdecl;external libglib2;
function g_thread_pool_unprocessed(pool:PGThreadPool):Tguint;cdecl;external libglib2;
procedure g_thread_pool_set_sort_function(pool:PGThreadPool; func:TGCompareDataFunc; user_data:Tgpointer);cdecl;external libglib2;
function g_thread_pool_move_to_front(pool:PGThreadPool; data:Tgpointer):Tgboolean;cdecl;external libglib2;
function g_thread_pool_set_max_threads(pool:PGThreadPool; max_threads:Tgint; error:PPGError):Tgboolean;cdecl;external libglib2;
function g_thread_pool_get_max_threads(pool:PGThreadPool):Tgint;cdecl;external libglib2;
function g_thread_pool_get_num_threads(pool:PGThreadPool):Tguint;cdecl;external libglib2;
procedure g_thread_pool_set_max_unused_threads(max_threads:Tgint);cdecl;external libglib2;
function g_thread_pool_get_max_unused_threads:Tgint;cdecl;external libglib2;
function g_thread_pool_get_num_unused_threads:Tguint;cdecl;external libglib2;
procedure g_thread_pool_stop_unused_threads;cdecl;external libglib2;
procedure g_thread_pool_set_max_idle_time(interval:Tguint);cdecl;external libglib2;
function g_thread_pool_get_max_idle_time:Tguint;cdecl;external libglib2;
{$endif}
{ __G_THREADPOOL_H__  }

// === Konventiert am: 22-6-26 19:40:23 ===


implementation



end.
