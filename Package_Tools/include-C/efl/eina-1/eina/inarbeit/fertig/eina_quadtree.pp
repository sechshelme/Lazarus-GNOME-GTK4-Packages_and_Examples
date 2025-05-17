
unit eina_quadtree;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_quadtree.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_quadtree.h
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
PEina_Inlist  = ^Eina_Inlist;
PEina_Quad_Direction  = ^Eina_Quad_Direction;
PEina_QuadTree  = ^Eina_QuadTree;
PEina_QuadTree_Item  = ^Eina_QuadTree_Item;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 2010 Cedric BAIL
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
{$ifndef EINA_QUADTREE_H_}
{$define EINA_QUADTREE_H_}
{$include "eina_config.h"}
{$include "eina_inlist.h"}
{*
 * @addtogroup Eina_Data_Types_Group Data Types
 *
 * @
  }
{*
 * @defgroup Eina_Quadtree_Group Quadtrees
 *
 * @brief Quadtree operations.
 *
 * @
  }
{*
 * @typedef Eina_QuadTree
 *
 * A quadtree is a data structure where each node contains four child
 * nodes.  It can be used to partition 2D spaces through subdivision
 * into quadrants.
  }
type
{*
 * @typedef Eina_QuadTree_Item
 *
 * A quadtree item is a holder for (void *) data items inside a
 * quadtree, that includes some state tracking for lifecycle management
 * and optimization purposes.
  }
{*
 * @typedef Eina_Quad_Direction
  }

  PEina_Quad_Direction = ^TEina_Quad_Direction;
  TEina_Quad_Direction =  Longint;
  Const
    EINA_QUAD_LEFT = 0;
    EINA_QUAD_RIGHT = 1;
    EINA_QUAD_BOTH = 2;
;
{*
 * @typedef Eina_Quad_Callback
 *
 * Signature for a callback routine used to determine the location of an
 * object within a quadtree.  These are used in sorting by determining
 * where in the tree the given data @p object belongs, using @p middle
 * as the division line for the two halves of the space.
  }
(* Const before type ignored *)
type

  TEina_Quad_Callback = function (object:pointer; middle:Tsize_t):TEina_Quad_Direction;cdecl;
{*
 * @brief Constructs a quadtree object.
 *
 * @param[in] w The geometric width of the quadtree.
 * @param[in] h The geometric height of the quadtree.
 * @param[in] vertical The callback for vertical direction determination.
 * @param[in] horizontal The callback for horizontal direction determination.
 * @return The newly allocated and initialized quadtree, or @c NULL on error.
 *
 * The vertical and horizontal callbacks are used to assist in
 * determining which quadrant a given data item belongs to.
  }

function eina_quadtree_new(w:Tsize_t; h:Tsize_t; vertical:TEina_Quad_Callback; horizontal:TEina_Quad_Callback):PEina_QuadTree;cdecl;external;
{*
 * @brief Destructs quadtree and its data.
 *
 * @param[in] q The quadtree to be freed.
 *
 * Frees the memory for the Eina_QuadTree object, and any memory used by
 * its change tracking and garbage collection internals.
  }
procedure eina_quadtree_free(q:PEina_QuadTree);cdecl;external;
{*
 * @brief Changes the width and height of the quadtree.
 *
 * @param[in,out] q The quadtree to resize.
 * @param[in] w The new geometric width for the quadtree.
 * @param[in] h The new geometric height for the quadtree.
 *
 * Sets the width and height of the quadtree, but the actual update is
 * done lazily.
  }
procedure eina_quadtree_resize(q:PEina_QuadTree; w:Tsize_t; h:Tsize_t);cdecl;external;
{*
 * @brief Sets the quadtree's index to 0.
 *
 * @param[in,out] q The quadtree to cycle.
  }
procedure eina_quadtree_cycle(q:PEina_QuadTree);cdecl;external;
{*
 * @brief Increases the index of the quadtree item by one.
 *
 * @param[in,out] object The quadtree item to increase.
 *
 * If necessary, records that the root is no longer sorted.
  }
procedure eina_quadtree_increase(object:PEina_QuadTree_Item);cdecl;external;
{*
 * @brief Inserts a data object into the quadtree.
 *
 * @param[in,out] q The quadtree to add @p object to.
 * @param[in] object A data object to store in the quadtree.
 * @return Pointer to the stored quadtree item.
 *
 * Creates an Eina_QuadTree_Item (or recycles one from the quadtree's
 * trash) and stores the data @p object in it, then arranges to lazily
 * insert the item into the quadtree (i.e. insertion is delayed until
 * it needs to be used.)
  }
(* Const before type ignored *)
function eina_quadtree_add(q:PEina_QuadTree; object:pointer):PEina_QuadTree_Item;cdecl;external;
{*
 * @brief Deletes a given quadtree item from the quadtree.
 *
 * @param[in] object The quadtree item to be deleted.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * Moves the item to the quadtree's internal garbage heap for later
 * reclamation.
  }
function eina_quadtree_del(object:PEina_QuadTree_Item):TEina_Bool;cdecl;external;
{*
 * @brief Marks an object within the quadtree as needing changed.
 *
 * @param[in,out] object The object that has changed.
 * @return #EINA_TRUE if change successfully noted, or #EINA_FALSE otherwise.
  }
function eina_quadtree_change(object:PEina_QuadTree_Item):TEina_Bool;cdecl;external;
{*
 * @brief Sets @p object invisible.
 *
 * @param[in,out] object The item within the quadtree to hide.
 * @return #EINA_TRUE if @p object was successfully hidden, or
 *         #EINA_FALSE if it wasn't in the quadtree.
  }
function eina_quadtree_hide(object:PEina_QuadTree_Item):TEina_Bool;cdecl;external;
{*
 * @brief Sets @p object to visible.
 *
 * @param[in,out] object The item within the quadtree to show.
 * @return #EINA_TRUE if @p object was successfully shown, or
 *         #EINA_FALSE if it wasn't in the quadtree.
  }
function eina_quadtree_show(object:PEina_QuadTree_Item):TEina_Bool;cdecl;external;
{*
 * @brief Retrieves items in quadtree inside the target geometry.
 *
 * @param[in,out] q The quadtree to recompute.
 * @param[in] x New target X coordinate.
 * @param[in] y New target Y coordinate.
 * @param[in] w New target width.
 * @param[in] h New target height.
 * @return The list of collided items or @c NULL on error.
 *
 * Forces a rebuild and resort of the quadtree if needed due to pending
 * changes, then performs a collision detection to find items whose
 * geometry is contained within or intersects the given target geometry.
  }
function eina_quadtree_collide(q:PEina_QuadTree; x:longint; y:longint; w:longint; h:longint):PEina_Inlist;cdecl;external;
{*
 * @brief Retrieves the quadtree item's data for the given inline list.
 *
 * @param[in] list The inline list item to lookup
 * @return The contained data object in the Eina_QuadTree_Item, or @c
 *         NULL if none could be found.
  }
function eina_quadtree_object(list:PEina_Inlist):pointer;cdecl;external;
{*
 * @
  }
{*
 * @
  }
{$endif}

implementation


end.
