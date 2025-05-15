
unit eina_iterator;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_iterator.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_iterator.h
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
PEina_Iterator  = ^Eina_Iterator;
PEina_Iterator_Get_Container_Callback  = ^Eina_Iterator_Get_Container_Callback;
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
{$ifndef EINA_ITERATOR_H__}
{$define EINA_ITERATOR_H__}
{$include "eina_config.h"}
{$include "eina_types.h"}
{$include ".h"}
{*
 * @page eina_iterator_example_page Eina_Iterator usage
 * @dontinclude eina_iterator_01.c
 *
 * As always when using eina we need to include it:
 * @skip #include
 * @until Eina.h
 *
 * Here we a declare an unimpressive @ref Eina_Each_Cb "function" that prints
 * some data:
 * @until 
 * @note Returning EINA_TRUE is important so we don't stop iterating over the
 * container.
 *
 * And here's a more interesting function, it uses an iterator to print the
 * contents of a container. What's interesting about it is that it doesn't care
 * the type of container, it works for anything that can provide an iterator:
 * @until 
 *
 * And on to our main function were we declare some variables and initialize
 * eina, nothing too special:
 * @until eina_init
 *
 * Next we populate both an array and a list with our strings, for more details
 * see @ref eina_list_01_example_page and @ref eina_array_01_example_page :
 * @until 
 *
 * And now we create an array and because the first element of the container
 * doesn't interest us we skip it:
 * @until iterator_next
 *
 * Having our iterator now pointing to interesting data we go ahead and print:
 * @until print_eina_container
 *
 * As always once data with a structure we free it, but just because we can we
 * do it by asking the iterator for it's container, and then of course free the
 * iterator itself:
 * @until eina_iterator_free
 *
 * But so far you're not impressed in @ref eina_array_01_example_page an array is
 * also printed, so now we go to the cool stuff and use an iterator to do same
 * stuff to a list:
 * @until eina_iterator_free
 * @note The only significant difference to the block above is in the
 * function used to create the iterator.
 *
 * And now we free the list and shut eina down:
 * @until 
  }
{*
 * @page eina_iterator_01_c Eina_Iterator usage
 * @page eina_iterator_01_c Eina_Iterator usage
 *
 * @include eina_iterator_01.c
 * @example eina_iterator_01.c
  }
{*
 * @addtogroup Eina_Iterator_Group Iterator Functions
 *
 * @brief These functions manage iterators on containers.
 *
 * These functions allow accessing elements of a container in a
 * generic way, without knowing which container is used (a bit like
 * iterators in the C++ STL). Iterators only allow sequential access
 * (that is, from one element to the next one). For random access, see
 * @ref Eina_Accessor_Group.
 *
 * Getting an iterator to access elements of a given container is done through
 * the functions of that particular container. There is no function to create
 * a generic iterator as iterators absolutely depend on the container. This
 * means you won't find an iterator creation function here, those can be found with
 * the documentation of the container type you're using. Though created with
 * container specific functions iterators are always deleted with the same
 * function: eina_iterator_free().
 *
 * To get the data and iterate, use eina_iterator_next(). To call a function on
 * all the elements of a container, use eina_iterator_foreach().
 *
 * Here an @ref eina_iterator_example_page "example"
  }
{*
 * @addtogroup Eina_Content_Access_Group Content Access
 *
 * @
  }
{*
 * @defgroup Eina_Iterator_Group Iterator Functions
 *
 * @
  }
{*
 * @typedef Eina_Iterator
 * Abstract type for iterators.
  }
type
{*
 * @typedef Eina_Iterator_Next_Callback
 * Type for a callback that returns the next element in a container.
  }

  TEina_Iterator_Next_Callback = function (it:PEina_Iterator; data:Ppointer):TEina_Bool;cdecl;
{*
 * @typedef Eina_Iterator_Get_Container_Callback
 * Type for a callback that returns the container.
  }

  PEina_Iterator_Get_Container_Callback = ^TEina_Iterator_Get_Container_Callback;
  TEina_Iterator_Get_Container_Callback = function (it:PEina_Iterator):pointer;cdecl;
{*
 * @typedef Eina_Iterator_Free_Callback
 * Type for a callback that frees the container.
  }

  TEina_Iterator_Free_Callback = procedure (it:PEina_Iterator);cdecl;
{*
 * @typedef Eina_Iterator_Lock_Callback
 * Type for a callback that lock the container.
  }

  TEina_Iterator_Lock_Callback = function (it:PEina_Iterator):TEina_Bool;cdecl;
{*
 * @struct _Eina_Iterator
 * structure of an iterator
 *
 * If creating an iterator remember to set the type using @ref _SET.
  }

