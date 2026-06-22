
unit gmem;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmem.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmem.h
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
PGMemVTable  = ^GMemVTable;
Pgpointer  = ^gpointer;
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
{$ifndef __G_MEM_H__}
{$define __G_MEM_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gutils.h>}
{$include <glib/glib-typeof.h>}
{*
 * GMemVTable:
 * @malloc: function to use for allocating memory.
 * @realloc: function to use for reallocating memory.
 * @free: function to use to free memory.
 * @calloc: function to use for allocating zero-filled memory.
 * @try_malloc: function to use for allocating memory without a default error handler.
 * @try_realloc: function to use for reallocating memory without a default error handler.
 * 
 * A set of functions used to perform memory allocation. The same #GMemVTable must
 * be used for all allocations in the same program; a call to g_mem_set_vtable(),
 * if it exists, should be prior to any use of GLib.
 *
 * This functions related to this has been deprecated in 2.46, and no longer work.
  }
type
{$if GLIB_SIZEOF_VOID_P > GLIB_SIZEOF_LONG}
{*
 * G_MEM_ALIGN:
 *
 * Indicates the number of bytes to which memory will be aligned on the
 * current platform.
  }

const
  G_MEM_ALIGN = GLIB_SIZEOF_VOID_P;  
{$else}
{ GLIB_SIZEOF_VOID_P <= GLIB_SIZEOF_LONG  }

const
  G_MEM_ALIGN = GLIB_SIZEOF_LONG;  
{$endif}
{ GLIB_SIZEOF_VOID_P <= GLIB_SIZEOF_LONG  }
{ Memory allocation functions
  }

