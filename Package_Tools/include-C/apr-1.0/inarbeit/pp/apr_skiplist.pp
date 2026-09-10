
unit apr_skiplist;
interface

{
  Automatically converted by H2Pas 1.0.0 from apr_skiplist.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    apr_skiplist.h
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
Papr_pool_t  = ^apr_pool_t;
Papr_skiplist  = ^apr_skiplist;
Papr_skiplistnode  = ^apr_skiplistnode;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
  }
{$ifndef APR_SKIPLIST_H}
{$define APR_SKIPLIST_H}
{*
 * @file apr_skiplist.h
 * @brief APR skip list implementation
  }
{$include "apr.h"}
{$include "apr_portable.h"}
{$include <stdlib.h>}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * @defgroup apr_skiplist Skip list implementation
 * Refer to http://en.wikipedia.org/wiki/Skip_list for information
 * about the purpose of and ideas behind skip lists.
 * @ingroup APR
 * @
  }
{*
 * apr_skiplist_compare is the function type that must be implemented 
 * per object type that is used in a skip list for comparisons to maintain
 * order
 *  }
type

  Tapr_skiplist_compare = function (para1:pointer; para2:pointer):longint;cdecl;
{*
 * apr_skiplist_freefunc is the function type that must be implemented
 * to handle elements as they are removed from a skip list.
  }

  Tapr_skiplist_freefunc = procedure (para1:pointer);cdecl;
{* Opaque structure used to represent the skip list  }
  Papr_skiplist = ^Tapr_skiplist;
  Tapr_skiplist = record
      {undefined structure}
    end;

{* Opaque structure used to represent the skip list  }
{* 
 * Opaque structure used to represent abstract nodes in the skip list
 * (an abstraction above the raw elements which are collected in the
 * skip list).
  }
  Papr_skiplistnode = ^Tapr_skiplistnode;
  Tapr_skiplistnode = record
      {undefined structure}
    end;

{* Opaque structure  }
{*
 * Allocate memory using the same mechanism as the skip list.
 * @param sl The skip list
 * @param size The amount to allocate
 * @remark If a pool was provided to apr_skiplist_init(), memory will
 * be allocated from the pool or from a free list maintained with
 * the skip list.  Otherwise, memory will be allocated using the
 * C standard library heap functions.
  }

function apr_skiplist_alloc(sl:Papr_skiplist; size:Tsize_t):pointer;cdecl;external;
{*
 * Free memory using the same mechanism as the skip list.
 * @param sl The skip list
 * @param mem The object to free
 * @remark If a pool was provided to apr_skiplist_init(), memory will
 * be added to a free list maintained with the skip list and be available
 * to operations on the skip list or to other calls to apr_skiplist_alloc().
 * Otherwise, memory will be freed using the  C standard library heap
 * functions.
  }
procedure apr_skiplist_free(sl:Papr_skiplist; mem:pointer);cdecl;external;
{*
 * Allocate a new skip list
 * @param sl The pointer in which to return the newly created skip list
 * @param p The pool from which to allocate the skip list (optional).
 * @remark Unlike most APR functions, a pool is optional.  If no pool
 * is provided, the C standard library heap functions will be used instead.
  }
function apr_skiplist_init(sl:PPapr_skiplist; p:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Set the comparison functions to be used for searching the skip list.
 * @param sl The skip list
 * @param XXX1 FIXME
 * @param XXX2 FIXME
 *
 * @remark If existing comparison functions are being replaced, the index
 * will be replaced during this call.  That is a potentially expensive
 * operation.
  }
procedure apr_skiplist_set_compare(sl:Papr_skiplist; XXX1:Tapr_skiplist_compare; XXX2:Tapr_skiplist_compare);cdecl;external;
{*
 * Set the indexing functions to the specified comparison functions and
 * rebuild the index.
 * @param sl The skip list
 * @param XXX1 FIXME
 * @param XXX2 FIXME
 *
 * @remark If an index already exists, it will not be replaced and the
 * comparison functions will not be changed.
  }
procedure apr_skiplist_add_index(sl:Papr_skiplist; XXX1:Tapr_skiplist_compare; XXX2:Tapr_skiplist_compare);cdecl;external;
{*
 * Return the list maintained by the skip list abstraction.
 * @param sl The skip list
  }
function apr_skiplist_getlist(sl:Papr_skiplist):Papr_skiplistnode;cdecl;external;
{*
 * Return the next matching element in the skip list using the specified
 * comparison function.
 * @param sl The skip list
 * @param data The value to search for
 * @param iter A pointer to the returned skip list node representing the element
 * found
 * @param func The comparison function to use
  }
