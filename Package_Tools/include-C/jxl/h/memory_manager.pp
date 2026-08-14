
unit memory_manager;
interface

{
  Automatically converted by H2Pas 1.0.0 from memory_manager.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    memory_manager.h
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
Pjpegxl_alloc_func  = ^jpegxl_alloc_func;
PJxlMemoryManager  = ^JxlMemoryManager;
PJxlMemoryManagerStruct  = ^JxlMemoryManagerStruct;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (c) the JPEG XL Project Authors. All rights reserved.
 *
 * Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
  }
{* @addtogroup libjxl_common
 * @
 * @file memory_manager.h
 * @brief Abstraction functions used by JPEG XL to allocate memory.
  }
{$ifndef JXL_MEMORY_MANAGER_H_}
{$define JXL_MEMORY_MANAGER_H_}
{$include <stddef.h>}
{*
 * Allocating function for a memory region of a given size.
 *
 * Allocates a contiguous memory region of size @p size bytes. The returned
 * memory may not be aligned to a specific size or initialized at all.
 *
 * @param opaque custom memory manager handle provided by the caller.
 * @param size in bytes of the requested memory region.
 * @return @c NULL if the memory can not be allocated,
 * @return pointer to the memory otherwise.
  }
type
  Pjpegxl_alloc_func = ^Tjpegxl_alloc_func;
  Tjpegxl_alloc_func = function (opaque:pointer; size:Tsize_t):pointer;cdecl;
{*
 * Deallocating function pointer type.
 *
 * This function @b MUST do nothing if @p address is @c NULL.
 *
 * @param opaque custom memory manager handle provided by the caller.
 * @param address memory region pointer returned by ::jpegxl_alloc_func, or @c
 * NULL.
  }

  Tjpegxl_free_func = procedure (opaque:pointer; address:pointer);cdecl;
{*
 * Memory Manager struct.
 * These functions, when provided by the caller, will be used to handle memory
 * allocations.
  }
{* The opaque pointer that will be passed as the first parameter to all the
   * functions in this struct.  }
{* Memory allocation function. This can be NULL if and only if also the
   * free() member in this class is NULL. All dynamic memory will be allocated
   * and freed with these functions if they are not NULL.  }
{* Free function matching the alloc() member.  }
{ TODO(deymo): Add cache-aligned alloc/free functions here.  }

  PJxlMemoryManagerStruct = ^TJxlMemoryManagerStruct;
  TJxlMemoryManagerStruct = record
      opaque : pointer;
      alloc : Tjpegxl_alloc_func;
      free : Tjpegxl_free_func;
    end;
  TJxlMemoryManager = TJxlMemoryManagerStruct;
  PJxlMemoryManager = ^TJxlMemoryManager;
{* @ }

implementation


end.
