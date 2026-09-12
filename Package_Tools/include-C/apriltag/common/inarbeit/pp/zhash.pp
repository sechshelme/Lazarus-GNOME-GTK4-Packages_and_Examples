
unit zhash;
interface

{
  Automatically converted by H2Pas 1.0.0 from zhash.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    zhash.h
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
Pzarray_t  = ^zarray_t;
Pzhash_iterator  = ^zhash_iterator;
Pzhash_iterator_t  = ^zhash_iterator_t;
Pzhash_t  = ^zhash_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 2013-2016, The Regents of The University of Michigan.
All rights reserved.
This software was developed in the APRIL Robotics Lab under the
direction of Edwin Olson, ebolson@umich.edu. This software may be
available under alternative licensing terms; contact the address above.
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
The views and conclusions contained in the software and documentation are those
of the authors and should not be interpreted as representing official policies,
either expressed or implied, of the Regents of The University of Michigan.
 }
(** unsupported pragma#pragma once*)
{$include <stdint.h>}
{ C++ extern C conditionnal removed }
{$include "zarray.h"}
{*
 * A hash table for structs and primitive types that stores entries by value.
 *   - The size of the key/values must be known at instantiation time, and remain fixed.
 *     e.g. for pointers: zhash_create(sizeof(void*), sizeof(void*)....)
 *          for structs: zhash_create(sizeof(struct key_struct), sizeof(struct value_struct)...)
 *          for bytes: zhash_create(sizeof(uint8_t), sizeof(uint8_t)...)
 *   - Entries are copied by value. This means you must always pass a reference to the start
 *     of 'key_size' and 'value_size' bytes, which you have already malloc'd or stack allocated
 *   - This data structure can be used to store types of any size, from bytes & doubles to
 *     user defined structs
 *     Note: if zhash stores pointers, user must be careful to manually manage the lifetime
 *     of the memory they point to.
 *
  }
type
  Tzhash = Tzhash_t;
{ The contents of the iterator should be considered private. However, }
{ since our usage model prefers stack-based allocation of iterators, }
{ we must publicly declare them. }
(* Const before type ignored *)
{ points to the last entry returned by _next }
  Pzhash_iterator = ^Tzhash_iterator;
  Tzhash_iterator = record
      zh : Pzhash_t;
      czh : Pzhash_t;
      last_entry : longint;
    end;

  Tzhash_iterator = Tzhash_iterator_t;
{*
 * Create, initializes, and returns an empty hash table structure. It is the
 * caller's responsibility to call zhash_destroy() on the returned array when it
 * is no longer needed.
 *
 * The size of values used in the hash and equals function must match 'keysz'.
 * I.e. if keysz = sizeof(uint64_t), then hash() and equals() should accept
 * parameters as *uint64_t.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function zhash_create(keysz:Tsize_t; valuesz:Tsize_t; hash:function (a:pointer):Tuint32_t; equals:function (a:pointer; b:pointer):longint):Pzhash_t;cdecl;external;
{*
 * Frees all resources associated with the hash table structure which was
 * created by zhash_create(). After calling, 'zh' will no longer be valid for storage.
 *
 * If 'zh' contains pointer data, it is the caller's responsibility to manage
 * the resources pointed to by those pointers.
  }
procedure zhash_destroy(zh:Pzhash_t);cdecl;external;
{*
 * Creates and returns a new identical copy of the zhash (i.e. a "shallow" copy).
 * If you're storing pointers, be sure not to double free their pointees!
 * It is the caller's responsibility to call zhash_destroy() on the returned array
 * when it is no longer needed (in addition to the zhash_destroy() call for the
 * original zhash).
  }
(* Const before type ignored *)
function zhash_copy(other:Pzhash_t):Pzhash_t;cdecl;external;
{*
 * Determines whether the supplied key value exists as an entry in the zhash
 * table. If zhash stores pointer types as keys, this function can differentiate
 * between a non-existent key and a key mapped to NULL.
 * Returns 1 if the supplied key exists in the zhash table, else 0.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function zhash_contains(zh:Pzhash_t; key:pointer):longint;cdecl;external;
{*
 * Retrieves the value for the given key, if it exists, by copying its contents
 * into the space pointed to by 'out_value', which must already be allocated.
 * Returns 1 if the supplied key exists in the table, else 0, in which case
 * the contents of 'out_value' will be unchanged.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function zhash_get(zh:Pzhash_t; key:pointer; out_value:pointer):longint;cdecl;external;
{*
 * Similar to zhash_get(), but more dangerous. Provides a pointer to the zhash's
 * internal storage.  This can be used to make simple modifications to
 * the underlying data while avoiding the memcpys associated with
 * zhash_get and zhash_put. However, some zhash operations (that
 * resize the underlying storage, in particular) render this pointer
 * invalid. For maximum safety, call no other zhash functions for the
 * period during which you intend to use the pointer.
 * 'out_p' should be a pointer to the pointer which will be set to the internal
 * data address.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function zhash_get_volatile(zh:Pzhash_t; key:pointer; out_p:pointer):longint;cdecl;external;
{*
 * Adds a key/value pair to the hash table, if the supplied key does not already
 * exist in the table, or overwrites the value for the supplied key if it does
 * already exist. In the latter case, the previous contents of the key and value
 * will be copied into the spaces pointed to by 'oldkey' and 'oldvalue', respectively,
 * if they are not NULL.
 *
 * The key/value is added to / updated in the hash table by copying 'keysz' bytes
 * from the data pointed to by 'key' and 'valuesz' bytes from the data pointed
 * to by 'value'. It is up to the caller to manage the memory allocation of the
 * passed-in values, zhash will store and manage a copy.
 *
 * NOTE: If the key is a pointer type (such as a string), the contents of the
 * data that it points to must not be modified after the call to zhash_put(),
 * or future zhash calls will not successfully locate the key (using either its
 * previous or new value).
 *
 * NOTE: When using array data as a key (such as a string), the array should not
 * be passed directly or it will cause a segmentation fault when it is dereferenced.
 * Instead, pass a pointer which points to the array location, i.e.:
 *   char key[strlen];
 *   char *keyptr = key;
 *   zhash_put(zh, &keyptr, ...)
 *
 * Example:
 *   char * key = ...;
 *   zarray_t * val = ...;
 *   char * old_key = NULL;
 *   zarray_t * old_val = NULL;
 *   if (zhash_put(zh, &key, &val, &old_key, &old_value))
 *       // manage resources for old_key and old_value
 *
 * Returns 1 if the supplied key previously existed in the table, else 0, in
 * which case the data pointed to by 'oldkey' and 'oldvalue' will be set to zero
 * if they are not NULL.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function zhash_put(zh:Pzhash_t; key:pointer; value:pointer; oldkey:pointer; oldvalue:pointer):longint;cdecl;external;
{*
 * Removes from the zhash table the key/value pair for the supplied key, if
 * it exists. If it does, the contents of the key and value will be copied into
 * the spaces pointed to by 'oldkey' and 'oldvalue', respectively, if they are
 * not NULL. If the key does not exist, the data pointed to by 'oldkey' and
 * 'oldvalue' will be set to zero if they are not NULL.
 *
 * Returns 1 if the key existed and was removed, else 0, indicating that the
 * table contents were not changed.
  }
(* Const before type ignored *)
function zhash_remove(zh:Pzhash_t; key:pointer; oldkey:pointer; oldvalue:pointer):longint;cdecl;external;
{*
 * Removes all entries in the has table to create the equivalent of starting from
 * a zhash_create(), using the same size parameters. If any elements need to be
 * freed manually, this will need to occur before calling clear.
  }
procedure zhash_clear(zh:Pzhash_t);cdecl;external;
{*
 * Retrieves the current number of key/value pairs currently contained in the
 * zhash table, or 0 if the table is empty.
  }
(* Const before type ignored *)
function zhash_size(zh:Pzhash_t):longint;cdecl;external;
{*
 * Initializes an iterator which can be used to traverse the key/value pairs of
 * the supplied zhash table via successive calls to zhash_iterator_next() or
 * zhash_iterator_next_volatile(). The iterator can also be used to remove elements
 * from the zhash with zhash_iterator_remove().
 *
 * Any modifications to the zhash table structure will invalidate the
 * iterator, with the exception of zhash_iterator_remove().
  }
procedure zhash_iterator_init(zh:Pzhash_t; zit:Pzhash_iterator_t);cdecl;external;
{*
 * Initializes an iterator which can be used to traverse the key/value pairs of
 * the supplied zhash table via successive calls to zhash_iterator_next() or
 * zhash_iterator_next_volatile().
 *
 * An iterator initialized with this function cannot be used with
 * zhash_iterator_remove(). For that you must use zhash_iterator_init().
 *
 * Any modifications to the zhash table structure will invalidate the
 * iterator.
  }
(* Const before type ignored *)
procedure zhash_iterator_init_const(zh:Pzhash_t; zit:Pzhash_iterator_t);cdecl;external;
{*
 * Retrieves the next key/value pair from a zhash table via the (previously-
 * initialized) iterator. Copies the key and value data into the space
 * pointed to by outkey and outvalue, respectively, if they are not NULL.
 *
 * Returns 1 if the call retrieved the next available key/value pair, else 0
 * indicating that no entries remain, in which case the contents of outkey and
 * outvalue will remain unchanged.
  }
function zhash_iterator_next(zit:Pzhash_iterator_t; outkey:pointer; outvalue:pointer):longint;cdecl;external;
{*
 * Similar to zhash_iterator_next() except that it retrieves a pointer to zhash's
 * internal storage.  This can be used to avoid the memcpys associated with
 * zhash_iterator_next(). Call no other zhash functions for the
 * period during which you intend to use the pointer.
 * 'outkey' and 'outvalue' should be pointers to the pointers which will be set
 * to the internal data addresses.
 *
 * Example:
 *   key_t *outkey;
 *   value_t *outvalue;
 *   if (zhash_iterator_next_volatile(&zit, &outkey, &outvalue))
 *       // access internal key and value storage via outkey and outvalue
 *
 * Returns 1 if the call retrieved the next available key/value pair, else 0
 * indicating that no entries remain, in which case the pointers outkey and
 * outvalue will remain unchanged.
  }
function zhash_iterator_next_volatile(zit:Pzhash_iterator_t; outkey:pointer; outvalue:pointer):longint;cdecl;external;
{*
 * Removes from the zhash table the key/value pair most recently returned via
 * a call to zhash_iterator_next() or zhash_iterator_next_volatile() for the
 * supplied iterator.
 *
 * Requires that the iterator was initialized with zhash_iterator_init(),
 * not zhash_iterator_init_const().
  }
procedure zhash_iterator_remove(zit:Pzhash_iterator_t);cdecl;external;
{*
 * Calls the supplied function with a pointer to every key in the hash table in
 * turn. The function will be passed a pointer to the table's internal storage
 * for the key, which the caller should not modify, as the hash table will not be
 * re-indexed. The function may be NULL, in which case no action is taken.
  }
procedure zhash_map_keys(zh:Pzhash_t; f:procedure );cdecl;external;
{*
 * Calls the supplied function with a pointer to every value in the hash table in
 * turn. The function will be passed a pointer to the table's internal storage
 * for the value, which the caller may safely modify. The function may be NULL,
 * in which case no action is taken.
  }
procedure zhash_map_values(zh:Pzhash_t; f:procedure );cdecl;external;
{*
 * Calls the supplied function with a copy of every key in the hash table in
 * turn. While zhash_map_keys() passes a pointer to internal storage, this function
 * passes a copy of the actual storage. If the zhash stores pointers to data,
 * functions like free() can be used directly with zhash_vmap_keys().
 * The function may be NULL, in which case no action is taken.
 *
 * NOTE: zhash_vmap_keys() can only be used with pointer-data keys.
 * Use with non-pointer keys (i.e. integer, double, etc.) will likely cause a
 * segmentation fault.
  }
procedure zhash_vmap_keys(vh:Pzhash_t; f:procedure );cdecl;external;
{*
 * Calls the supplied function with a copy of every value in the hash table in
 * turn. While zhash_map_values() passes a pointer to internal storage, this function
 * passes a copy of the actual storage. If the zhash stores pointers to data,
 * functions like free() can be used directly with zhash_vmap_values().
 * The function may be NULL, in which case no action is taken.
 *
 * NOTE: zhash_vmap_values() can only be used with pointer-data values.
 * Use with non-pointer values (i.e. integer, double, etc.) will likely cause a
 * segmentation fault.
  }
procedure zhash_vmap_values(vh:Pzhash_t; f:procedure );cdecl;external;
{*
 * Returns an array which contains copies of all of the hash table's keys, in no
 * particular order. It is the caller's responsibility to call zarray_destroy()
 * on the returned structure when it is no longer needed.
  }
(* Const before type ignored *)
function zhash_keys(zh:Pzhash_t):Pzarray_t;cdecl;external;
{*
 * Returns an array which contains copies of all of the hash table's values, in no
 * particular order. It is the caller's responsibility to call zarray_destroy()
 * on the returned structure when it is no longer needed.
  }
(* Const before type ignored *)
function zhash_values(zh:Pzhash_t):Pzarray_t;cdecl;external;
{*
 * Defines a hash function which will calculate a zhash value for uint32_t input
 * data. Can be used with zhash_create() for a key size of sizeof(uint32_t).
  }
(* Const before type ignored *)
function zhash_uint32_hash(a:pointer):Tuint32_t;cdecl;external;
{*
 * Defines a function to compare zhash values for uint32_t input data.
 * Can be used with zhash_create() for a key size of sizeof(uint32_t).
  }
(* Const before type ignored *)
(* Const before type ignored *)
function zhash_uint32_equals(a:pointer; b:pointer):longint;cdecl;external;
{*
 * Defines a hash function which will calculate a zhash value for uint64_t input
 * data. Can be used with zhash_create() for a key size of sizeof(uint64_t).
  }
(* Const before type ignored *)
function zhash_uint64_hash(a:pointer):Tuint32_t;cdecl;external;
{*
 * Defines a function to compare zhash values for uint64_t input data.
 * Can be used with zhash_create() for a key size of sizeof(uint64_t).
  }
(* Const before type ignored *)
(* Const before type ignored *)
function zhash_uint64_equals(a:pointer; b:pointer):longint;cdecl;external;
{/////////////////////////////////////////////////// }
{ functions for keys that can be compared via their pointers. }
{*
 * Defines a hash function which will calculate a zhash value for pointer input
 * data. Can be used with zhash_create() for a key size of sizeof(void*). Will
 * use only the pointer value itself for computing the hash value.
  }
(* Const before type ignored *)
function zhash_ptr_hash(a:pointer):Tuint32_t;cdecl;external;
{*
 * Defines a function to compare zhash values for pointer input data.
 * Can be used with zhash_create() for a key size of sizeof(void*).
  }
(* Const before type ignored *)
(* Const before type ignored *)
function zhash_ptr_equals(a:pointer; b:pointer):longint;cdecl;external;
{/////////////////////////////////////////////////// }
{ Functions for string-typed keys }
{*
 * Defines a hash function which will calculate a zhash value for string input
 * data. Can be used with zhash_create() for a key size of sizeof(char*). Will
 * use the contents of the string in computing the hash value.
  }
(* Const before type ignored *)
function zhash_str_hash(a:pointer):Tuint32_t;cdecl;external;
{*
 * Defines a function to compare zhash values for string input data.
 * Can be used with zhash_create() for a key size of sizeof(char*).
  }
(* Const before type ignored *)
(* Const before type ignored *)
function zhash_str_equals(a:pointer; b:pointer):longint;cdecl;external;
procedure zhash_debug(zh:Pzhash_t);cdecl;external;
{xxxxxxxx

    static inline zhash_t *zhash_str_str_create(void)
    
        return zhash_create(sizeof(char*), sizeof(char*),
                            zhash_str_hash, zhash_str_equals);
    



static inline char *zhash_str_str_get(zhash_t *zh, const char *key)

    char *value;
    if (zhash_get(zh, &key, &value))
        return value;
    return NULL;


    static inline void zhash_str_str_put(zhash_t *zh, char *key, char *value)
    
        char *oldkey, *oldval;
        if (zhash_put(zh, &key, &value, &oldkey, &oldval)) 
            free(oldkey);
            free(oldval);
        
    

    static inline void zhash_str_str_destroy(zhash_t *zh)
    
        zhash_iterator_t zit;
        zhash_iterator_init(zh, &zit);

        char *key, *value;
        while (zhash_iterator_next(&zit, &key, &value)) 
            free(key);
            free(value);
        

        zhash_destroy(zh);
    


static inline uint32_t zhash_int_hash(const void *_a)

    assert(_a != NULL);

    uint32_t a = *((int*) _a);
    return a;


static inline int zhash_int_equals(const void *_a, const void *_b)

    assert(_a != NULL);
    assert(_b != NULL);

    int a = *((int*) _a);
    int b = *((int*) _b);

    return a==b;

 }
{ C++ end of extern C conditionnal removed }

implementation


end.
