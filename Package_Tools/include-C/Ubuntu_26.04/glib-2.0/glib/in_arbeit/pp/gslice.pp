
unit gslice;
interface

{
  Automatically converted by H2Pas 1.0.0 from gslice.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gslice.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pgint64  = ^gint64;
PGSliceConfig  = ^GSliceConfig;
Pguint  = ^guint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GLIB sliced memory - fast threaded memory chunk allocator
 * Copyright (C) 2005 Tim Janik
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
{$ifndef __G_SLICE_H__}
{$define __G_SLICE_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}
{$include <string.h>}
{ slices - fast allocation/release of small memory blocks
  }

function g_slice_alloc(block_size:Tgsize):Tgpointer;cdecl;external;
{(1); }
function g_slice_alloc0(block_size:Tgsize):Tgpointer;cdecl;external;
{(1); }
function g_slice_copy(block_size:Tgsize; mem_block:Tgconstpointer):Tgpointer;cdecl;external;
{(1); }
procedure g_slice_free1(block_size:Tgsize; mem_block:Tgpointer);cdecl;external;
procedure g_slice_free_chain_with_offset(block_size:Tgsize; mem_chain:Tgpointer; next_offset:Tgsize);cdecl;external;
{ MemoryBlockType *
 *       g_slice_dup                    (MemoryBlockType,
 *	                                 MemoryBlockType *mem_block);
 *       g_slice_free                   (MemoryBlockType,
 *	                                 MemoryBlockType *mem_block);
 *       g_slice_free_chain             (MemoryBlockType,
 *                                       MemoryBlockType *first_chain_block,
 *                                       memory_block_next_field);
 * pseudo prototypes for the macro
 * definitions following below.
  }
type
  PGSliceConfig = ^TGSliceConfig;
  TGSliceConfig =  Longint;
  Const
    G_SLICE_CONFIG_ALWAYS_MALLOC = 1;
    G_SLICE_CONFIG_BYPASS_MAGAZINES = 2;
    G_SLICE_CONFIG_WORKING_SET_MSECS = 3;
    G_SLICE_CONFIG_COLOR_INCREMENT = 4;
    G_SLICE_CONFIG_CHUNK_SIZES = 5;
    G_SLICE_CONFIG_CONTENTION_COUNTER = 6;
;
{xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_34 }

procedure g_slice_set_config(ckey:TGSliceConfig; value:Tgint64);cdecl;external;
{xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_34 }
function g_slice_get_config(ckey:TGSliceConfig):Tgint64;cdecl;external;
{xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_34 }
function g_slice_get_config_state(ckey:TGSliceConfig; address:Tgint64; n_values:Pguint):Pgint64;cdecl;external;
{$ifndef __GI_SCANNER__}
{$ifdef G_ENABLE_DEBUG}

procedure g_slice_debug_tree_statistics;cdecl;external;
{$endif}
{$endif}
{$endif}
{ __G_SLICE_H__  }

implementation


end.
