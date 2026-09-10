
unit apr_hash;
interface

{
  Automatically converted by H2Pas 1.0.0 from apr_hash.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    apr_hash.h
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
Papr_hash_do_callback_fn_t  = ^apr_hash_do_callback_fn_t;
Papr_hash_index_t  = ^apr_hash_index_t;
Papr_hash_t  = ^apr_hash_t;
Papr_pool_t  = ^apr_pool_t;
Papr_ssize_t  = ^apr_ssize_t;
Pchar  = ^char;
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
{$ifndef APR_HASH_H}
{$define APR_HASH_H}
{*
 * @file apr_hash.h
 * @brief APR Hash Tables
  }
{$include "apr_pools.h"}
{ C++ extern C conditionnal removed }
{*
 * @defgroup apr_hash Hash Tables
 * @ingroup APR 
 * @
  }
{*
 * When passing a key to apr_hash_set or apr_hash_get, this value can be
 * passed to indicate a string-valued key, and have apr_hash compute the
 * length automatically.
 *
 * @remark apr_hash will use strlen(key) for the length. The NUL terminator
 *         is not included in the hash value (why throw a constant in?).
 *         Since the hash table merely references the provided key (rather
 *         than copying it), apr_hash_this() will return the NUL-term'd key.
  }

const
  APR_HASH_KEY_STRING = -(1);  
{*
 * Abstract type for hash tables.
  }
type
{*
 * Abstract type for scanning hash tables.
  }
{*
 * Callback functions for calculating hash values.
 * @param key The key.
 * @param klen The length of the key, or APR_HASH_KEY_STRING to use the string 
 *             length. If APR_HASH_KEY_STRING then returns the actual key length.
  }
(* Const before type ignored *)

