
unit eina_cow;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_cow.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_cow.h
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
PEina_Cow  = ^Eina_Cow;
PEina_Cow_Data  = ^Eina_Cow_Data;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 2013 Cedric Bail
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
{$ifndef EINA_COW_H_}
{$define EINA_COW_H_}
{*
 * @addtogroup Eina_Tools_Group Tools
 *
 * @
  }
{*
 * @defgroup Eina_Cow_Group Copy On Write
 *
 * @brief These functions provide some helper for a pseudo Copy-On-Write mechanism.
 *
 * Eina_Cow will return a const memory pointer to some default value that you will
 * be able to change only by requesting a writable pointer. Later on a garbage collector
 * can come online and try to merge back some of those pointers.
 *
 * @since 1.8.0
 *
 * @
  }
{*
 * @typedef Eina_Cow
 * Type for Eina_Cow pool
  }
type
{*
 * @typedef Eina_Cow_Data
 * Type of the returned pointer to simplify some reading.
  }

  PEina_Cow_Data = ^TEina_Cow_Data;
  TEina_Cow_Data = pointer;
{*
 * @brief Instantiates a new Eina_Cow pool.
 *
 * @param[in] name The name of this pool, used for debugging.
 * @param[in] struct_size The size of the object from this pool.
 * @param[in] step How many objects to allocate when the pool gets empty.
 * @param[in] default_value The default value returned by this pool.
 * @param[in] gc Is it possible to run garbage collection on this pool.
 * @return A valid new Eina_Cow, or @c NULL on error.
  }
(* Const before type ignored *)
(* Const before type ignored *)

function eina_cow_add(name:Pchar; struct_size:dword; step:dword; default_value:pointer; gc:TEina_Bool):PEina_Cow;cdecl;external;
{*
 * @brief Destroys an Eina_Cow pool and all the allocated memory.
 *
 * @param[in] cow The pool to destroy
  }
procedure eina_cow_del(cow:PEina_Cow);cdecl;external;
{*
 * @brief Returns an initialized pointer from the pool.
 *
 * @param[in] cow The pool to take things from.
 * @return A pointer to the new pool instance
  }
(* Const before type ignored *)
function eina_cow_alloc(cow:PEina_Cow):PEina_Cow_Data;cdecl;external;
{*
 * @brief Frees a pointer from the pool.
 *
 * @param[in,out] cow The pool to gave back memory to.
 * @param[in] data The data to give back.
 *
 * @note To simplify the caller code *data will point to the default
 * read only state after the call to this function.
  }
(* Const before type ignored *)
procedure eina_cow_free(cow:PEina_Cow; data:PPEina_Cow_Data);cdecl;external;
{*
 * @brief Gets a writeable pointer from a const pointer.
 *
 * @param[in,out] cow The pool the pointer came from.
 * @param[in] src The pointer you want to write to.
 *
 * @note This function is not thread safe.
  }
(* Const before type ignored *)
(* Const before declarator ignored *)
function eina_cow_write(cow:PEina_Cow; src:PPEina_Cow_Data):pointer;cdecl;external;
{*
 * @brief Sets back a pointer into read only.
 *
 * @param[in,out] cow The pool the pointer came from.
 * @param[in] dst The read only version of the pointer.
 * @param[in] data The pointer to which data was written to.
 * @param[in] needed_gc Does this pool need to be garbage collected?
 *
 * @note This function is not thread safe.
  }
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
procedure eina_cow_done(cow:PEina_Cow; dst:PPEina_Cow_Data; data:pointer; needed_gc:TEina_Bool);cdecl;external;
{*
 * @brief Makes the destination contain the same thing as the source pointer.
 *
 * @param[in,out] cow The pool the pointers came from.
 * @param[in] dst The destination to update.
 * @param[in] src The source of information to copy.
  }
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
procedure eina_cow_memcpy(cow:PEina_Cow; dst:PPEina_Cow_Data; src:PEina_Cow_Data);cdecl;external;
{*
 * @brief Tries to find entries that have the same content and update them.
 *
 * @param[in,out] cow The cow to try to compact.
 * @return EINA_TRUE if something was compacted, EINA_FALSE if nothing was.
 *
 * There is no guaranty in the time it will require, but should remain low.
 * It does run a hash function on all possible common structures trying to
 * find the one that matches and merge them into one pointer.
  }
function eina_cow_gc(cow:PEina_Cow):TEina_Bool;cdecl;external;
{*
 * @def EINA_COW_WRITE_BEGIN
 * @brief Definition for the macro to setup a writeable pointer from a const one.
 *
 * @param[in,out] Cow The Eina_Cow where the const pointer came from.
 * @param[in] Read The const pointer to get a writable handler from.
 * @param[in] Write_Type The type of the pointer you want to write to.
 * @param[in] Write The name of the variable where to put the writeable pointer to.
 *
 * @since 1.8.0
 *
 * @note This macro opens a C scope that is expected to be closed by
 * EINA_COW_WRITE_END().
  }
{*
 * @def EINA_COW_WRITE_END
 * @brief Definition for the macro to close the writeable pointer.
 *
 * @param[in,out] Cow The Eina_Cow where the const pointer came from.
 * @param[in] Read The const pointer to get a writable handler from.
 * @param[in] Write The name of the variable where to put the writeable pointer to.
 *
 * @since 1.8.0
 *
 * @note This macro closes the scope opened by EINA_COW_WRITE_BEGIN().
  }
{*
 * @
  }
{*
 * @
  }
{$endif}

implementation


end.