function apr_skiplist_find_compare(sl:Papr_skiplist; data:pointer; iter:PPapr_skiplistnode; func:Tapr_skiplist_compare):pointer;cdecl;external;
{*
 * Return the next matching element in the skip list using the current comparison
 * function.
 * @param sl The skip list
 * @param data The value to search for
 * @param iter A pointer to the returned skip list node representing the element
 * found
  }
function apr_skiplist_find(sl:Papr_skiplist; data:pointer; iter:PPapr_skiplistnode):pointer;cdecl;external;
{*
 * Return the last matching element in the skip list using the specified
 * comparison function.
 * @param sl The skip list
 * @param data The value to search for
 * @param iter A pointer to the returned skip list node representing the element
 * found
 * @param comp The comparison function to use
  }
function apr_skiplist_last_compare(sl:Papr_skiplist; data:pointer; iter:PPapr_skiplistnode; comp:Tapr_skiplist_compare):pointer;cdecl;external;
{*
 * Return the last matching element in the skip list using the current comparison
 * function.
 * @param sl The skip list
 * @param data The value to search for
 * @param iter A pointer to the returned skip list node representing the element
 * found
  }
function apr_skiplist_last(sl:Papr_skiplist; data:pointer; iter:PPapr_skiplistnode):pointer;cdecl;external;
{*
 * Return the next element in the skip list.
 * @param sl The skip list
 * @param iter On entry, a pointer to the skip list node to start with; on return,
 * a pointer to the skip list node representing the element returned
 * @remark If iter points to a NULL value on entry, NULL will be returned.
  }
function apr_skiplist_next(sl:Papr_skiplist; iter:PPapr_skiplistnode):pointer;cdecl;external;
{*
 * Return the previous element in the skip list.
 * @param sl The skip list
 * @param iter On entry, a pointer to the skip list node to start with; on return,
 * a pointer to the skip list node representing the element returned
 * @remark If iter points to a NULL value on entry, NULL will be returned.
  }
function apr_skiplist_previous(sl:Papr_skiplist; iter:PPapr_skiplistnode):pointer;cdecl;external;
{*
 * Return the element of the skip list node
 * @param iter The skip list node
  }
function apr_skiplist_element(iter:Papr_skiplistnode):pointer;cdecl;external;
{*
 * Insert an element into the skip list using the specified comparison function
 * if it does not already exist.
 * @param sl The skip list
 * @param data The element to insert
 * @param comp The comparison function to use for placement into the skip list
  }
function apr_skiplist_insert_compare(sl:Papr_skiplist; data:pointer; comp:Tapr_skiplist_compare):Papr_skiplistnode;cdecl;external;
{*
 * Insert an element into the skip list using the existing comparison function
 * if it does not already exist.
 * @param sl The skip list
 * @param data The element to insert
 * @remark If no comparison function has been set for the skip list, the element
 * will not be inserted and NULL will be returned.
  }
function apr_skiplist_insert(sl:Papr_skiplist; data:pointer):Papr_skiplistnode;cdecl;external;
{*
 * Add an element into the skip list using the specified comparison function
 * allowing for duplicates.
 * @param sl The skip list
 * @param data The element to add
 * @param comp The comparison function to use for placement into the skip list
  }
function apr_skiplist_add_compare(sl:Papr_skiplist; data:pointer; comp:Tapr_skiplist_compare):Papr_skiplistnode;cdecl;external;
{*
 * Add an element into the skip list using the existing comparison function
 * allowing for duplicates.
 * @param sl The skip list
 * @param data The element to insert
 * @remark If no comparison function has been set for the skip list, the element
 * will not be inserted and NULL will be returned.
  }
function apr_skiplist_add(sl:Papr_skiplist; data:pointer):Papr_skiplistnode;cdecl;external;
{*
 * Add an element into the skip list using the specified comparison function
 * removing the existing duplicates.
 * @param sl The skip list
 * @param data The element to insert
 * @param comp The comparison function to use for placement into the skip list
 * @param myfree A function to be called for each removed duplicate
 * @remark If no comparison function has been set for the skip list, the element
 * will not be inserted, none will be replaced, and NULL will be returned.
  }
function apr_skiplist_replace_compare(sl:Papr_skiplist; data:pointer; myfree:Tapr_skiplist_freefunc; comp:Tapr_skiplist_compare):Papr_skiplistnode;cdecl;external;
{*
 * Add an element into the skip list using the existing comparison function
 * removing the existing duplicates.
 * @param sl The skip list
 * @param data The element to insert
 * @param myfree A function to be called for each removed duplicate
 * @remark If no comparison function has been set for the skip list, the element
 * will not be inserted, none will be replaced, and NULL will be returned.
  }