  Tapr_hashfunc_t = function (key:Pchar; klen:Papr_ssize_t):dword;cdecl;
{*
 * The default hash function.
  }
(* Const before type ignored *)

function apr_hashfunc_default(key:Pchar; klen:Papr_ssize_t):dword;cdecl;external;
{*
 * Create a hash table.
 * @param pool The pool to allocate the hash table out of
 * @return The hash table just created
   }
function apr_hash_make(pool:Papr_pool_t):Papr_hash_t;cdecl;external;
{*
 * Create a hash table with a custom hash function
 * @param pool The pool to allocate the hash table out of
 * @param hash_func A custom hash function.
 * @return The hash table just created
   }
function apr_hash_make_custom(pool:Papr_pool_t; hash_func:Tapr_hashfunc_t):Papr_hash_t;cdecl;external;
{*
 * Make a copy of a hash table
 * @param pool The pool from which to allocate the new hash table
 * @param h The hash table to clone
 * @return The hash table just created
 * @remark Makes a shallow copy
  }
(* Const before type ignored *)
function apr_hash_copy(pool:Papr_pool_t; h:Papr_hash_t):Papr_hash_t;cdecl;external;
{*
 * Associate a value with a key in a hash table.
 * @param ht The hash table
 * @param key Pointer to the key
 * @param klen Length of the key. Can be APR_HASH_KEY_STRING to use the string length.
 * @param val Value to associate with the key
 * @remark If the value is NULL the hash entry is deleted. The key is stored as is,
 *         and so must have a lifetime at least as long as the hash table's pool.
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure apr_hash_set(ht:Papr_hash_t; key:pointer; klen:Tapr_ssize_t; val:pointer);cdecl;external;
{*
 * Look up the value associated with a key in a hash table.
 * @param ht The hash table
 * @param key Pointer to the key
 * @param klen Length of the key. Can be APR_HASH_KEY_STRING to use the string length.
 * @return Returns NULL if the key is not present.
  }
(* Const before type ignored *)
function apr_hash_get(ht:Papr_hash_t; key:pointer; klen:Tapr_ssize_t):pointer;cdecl;external;
{*
 * Start iterating over the entries in a hash table.
 * @param p The pool to allocate the apr_hash_index_t iterator. If this
 *          pool is NULL, then an internal, non-thread-safe iterator is used.
 * @param ht The hash table
 * @return The iteration state
 * @remark  There is no restriction on adding or deleting hash entries during
 * an iteration (although the results may be unpredictable unless all you do
 * is delete the current entry) and multiple iterations can be in
 * progress at the same time.
 *
 * @par Example:
 *
 * @code
 * int sum_values(apr_pool_t *p, apr_hash_t *ht)
 * 
 *     apr_hash_index_t *hi;
 *     void *val;
 *     int sum = 0;
 *     for (hi = apr_hash_first(p, ht); hi; hi = apr_hash_next(hi)) 
 *         apr_hash_this(hi, NULL, NULL, &val);
 *         sum += *(int *)val;
 *     
 *     return sum;
 * 
 * @endcode
  }
function apr_hash_first(p:Papr_pool_t; ht:Papr_hash_t):Papr_hash_index_t;cdecl;external;
{*
 * Continue iterating over the entries in a hash table.
 * @param hi The iteration state
 * @return a pointer to the updated iteration state.  NULL if there are no more  
 *         entries.
  }
function apr_hash_next(hi:Papr_hash_index_t):Papr_hash_index_t;cdecl;external;
{*
 * Get the current entry's details from the iteration state.
 * @param hi The iteration state
 * @param key Return pointer for the pointer to the key.
 * @param klen Return pointer for the key length.
 * @param val Return pointer for the associated value.
 * @remark The return pointers should point to a variable that will be set to the
 *         corresponding data, or they may be NULL if the data isn't interesting.
  }
(* Const before type ignored *)
procedure apr_hash_this(hi:Papr_hash_index_t; key:Ppointer; klen:Papr_ssize_t; val:Ppointer);cdecl;external;
{*
 * Get the current entry's key from the iteration state.
 * @param hi The iteration state
 * @return The pointer to the key
  }
(* Const before type ignored *)
function apr_hash_this_key(hi:Papr_hash_index_t):pointer;cdecl;external;
{*
 * Get the current entry's key length from the iteration state.
 * @param hi The iteration state
 * @return The key length
  }
function apr_hash_this_key_len(hi:Papr_hash_index_t):Tapr_ssize_t;cdecl;external;
{*
 * Get the current entry's value from the iteration state.
 * @param hi The iteration state
 * @return The pointer to the value
  }
function apr_hash_this_val(hi:Papr_hash_index_t):pointer;cdecl;external;
{*
 * Get the number of key/value pairs in the hash table.
 * @param ht The hash table
 * @return The number of key/value pairs in the hash table.
  }
function apr_hash_count(ht:Papr_hash_t):dword;cdecl;external;
{*
 * Clear any key/value pairs in the hash table.
 * @param ht The hash table
  }
procedure apr_hash_clear(ht:Papr_hash_t);cdecl;external;
{*
 * Merge two hash tables into one new hash table. The values of the overlay
 * hash override the values of the base if both have the same key.  Both
 * hash tables must use the same hash function.
 * @param p The pool to use for the new hash table
 * @param overlay The table to add to the initial table
 * @param base The table that represents the initial values of the new table
 * @return A new hash table containing all of the data from the two passed in
  }
(* Const before type ignored *)
(* Const before type ignored *)
function apr_hash_overlay(p:Papr_pool_t; overlay:Papr_hash_t; base:Papr_hash_t):Papr_hash_t;cdecl;external;
{*
 * Merge two hash tables into one new hash table. If the same key
 * is present in both tables, call the supplied merge function to
 * produce a merged value for the key in the new table.  Both
 * hash tables must use the same hash function.
 * @param p The pool to use for the new hash table
 * @param h1 The first of the tables to merge
 * @param h2 The second of the tables to merge
 * @param merger A callback function to merge values, or NULL to
 *  make values from h1 override values from h2 (same semantics as
 *  apr_hash_overlay())
 * @param data Client data to pass to the merger function
 * @return A new hash table containing all of the data from the two passed in
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function apr_hash_merge(p:Papr_pool_t; h1:Papr_hash_t; h2:Papr_hash_t; merger:function (p:Papr_pool_t; key:pointer; klen:Tapr_ssize_t; h1_val:pointer; h2_val:pointer; 
                      data:pointer):pointer; data:pointer):Papr_hash_t;cdecl;external;
{*
 * Declaration prototype for the iterator callback function of apr_hash_do().
 *
 * @param rec The data passed as the first argument to apr_hash_[v]do()
 * @param key The key from this iteration of the hash table
 * @param klen The key length from this iteration of the hash table
 * @param value The value from this iteration of the hash table
 * @remark Iteration continues while this callback function returns non-zero.
 * To export the callback function for apr_hash_do() it must be declared 
 * in the _NONSTD convention.
  }
(* Const before type ignored *)
(* Const before type ignored *)
type
{* 
 * Iterate over a hash table running the provided function once for every
 * element in the hash table. The @p comp function will be invoked for
 * every element in the hash table.
 *
 * @param comp The function to run
 * @param rec The data to pass as the first argument to the function
 * @param ht The hash table to iterate over
 * @return FALSE if one of the comp() iterations returned zero; TRUE if all
 *            iterations returned non-zero
 * @see apr_hash_do_callback_fn_t
  }
(* Const before type ignored *)

function apr_hash_do(comp:Papr_hash_do_callback_fn_t; rec:pointer; ht:Papr_hash_t):longint;cdecl;external;
{*
 * Get a pointer to the pool which the hash table was created in
  }
  var
    hash : TAPR_POOL_DECLARE_ACCESSOR;cvar;public;
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ !APR_HASH_H  }

implementation


end.
