
unit eina_lalloc;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_lalloc.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_lalloc.h
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
PEina_Lalloc  = ^Eina_Lalloc;
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
{$ifndef EINA_LALLOC_H_}
{$define EINA_LALLOC_H_}
{$include "eina_types.h"}
{*
 * @addtogroup Eina_Tools_Group Tools
 *
 * @
  }
{*
 * @defgroup Eina_Lalloc_Group Lazy allocator
 *
 * @
  }
{*
 * @typedef Eina_Lalloc_Alloc
 * Type definition for the callback used to allocate new items in a lazy allocator.
 *
  }
type

  TEina_Lalloc_Alloc = function (user_data:pointer; num:longint):TEina_Bool;cdecl;
{*
 * @def EINA_LALLOC_ALLOC
 * @param[in] function The function to allocate.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function EINA_LALLOC_ALLOC(_function : longint) : TEina_Lalloc_Alloc;

{*
 * @typedef Eina_Lalloc_Free
 * Type definition for the callback used to allocate new items in a lazy allocator.
 *
  }
type

  TEina_Lalloc_Free = procedure (user_data:pointer);cdecl;
{*
 * @def EINA_LALLOC_FREE
 * @param[in] function The function to free.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function EINA_LALLOC_FREE(_function : longint) : TEina_Lalloc_Free;

{*
 * @typedef Eina_Lalloc
 * Public type definition for a lazy allocator.
 *
  }
type
{*
 * @brief Creates a new lazy allocator.
 *
 * @param[in] data The data for which memory will be allocated.
 * @param[in] alloc_cb The callback to allocate memory for @p data items.
 * @param[in] free_cb The callback to free memory for @p data items.
 * @param[in] num_init The number of @p data items to initially allocate space for.
 *
 * @return A new lazy allocator.
 *
  }

function eina_lalloc_new(data:pointer; alloc_cb:TEina_Lalloc_Alloc; free_cb:TEina_Lalloc_Free; num_init:longint):PEina_Lalloc;cdecl;external;
{*
 * @brief Frees the resources for a lazy allocator.
 *
 * @param[in,out] a The lazy allocator to free.
 *
  }
procedure eina_lalloc_free(a:PEina_Lalloc);cdecl;external;
{*
 * @brief Adds several elements to a lazy allocator.
 *
 * @param[in,out] a The lazy allocator to add items to.
 * @param[in] num The number of elements to add.
 *
 * @return #EINA_TRUE on success, else #EINA_FALSE.
 *
  }
function eina_lalloc_elements_add(a:PEina_Lalloc; num:longint):TEina_Bool;cdecl;external;
{*
 * @brief Allocates one more of whatever the lazy allocator is allocating.
 *
 * @param[in,out] a The lazy allocator to add an item to.
 *
 * @return #EINA_TRUE on success, else #EINA_FALSE.
 *
  }
function eina_lalloc_element_add(a:PEina_Lalloc):TEina_Bool;cdecl;external;
{*
 * @
  }
{*
 * @
  }
{$endif}
{ EINA_LALLOC_H_  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function EINA_LALLOC_ALLOC(_function : longint) : TEina_Lalloc_Alloc;
begin
  EINA_LALLOC_ALLOC:=TEina_Lalloc_Alloc(_function);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function EINA_LALLOC_FREE(_function : longint) : TEina_Lalloc_Free;
begin
  EINA_LALLOC_FREE:=TEina_Lalloc_Free(_function);
end;


end.
