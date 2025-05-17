
unit eina_rbtree;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_rbtree.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_rbtree.h
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
PEina_Iterator  = ^Eina_Iterator;
PEina_Rbtree  = ^Eina_Rbtree;
PEina_Rbtree_Color  = ^Eina_Rbtree_Color;
PEina_Rbtree_Direction  = ^Eina_Rbtree_Direction;
PType  = ^Type;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 2008 Cedric Bail
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
{$ifndef EINA_RBTREE_H__}
{$define EINA_RBTREE_H__}
{$include <stdlib.h>}
{$include "eina_types.h"}
{$include "eina_error.h"}
{$include "eina_iterator.h"}
{*
 * @addtogroup Eina_Rbtree_Group Red-Black tree
 *
 * @brief These functions provide Red-Black tree management.
 *
 * For a brief description look at http://en.wikipedia.org/wiki/Red-black_tree .
 * This code is largely inspired from a tutorial written by Julienne Walker at :
 * http://eternallyconfuzzled.com/tuts/datastructures/jsw_tut_rbtree.aspx . The
 * main difference is that this set of functions never allocate any data, making
 * them particularly useful for memory management.
  }
{*
 * @addtogroup Eina_Data_Types_Group Data Types
 *
 * @
  }
{*
 * @addtogroup Eina_Containers_Group Containers
 *
 * @
  }
{*
 * @defgroup Eina_Rbtree_Group Red-Black tree
 *
 * @
  }
{*
 * @typedef Eina_Rbtree_Color
 * node color.
  }
type
  PEina_Rbtree_Color = ^TEina_Rbtree_Color;
  TEina_Rbtree_Color =  Longint;
  Const
    EINA_RBTREE_RED = 0;
    EINA_RBTREE_BLACK = 1;
;
{*
 * @typedef Eina_Rbtree_Direction
 * walk direction.
  }
type
  PEina_Rbtree_Direction = ^TEina_Rbtree_Direction;
  TEina_Rbtree_Direction =  Longint;
  Const
    EINA_RBTREE_LEFT = 0;
    EINA_RBTREE_RIGHT = 1;
;
{*
 * @typedef Eina_Rbtree
 * Type for a Red-Black tree node. It should be inlined into user's type.
  }
type
  PEina_Rbtree = ^TEina_Rbtree;
  TEina_Rbtree = record
      son : array[0..1] of PEina_Rbtree;
      flag0 : word;
    end;


const
  bm_TEina_Rbtree_color = $1;
  bp_TEina_Rbtree_color = 0;