procedure g_free(mem:Tgpointer);cdecl;external;
procedure g_free_sized(mem:Tgpointer; size:Tsize_t);cdecl;external;
procedure g_clear_pointer(pp:Pgpointer; destroy:TGDestroyNotify);cdecl;external;
function g_malloc(n_bytes:Tgsize):Tgpointer;cdecl;external;
{(1); }
function g_malloc0(n_bytes:Tgsize):Tgpointer;cdecl;external;
{(1); }
function g_realloc(mem:Tgpointer; n_bytes:Tgsize):Tgpointer;cdecl;external;
function g_try_malloc(n_bytes:Tgsize):Tgpointer;cdecl;external;
{(1); }
function g_try_malloc0(n_bytes:Tgsize):Tgpointer;cdecl;external;
{(1); }
function g_try_realloc(mem:Tgpointer; n_bytes:Tgsize):Tgpointer;cdecl;external;
function g_malloc_n(n_blocks:Tgsize; n_block_bytes:Tgsize):Tgpointer;cdecl;external;
{2(1,2); }
function g_malloc0_n(n_blocks:Tgsize; n_block_bytes:Tgsize):Tgpointer;cdecl;external;
{2(1,2); }
function g_realloc_n(mem:Tgpointer; n_blocks:Tgsize; n_block_bytes:Tgsize):Tgpointer;cdecl;external;
function g_try_malloc_n(n_blocks:Tgsize; n_block_bytes:Tgsize):Tgpointer;cdecl;external;
{2(1,2); }
function g_try_malloc0_n(n_blocks:Tgsize; n_block_bytes:Tgsize):Tgpointer;cdecl;external;
{2(1,2); }
function g_try_realloc_n(mem:Tgpointer; n_blocks:Tgsize; n_block_bytes:Tgsize):Tgpointer;cdecl;external;
function g_aligned_alloc(n_blocks:Tgsize; n_block_bytes:Tgsize; alignment:Tgsize):Tgpointer;cdecl;external;
{2(1,2); }
function g_aligned_alloc0(n_blocks:Tgsize; n_block_bytes:Tgsize; alignment:Tgsize):Tgpointer;cdecl;external;
{2(1,2); }
procedure g_aligned_free(mem:Tgpointer);cdecl;external;
procedure g_aligned_free_sized(mem:Tgpointer; alignment:Tsize_t; size:Tsize_t);cdecl;external;
{xxxxxxxxxxxxxxxx
GLIB_AVAILABLE_STATIC_INLINE_IN_2_44
static inline gpointer g_steal_pointer (gpointer pp);

GLIB_AVAILABLE_STATIC_INLINE_IN_2_44
static inline gpointer
g_steal_pointer (gpointer pp)

  gpointer *ptr = (gpointer *) pp;
  gpointer ref;

  ref = *ptr;
  *ptr = NULL;

  return ref;


  }
{*
 * g_new:
 * @struct_type: the type of the elements to allocate
 * @n_structs: the number of elements to allocate
 * 
 * Allocates @n_structs elements of type @struct_type.
 * The returned pointer is cast to a pointer to the given type.
 * If @n_structs is 0 it returns %NULL.
 * Care is taken to avoid overflow when calculating the size of the allocated block.
 * 
 * Since the returned pointer is already casted to the right type,
 * it is normally unnecessary to cast it explicitly, and doing
 * so might hide memory allocation errors.
 * 
 * Returns: a pointer to the allocated memory, cast to a pointer to @struct_type
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_new(struct_type,n_structs : longint) : longint;

{*
 * g_new0:
 * @struct_type: the type of the elements to allocate.
 * @n_structs: the number of elements to allocate.
 * 
 * Allocates @n_structs elements of type @struct_type, initialized to 0's.
 * The returned pointer is cast to a pointer to the given type.
 * If @n_structs is 0 it returns %NULL.
 * Care is taken to avoid overflow when calculating the size of the allocated block.
 * 
 * Since the returned pointer is already casted to the right type,
 * it is normally unnecessary to cast it explicitly, and doing
 * so might hide memory allocation errors.
 * 
 * Returns: a pointer to the allocated memory, cast to a pointer to @struct_type.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_new0(struct_type,n_structs : longint) : longint;

{*
 * g_renew:
 * @struct_type: the type of the elements to allocate
 * @mem: the currently allocated memory
 * @n_structs: the number of elements to allocate
 * 
 * Reallocates the memory pointed to by @mem, so that it now has space for
 * @n_structs elements of type @struct_type. It returns the new address of
 * the memory, which may have been moved.
 * Care is taken to avoid overflow when calculating the size of the allocated block.
 * 
 * Returns: a pointer to the new allocated memory, cast to a pointer to @struct_type
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_renew(struct_type,mem,n_structs : longint) : longint;

{*
 * g_try_new:
 * @struct_type: the type of the elements to allocate
 * @n_structs: the number of elements to allocate
 * 
 * Attempts to allocate @n_structs elements of type @struct_type, and returns
 * %NULL on failure. Contrast with g_new(), which aborts the program on failure.
 * The returned pointer is cast to a pointer to the given type.
 * The function returns %NULL when @n_structs is 0 of if an overflow occurs.
 * 
 * Since: 2.8
 * Returns: a pointer to the allocated memory, cast to a pointer to @struct_type
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_try_new(struct_type,n_structs : longint) : longint;

{*
 * g_try_new0:
 * @struct_type: the type of the elements to allocate
 * @n_structs: the number of elements to allocate
 * 
 * Attempts to allocate @n_structs elements of type @struct_type, initialized
 * to 0's, and returns %NULL on failure. Contrast with g_new0(), which aborts
 * the program on failure.
 * The returned pointer is cast to a pointer to the given type.
 * The function returns %NULL when @n_structs is 0 or if an overflow occurs.
 * 
 * Since: 2.8
 * Returns: a pointer to the allocated memory, cast to a pointer to @struct_type
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_try_new0(struct_type,n_structs : longint) : longint;

{*
 * g_try_renew:
 * @struct_type: the type of the elements to allocate
 * @mem: the currently allocated memory
 * @n_structs: the number of elements to allocate
 * 
 * Attempts to reallocate the memory pointed to by @mem, so that it now has
 * space for @n_structs elements of type @struct_type, and returns %NULL on
 * failure. Contrast with g_renew(), which aborts the program on failure.
 * It returns the new address of the memory, which may have been moved.
 * The function returns %NULL if an overflow occurs.
 * 
 * Since: 2.8
 * Returns: a pointer to the new allocated memory, cast to a pointer to @struct_type
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_try_renew(struct_type,mem,n_structs : longint) : longint;

{ Memory allocation virtualization for debugging purposes
 * g_mem_set_vtable() has to be the very first GLib function called
 * if being used
  }
{ optional; set to NULL if not used !  }
type
  PGMemVTable = ^TGMemVTable;
  TGMemVTable = record
      malloc : function (n_bytes:Tgsize):Tgpointer;cdecl;
      realloc : function (mem:Tgpointer; n_bytes:Tgsize):Tgpointer;cdecl;
      free : procedure (mem:Tgpointer);cdecl;
      calloc : function (n_blocks:Tgsize; n_block_bytes:Tgsize):Tgpointer;cdecl;
      try_malloc : function (n_bytes:Tgsize):Tgpointer;cdecl;
      try_realloc : function (mem:Tgpointer; n_bytes:Tgsize):Tgpointer;cdecl;
    end;

{xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_46 }

procedure g_mem_set_vtable(vtable:PGMemVTable);cdecl;external;
{xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_46 }
function g_mem_is_system_malloc:Tgboolean;cdecl;external;
  var
    g_mem_gc_friendly : Tgboolean;cvar;external;
{ Memory profiler and checker, has to be enabled via g_mem_set_vtable()
  }
    glib_mem_profiler_table : PGMemVTable;cvar;external;
{xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_46 }

procedure g_mem_profile;cdecl;external;
{$endif}
{ __G_MEM_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_new(struct_type,n_structs : longint) : longint;
begin
  g_new:=_G_NEW(struct_type,n_structs,malloc);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_new0(struct_type,n_structs : longint) : longint;
begin
  g_new0:=_G_NEW(struct_type,n_structs,malloc0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_renew(struct_type,mem,n_structs : longint) : longint;
begin
  g_renew:=_G_RENEW(struct_type,mem,n_structs,realloc);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_try_new(struct_type,n_structs : longint) : longint;
begin
  g_try_new:=_G_NEW(struct_type,n_structs,try_malloc);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_try_new0(struct_type,n_structs : longint) : longint;
begin
  g_try_new0:=_G_NEW(struct_type,n_structs,try_malloc0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_try_renew(struct_type,mem,n_structs : longint) : longint;
begin
  g_try_renew:=_G_RENEW(struct_type,mem,n_structs,try_realloc);
end;


end.