const
  EINA_ITERATOR_VERSION = 1;  
  _ITERATOR = $98761233;  
{*< Version of the Iterator API.  }
{*< Callback called when a next element is requested.  }
{*< Callback called when the container is requested.  }
{*< Callback called when the container is freed.  }
{*< Callback called when the container is locked.  }
{*< Callback called when the container is unlocked.  }
type
  PEina_Iterator = ^TEina_Iterator;
  TEina_Iterator = record
      version : longint;cdecl;
      next : TEina_Iterator_Next_Callback;
      get_container : TEina_Iterator_Get_Container_Callback;
      free : TEina_Iterator_Free_Callback;
      lock : TEina_Iterator_Lock_Callback;
      unlock : TEina_Iterator_Lock_Callback;
    end;

{*
 * @def FUNC_ITERATOR_NEXT(Function)
 * Helper macro to cast @p Function to a Eina_Iterator_Next_Callback.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function FUNC_ITERATOR_NEXT(_Function : longint) : TEina_Iterator_Next_Callback;

{*
 * @def FUNC_ITERATOR_GET_CONTAINER(Function)
 * Helper macro to cast @p Function to a Eina_Iterator_Get_Container_Callback.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FUNC_ITERATOR_GET_CONTAINER(_Function : longint) : TEina_Iterator_Get_Container_Callback;

{*
 * @def FUNC_ITERATOR_FREE(Function)
 * Helper macro to cast @p Function to a Eina_Iterator_Free_Callback.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FUNC_ITERATOR_FREE(_Function : longint) : TEina_Iterator_Free_Callback;

{*
 * @def FUNC_ITERATOR_LOCK(Function)
 * Helper macro to cast @p Function to a Eina_Iterator_Lock_Callback.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FUNC_ITERATOR_LOCK(_Function : longint) : TEina_Iterator_Lock_Callback;

{*
 * @brief Frees an iterator.
 *
 * @param[in,out] iterator The iterator to free.
 *
 * This function frees @p iterator if it is not @c NULL;
  }
procedure eina_iterator_free(iterator:PEina_Iterator);cdecl;external;
{*
 * @brief Returns the container of an iterator.
 *
 * @param[in] iterator The iterator.
 * @return The container which created the iterator.
 *
 * This function returns the container which created @p iterator. If
 * @p iterator is @c NULL, this function returns @c NULL.
  }
function eina_iterator_container_get(iterator:PEina_Iterator):pointer;cdecl;external;
{*
 * @brief Returns the value of the current element and go to the next one.
 *
 * @param[in,out] iterator The iterator.
 * @param[out] data The data of the element.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * This function returns the value of the current element pointed by
 * @p iterator in @p data, then goes to the next element. If @p
 * iterator is @c NULL or if a problem occurred, #EINA_FALSE is
 * returned, otherwise #EINA_TRUE is returned.
  }
function eina_iterator_next(iterator:PEina_Iterator; data:Ppointer):TEina_Bool;cdecl;external;
{*
 * @brief Iterates over the container and execute a callback on each element.
 *
 * @param[in,out] iterator The iterator.
 * @param[in] callback The callback called on each iteration.
 * @param[in] fdata The data passed to the callback.
 *
 * This function iterates over the elements pointed by @p iterator,
 * beginning with the current element. For each element, the callback
 * @p cb is called with the data @p fdata. If @p iterator is @c NULL,
 * the function returns immediately. Also, if @p cb returns #EINA_FALSE,
 * the iteration stops at that point, if @p cb returns #EINA_TRUE
 * the iteration continues.
  }
(* Const before type ignored *)
procedure eina_iterator_foreach(iterator:PEina_Iterator; callback:TEina_Each_Cb; fdata:pointer);cdecl;external;
{*
 * @brief Locks the container of the iterator.
 *
 * @param[in,out] iterator The iterator.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * If the container of the @p iterator permits it, it will be locked. When a
 * container is locked calling eina_iterator_foreach() on it will return
 * immediately. If @p iterator is @c NULL or if a problem occurred, #EINA_FALSE
 * is returned, otherwise #EINA_TRUE is returned. If the container isn't
 * lockable, it will return #EINA_TRUE.
 *
 * @warning None of the existing eina data structures are lockable.
  }
function eina_iterator_lock(iterator:PEina_Iterator):TEina_Bool;cdecl;external;
{*
 * @brief Unlocks the container of the iterator.
 *
 * @param[in,out] iterator The iterator.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * If the container of the @p iterator permits it and was previously
 * locked, it will be unlocked. If @p iterator is @c NULL or if a
 * problem occurred, #EINA_FALSE is returned, otherwise #EINA_TRUE
 * is returned. If the container is not lockable, it will
 * return #EINA_TRUE.
 *
 * @warning None of the existing eina data structures are lockable.
  }
function eina_iterator_unlock(iterator:PEina_Iterator):TEina_Bool;cdecl;external;
{*
 * @brief Creates an Eina_Iterator that iterates through a
 * NUL-terminated C array.
 *
 * @param[in] array The NUL-terminated array
 * @return The iterator that will walk over the array.
 *
 * You can create it like this:
 * int array[] = 1, 2, 3, 4;
 * int* array2[] = &array[0], &array[1], &array[2], &array[3], NULL;
 *
 * Eina_Iterator* iterator = eina_carray_iterator_new((void**)array2);
 *
 * @since 1.18
  }
function eina_carray_iterator_new(array:Ppointer):PEina_Iterator;cdecl;external;
{*
 * @brief Creates an Eina_Iterator that iterates through a
 * C array of specified size.
 *
 * @param[in] array The array
 * @return The iterator that will walk over the array.
 *
 * You can create it like this:
 * int array[] = 1, 2, 3, 4;
 *
 * Eina_Iterator* iterator = eina_carray_length_iterator_new((void**)array, sizeof (array[0]), (EINA_C_ARRAY_LENGTH(array));
 *
 * @since 1.22
  }
function eina_carray_length_iterator_new(array:Ppointer; step:dword; length:dword):PEina_Iterator;cdecl;external;
{*
 * @def EINA_C_ARRAY_ITERATOR_NEW
 * @brief Creates an Eina_Iterator that iterates through a
 * NUL-terminated C array.
 *
 * @param[in] Array The NUL-terminated array
 * @return The iterator that will walk over the array.
 *
 * You can create it like this:
 * int array[] = 1, 2, 3, 4;
 *
 * Eina_Iterator* iterator = EINA_C_ARRAY_ITERATOR_NEW(array);
 *
 * @since 1.22
  }
{#define EINA_C_ARRAY_ITERATOR_NEW(Array) eina_carray_length_iterator_new((void**) Array, sizeof (Array[0]), EINA_C_ARRAY_LENGTH(Array)) }
{*
 * @brief Creates a new iterator which which iterates through all elements with are accepted by the filter callback
 *
 * @param[in] original the iterator the use as original set
 * @param[in] filter if the callback returns true the element from the original set is taken into the the new set.
 * @param[in] free_cb when the iterator is gone this callback will be called with data as argument
 * @param[in] data the data which is passed to the filter callback
 *
 * The iterator is filtered while it is being iterated.
 * The original iterator you pass in here is is then owned and will be freed once the the new iterator is freed.
 *
 * @since 1.19
  }
function eina_iterator_filter_new(original:PEina_Iterator; filter:TEina_Each_Cb; free_cb:TEina_Free_Cb; data:pointer):PEina_Iterator;cdecl;external;
{*
 * @brief Creates an Eina_Iterator that iterates through a series
 * of Eina_Iterator.
 *
 * @param[in] it The first Eina_Iterator to iterate over
 * @return The iterator that will walk all the other iterator
 *
 * Eina_Iterator* iterator = eina_multi_iterator_new(it1, it2, it3, NULL);
 *
 * @note The returned array will destroy iterator given to it once they are not
 * necessary anymore. Taking ownership of those iterator.
 *
 * @since 1.22
  }
function eina_multi_iterator_internal_new(it:PEina_Iterator; args:array of const):PEina_Iterator;cdecl;external;
function eina_multi_iterator_internal_new(it:PEina_Iterator):PEina_Iterator;cdecl;external;
{*
 * @brief Calls the process method on each node of iterator, producing new "processed"
 * nodes and returning a new iterator which contains them.
 *
 * @param[in] iterator Iterator containing the nodes to process.
 * @param[in] process Method to call on each node.
 * @param[in] free_cb Method called when all nodes have been processed. It receives "data" as a parameter.
 * @param[in] fdata Additional data passed to the process method.
 *
 * Processes every node in the input iterator and returns a new iterator containing
 * the processed nodes. This is akin to a Map function:
 * https://en.wikipedia.org/wiki/Map_(higher-order_function)
 *
 * @since 1.24
  }
function eina_iterator_processed_new(iterator:PEina_Iterator; process:TEina_Process_Cb; free_cb:TEina_Free_Cb; fdata:pointer):PEina_Iterator;cdecl;external;
{*
 * @def eina_multi_iterator_new
 * @brief Creates an Eina_Iterator that iterates through a series
 * of Eina_Iterator.
 *
 * @param[in] It The first Eina_Iterator to iterate over
 * @return The iterator that will walk all the other iterator
 *
 * Eina_Iterator* iterator = eina_multi_iterator_new(it1, it2, it3);
 *
 * @note The returned array will destroy iterator given to it once they are not
 * necessary anymore. Taking ownership of those iterator.
 *
 * @since 1.22
  }
{#define eina_multi_iterator_new(It, ...) eina_multi_iterator_internal_new(It, ##__VA_ARGS__, NULL) }
{*
 * @def EINA_ITERATOR_FOREACH
 * @brief Definition for the macro to iterate over all elements easily.
 *
 * @param[in,out] itr The iterator to use.
 * @param[out] data Where to store * data, must be a pointer support getting
 *        its address since * eina_iterator_next() requires a pointer
 *        to pointer!
 *
 * This macro is a convenient way to use iterators, very similar to
 * EINA_LIST_FOREACH().
 *
 * This macro can be used for freeing the data of a list, like in the
 * following example. It has the same goal as the one documented in
 * EINA_LIST_FOREACH(), but using iterators:
 *
 * @code
 * Eina_List     *list;
 * Eina_Iterator *itr;
 * char          *data;
 *
 * // list is already filled,
 * // its elements are just duplicated strings
 *
 * itr = eina_list_iterator_new(list);
 * EINA_ITERATOR_FOREACH(itr, data)
 *   free(data);
 * eina_iterator_free(itr);
 * eina_list_free(list);
 * @endcode
 *
 * @note This example is not optimal algorithm to release a list since
 *    it will walk the list twice, but it serves as an example. For
 *    optimized version use EINA_LIST_FREE()
 *
 * @warning The order in which the elements will be traversed depends on the
 * underlying container and @b shouldn't be relied upon.
 *
 * @warning unless explicitly stated in functions returning iterators,
 *    do not modify the iterated object while you walk it, in this
 *    example using lists, do not remove list nodes or you might
 *    crash!  This is not a limitation of iterators themselves,
 *    rather in the iterators implementations to keep them as simple
 *    and fast as possible.
  }
{*
 * @
  }
{*
 * @
  }
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FUNC_ITERATOR_NEXT(_Function : longint) : TEina_Iterator_Next_Callback;
begin
  FUNC_ITERATOR_NEXT:=TEina_Iterator_Next_Callback(_Function);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FUNC_ITERATOR_GET_CONTAINER(_Function : longint) : TEina_Iterator_Get_Container_Callback;
begin
  FUNC_ITERATOR_GET_CONTAINER:=TEina_Iterator_Get_Container_Callback(_Function);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FUNC_ITERATOR_FREE(_Function : longint) : TEina_Iterator_Free_Callback;
begin
  FUNC_ITERATOR_FREE:=TEina_Iterator_Free_Callback(_Function);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FUNC_ITERATOR_LOCK(_Function : longint) : TEina_Iterator_Lock_Callback;
begin
  FUNC_ITERATOR_LOCK:=TEina_Iterator_Lock_Callback(_Function);
end;


end.
