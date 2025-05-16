/*
 * Linked lists support
 *
 * Copyright (C) 2002 Alexandre Julliard
 * Copyright (C) 2011 Mike McCormack (adapted for Eina)
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
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
 */

#ifndef __EINA_CLIST_H__
#define __EINA_CLIST_H__

/**
 * @defgroup Eina_CList_Group Compact List
 * @ingroup Eina_Containers_Group
 *
 * @{
 *
 * @brief Eina_Clist is a compact (inline) list implementation.
 *
 * Elements of this list are members of the structs stored in the list.
 *
 * Advantages over @ref Eina_List and @ref Eina_Inlist :
 * - Uses less memory (two machine words per item).
 * - Allows removing items without knowing which list they're in while using O(1) time.
 * - Doesn't need to keep updating the head pointer as the list is changed.
 *
 * Disadvantages:
 * - O(N) time to calculate the list length.
 * - Requires one list entry in a struct per list (i.e. it's an inlist).
 * - Requires a head/tail pointer.
 * - Needs to know the list head when moving to the next or previous pointer.
 *
 * @note There's no @c NULL at the end of the list, the last item points to the head.
 *
 * @note List heads must be initialized with EINA_CLIST_INIT or by calling eina_clist_element_init.
 *
 * Define a list as follows:
 *
 * @code
 *   struct gadget
 *   {
 *       struct Eina_Clist  entry;   <-- doesn't have to be the first item in the struct
 *       int                a, b;
 *   };
 *
 *   static Eina_Clist global_gadgets = EINA_CLIST_INIT( global_gadgets );
 * @endcode
 *
 * or
 *
 * @code
 *   struct some_global_thing
 *   {
 *       Eina_Clist gadgets;
 *   };
 *
 *   eina_clist_init( &some_global_thing->gadgets );
 * @endcode
 *
 * Manipulate it like this:
 *
 * @code
 *   eina_clist_add_head( &global_gadgets, &new_gadget->entry );
 *   eina_clist_remove( &new_gadget->entry );
 *   eina_clist_add_after( &some_random_gadget->entry, &new_gadget->entry );
 * @endcode
 *
 * And to iterate over it:
 *
 * @code
 *   struct gadget *gadget;
 *   EINA_CLIST_FOR_EACH_ENTRY( gadget, &global_gadgets, struct gadget, entry )
 *   {
 *       ...
 *   }
 * @endcode
 *
 */

/**
 * @typedef Eina_Clist
 * @brief Type for #_Eina_Clist structure containing the list head and the list entry.
 * @since 1.1.0
 */
typedef struct _Eina_Clist Eina_Clist;

/**
 * @struct _Eina_Clist
 * @brief The structure type for a compact list type.
 *
 * @note This structure is used as both the list head and the list entry.
 *
 * @since 1.1.0
 */
struct _Eina_Clist
{
   Eina_Clist *next; /**< The next entry in the list */
   Eina_Clist *prev; /**< The previous entry in the list */
};

/**
 * @brief Adds an element after the specified one.
 *
 * @param[in,out] elem An element in the list
 * @param[in] to_add The element to add to the list
 * @pre The list head must be initialized once before adding anything.
 * @pre The element is not in any list.
 *
 * @note There is no need to initialize an element before adding it to the list.
 *
 * @since 1.1.0
 */

/**
 * @def EINA_CLIST_FOR_EACH
 * @brief Iterates through the list.
 *
 * @param[out] cursor The pointer to be used during the interaction
 * @param[in] list The list to be interacted with
 */

/**
 * @def EINA_CLIST_FOR_EACH_SAFE
 * @brief Iterates through the list, with safety against removal.
 *
 * @param[out] cursor The pointer to be used during the interaction
 * @param[out] cursor2 The auxiliary pointer to be used during the interaction
 * @param[in] list The list to be interacted with
 */

/**
 * @def EINA_CLIST_FOR_EACH_ENTRY_SAFE
 * @brief Iterates through the list using a list entry, with safety against removal.
 *
 * @param[out] cursor The pointer to be used during the interaction
 * @param[out] cursor2 The auxiliary pointer to be used during the interaction
 * @param[in] list The list to be interacted with
 * @param[in] type The type of the list
 * @param[in] field The field of the element
*/

#include "eina_inline_clist.x"

/**
 * @}
 */

#endif /* __EINA_CLIST_H__ */
