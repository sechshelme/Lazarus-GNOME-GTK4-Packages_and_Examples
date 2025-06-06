
unit eina_inlist;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_inlist.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_inlist.h
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
PEina_Accessor  = ^Eina_Accessor;
PEina_Inlist  = ^Eina_Inlist;
PEina_Inlist_Sorted_State  = ^Eina_Inlist_Sorted_State;
PEina_Iterator  = ^Eina_Iterator;
Ptype  = ^type;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 2002-2008 Carsten Haitzler, Vincent Torri
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
{$ifndef EINA_INLIST_H_}
{$define EINA_INLIST_H_}
{$include "eina_types.h"}
{$include "eina_iterator.h"}
{$include "eina_accessor.h"}
{$include <stddef.h>}
{*
 * @page eina_inlist_01_example_page Eina_Inlist basic usage
 * @dontinclude eina_inlist_01.c
 *
 * To see the full source for this example, click here: @ref
 * eina_inlist_01_c
 *
 * As explained before, inline lists mean its nodes pointers are part of same
 * memory block/blob. This is done by using the macro @ref EINA_INLIST inside the
 * data structure that will be used:
 *
 * @skip struct
 * @until ;
 *
 * The resulting node representing this struct can be exemplified by the
 * following picture:
 *
 * @image html eina_inlist-node_eg1-my-struct.png
 * @image rtf eina_inlist-node_eg1-my-struct.png
 * @image latex eina_inlist-node_eg1-my-struct.eps
 *
 * Let's define a comparison function that will be used later during the
 * sorting of the list:
 *
 * @skip int
 * @until 
 *
 * The @ref Eina_Inlist can be used exactly the same way as @ref Eina_List when
 * appending, prepending and removing items. But since we already have the node
 * pointers inside the structure, they need to be retrieved with the macro @ref
 * EINA_INLIST_GET :
 *
 * @skip malloc
 * @until append
 *
 * Notice that @ref eina_inlist_append always receives the head of the list as
 * first argument, and its return value should be used as the list pointer
 * (head):
 *
 * @skip malloc
 * @until append
 *
 * After appending 3 items, the list now should look similar to this:
 *
 * @image html eina_inlist-node_eg1-inlist.png
 * @image rtf eina_inlist-node_eg1-inlist.png
 * @image latex eina_inlist-node_eg1-inlist.eps "" width=\textwidth
 *
 * The macro @ref EINA_INLIST_FOREACH can be used to iterate over the list:
 *
 * @skip printf
 * @until cur->a
 *
 * @ref eina_inlist_promote(), @ref eina_inlist_demote(), @ref
 * eina_inlist_append_relative() and similar functions all work in the same way
 * as the @ref Eina_List :
 *
 * @skip eina_inlist_promote
 * @until eina_inlist_demote
 *
 * Now let's use the @c sort_cb function declared above to sort our list:
 *
 * @skipline eina_inlist_sort
 *
 * Removing an element from the inlist is also similar to @ref Eina_List :
 *
 * @skip inlist_remove
 * @until free
 *
 * Another way of walking through the inlist.
 *
 * @skip for
 * @until 
 *
 * Notice that in the previous piece of code, since we only have the pointers to
 * the inlist nodes, we have to use the @ref EINA_INLIST_CONTAINER_GET macro
 * that will return the pointer to the entire structure. Of course, in this case
 * it is the same as the list pointer, since the @ref EINA_INLIST macro was used
 * in the beginning of the structure.
 *
 * Now to finish this example, lets delete this list:
 *
 * @skip while
 * @until 
 * @example eina_inlist_01.c
  }
{*
 * @page eina_inlist_02_example_page Eina_Inlist advanced usage - lists and inlists
 * @dontinclude eina_inlist_02.c
 *
 * This example describes the usage of @ref Eina_Inlist mixed with @ref
 * Eina_List . We create and add elements to an inlist, and the even members
 * are also added to a normal list. Later we remove the elements divisible by 3
 * from this normal list.
 *
 * The struct that is going to be used is the same used in @ref
 * eina_inlist_01_example_page , since we still need the @ref EINA_INLIST macro to
 * declare the inlist node info:
 *
 * @skip struct
 * @until ;
 *
 * The resulting node representing this struct can be exemplified by the
 * following picture:
 *
 * @image html eina_inlist-node_eg2-my-struct.png
 * @image rtf eina_inlist-node_eg2-my-struct.png
 * @image latex eina_inlist-node_eg2-my-struct.eps
 *
 * Now we need some pointers and auxiliary variables that will help us iterate on
 * the lists:
 *
 * @skip struct
 * @until l_next;
 *
 * Allocating 100 elements and putting them into an inlist, and the even
 * elements also go to the normal list:
 *
 * @skip for
 * @until 
 *
 * After this point, what we have are two distinct lists that share some
 * elements. The first list (inlist) is defined by the pointers inside the
 * elements data structure, while the second list (normal list) has its own node
 * data structure that is kept outside of the elements.
 *
 * The two lists, sharing some elements, can be represented by the following
 * picture:
 *
 * @image rtf eina_inlist-node_eg2-list-inlist.png
 * @image html eina_inlist-node_eg2-list-inlist.png
 * @image latex eina_inlist-node_eg2-list-inlist.eps "" width=\textwidth
 *
 * Accessing both lists is done normally, as if they didn't have any elements in
 * common:
 *
 * @skip printf
 * @until eina_list_count
 *
 * We can remove elements from the normal list, but we just don't free them
 * because they are still stored in the inlist:
 *
 * @skip EINA_LIST_FOREACH_SAFE
 * @until eina_list_count
 *
 * To finish this example, we want to free both lists, we can't just free all
 * elements on the second list (normal list) because they are still being used
 * in the inlist. So we first discard the normal list without freeing its
 * elements, then we free all elements in the inlist (that contains all elements
 * allocated until now):
 *
 * @skip eina_list_free
 * @until 
 *
 * Here is the full source code for this example: @ref eina_inlist_02_c
 * @example eina_inlist_02.c
  }
{*
 * @page eina_inlist_03_example_page Eina_Inlist advanced usage - multi-inlists
 * @dontinclude eina_inlist_03.c
 *
 * This example describes the usage of multiple inlists storing the same data.
 * It means that some data may appear in more than one inlist at the same time.
 * We will demonstrate this by creating an inlist with 100 numbers, and adding
 * the odd numbers to the second inlist, then remove the numbers divisible by 3
 * from the second list.
 *
 * To accomplish this, it is necessary to have two inlist pointers in the struct
 * that is going to be stored. We are using the default inlist member @ref
 * EINA_INLIST, and adding another member @c even that is of type @ref
 * Eina_Inlist too:
 *
 * @skip struct
 * @until ;
 *
 * The representation for this struct is:
 *
 * @image html eina_inlist-node_eg3-my-struct.png
 * @image rtf eina_inlist-node_eg3-my-struct.png
 * @image latex eina_inlist-node_eg3-my-struct.eps
 *
 * And we will define some convenience macros that are equivalent to @ref
 * EINA_INLIST_GET and @ref EINA_INLIST_CONTAINER_GET :
 *
 * @skip define
 * @until offsetof
 *
 * We need two pointers, one for each list, and a pointer that will be used as
 * an iterator:
 *
 * @skipline Eina_Inlist
 *
 * Now we allocate and add to the first list every number from 0 to 99. These
 * nodes data also have the @ref Eina_Inlist node info for the second list (@c
 * even). We will use them to add just the even numbers to the second list, the
 * @c list_even. Also notice that we are using our macro @c EVEN_INLIST_GET to
 * get the pointer to the even list node info:
 *
 * @skip for
 * @until 
 *
 * And the resulting lists will be as follow:
 *
 * @image rtf eina_inlist-node_eg3-two-inlists.png
 * @image html eina_inlist-node_eg3-two-inlists.png
 * @image latex eina_inlist-node_eg3-two-inlists.eps "" width=\textwidth
 *
 * For the first list, we can use the macro @ref EINA_INLIST_FOREACH to iterate
 * over its elements:
 *
 * @skip FOREACH
 * @until printf
 *
 * But for the second list, we have to do it manually. Of course we could create
 * a similar macro to @ref EINA_INLIST_FOREACH, but since this macro is more
 * complex than the other two and we are using it only once, it's better to just
 * do it manually:
 *
 * @skip for
 * @until 
 *
 * Let's just check that the two lists have the expected number of elements:
 *
 * @skip list count
 * @until list_even count
 *
 * And removing the numbers divisible by 3 only from the second list:
 *
 * @skip itr
 * @until list_even count
 *
 * Now that we don't need the two lists anymore, we can just free all the items.
 * Since all of the allocated data was put into the first list, and both lists
 * are made of pointers to inside the data structures, we can free only the
 * first list (that contains all the elements) and the second list will be gone
 * with it:
 *
 * @skip while
 * @until free
 *
 * To see the full source code for this example, click here: @ref
 * eina_inlist_03_c
 * @example eina_inlist_03.c
  }
{*
 * @page eina_inlist_01_c eina_inlist_01.c Eina_Inlist basic usage source
 * @include eina_inlist_01.c
  }
{*
 * @page eina_inlist_02_c eina_inlist_02.c Eina_Inlist advanced usage - lists and inlists source
 * @include eina_inlist_02.c
  }
{*
 * @page eina_inlist_03_c eina_inlist_03.c Eina_Inlist advanced usage - multi-inlists source
 * @include eina_inlist_03.c
  }
{*
 * @addtogroup Eina_Inline_List_Group Inline List
 *
 * @brief These functions provide inline list management.
 *
 * Inline lists mean its nodes pointers are part of same memory as
 * data. This has the benefit of fragmenting memory less and avoiding
 * @c node->data indirection, but has the drawback of higher cost for some
 * common operations like count and sort.
 *
 * It is possible to have inlist nodes to be part of regular lists, created with
 * @ref eina_list_append() or @ref eina_list_prepend(). It's also possible to
 * have a structure with two inlist pointers, thus be part of two different
 * inlists at the same time, but the current convenience macros provided won't
 * work for both of them. Consult @ref inlist_advanced for more info.
 *
 * Inline lists have their purposes, but if you don't know what those purposes are, go with
 * regular lists instead.
 *
 * Tip: When using inlists in more than one place (that is, passing them around
 * functions or keeping a pointer to them in a structure) it's more correct
 * to keep a pointer to the first container, and not a pointer to the first
 * inlist item (mostly they are the same, but that's not always correct).
 * This lets the compiler to do type checking and let the programmer know
 * exactly what type this list is.
 *
 * A simple example demonstrating the basic usage of an inlist can be found
 * here: @ref eina_inlist_01_example_page
 *
 * @section inlist_algo Algorithm
 *
 * The basic structure can be represented by the following picture:
 *
 * @image html eina_inlist-node.png
 * @image rtf eina_inlist-node.png
 * @image latex eina_inlist-node.eps
 *
 * One data structure will also have the node information, with three pointers:
 * @a prev, @a next and @a last. The @a last pointer is just valid for the first
 * element (the list head), otherwise each insertion in the list would have to
 * be done updating every node with the correct pointer. This means that it's
 * always very important to keep a pointer to the first element of the list,
 * since it is the only one that has the correct information to allow a proper
 * O(1) append to the list.
 *
 * @section inlist_perf Performance
 *
 * Due to the nature of the inlist, there's no accounting information, and no
 * easy access to the last element from each list node. This means that @ref
 * eina_inlist_count() is order-N, while @ref eina_list_count() is order-1 (constant
 * time).
 *
 * @section inlist_advanced Advanced Usage
 *
 * The basic usage considers a struct that will have the user data, and also
 * have an inlist node information (prev, next and last pointers) created with
 * @ref EINA_INLIST during the struct declaration. This allows one to use the
 * convenience macros @ref EINA_INLIST_GET(), @ref EINA_INLIST_CONTAINER_GET(),
 * @ref EINA_INLIST_FOREACH() and so. This happens because the @ref EINA_INLIST
 * macro declares a struct member with the name @a __inlist, and all the other
 * macros assume that this struct member has this name.
 *
 * It may be the case that someone needs to have some inlist nodes added to a
 * @ref Eina_List too. If this happens, the inlist nodes can be added to the
 * @ref Eina_List without any problems. This example demonstrates this case:
 * @ref eina_inlist_02_example_page
 *
 * It's also possible to have some data that is part of two different inlists.
 * If this is the case, then it won't be possible to use the convenience macros
 * to both of the lists. It will be necessary to create a new set of macros that
 * will allow access to the second list node info. An example for this usage can
 * be found here:
 * @ref eina_inlist_03_example_page
 *
 * List of examples:
 * @li @ref eina_inlist_01_example_page
 * @li @ref eina_inlist_02_example_page
 * @li @ref eina_inlist_03_example_page
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
 * @defgroup Eina_Inline_List_Group Inline List
 *
 * @
  }
{*
 * @typedef Eina_Inlist
 * Inlined list type.
  }
type
{*
 * @typedef Eina_Inlist_Sorted_State
 * @since 1.1.0
 * State of sorted Eina_Inlist
  }
{*
 * @struct _Eina_Inlist
 * Inlined list type.
  }
{*< next node  }
{*< previous node  }
{*< last node  }
  PEina_Inlist = ^TEina_Inlist;
  TEina_Inlist = record
      next : PEina_Inlist;
      prev : PEina_Inlist;
      last : PEina_Inlist;
    end;

{* Used for declaring an inlist member in a struct  }
{#define EINA_INLIST Eina_Inlist __in_list }
{* Utility macro to get the inlist object of a struct  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function EINA_INLIST_GET(Inlist : longint) : longint;

{* Utility macro to get the container object of an inlist  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function EINA_INLIST_CONTAINER_GET(ptr,_type : longint) : Ptype;

{*
 * @brief Adds a new node to end of a list.
 *
 * @note This code is meant to be fast: appends are O(1) and do not
 *       walk @a in_list.
 *
 * @note @a in_item is considered to be in no list. If it was in another
 *       list before, eina_inlist_remove() it before adding. No
 *       check of @a new_l prev and next pointers is done, so it's safe
 *       to have them uninitialized.
 *
 * @param[in,out] in_list Existing list head or @c NULL to create a new list.
 * @param[in] in_item New list node, must not be @c NULL.
 *
 * @return The new list head. Use it and not @a in_list anymore.
  }
function eina_inlist_append(in_list:PEina_Inlist; in_item:PEina_Inlist):PEina_Inlist;cdecl;external;
{*
 * @brief Adds a new node to beginning of list.
 *
 * @note This code is meant to be fast: appends are O(1) and do not
 *       walk @a in_list.
 *
 * @note @a new_l is considered to be in no list. If it was in another
 *       list before, eina_inlist_remove() it before adding. No
 *       check of @a new_l prev and next pointers is done, so it's safe
 *       to have them uninitialized.
 *
 * @param[in,out] in_list Existing list head or @c NULL to create a new list.
 * @param[in] in_item New list node, must not be @c NULL.
 *
 * @return The new list head. Use it and not @a in_list anymore.
  }
function eina_inlist_prepend(in_list:PEina_Inlist; in_item:PEina_Inlist):PEina_Inlist;cdecl;external;
{*
 * @brief Adds a new node after the given relative item in list.
 *
 * @note This code is meant to be fast: appends are O(1) and do not
 *       walk @a in_list.
 *
 * @note @a in_item_l is considered to be in no list. If it was in another
 *       list before, eina_inlist_remove() it before adding. No
 *       check of @a in_item prev and next pointers is done, so it's safe
 *       to have them uninitialized.
 *
 * @note @a in_relative is considered to be inside @a in_list, no checks are
 *       done to confirm that and giving nodes from different lists
 *       will lead to problems. Giving NULL @a in_relative is the same as
 *       eina_list_append().
 *
 * @param[in,out] in_list Existing list head or @c NULL to create a new list.
 * @param[in] in_item New list node, must not be @c NULL.
 * @param[in] in_relative Reference node, @a in_item will be added after it.
 *
 * @return The new list head. Use it and not @a list anymore.
  }
function eina_inlist_append_relative(in_list:PEina_Inlist; in_item:PEina_Inlist; in_relative:PEina_Inlist):PEina_Inlist;cdecl;external;
{*
 * @brief Adds a new node before the given relative item in list.
 *
 * @note This code is meant to be fast: appends are O(1) and do not
 *       walk @a in_list.
 *
 * @note @a in_item is considered to be in no list. If it was in another
 *       list before, eina_inlist_remove() it before adding. No
 *       check of @a in_item prev and next pointers is done, so it's safe
 *       to have them uninitialized.
 *
 * @note @a in_relative is considered to be inside @a in_list, no checks are
 *       done to confirm that and giving nodes from different lists
 *       will lead to problems. Giving NULL @a in_relative is the same as
 *       eina_list_prepend().
 *
 * @param[in,out] in_list Existing list head or @c NULL to create a new list.
 * @param[in] in_item New list node, must not be @c NULL.
 * @param[in] in_relative Reference node, @a in_item will be added before it.
 *
 * @return The new list head. Use it and not @a in_list anymore.
  }
function eina_inlist_prepend_relative(in_list:PEina_Inlist; in_item:PEina_Inlist; in_relative:PEina_Inlist):PEina_Inlist;cdecl;external;
{*
 * @brief Removes node from list.
 *
 * @note This code is meant to be fast: appends are O(1) and do not
 *       walk @a list.
 *
 * @note @a in_item is considered to be inside @a in_list, no checks are
 *       done to confirm that and giving nodes from different lists
 *       will lead to problems, especially if @a in_item is the head since
 *       it will be different from @a list and the wrong new head will
 *       be returned.
 *
 * @param[in,out] in_list Existing list head, must not be @c NULL.
 * @param[in] in_item Existing list node, must not be @c NULL.
 *
 * @return The new list head. Use it and not @a list anymore.
  }
function eina_inlist_remove(in_list:PEina_Inlist; in_item:PEina_Inlist):PEina_Inlist;cdecl;external;
{*
 * @brief Finds given node in list, returns itself if found, NULL if not.
 *
 * @warning This is an expensive call and has O(n) cost, possibly
 *    walking the whole list.
 *
 * @param[in] in_list Existing list to search @a in_item in, must not be @c NULL.
 * @param[in] in_item What to search for, must not be @c NULL.
 *
 * @return @a in_item if found, @c NULL if not.
  }
function eina_inlist_find(in_list:PEina_Inlist; in_item:PEina_Inlist):PEina_Inlist;cdecl;external;
{*
 * @brief Moves existing node to beginning of list.
 *
 * @note This code is meant to be fast: appends are O(1) and do not
 *       walk @a list.
 *
 * @note @a item is considered to be inside @a list. No checks are
 *       done to confirm this, and giving nodes from different lists
 *       will lead to problems.
 *
 * @param[in] list Existing list head or @c NULL to create a new list.
 * @param[in] item List node to move to beginning (head), must not be @c NULL.
 *
 * @return The new list head. Use it and not @a list anymore.
  }
function eina_inlist_promote(list:PEina_Inlist; item:PEina_Inlist):PEina_Inlist;cdecl;external;
{*
 * @brief Moves existing node to end of list.
 *
 * @note This code is meant to be fast: appends are O(1) and do not
 *       walk @a list.
 *
 * @note @a item is considered to be inside @a list. No checks are
 *       done to confirm this, and giving nodes from different lists
 *       will lead to problems.
 *
 * @param[in] list Existing list head or @c NULL to create a new list.
 * @param[in] item List node to move to end (tail), must not be @c NULL.
 *
 * @return The new list head. Use it and not @a list anymore.
  }
function eina_inlist_demote(list:PEina_Inlist; item:PEina_Inlist):PEina_Inlist;cdecl;external;
{*
 * @brief Gets the first list node in the list.
 *
 * @param[in] list The list to get the first list node from.
 * @return The first list node in the list.
 *
 * This function returns the first list node in the list @p list. If
 * @p list is @c NULL, @c NULL is returned.
 *
 * This is a O(N) operation (it takes time proportional
 * to the length of the list).
 *
 * @since 1.8
  }
{*
 * @brief Gets the count of the number of items in a list.
 *
 * @param[in] list The list whose count to return.
 * @return The number of members in the list.
 *
 * This function returns how many members @p list contains. If the
 * list is @c NULL, @c 0 is returned.
 *
 * @warning This is an order-N operation and so the time will depend
 *    on the number of elements on the list, so, it might become
 *    slow for big lists!
  }
(* Const before type ignored *)
function eina_inlist_count(list:PEina_Inlist):dword;cdecl;external;
{*
 * @brief Returns a new iterator associated to @a list.
 *
 * @param[in] in_list The list.
 * @return A new iterator.
 *
 * This function returns a newly allocated iterator associated to @p
 * in_list. If @p in_list is @c NULL or the count member of @p in_list is less
 * or equal than 0, this function still returns a valid iterator that
 * will always return false on eina_iterator_next(), thus keeping API
 * sane.
 *
 * If the memory can not be allocated, @c NULL is returned.
 * Otherwise, a valid iterator is returned.
 *
 * @warning if the list structure changes then the iterator becomes
 *    invalid, and if you add or remove nodes iterator
 *    behavior is undefined, and your program may crash!
  }
(* Const before type ignored *)
function eina_inlist_iterator_new(in_list:PEina_Inlist):PEina_Iterator;cdecl;external;
{*
 * @brief Returns a new accessor associated to a list.
 *
 * @param[in] in_list The list.
 * @return A new accessor.
 *
 * This function returns a newly allocated accessor associated to
 * @p in_list. If @p in_list is @c NULL or the count member of @p in_list is
 * less or equal than @c 0, this function returns @c NULL. If the memory can
 * not be allocated, @c NULL is returned and Otherwise, a valid accessor is
 * returned.
  }
(* Const before type ignored *)
function eina_inlist_accessor_new(in_list:PEina_Inlist):PEina_Accessor;cdecl;external;
{*
 * @brief Inserts a new node into a sorted list.
 *
 * @param[in,out] list The given linked list, @b must be sorted.
 * @param[in] item List node to insert, must not be @c NULL.
 * @param[in] func The function called for the sort.
 * @return A list pointer.
 *
 * This function inserts item into a linked list assuming it was
 * sorted and the result will be sorted. If @p list is @c NULL, item
 * is returned. On success, a new list pointer that should be
 * used in place of the one given to this function is
 * returned. Otherwise, the old pointer is returned.
 *
 * @note O(log2(n)) comparisons (calls to @p func) average/worst case
 * performance. As said in eina_list_search_sorted_near_list(),
 * lists do not have O(1) access time, so walking to the correct node
 * can be costly, consider worst case to be almost O(n) pointer
 * dereference (list walk).
 *
 * @since 1.1.0
  }
function eina_inlist_sorted_insert(list:PEina_Inlist; item:PEina_Inlist; func:TEina_Compare_Cb):PEina_Inlist;cdecl;external;
{*
 * @brief Creates state with valid data in it.
 *
 * @return A valid Eina_Inlist_Sorted_State.
 *
 * @since 1.1.0
 *
 * See eina_inlist_sorted_state_insert() for more information.
  }
function eina_inlist_sorted_state_new:PEina_Inlist_Sorted_State;cdecl;external;
{*
 * @brief Forces an Eina_Inlist_Sorted_State to match the content of a list.
 *
 * @param[in,out] state The state to update
 * @param[in] list The list to match
 * @return The number of item in the actually in the list
 *
 * @since 1.1.0
 *
 * See eina_inlist_sorted_state_insert() for more information. This function is
 * useful if you didn't use eina_inlist_sorted_state_insert() at some point, but
 * still think you have a sorted list. It will only correctly work on a sorted list.
  }
function eina_inlist_sorted_state_init(state:PEina_Inlist_Sorted_State; list:PEina_Inlist):longint;cdecl;external;
{*
 * @brief Frees an Eina_Inlist_Sorted_State.
 *
 * @param[in,out] state The state to destroy
 *
 * @since 1.1.0
 *
 * See eina_inlist_sorted_state_insert() for more information.
  }
procedure eina_inlist_sorted_state_free(state:PEina_Inlist_Sorted_State);cdecl;external;
{*
 * @brief Inserts a new node into a sorted list.
 *
 * @param[in,out] list The given linked list, @b must be sorted.
 * @param[in] item list node to insert, must not be @c NULL.
 * @param[in] func The function called for the sort.
 * @param[in,out] state The current array for initial dichotomic search
 * @return A list pointer.
 * @since 1.1.0
 *
 * This function inserts item into a linked list assuming @p state matches
 * the exact content order of the list. It uses @p state to do a fast
 * first step dichotomic search before starting to walk the inlist itself.
 * This makes this code much faster than eina_inlist_sorted_insert() as it
 * doesn't need to walk the list at all. The result is of course a sorted
 * list with an updated state. If @p list is @c NULL, item
 * is returned. On success, a new list pointer that should be
 * used in place of the one given to this function is
 * returned. Otherwise, the old pointer is returned.
 *
 * @note O(log2(n)) comparisons (calls to @p func) average/worst case
 * performance. As said in eina_list_search_sorted_near_list(),
 * lists do not have O(1) access time, so walking to the correct node
 * can be costly, but this version tries to minimize that by making it a
 * O(log2(n)) for number small number. After n == 256, it starts to add a
 * linear cost again. Consider worst case to be almost O(n) pointer
 * dereference (list walk).
  }
function eina_inlist_sorted_state_insert(list:PEina_Inlist; item:PEina_Inlist; func:TEina_Compare_Cb; state:PEina_Inlist_Sorted_State):PEina_Inlist;cdecl;external;
{*
 * @brief Sorts a list according to the ordering func will return.
 *
 * @param[in,out] head The list handle to sort.
 * @param[in] func A function pointer that can handle comparing the list data
 * nodes.
 * @return the new head of list.
 *
 * This function sorts all the elements of @p head. @p func is used to
 * compare two elements of @p head. If @p head or @p func are @c NULL,
 * this function returns @c NULL.
 *
 * @note @b in-place: this will change the given list, so you should
 * now point to the new list head that is returned by this function.
 *
 * @note Worst case is O(n * log2(n)) comparisons (calls to func()).
 * That means that for 1,000,000 list  elements, sort will do 20,000,000
 * comparisons.
 *
 * Example:
 * @code
 * typedef struct _Sort_Ex Sort_Ex;
 * struct _Sort_Ex
 * 
 *   EINA_INLIST;
 *   const char *text;
 * ;
 *
 * int
 * sort_cb(const Inlist *l1, const Inlist *l2)
 * 
 *    const Sort_Ex *x1;
 *    const Sort_Ex *x2;
 *
 *    x1 = EINA_INLIST_CONTAINER_GET(l1, Sort_Ex);
 *    x2 = EINA_INLIST_CONTAINER_GET(l2, Sort_Ex);
 *
 *    return(strcmp(x1->text, x2->text));
 * 
 * extern Eina_Inlist *list;
 *
 * list = eina_inlist_sort(list, sort_cb);
 * @endcode
  }
function eina_inlist_sort(head:PEina_Inlist; func:TEina_Compare_Cb):PEina_Inlist;cdecl;external;
{ These two macros are helpers for the _FOREACH ones, don't use them  }
{*
 * @def _EINA_INLIST_OFFSET
 * @param[in,out] ref The reference to be used.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _EINA_INLIST_OFFSET(ref : longint) : longint;

{$if !defined(__cplusplus)}
{*
 * @def _EINA_INLIST_CONTAINER
 * @param[in,out] ref The reference to be used.
 * @param[out] ptr The pointer to be used.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function _EINA_INLIST_CONTAINER(ref,ptr : longint) : pointer;

{$else}
{
 * In C++ we can't assign a "type*" pointer to void* so we rely on GCC's typeof
 * operator.
  }
{$endif}
{*
 * @def EINA_INLIST_FOREACH
 * @param[in,out] list The list to iterate on.
 * @param[out] it The pointer to the list item, i.e. a pointer to each
 *             item that is part of the list.
  }
{*
 * @def EINA_INLIST_FOREACH_SAFE
 * @param[in,out] list The list to iterate on.
 * @param[out] list2 Auxiliary Eina_Inlist variable so we can save the
 *             pointer to the next element, allowing us to free/remove
 *             the current one. Note that this macro is only safe if the
 *             next element is not removed. Only the current one is
 *             allowed to be removed.
 * @param[out] it The pointer to the list item, i.e. a pointer to each
 *             item that is part of the list.
  }
{*
 * @def EINA_INLIST_REVERSE_FOREACH
 * @param[in,out] list The list to traverse in reverse order.
 * @param[out] it The pointer to the list item, i.e. a pointer to each
 *             item that is part of the list.
  }
{*
 * @def EINA_INLIST_REVERSE_FOREACH_FROM
 * @param[in,out] list The last list to traverse in reverse order.
 * @param[in] it The pointer to the list item, i.e. a pointer to each
 *            item that is part of the list.
 * @see EINA_INLIST_REVERSE_FOREACH()
 *
 * @since 1.8
 *
 * EINA_INLIST_REVERSE_FOREACH() starts from last list of the given list.
 * This starts from given list, not the last one.
  }
{*
 * @def EINA_INLIST_FREE
 * @param[in,out] list The list to free.
 * @param[in] it The pointer to the list item, i.e. a pointer to each item
 *            that is part of the list.
 *
 * NOTE: it is the duty of the body loop to properly remove the item from the
 * inlist and free it. This function will turn into a infinite loop if you
 * don't remove all items from the list.
 * @since 1.8
  }
{$include "eina_inline_inlist.x"}
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
{EINA_INLIST_H_ }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EINA_INLIST_GET(Inlist : longint) : longint;
begin
  EINA_INLIST_GET:=@(Inlist^.__in_list);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function EINA_INLIST_CONTAINER_GET(ptr,_type : longint) : Ptype;
begin
  EINA_INLIST_CONTAINER_GET:=Ptype(pointer((Pchar(ptr))-(offsetof(_type,__in_list))));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _EINA_INLIST_OFFSET(ref : longint) : longint;
begin
  _EINA_INLIST_OFFSET:=(Pchar(@(ref^.__in_list)))-(Pchar(ref));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function _EINA_INLIST_CONTAINER(ref,ptr : longint) : pointer;
begin
  _EINA_INLIST_CONTAINER:=pointer(Pchar(Tptr(-(_EINA_INLIST_OFFSET(ref)))));
end;


end.
