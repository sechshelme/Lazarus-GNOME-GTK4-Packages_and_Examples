
unit eina_mempool;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_mempool.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_mempool.h
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
Pchar  = ^char;
PEina_Mempool  = ^Eina_Mempool;
PEina_Mempool_Backend  = ^Eina_Mempool_Backend;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 2007-2008 Jorge Luis Zapata Muga
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
 * License along with this library;
 * if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef EINA_MEMPOOL_H_}
{$define EINA_MEMPOOL_H_}
{$include "eina_types.h"}
{$include "eina_error.h"}
{$include "eina_module.h"}
{*
 * @defgroup Eina_Memory_Pool_Group Memory Pool
 * @ingroup Eina_Tools_Group
 * @brief This group discusses the functions that provide memory pool management.
 *
 * Several mempools are available:
 *
 * @li @c chained_pool: It is the default one. It allocates a big
 * chunk of memory with malloc() and splits the result into chunks of the
 * requested size that are pushed inside a stack. When requested, it
 * takes this pointer from the stack to give them to whoever wants
 * them.
 * @li @c pass_through: it just call malloc() and free(). It may be
 * faster on some computers than using our own allocators (like having
 * a huge L2 cache, over 4MB).
 * @li @c one_big: It calls malloc() just one time for the requested number
 * of items. This is useful when you know in advance how many objects of some
 * type live during the life of the mempool.
 *
 * @
  }
{*
 * @typedef Eina_Mempool
 * @brief The opaque type for the mempool structure.
  }
type
{*
 * @typedef Eina_Mempool_Backend
 * @brief The opaque type for the mempool backend type.
  }
{*
 * @typedef Eina_Mempool_Repack_Cb
 *
 * @brief The callback type which is called when the mempool "repacks" its data.
 *
 * @details I.e. moves it around to optimize the way it is stored in memory. This is
 *          useful to improve data locality and to free internal pools back to the OS.
 *
 * @note The callback needs to update users of the data to stop accessing the object
 *       from the old location and access it using the new location instead. The copy
 *       of memory is taken care of by the mempool.
  }

  TEina_Mempool_Repack_Cb = procedure (dst:pointer; src:pointer; data:pointer);cdecl;
  var
    EINA_ERROR_NOT_MEMPOOL_MODULE : TEina_Error;cvar;external;
{*
 * @brief Creates a new mempool of the given type
 *
 * @param[in] name Name of the mempool kind to use.
 * @param[in] context Identifier of the mempool created (for debug purposes).
 * @param[in] options Unused. Use the variable arguments list instead to pass options to the mempool.
 * @param[in] ... Additional options to pass to the allocator; depends entirely on the type of mempool ("int pool size" for chained and "int item_size" for one_big.
 * @return Newly allocated mempool instance, NULL otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function eina_mempool_add(name:Pchar; context:Pchar; options:Pchar; args:array of const):PEina_Mempool;cdecl;external;
function eina_mempool_add(name:Pchar; context:Pchar; options:Pchar):PEina_Mempool;cdecl;external;
{*
 * @brief Deletes the given mempool.
 *
 * @param[in] mp The mempool to delete
  }
procedure eina_mempool_del(mp:PEina_Mempool);cdecl;external;
{*
 * @brief Re-allocates an amount memory by the given mempool.
 *
 * @param[in] mp The mempool
 * @param[in] element The element to re-allocate
 * @param[in] size The size in bytes to re-allocate
 * @return The newly re-allocated data
 *
 * @note This function re-allocates and returns @p element with @p size bytes using the
 *       mempool @p mp. If not used anymore, the data must be freed with eina_mempool_free().
 * @warning No checks are done for @p mp.
 *
 * @see eina_mempool_free()
  }
procedure eina_mempool_repack(mp:PEina_Mempool; cb:TEina_Mempool_Repack_Cb; data:pointer);cdecl;external;
{*
 * @brief Runs a garbage collection cycle.
 *
 * @param[in] mp The mempool
  }
procedure eina_mempool_gc(mp:PEina_Mempool);cdecl;external;
{*
 * @brief Check if a pointer is a valid element from the mempool
 *
 * @param[in] mp The mempool
 * @param[in] element The data to free
 * @return #EINA_TRUE if the element is a valid element of the mempool, #EINA_FALSE otherwise
 *
 * @since 1.20
  }
{*
 * @brief Has the backend update its internal statistics.
 *
 * @param[in] mp The mempool
 *
  }
procedure eina_mempool_statistics(mp:PEina_Mempool);cdecl;external;
{*
 * @brief Provide an iterator to walk all allocated elements from a specified mempool.
 *
 * @param[in] mp The mempool
 * @return @c NULL if it is not possible to iterate over the mempool, a valid iterator otherwise.
 *
 * @note This call is expected to be slow and should not be used in any performance critical area.
 * @since 1.23
  }
{*
 * @brief Registers the given memory pool backend.
 *
 * @param[in] be The backend
 * @return #EINA_TRUE if backend has been correctly registered, #EINA_FALSE
 *         otherwise.
  }
function eina_mempool_register(be:PEina_Mempool_Backend):TEina_Bool;cdecl;external;
{*
 * @brief Unregisters the given memory pool backend.
 *
 * @param[in] be The backend
  }
procedure eina_mempool_unregister(be:PEina_Mempool_Backend);cdecl;external;
{*
 * @brief Computes the alignment that would be used when allocating a object of size @p size.
 *
 * @param[in] size
 * @return The alignment for an allocation of size @p size.
  }
{$include "eina_inline_mempool.x"}
{*
 * @
  }
{$endif}
{ EINA_MEMPOOL_H_  }

implementation


end.