function color(var a : TEina_Rbtree) : dword;
procedure set_color(var a : TEina_Rbtree; __color : dword);
{*
 * @def EINA_RBTREE
 * recommended way to declare the inlined Eina_Rbtree in your type.
 *
 * @code
 * struct my_type 
 *    EINA_RBTREE;
 *    int my_value;
 *    char *my_name;
 * ;
 * @endcode
 *
 * @see EINA_RBTREE_GET()
  }
{*
 * @def EINA_RBTREE_GET
 * access the inlined node if it was created with #EINA_RBTREE.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function EINA_RBTREE_GET(Rbtree : longint) : longint;

{*
 * @def EINA_RBTREE_CONTAINER_GET
 * find back the container of a red black tree.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function EINA_RBTREE_CONTAINER_GET(Ptr,_Type : longint) : PType;

{*
 * @typedef Eina_Rbtree_Cmp_Node_Cb
 * Function used to compare two nodes and see which direction to navigate.
  }
(* Const before type ignored *)
(* Const before type ignored *)
type

  TEina_Rbtree_Cmp_Node_Cb = function (left:PEina_Rbtree; right:PEina_Rbtree; data:pointer):TEina_Rbtree_Direction;cdecl;
{*
 * @def EINA_RBTREE_CMP_NODE_CB
 * Cast using #Eina_Rbtree_Cmp_Node_Cb
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function EINA_RBTREE_CMP_NODE_CB(_Function : longint) : TEina_Rbtree_Cmp_Node_Cb;

{*
 * @typedef Eina_Rbtree_Cmp_Key_Cb
 * Function used compare node with a given key of specified length.
  }
(* Const before type ignored *)
(* Const before type ignored *)
type

  TEina_Rbtree_Cmp_Key_Cb = function (node:PEina_Rbtree; key:pointer; length:longint; data:pointer):longint;cdecl;
{*
 * @def EINA_RBTREE_CMP_KEY_CB
 * Cast using #Eina_Rbtree_Cmp_Key_Cb
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function EINA_RBTREE_CMP_KEY_CB(_Function : longint) : TEina_Rbtree_Cmp_Key_Cb;

{*
 * @typedef Eina_Rbtree_Free_Cb
 * Function used to free a node.
  }
type

  TEina_Rbtree_Free_Cb = procedure (node:PEina_Rbtree; data:pointer);cdecl;
{*
 * @def EINA_RBTREE_FREE_CB
 * Cast using #Eina_Rbtree_Free_Cb
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function EINA_RBTREE_FREE_CB(_Function : longint) : TEina_Rbtree_Free_Cb;

{*
 * @brief Inserts a new node inside an existing red black tree.
 *
 * @param[in,out] root The root of an existing valid red black tree.
 * @param[in] node The new node to insert.
 * @param[in] cmp The callback that is able to compare two nodes.
 * @param[in] data Private data to help the compare function.
 * @return The new root of the red black tree.
 *
 * This function inserts a new node in a valid red black tree. @c NULL is
 * an empty valid red black tree. The resulting new tree is a valid red
 * black tree. This function doesn't allocate any data.
  }
(* Const before type ignored *)
function eina_rbtree_inline_insert(root:PEina_Rbtree; node:PEina_Rbtree; cmp:TEina_Rbtree_Cmp_Node_Cb; data:pointer):PEina_Rbtree;cdecl;external;
{*
 * @brief Removes a node from an existing red black tree.
 *
 * @param[in,out] root The root of a valid red black tree.
 * @param[in] node The node to remove from the tree.
 * @param[in] cmp The callback that is able to compare two nodes.
 * @param[in] data Private data to help the compare function.
 * @return The new root of the red black tree.
 *
 * This function removes a new node in a valid red black tree that should
 * contain the node that you are removing. This function will return @c NULL
 * when the red black tree got empty. This function doesn't free any data.
  }
(* Const before type ignored *)
function eina_rbtree_inline_remove(root:PEina_Rbtree; node:PEina_Rbtree; cmp:TEina_Rbtree_Cmp_Node_Cb; data:pointer):PEina_Rbtree;cdecl;external;
{*
 * @brief Deletes all nodes from a valid red black tree.
 *
 * @param[in,out] root The root of a valid red black tree.
 * @param[in] func The callback that will free each node.
 * @param[in] data Private data to help the compare function.
  }
procedure eina_rbtree_delete(root:PEina_Rbtree; func:TEina_Rbtree_Free_Cb; data:pointer);cdecl;external;
{*
 * @brief Searches tree for a key using a comparison function.
 *
 * @param[in,out] root The root of a valid red black tree.
 * @param[in] key The key value to search for.
 * @param[in] length The length of the specified key.
 * @param[in] cmp Callback routine to compare two nodes.
 * @param[in] data Private data to help the compare function.
 *
 * @return The first matching node found in the red black tree, or
 * @p root if nothing was found.
  }
{*
 * @brief Returns a new prefix iterator associated with a rbtree.
 *
 * @param[in] root The root of rbtree.
 * @return A new iterator.
 *
 * This function returns a newly allocated iterator associated with @p
 * root. It will iterate the tree using prefix walk. If @p root is @c
 * NULL, this function still returns a valid iterator that will always
 * return false on eina_iterator_next(), thus keeping API sane.
 *
 * If the memory cannot be allocated, @c NULL is returned.
 * Otherwise, a valid iterator is returned.
 *
 * @warning if the rbtree structure changes then the iterator becomes
 *    invalid! That is, if you add or remove nodes this iterator
 *    behavior is undefined and your program may crash!
  }
(* Const before type ignored *)
function eina_rbtree_iterator_prefix(root:PEina_Rbtree):PEina_Iterator;cdecl;external;
{*
 * @brief Returns a new prefix iterator associated with a rbtree.
 *
 * @param[in] root The root of rbtree.
 * @return A new iterator.
 *
 * This function returns a newly allocated iterator associated with @p
 * root. It will iterate the tree using infix walk. If @p root is @c
 * NULL, this function still returns a valid iterator that will always
 * return false on eina_iterator_next(), thus keeping API sane.
 *
 * If the memory cannot be allocated, @c NULL is returned.
 * Otherwise, a valid iterator is returned.
 *
 * @warning if the rbtree structure changes then the iterator becomes
 *    invalid! That is, if you add or remove nodes this iterator
 *    behavior is undefined and your program may crash!
  }
(* Const before type ignored *)
function eina_rbtree_iterator_infix(root:PEina_Rbtree):PEina_Iterator;cdecl;external;
{*
 * @brief Returns a new prefix iterator associated with a rbtree.
 *
 * @param[in] root The root of rbtree.
 * @return A new iterator.
 *
 * This function returns a newly allocated iterator associated with @p
 * root. It will iterate the tree using postfix walk. If @p root is @c
 * NULL, this function still returns a valid iterator that will always
 * return false on eina_iterator_next(), thus keeping API sane.
 *
 * If the memory cannot be allocated, @c NULL is returned.
 * Otherwise, a valid iterator is returned.
 *
 * @warning if the rbtree structure changes then the iterator becomes
 *    invalid! That is, if you add or remove nodes this iterator
 *    behavior is undefined and your program may crash!
  }
(* Const before type ignored *)
function eina_rbtree_iterator_postfix(root:PEina_Rbtree):PEina_Iterator;cdecl;external;
{$include "eina_inline_rbtree.x"}
{*
 * @
  }
{*
 * @
  }
{*
 * @
  }
{$endif}

implementation

function color(var a : TEina_Rbtree) : dword;
begin
  color:=(a.flag0 and bm_TEina_Rbtree_color) shr bp_TEina_Rbtree_color;
end;

procedure set_color(var a : TEina_Rbtree; __color : dword);
begin
  a.flag0:=a.flag0 or ((__color shl bp_TEina_Rbtree_color) and bm_TEina_Rbtree_color);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EINA_RBTREE_GET(Rbtree : longint) : longint;
begin
  EINA_RBTREE_GET:=@(Rbtree^.__rbtree);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function EINA_RBTREE_CONTAINER_GET(Ptr,_Type : longint) : PType;
begin
  EINA_RBTREE_CONTAINER_GET:=PType((Pchar(Ptr))-(offsetof(_Type,__rbtree)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function EINA_RBTREE_CMP_NODE_CB(_Function : longint) : TEina_Rbtree_Cmp_Node_Cb;
begin
  EINA_RBTREE_CMP_NODE_CB:=TEina_Rbtree_Cmp_Node_Cb(_Function);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function EINA_RBTREE_CMP_KEY_CB(_Function : longint) : TEina_Rbtree_Cmp_Key_Cb;
begin
  EINA_RBTREE_CMP_KEY_CB:=TEina_Rbtree_Cmp_Key_Cb(_Function);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function EINA_RBTREE_FREE_CB(_Function : longint) : TEina_Rbtree_Free_Cb;
begin
  EINA_RBTREE_FREE_CB:=TEina_Rbtree_Free_Cb(_Function);
end;


end.
