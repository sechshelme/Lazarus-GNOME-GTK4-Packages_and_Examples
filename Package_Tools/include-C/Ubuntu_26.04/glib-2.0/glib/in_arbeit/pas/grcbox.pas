unit grcbox;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ grcbox.h: Reference counted data
 *
 * Copyright 2018  Emmanuele Bassi
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
(** unsupported pragma#pragma once*)
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gmem.h>}
{$include <glib/glib-typeof.h>}

function g_rc_box_alloc(block_size:Tgsize):Tgpointer;cdecl;external libglib2;
{(1); }
function g_rc_box_alloc0(block_size:Tgsize):Tgpointer;cdecl;external libglib2;
{(1); }
function g_rc_box_dup(block_size:Tgsize; mem_block:Tgconstpointer):Tgpointer;cdecl;external libglib2;
{(1); }
function g_rc_box_acquire(mem_block:Tgpointer):Tgpointer;cdecl;external libglib2;
procedure g_rc_box_release(mem_block:Tgpointer);cdecl;external libglib2;
procedure g_rc_box_release_full(mem_block:Tgpointer; clear_func:TGDestroyNotify);cdecl;external libglib2;
function g_rc_box_get_size(mem_block:Tgpointer):Tgsize;cdecl;external libglib2;
function g_atomic_rc_box_alloc(block_size:Tgsize):Tgpointer;cdecl;external libglib2;
{(1); }
function g_atomic_rc_box_alloc0(block_size:Tgsize):Tgpointer;cdecl;external libglib2;
{(1); }
function g_atomic_rc_box_dup(block_size:Tgsize; mem_block:Tgconstpointer):Tgpointer;cdecl;external libglib2;
{(1); }
function g_atomic_rc_box_acquire(mem_block:Tgpointer):Tgpointer;cdecl;external libglib2;
procedure g_atomic_rc_box_release(mem_block:Tgpointer);cdecl;external libglib2;
procedure g_atomic_rc_box_release_full(mem_block:Tgpointer; clear_func:TGDestroyNotify);cdecl;external libglib2;
function g_atomic_rc_box_get_size(mem_block:Tgpointer):Tgsize;cdecl;external libglib2;
{$if defined(glib_typeof)}
{xxxxxxxxxx
#define g_rc_box_acquire(mem_block) \
  ((glib_typeof (mem_block)) (g_rc_box_acquire) (mem_block))
#define g_atomic_rc_box_acquire(mem_block) \
  ((glib_typeof (mem_block)) (g_atomic_rc_box_acquire) (mem_block))

#define g_rc_box_dup(block_size, mem_block) \
  ((glib_typeof (mem_block)) (g_rc_box_dup) (block_size, mem_block))
#define g_atomic_rc_box_dup(block_size, mem_block) \
  ((glib_typeof (mem_block)) (g_atomic_rc_box_dup) (block_size, mem_block))
#endif

 }

// === Konventiert am: 22-6-26 17:17:08 ===


implementation



end.