function apr_skiplist_replace(sl:Papr_skiplist; data:pointer; myfree:Tapr_skiplist_freefunc):Papr_skiplistnode;cdecl;external;
{*
 * Remove a node from the skip list.
 * @param sl The skip list
 * @param iter The skip list node to remove
 * @param myfree A function to be called for the removed element
  }
function apr_skiplist_remove_node(sl:Papr_skiplist; iter:Papr_skiplistnode; myfree:Tapr_skiplist_freefunc):longint;cdecl;external;
{*
 * Remove an element from the skip list using the specified comparison function for
 * locating the element. In the case of duplicates, the 1st entry will be removed.
 * @param sl The skip list
 * @param data The element to remove
 * @param myfree A function to be called for each removed element
 * @param comp The comparison function to use for placement into the skip list
 * @remark If the element is not found, 0 will be returned.  Otherwise, the heightXXX
 * will be returned.
  }
function apr_skiplist_remove_compare(sl:Papr_skiplist; data:pointer; myfree:Tapr_skiplist_freefunc; comp:Tapr_skiplist_compare):longint;cdecl;external;
{*
 * Remove an element from the skip list using the existing comparison function for
 * locating the element. In the case of duplicates, the 1st entry will be removed.
 * @param sl The skip list
 * @param data The element to remove
 * @param myfree A function to be called for each removed element
 * @remark If the element is not found, 0 will be returned.  Otherwise, the heightXXX
 * will be returned.
 * @remark If no comparison function has been set for the skip list, the element
 * will not be removed and 0 will be returned.
  }
function apr_skiplist_remove(sl:Papr_skiplist; data:pointer; myfree:Tapr_skiplist_freefunc):longint;cdecl;external;
{*
 * Remove all elements from the skip list.
 * @param sl The skip list
 * @param myfree A function to be called for each removed element
  }
procedure apr_skiplist_remove_all(sl:Papr_skiplist; myfree:Tapr_skiplist_freefunc);cdecl;external;
{*
 * Remove each element from the skip list.
 * @param sl The skip list
 * @param myfree A function to be called for each removed element
  }
procedure apr_skiplist_destroy(sl:Papr_skiplist; myfree:Tapr_skiplist_freefunc);cdecl;external;
{*
 * Return the first element in the skip list, removing the element from the skip list.
 * @param sl The skip list
 * @param myfree A function to be called for the removed element
 * @remark NULL will be returned if there are no elements
  }
function apr_skiplist_pop(sl:Papr_skiplist; myfree:Tapr_skiplist_freefunc):pointer;cdecl;external;
{*
 * Return the first element in the skip list, leaving the element in the skip list.
 * @param sl The skip list
 * @remark NULL will be returned if there are no elements
  }
function apr_skiplist_peek(sl:Papr_skiplist):pointer;cdecl;external;
{*
 * Return the size of the list (number of elements), in O(1).
 * @param sl The skip list
  }
(* Const before type ignored *)
function apr_skiplist_size(sl:Papr_skiplist):Tsize_t;cdecl;external;
{*
 * Return the height of the list (number of skip paths), in O(1).
 * @param sl The skip list
  }
(* Const before type ignored *)
function apr_skiplist_height(sl:Papr_skiplist):longint;cdecl;external;
{*
 * Return the predefined maximum height of the skip list.
 * @param sl The skip list
  }
(* Const before type ignored *)
function apr_skiplist_preheight(sl:Papr_skiplist):longint;cdecl;external;
{*
 * Set a predefined maximum height for the skip list.
 * @param sl The skip list
 * @param to The preheight to set, or a nul/negative value to disable.
 * @remark When a preheight is used, the height of each inserted element is
 * computed randomly up to this preheight instead of the current skip list's
 * height plus one used by the default implementation. Using a preheight can
 * probably ensure more fairness with long living elements (since with an
 * adaptative height, former elements may have been created with a low height,
 * hence a longest path to reach them while the skip list grows). On the other
 * hand, the default behaviour (preheight <= 0) with a growing and decreasing
 * maximum height is more adaptative/suitable for short living values.
 * @note Should be called before any insertion/add.
  }
procedure apr_skiplist_set_preheight(sl:Papr_skiplist; to:longint);cdecl;external;
{*
 * Merge two skip lists.  XXX SEMANTICS
 * @param sl1 One of two skip lists to be merged
 * @param sl2 The other of two skip lists to be merged
  }
function apr_skiplist_merge(sl1:Papr_skiplist; sl2:Papr_skiplist):Papr_skiplist;cdecl;external;
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ! APR_SKIPLIST_H  }

implementation


end.
