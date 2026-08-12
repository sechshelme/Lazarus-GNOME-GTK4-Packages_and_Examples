
unit gegl_memory;
interface

{
  Automatically converted by H2Pas 1.0.0 from gegl_memory.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gegl_memory.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ This file is part of GEGL.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <https://www.gnu.org/licenses/>.
  }
{$ifndef __GEGL_MEMORY_H__}
{$define __GEGL_MEMORY_H__}
{**
 * Aligned memory:
 *
 * GEGL provides functions to allocate and free buffers that are guaranteed to
 * be on 16 byte aligned memory addresses.
  }
{*
 * gegl_malloc: (skip)
 * @n_bytes: the number of bytes to allocte.
 *
 * Allocates @n_bytes of memory. If @n_bytes is 0, returns NULL.
 *
 * Returns a pointer to the allocated memory.
  }

function gegl_malloc(n_bytes:Tgsize):Tgpointer;cdecl;external;
{*
 * gegl_try_malloc: (skip)
 * @n_bytes: the number of bytes to allocte.
 *
 * Allocates @n_bytes of memory. If allocation fails, or if @n_bytes is 0,
 * returns %NULL.
 *
 * Returns a pointer to the allocated memory, or NULL.
  }
function gegl_try_malloc(n_bytes:Tgsize):Tgpointer;cdecl;external;
{*
 * gegl_free: (skip)
 * @mem: the memory to free.
 *
 * Frees the memory pointed to by @mem. If @mem is NULL, does nothing.
  }
procedure gegl_free(mem:Tgpointer);cdecl;external;
{*
 * gegl_calloc: (skip)
 * @size: size of items to allocate
 * @n_memb: number of members
 *
 * allocated 0'd memory.
  }
function gegl_calloc(size:Tgsize; n_memb:Tgint):Tgpointer;cdecl;external;
{*
 * gegl_memeq_zero: (skip)
 * @ptr: pointer to the memory block
 * @size: block size
 *
 * Checks if all the bytes of the memory block @ptr, of size @size,
 * are equal to zero.
 *
 * Returns: TRUE if all the bytes are equal to zero.
  }
function gegl_memeq_zero(ptr:Tgconstpointer; size:Tgsize):Tgboolean;cdecl;external;
{*
 * gegl_memset_pattern: (skip)
 * @dst_ptr: pointer to copy to
 * @src_ptr: pointer to copy from
 * @pattern_size: the length of @src_ptr
 * @count: number of copies
 *
 * Fill @dst_ptr with @count copies of the bytes in @src_ptr.
  }
procedure gegl_memset_pattern(dst_ptr:Tgpointer; src_ptr:Tgconstpointer; pattern_size:Tgint; count:Tgint);cdecl;external;
{$endif}
{ __GEGL_MEMORY_H__  }

implementation


end.
