
unit bson;
interface

{
  Automatically converted by H2Pas 1.0.0 from bson.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bson.h
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
Pbson_array_builder_t  = ^bson_array_builder_t;
Pbson_decimal128_t  = ^bson_decimal128_t;
Pbson_error_t  = ^bson_error_t;
Pbson_iter_t  = ^bson_iter_t;
Pbson_json_opts_t  = ^bson_json_opts_t;
Pbson_oid_t  = ^bson_oid_t;
Pbson_t  = ^bson_t;
Pbson_value_t  = ^bson_value_t;
Pchar  = ^char;
Psize_t  = ^size_t;
Ptimeval  = ^timeval;
Puint32_t  = ^uint32_t;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2013 MongoDB, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
  }
{$ifndef BSON_H}
{$define BSON_H}
{$define BSON_INSIDE}
{$include <bson/bson-compat.h>}
{$include <string.h>}
{$include <time.h>}
{$include <bson/bson-macros.h>}
{$include <bson/bson-config.h>}
{$include <bson/bson-atomic.h>}
{$include <bson/bson-cmp.h>}
{$include <bson/bson-context.h>}
{$include <bson/bson-clock.h>}
{$include <bson/bson-decimal128.h>}
{$include <bson/bson-error.h>}
{$include <bson/bson-iter.h>}
{$include <bson/bson-json.h>}
{$include <bson/bson-keys.h>}
{$include <bson/bson-md5.h>}
{$include <bson/bson-memory.h>}
{$include <bson/bson-oid.h>}
{$include <bson/bson-reader.h>}
{$include <bson/bson-string.h>}
{$include <bson/bson-types.h>}
{$include <bson/bson-utf8.h>}
{$include <bson/bson-value.h>}
{$include <bson/bson-version.h>}
{$include <bson/bson-version-functions.h>}
{$include <bson/bson-writer.h>}
{$include <bson/bcon.h>}
{$undef BSON_INSIDE}
{*
 * bson_empty:
 * @b: a bson_t.
 *
 * Checks to see if @b is an empty BSON document. An empty BSON document is
 * a 5 byte document which contains the length (4 bytes) and a single NUL
 * byte indicating end of fields.
  }
{*
 * bson_empty0:
 *
 * Like bson_empty() but treats NULL the same as an empty bson_t document.
  }
{*
 * bson_clear:
 *
 * Easily free a bson document and set it to NULL. Use like:
 *
 * bson_t *doc = bson_new();
 * bson_clear (&doc);
 * BSON_ASSERT (doc == NULL);
  }
{*
 * BSON_MAX_SIZE:
 *
 * The maximum size in bytes of a BSON document.
  }

{ was #define dname def_expr }
function BSON_MAX_SIZE : Tsize_t;  

{*
 * bson_new:
 *
 * Allocates a new bson_t structure. Call the various bson_append_*()
 * functions to add fields to the bson. You can iterate the bson_t at any
 * time using a bson_iter_t and bson_iter_init().
 *
 * Returns: A newly allocated bson_t that should be freed with bson_destroy().
  }
function bson_new:Pbson_t;cdecl;external;
(* Const before type ignored *)
function bson_new_from_json(data:Puint8_t; len:Tssize_t; error:Pbson_error_t):Pbson_t;cdecl;external;
(* Const before type ignored *)
function bson_init_from_json(bson:Pbson_t; data:Pchar; len:Tssize_t; error:Pbson_error_t):Tbool;cdecl;external;
{*
 * bson_init_static:
 * @b: A pointer to a bson_t.
 * @data: The data buffer to use.
 * @length: The length of @data.
 *
 * Initializes a bson_t using @data and @length. This is ideal if you would
 * like to use a stack allocation for your bson and do not need to grow the
 * buffer. @data must be valid for the life of @b.
 *
 * Returns: true if initialized successfully; otherwise false.
  }
(* Const before type ignored *)
function bson_init_static(b:Pbson_t; data:Puint8_t; length:Tsize_t):Tbool;cdecl;external;
{*
 * bson_init:
 * @b: A pointer to a bson_t.
 *
 * Initializes a bson_t for use. This function is useful to those that want a
 * stack allocated bson_t. The usefulness of a stack allocated bson_t is
 * marginal as the target buffer for content will still require heap
 * allocations. It can help reduce heap fragmentation on allocators that do
 * not employ SLAB/magazine semantics.
 *
 * You must call bson_destroy() with @b to release resources when you are done
 * using @b.
  }
procedure bson_init(b:Pbson_t);cdecl;external;
{*
 * bson_reinit:
 * @b: (inout): A bson_t.
 *
 * This is equivalent to calling bson_destroy() and bson_init() on a #bson_t.
 * However, it will try to persist the existing malloc'd buffer if one exists.
 * This is useful in cases where you want to reduce malloc overhead while
 * building many documents.
  }
procedure bson_reinit(b:Pbson_t);cdecl;external;
{*
 * bson_new_from_data:
 * @data: A buffer containing a serialized bson document.
 * @length: The length of the document in bytes.
 *
 * Creates a new bson_t structure using the data provided. @data should contain
 * at least @length bytes that can be copied into the new bson_t structure.
 *
 * Returns: A newly allocated bson_t that should be freed with bson_destroy().
 *   If the first four bytes (little-endian) of data do not match @length,
 *   then NULL will be returned.
  }
(* Const before type ignored *)
function bson_new_from_data(data:Puint8_t; length:Tsize_t):Pbson_t;cdecl;external;
{*
 * bson_new_from_buffer:
 * @buf: A pointer to a buffer containing a serialized bson document.
 * @buf_len: The length of the buffer in bytes.
 * @realloc_fun: a realloc like function
 * @realloc_fun_ctx: a context for the realloc function
 *
 * Creates a new bson_t structure using the data provided. @buf should contain
 * a bson document, or null pointer should be passed for new allocations.
 *
 * Returns: A newly allocated bson_t that should be freed with bson_destroy().
 *          The underlying buffer will be used and not be freed in destroy.
  }
function bson_new_from_buffer(buf:PPuint8_t; buf_len:Psize_t; realloc_func:Tbson_realloc_func; realloc_func_ctx:pointer):Pbson_t;cdecl;external;
{*
 * bson_sized_new:
 * @size: A size_t containing the number of bytes to allocate.
 *
 * This will allocate a new bson_t with enough bytes to hold a buffer
 * sized @size. @size must be smaller than INT_MAX bytes.
 *
 * Returns: A newly allocated bson_t that should be freed with bson_destroy().
  }
function bson_sized_new(size:Tsize_t):Pbson_t;cdecl;external;
{*
 * bson_copy:
 * @bson: A bson_t.
 *
 * Copies @bson into a newly allocated bson_t. You must call bson_destroy()
 * when you are done with the resulting value to free its resources.
 *
 * Returns: A newly allocated bson_t that should be free'd with bson_destroy()
  }
(* Const before type ignored *)
function bson_copy(bson:Pbson_t):Pbson_t;cdecl;external;
{*
 * bson_copy_to:
 * @src: The source bson_t.
 * @dst: The destination bson_t.
 *
 * Initializes @dst and copies the content from @src into @dst.
  }
(* Const before type ignored *)
procedure bson_copy_to(src:Pbson_t; dst:Pbson_t);cdecl;external;
{*
 * bson_copy_to_excluding:
 * @src: A bson_t.
 * @dst: A bson_t to initialize and copy into.
 * @first_exclude: First field name to exclude.
 *
 * Copies @src into @dst excluding any field that is provided.
 * This is handy for situations when you need to remove one or
 * more fields in a bson_t. Note that bson_init() will be called
 * on dst.
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure bson_copy_to_excluding(src:Pbson_t; dst:Pbson_t; first_exclude:Pchar; args:array of const);cdecl;external;
procedure bson_copy_to_excluding(src:Pbson_t; dst:Pbson_t; first_exclude:Pchar);cdecl;external;
{xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;;_FOR (bson_copy_to_excluding_noinit); }
{*
 * bson_copy_to_excluding_noinit:
 * @src: A bson_t.
 * @dst: A bson_t to initialize and copy into.
 * @first_exclude: First field name to exclude.
 *
 * The same as bson_copy_to_excluding, but does not call bson_init()
 * on the dst. This version should be preferred in new code, but the
 * old function is left for backwards compatibility.
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure bson_copy_to_excluding_noinit(src:Pbson_t; dst:Pbson_t; first_exclude:Pchar; args:array of const);cdecl;external;
procedure bson_copy_to_excluding_noinit(src:Pbson_t; dst:Pbson_t; first_exclude:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure bson_copy_to_excluding_noinit_va(src:Pbson_t; dst:Pbson_t; first_exclude:Pchar; args:Tva_list);cdecl;external;
{*
 * bson_destroy:
 * @bson: A bson_t.
 *
 * Frees the resources associated with @bson.
  }
procedure bson_destroy(bson:Pbson_t);cdecl;external;
function bson_reserve_buffer(bson:Pbson_t; size:Tuint32_t):Puint8_t;cdecl;external;
function bson_steal(dst:Pbson_t; src:Pbson_t):Tbool;cdecl;external;
{*
 * bson_destroy_with_steal:
 * @bson: A #bson_t.
 * @steal: If ownership of the data buffer should be transferred to caller.
 * @length: (out): location for the length of the buffer.
 *
 * Destroys @bson similar to calling bson_destroy() except that the underlying
 * buffer will be returned and ownership transferred to the caller if @steal
 * is non-zero.
 *
 * If length is non-NULL, the length of @bson will be stored in @length.
 *
 * It is a programming error to call this function with any bson that has
 * been initialized static, or is being used to create a subdocument with
 * functions such as bson_append_document_begin() or bson_append_array_begin().
 *
 * Returns: a buffer owned by the caller if @steal is true. Otherwise NULL.
 *    If there was an error, NULL is returned.
  }
function bson_destroy_with_steal(bson:Pbson_t; steal:Tbool; length:Puint32_t):Puint8_t;cdecl;external;
{*
 * bson_get_data:
 * @bson: A bson_t.
 *
 * Fetched the data buffer for @bson of @bson->len bytes in length.
 *
 * Returns: A buffer that should not be modified or freed.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function bson_get_data(bson:Pbson_t):Puint8_t;cdecl;external;
{*
 * bson_count_keys:
 * @bson: A bson_t.
 *
 * Counts the number of elements found in @bson.
  }
(* Const before type ignored *)
function bson_count_keys(bson:Pbson_t):Tuint32_t;cdecl;external;
{*
 * bson_has_field:
 * @bson: A bson_t.
 * @key: The key to lookup.
 *
 * Checks to see if @bson contains a field named @key.
 *
 * This function is case-sensitive.
 *
 * Returns: true if @key exists in @bson; otherwise false.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function bson_has_field(bson:Pbson_t; key:Pchar):Tbool;cdecl;external;
{*
 * bson_compare:
 * @bson: A bson_t.
 * @other: A bson_t.
 *
 * Compares @bson to @other in a qsort() style comparison.
 * See qsort() for information on how this function works.
 *
 * Returns: Less than zero, zero, or greater than zero.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function bson_compare(bson:Pbson_t; other:Pbson_t):longint;cdecl;external;
{
 * bson_equal:
 * @bson: A bson_t.
 * @other: A bson_t.
 *
 * Checks to see if @bson and @other are equal.
 *
 * Returns: true if equal; otherwise false.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function bson_equal(bson:Pbson_t; other:Pbson_t):Tbool;cdecl;external;
{*
 * bson_validate:
 * @bson: A bson_t.
 * @offset: A location for the error offset.
 *
 * Validates a BSON document by walking through the document and inspecting
 * the fields for valid content.
 *
 * Returns: true if @bson is valid; otherwise false and @offset is set.
  }
(* Const before type ignored *)
function bson_validate(bson:Pbson_t; flags:Tbson_validate_flags_t; offset:Psize_t):Tbool;cdecl;external;
{*
 * bson_validate_with_error:
 * @bson: A bson_t.
 * @error: A location for the error info.
 *
 * Validates a BSON document by walking through the document and inspecting
 * the fields for valid content.
 *
 * Returns: true if @bson is valid; otherwise false and @error is filled out.
  }
(* Const before type ignored *)
function bson_validate_with_error(bson:Pbson_t; flags:Tbson_validate_flags_t; error:Pbson_error_t):Tbool;cdecl;external;
{*
 * bson_as_json_with_opts:
 * @bson: A bson_t.
 * @length: A location for the string length, or NULL.
 * @opts: A bson_t_json_opts_t defining options for the conversion
 *
 * Creates a new string containing @bson in the selected JSON format,
 * conforming to the MongoDB Extended JSON Spec:
 *
 * github.com/mongodb/specifications/blob/master/source/extended-json.rst
 *
 * The caller is responsible for freeing the resulting string. If @length is
 * non-NULL, then the length of the resulting string will be placed in @length.
 *
 * See https://www.mongodb.com/docs/manual/reference/mongodb-extended-json/ for
 * more information on extended JSON.
 *
 * Returns: A newly allocated string that should be freed with bson_free().
  }
(* Const before type ignored *)
(* Const before type ignored *)
function bson_as_json_with_opts(bson:Pbson_t; length:Psize_t; opts:Pbson_json_opts_t):Pchar;cdecl;external;
{*
 * bson_as_canonical_extended_json:
 * @bson: A bson_t.
 * @length: A location for the string length, or NULL.
 *
 * Creates a new string containing @bson in canonical extended JSON format,
 * conforming to the MongoDB Extended JSON Spec:
 *
 * github.com/mongodb/specifications/blob/master/source/extended-json.rst
 *
 * The caller is responsible for freeing the resulting string. If @length is
 * non-NULL, then the length of the resulting string will be placed in @length.
 *
 * See https://www.mongodb.com/docs/manual/reference/mongodb-extended-json/ for
 * more information on extended JSON.
 *
 * Returns: A newly allocated string that should be freed with bson_free().
  }
(* Const before type ignored *)
function bson_as_canonical_extended_json(bson:Pbson_t; length:Psize_t):Pchar;cdecl;external;
{*
 * bson_as_json:
 * @bson: A bson_t.
 * @length: A location for the string length, or NULL.
 *
 * Creates a new string containing @bson in libbson's legacy JSON format.
 * Superseded by bson_as_canonical_extended_json and
 * bson_as_relaxed_extended_json. The caller is
 * responsible for freeing the resulting string. If @length is non-NULL, then
 * the length of the resulting string will be placed in @length.
 *
 * Returns: A newly allocated string that should be freed with bson_free().
  }
(* Const before type ignored *)
function bson_as_json(bson:Pbson_t; length:Psize_t):Pchar;cdecl;external;
{*
 * bson_as_relaxed_extended_json:
 * @bson: A bson_t.
 * @length: A location for the string length, or NULL.
 *
 * Creates a new string containing @bson in relaxed extended JSON format,
 * conforming to the MongoDB Extended JSON Spec:
 *
 * github.com/mongodb/specifications/blob/master/source/extended-json.rst
 *
 * The caller is responsible for freeing the resulting string. If @length is
 * non-NULL, then the length of the resulting string will be placed in @length.
 *
 * See https://www.mongodb.com/docs/manual/reference/mongodb-extended-json/ for
 * more information on extended JSON.
 *
 * Returns: A newly allocated string that should be freed with bson_free().
  }
(* Const before type ignored *)
function bson_as_relaxed_extended_json(bson:Pbson_t; length:Psize_t):Pchar;cdecl;external;
{ like bson_as_json() but for outermost arrays.  }
(* Const before type ignored *)
function bson_array_as_json(bson:Pbson_t; length:Psize_t):Pchar;cdecl;external;
{ like bson_as_relaxed_extended_json() but for outermost arrays.  }
(* Const before type ignored *)
function bson_array_as_relaxed_extended_json(bson:Pbson_t; length:Psize_t):Pchar;cdecl;external;
{ like bson_as_canonical_extended_json() but for outermost arrays.  }
(* Const before type ignored *)
function bson_array_as_canonical_extended_json(bson:Pbson_t; length:Psize_t):Pchar;cdecl;external;
{ bson_array_builder_t defines an API for building arrays. }
{ BSON arrays require sequential numeric keys "0", "1", "2", ... }
type
{ bson_array_builder_new may be used to build a top-level BSON array. Example: }
{ `[1,2,3]`. }
{ To append an array field to a document (Example: ` "field": [1,2,3] `), use }
{ `bson_append_array_builder_begin`. }

function bson_array_builder_new:Pbson_array_builder_t;cdecl;external;
{ bson_array_builder_build initializes and moves BSON data to `out`. }
{ `bab` may be reused and will start appending a new array at index "0". }
function bson_array_builder_build(bab:Pbson_array_builder_t; out:Pbson_t):Tbool;cdecl;external;
procedure bson_array_builder_destroy(bab:Pbson_array_builder_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function bson_append_value(bson:Pbson_t; key:Pchar; key_length:longint; value:Pbson_value_t):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_VALUE(b,key,val : longint) : longint;

(* Const before type ignored *)
function bson_array_builder_append_value(bab:Pbson_array_builder_t; value:Pbson_value_t):Tbool;cdecl;external;
{*
 * bson_append_array:
 * @bson: A bson_t.
 * @key: The key for the field.
 * @array: A bson_t containing the array.
 *
 * Appends a BSON array to @bson. BSON arrays are like documents where the
 * key is the string version of the index. For example, the first item of the
 * array would have the key "0". The second item would have the index "1".
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function bson_append_array(bson:Pbson_t; key:Pchar; key_length:longint; array:Pbson_t):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_ARRAY(b,key,val : longint) : longint;

(* Const before type ignored *)
function bson_array_builder_append_array(bab:Pbson_array_builder_t; array:Pbson_t):Tbool;cdecl;external;
{*
 * bson_append_binary:
 * @bson: A bson_t to append.
 * @key: The key for the field.
 * @subtype: The bson_subtype_t of the binary.
 * @binary: The binary buffer to append.
 * @length: The length of @binary.
 *
 * Appends a binary buffer to the BSON document.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function bson_append_binary(bson:Pbson_t; key:Pchar; key_length:longint; subtype:Tbson_subtype_t; binary:Puint8_t; 
           length:Tuint32_t):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_BINARY(b,key,subtype,val,len : longint) : longint;

(* Const before type ignored *)
function bson_array_builder_append_binary(bab:Pbson_array_builder_t; subtype:Tbson_subtype_t; binary:Puint8_t; length:Tuint32_t):Tbool;cdecl;external;
{*
 * bson_append_bool:
 * @bson: A bson_t.
 * @key: The key for the field.
 * @value: The boolean value.
 *
 * Appends a new field to @bson of type BSON_TYPE_BOOL.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
function bson_append_bool(bson:Pbson_t; key:Pchar; key_length:longint; value:Tbool):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_BOOL(b,key,val : longint) : longint;

function bson_array_builder_append_bool(bab:Pbson_array_builder_t; value:Tbool):Tbool;cdecl;external;
{*
 * bson_append_code:
 * @bson: A bson_t.
 * @key: The key for the document.
 * @javascript: JavaScript code to be executed.
 *
 * Appends a field of type BSON_TYPE_CODE to the BSON document. @javascript
 * should contain a script in javascript to be executed.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function bson_append_code(bson:Pbson_t; key:Pchar; key_length:longint; javascript:Pchar):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_CODE(b,key,val : longint) : longint;

(* Const before type ignored *)
function bson_array_builder_append_code(bab:Pbson_array_builder_t; javascript:Pchar):Tbool;cdecl;external;
{*
 * bson_append_code_with_scope:
 * @bson: A bson_t.
 * @key: The key for the document.
 * @javascript: JavaScript code to be executed.
 * @scope: A bson_t containing the scope for @javascript.
 *
 * Appends a field of type BSON_TYPE_CODEWSCOPE to the BSON document.
 * @javascript should contain a script in javascript to be executed.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function bson_append_code_with_scope(bson:Pbson_t; key:Pchar; key_length:longint; javascript:Pchar; scope:Pbson_t):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_CODE_WITH_SCOPE(b,key,val,scope : longint) : longint;

(* Const before type ignored *)
(* Const before type ignored *)
function bson_array_builder_append_code_with_scope(bab:Pbson_array_builder_t; javascript:Pchar; scope:Pbson_t):Tbool;cdecl;external;
{*
 * bson_append_dbpointer:
 * @bson: A bson_t.
 * @key: The key for the field.
 * @collection: The collection name.
 * @oid: The oid to the reference.
 *
 * Appends a new field of type BSON_TYPE_DBPOINTER. This datum type is
 * deprecated in the BSON spec and should not be used in new code.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function bson_append_dbpointer(bson:Pbson_t; key:Pchar; key_length:longint; collection:Pchar; oid:Pbson_oid_t):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_DBPOINTER(b,key,coll,oid : longint) : longint;

(* Const before type ignored *)
(* Const before type ignored *)
function bson_array_builder_append_dbpointer(bab:Pbson_array_builder_t; collection:Pchar; oid:Pbson_oid_t):Tbool;cdecl;external;
{*
 * bson_append_double:
 * @bson: A bson_t.
 * @key: The key for the field.
 *
 * Appends a new field to @bson of the type BSON_TYPE_DOUBLE.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
function bson_append_double(bson:Pbson_t; key:Pchar; key_length:longint; value:Tdouble):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_DOUBLE(b,key,val : longint) : longint;

function bson_array_builder_append_double(bab:Pbson_array_builder_t; value:Tdouble):Tbool;cdecl;external;
{*
 * bson_append_document:
 * @bson: A bson_t.
 * @key: The key for the field.
 * @value: A bson_t containing the subdocument.
 *
 * Appends a new field to @bson of the type BSON_TYPE_DOCUMENT.
 * The documents contents will be copied into @bson.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function bson_append_document(bson:Pbson_t; key:Pchar; key_length:longint; value:Pbson_t):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_DOCUMENT(b,key,val : longint) : longint;

(* Const before type ignored *)
function bson_array_builder_append_document(bab:Pbson_array_builder_t; value:Pbson_t):Tbool;cdecl;external;
{*
 * bson_append_document_begin:
 * @bson: A bson_t.
 * @key: The key for the field.
 * @key_length: The length of @key in bytes not including NUL or -1
 *    if @key_length is NUL terminated.
 * @child: A location to an uninitialized bson_t.
 *
 * Appends a new field named @key to @bson. The field is, however,
 * incomplete.  @child will be initialized so that you may add fields to the
 * child document.  Child will use a memory buffer owned by @bson and
 * therefore grow the parent buffer as additional space is used. This allows
 * a single malloc'd buffer to be used when building documents which can help
 * reduce memory fragmentation.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
function bson_append_document_begin(bson:Pbson_t; key:Pchar; key_length:longint; child:Pbson_t):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_DOCUMENT_BEGIN(b,key,child : longint) : longint;

function bson_array_builder_append_document_begin(bab:Pbson_array_builder_t; child:Pbson_t):Tbool;cdecl;external;
{*
 * bson_append_document_end:
 * @bson: A bson_t.
 * @child: A bson_t supplied to bson_append_document_begin().
 *
 * Finishes the appending of a document to a @bson. @child is considered
 * disposed after this call and should not be used any further.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
function bson_append_document_end(bson:Pbson_t; child:Pbson_t):Tbool;cdecl;external;
function bson_array_builder_append_document_end(bab:Pbson_array_builder_t; child:Pbson_t):Tbool;cdecl;external;
{*
 * bson_append_array_begin:
 * @bson: A bson_t.
 * @key: The key for the field.
 * @key_length: The length of @key in bytes not including NUL or -1
 *    if @key_length is NUL terminated.
 * @child: A location to an uninitialized bson_t.
 *
 * Appends a new field named @key to @bson. The field is, however,
 * incomplete. @child will be initialized so that you may add fields to the
 * child array. Child will use a memory buffer owned by @bson and
 * therefore grow the parent buffer as additional space is used. This allows
 * a single malloc'd buffer to be used when building arrays which can help
 * reduce memory fragmentation.
 *
 * The type of @child will be BSON_TYPE_ARRAY and therefore the keys inside
 * of it MUST be "0", "1", etc.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
function bson_append_array_begin(bson:Pbson_t; key:Pchar; key_length:longint; child:Pbson_t):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_ARRAY_BEGIN(b,key,child : longint) : longint;

{*
 * bson_append_array_end:
 * @bson: A bson_t.
 * @child: A bson_t supplied to bson_append_array_begin().
 *
 * Finishes the appending of a array to a @bson. @child is considered
 * disposed after this call and should not be used any further.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
function bson_append_array_end(bson:Pbson_t; child:Pbson_t):Tbool;cdecl;external;
{*
 * bson_append_int32:
 * @bson: A bson_t.
 * @key: The key for the field.
 * @value: The int32_t 32-bit integer value.
 *
 * Appends a new field of type BSON_TYPE_INT32 to @bson.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
function bson_append_int32(bson:Pbson_t; key:Pchar; key_length:longint; value:Tint32_t):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_INT32(b,key,val : longint) : longint;

function bson_array_builder_append_int32(bab:Pbson_array_builder_t; value:Tint32_t):Tbool;cdecl;external;
{*
 * bson_append_int64:
 * @bson: A bson_t.
 * @key: The key for the field.
 * @value: The int64_t 64-bit integer value.
 *
 * Appends a new field of type BSON_TYPE_INT64 to @bson.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
function bson_append_int64(bson:Pbson_t; key:Pchar; key_length:longint; value:Tint64_t):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_INT64(b,key,val : longint) : longint;

function bson_array_builder_append_int64(bab:Pbson_array_builder_t; value:Tint64_t):Tbool;cdecl;external;
{*
 * bson_append_decimal128:
 * @bson: A bson_t.
 * @key: The key for the field.
 * @value: The bson_decimal128_t decimal128 value.
 *
 * Appends a new field of type BSON_TYPE_DECIMAL128 to @bson.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function bson_append_decimal128(bson:Pbson_t; key:Pchar; key_length:longint; value:Pbson_decimal128_t):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_DECIMAL128(b,key,val : longint) : longint;

(* Const before type ignored *)
function bson_array_builder_append_decimal128(bab:Pbson_array_builder_t; value:Pbson_decimal128_t):Tbool;cdecl;external;
{*
 * bson_append_iter:
 * @bson: A bson_t to append to.
 * @key: The key name or %NULL to take current key from @iter.
 * @key_length: The key length or -1 to use strlen().
 * @iter: The iter located on the position of the element to append.
 *
 * Appends a new field to @bson that is equivalent to the field currently
 * pointed to by @iter.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function bson_append_iter(bson:Pbson_t; key:Pchar; key_length:longint; iter:Pbson_iter_t):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_ITER(b,key,val : longint) : longint;

(* Const before type ignored *)
function bson_array_builder_append_iter(bab:Pbson_array_builder_t; iter:Pbson_iter_t):Tbool;cdecl;external;
{*
 * bson_append_minkey:
 * @bson: A bson_t.
 * @key: The key for the field.
 *
 * Appends a new field of type BSON_TYPE_MINKEY to @bson. This is a special
 * type that compares lower than all other possible BSON element values.
 *
 * See http://bsonspec.org for more information on this type.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
function bson_append_minkey(bson:Pbson_t; key:Pchar; key_length:longint):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_MINKEY(b,key : longint) : longint;

function bson_array_builder_append_minkey(bab:Pbson_array_builder_t):Tbool;cdecl;external;
{*
 * bson_append_maxkey:
 * @bson: A bson_t.
 * @key: The key for the field.
 *
 * Appends a new field of type BSON_TYPE_MAXKEY to @bson. This is a special
 * type that compares higher than all other possible BSON element values.
 *
 * See http://bsonspec.org for more information on this type.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
function bson_append_maxkey(bson:Pbson_t; key:Pchar; key_length:longint):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_MAXKEY(b,key : longint) : longint;

function bson_array_builder_append_maxkey(bab:Pbson_array_builder_t):Tbool;cdecl;external;
{*
 * bson_append_null:
 * @bson: A bson_t.
 * @key: The key for the field.
 *
 * Appends a new field to @bson with NULL for the value.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
function bson_append_null(bson:Pbson_t; key:Pchar; key_length:longint):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_NULL(b,key : longint) : longint;

function bson_array_builder_append_null(bab:Pbson_array_builder_t):Tbool;cdecl;external;
{*
 * bson_append_oid:
 * @bson: A bson_t.
 * @key: The key for the field.
 * @oid: bson_oid_t.
 *
 * Appends a new field to the @bson of type BSON_TYPE_OID using the contents of
 * @oid.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function bson_append_oid(bson:Pbson_t; key:Pchar; key_length:longint; oid:Pbson_oid_t):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_OID(b,key,val : longint) : longint;

(* Const before type ignored *)
function bson_array_builder_append_oid(bab:Pbson_array_builder_t; oid:Pbson_oid_t):Tbool;cdecl;external;
{*
 * bson_append_regex:
 * @bson: A bson_t.
 * @key: The key of the field.
 * @regex: The regex to append to the bson.
 * @options: Options for @regex.
 *
 * Appends a new field to @bson of type BSON_TYPE_REGEX. @regex should
 * be the regex string. @options should contain the options for the regex.
 *
 * Valid options for @options are:
 *
 *   'i' for case-insensitive.
 *   'm' for multiple matching.
 *   'x' for verbose mode.
 *   'l' to make \w and \W locale dependent.
 *   's' for dotall mode ('.' matches everything)
 *   'u' to make \w and \W match unicode.
 *
 * For more detailed information about BSON regex elements, see bsonspec.org.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function bson_append_regex(bson:Pbson_t; key:Pchar; key_length:longint; regex:Pchar; options:Pchar):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_REGEX(b,key,val,opt : longint) : longint;

(* Const before type ignored *)
(* Const before type ignored *)
function bson_array_builder_append_regex(bab:Pbson_array_builder_t; regex:Pchar; options:Pchar):Tbool;cdecl;external;
{*
 * bson_append_regex:
 * @bson: A bson_t.
 * @key: The key of the field.
 * @key_length: The length of the key string.
 * @regex: The regex to append to the bson.
 * @regex_length: The length of the regex string.
 * @options: Options for @regex.
 *
 * Appends a new field to @bson of type BSON_TYPE_REGEX. @regex should
 * be the regex string. @options should contain the options for the regex.
 *
 * Valid options for @options are:
 *
 *   'i' for case-insensitive.
 *   'm' for multiple matching.
 *   'x' for verbose mode.
 *   'l' to make \w and \W locale dependent.
 *   's' for dotall mode ('.' matches everything)
 *   'u' to make \w and \W match unicode.
 *
 * For more detailed information about BSON regex elements, see bsonspec.org.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function bson_append_regex_w_len(bson:Pbson_t; key:Pchar; key_length:longint; regex:Pchar; regex_length:longint; 
           options:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function bson_array_builder_append_regex_w_len(bab:Pbson_array_builder_t; regex:Pchar; regex_length:longint; options:Pchar):Tbool;cdecl;external;
{*
 * bson_append_utf8:
 * @bson: A bson_t.
 * @key: The key for the field.
 * @value: A UTF-8 encoded string.
 * @length: The length of @value or -1 if it is NUL terminated.
 *
 * Appends a new field to @bson using @key as the key and @value as the UTF-8
 * encoded value.
 *
 * It is the callers responsibility to ensure @value is valid UTF-8. You can
 * use bson_utf8_validate() to perform this check.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function bson_append_utf8(bson:Pbson_t; key:Pchar; key_length:longint; value:Pchar; length:longint):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_UTF8(b,key,val : longint) : longint;

(* Const before type ignored *)
function bson_array_builder_append_utf8(bab:Pbson_array_builder_t; value:Pchar; length:longint):Tbool;cdecl;external;
{*
 * bson_append_symbol:
 * @bson: A bson_t.
 * @key: The key for the field.
 * @value: The symbol as a string.
 * @length: The length of @value or -1 if NUL-terminated.
 *
 * Appends a new field to @bson of type BSON_TYPE_SYMBOL. This BSON type is
 * deprecated and should not be used in new code.
 *
 * See http://bsonspec.org for more information on this type.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function bson_append_symbol(bson:Pbson_t; key:Pchar; key_length:longint; value:Pchar; length:longint):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_SYMBOL(b,key,val : longint) : longint;

(* Const before type ignored *)
function bson_array_builder_append_symbol(bab:Pbson_array_builder_t; value:Pchar; length:longint):Tbool;cdecl;external;
{*
 * bson_append_time_t:
 * @bson: A bson_t.
 * @key: The key for the field.
 * @value: A time_t.
 *
 * Appends a BSON_TYPE_DATE_TIME field to @bson using the time_t @value for the
 * number of seconds since UNIX epoch in UTC.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
function bson_append_time_t(bson:Pbson_t; key:Pchar; key_length:longint; value:Ttime_t):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_TIME_T(b,key,val : longint) : longint;

function bson_array_builder_append_time_t(bab:Pbson_array_builder_t; value:Ttime_t):Tbool;cdecl;external;
{*
 * bson_append_timeval:
 * @bson: A bson_t.
 * @key: The key for the field.
 * @value: A struct timeval containing the date and time.
 *
 * Appends a BSON_TYPE_DATE_TIME field to @bson using the struct timeval
 * provided. The time is persisted in milliseconds since the UNIX epoch in UTC.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
function bson_append_timeval(bson:Pbson_t; key:Pchar; key_length:longint; value:Ptimeval):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_TIMEVAL(b,key,val : longint) : longint;

function bson_array_builder_append_timeval(bab:Pbson_array_builder_t; value:Ptimeval):Tbool;cdecl;external;
{*
 * bson_append_date_time:
 * @bson: A bson_t.
 * @key: The key for the field.
 * @key_length: The length of @key in bytes or -1 if \0 terminated.
 * @value: The number of milliseconds elapsed since UNIX epoch.
 *
 * Appends a new field to @bson of type BSON_TYPE_DATE_TIME.
 *
 * Returns: true if successful; otherwise false.
  }
(* Const before type ignored *)
function bson_append_date_time(bson:Pbson_t; key:Pchar; key_length:longint; value:Tint64_t):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_DATE_TIME(b,key,val : longint) : longint;

function bson_array_builder_append_date_time(bab:Pbson_array_builder_t; value:Tint64_t):Tbool;cdecl;external;
{*
 * bson_append_now_utc:
 * @bson: A bson_t.
 * @key: The key for the field.
 * @key_length: The length of @key or -1 if it is NULL terminated.
 *
 * Appends a BSON_TYPE_DATE_TIME field to @bson using the current time in UTC
 * as the field value.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
function bson_append_now_utc(bson:Pbson_t; key:Pchar; key_length:longint):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_NOW_UTC(b,key : longint) : longint;

function bson_array_builder_append_now_utc(bab:Pbson_array_builder_t):Tbool;cdecl;external;
{*
 * bson_append_timestamp:
 * @bson: A bson_t.
 * @key: The key for the field.
 * @timestamp: 4 byte timestamp.
 * @increment: 4 byte increment for timestamp.
 *
 * Appends a field of type BSON_TYPE_TIMESTAMP to @bson. This is a special type
 * used by MongoDB replication and sharding. If you need generic time and date
 * fields use bson_append_time_t() or bson_append_timeval().
 *
 * Setting @increment and @timestamp to zero has special semantics. See
 * http://bsonspec.org for more information on this field type.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
function bson_append_timestamp(bson:Pbson_t; key:Pchar; key_length:longint; timestamp:Tuint32_t; increment:Tuint32_t):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_TIMESTAMP(b,key,val,inc : longint) : longint;

function bson_array_builder_append_timestamp(bab:Pbson_array_builder_t; timestamp:Tuint32_t; increment:Tuint32_t):Tbool;cdecl;external;
{*
 * bson_append_undefined:
 * @bson: A bson_t.
 * @key: The key for the field.
 *
 * Appends a field of type BSON_TYPE_UNDEFINED. This type is deprecated in the
 * spec and should not be used for new code. However, it is provided for those
 * needing to interact with legacy systems.
 *
 * Returns: true if successful; false if append would overflow max size.
  }
(* Const before type ignored *)
function bson_append_undefined(bson:Pbson_t; key:Pchar; key_length:longint):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_UNDEFINED(b,key : longint) : longint;

function bson_array_builder_append_undefined(bab:Pbson_array_builder_t):Tbool;cdecl;external;
(* Const before type ignored *)
function bson_concat(dst:Pbson_t; src:Pbson_t):Tbool;cdecl;external;
(* Const before type ignored *)
function bson_append_array_builder_begin(bson:Pbson_t; key:Pchar; key_length:longint; child:PPbson_array_builder_t):Tbool;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_ARRAY_BUILDER_BEGIN(b,key,child : longint) : longint;

function bson_array_builder_append_array_builder_begin(bab:Pbson_array_builder_t; child:PPbson_array_builder_t):Tbool;cdecl;external;
function bson_append_array_builder_end(bson:Pbson_t; child:Pbson_array_builder_t):Tbool;cdecl;external;
function bson_array_builder_append_array_builder_end(bab:Pbson_array_builder_t; child:Pbson_array_builder_t):Tbool;cdecl;external;
{$endif}
{ BSON_H  }

implementation

{ was #define dname def_expr }
function BSON_MAX_SIZE : Tsize_t;
  begin
    BSON_MAX_SIZE:=Tsize_t((1 shl 31)-1);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_VALUE(b,key,val : longint) : longint;
begin
  BSON_APPEND_VALUE:=bson_append_value(b,key,longint(strlen(key)),val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_ARRAY(b,key,val : longint) : longint;
begin
  BSON_APPEND_ARRAY:=bson_append_array(b,key,longint(strlen(key)),val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_BINARY(b,key,subtype,val,len : longint) : longint;
begin
  BSON_APPEND_BINARY:=bson_append_binary(b,key,longint(strlen(key)),subtype,val,len);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_BOOL(b,key,val : longint) : longint;
begin
  BSON_APPEND_BOOL:=bson_append_bool(b,key,longint(strlen(key)),val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_CODE(b,key,val : longint) : longint;
begin
  BSON_APPEND_CODE:=bson_append_code(b,key,longint(strlen(key)),val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_CODE_WITH_SCOPE(b,key,val,scope : longint) : longint;
begin
  BSON_APPEND_CODE_WITH_SCOPE:=bson_append_code_with_scope(b,key,longint(strlen(key)),val,scope);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_DBPOINTER(b,key,coll,oid : longint) : longint;
begin
  BSON_APPEND_DBPOINTER:=bson_append_dbpointer(b,key,longint(strlen(key)),coll,oid);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_DOUBLE(b,key,val : longint) : longint;
begin
  BSON_APPEND_DOUBLE:=bson_append_double(b,key,longint(strlen(key)),val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_DOCUMENT(b,key,val : longint) : longint;
begin
  BSON_APPEND_DOCUMENT:=bson_append_document(b,key,longint(strlen(key)),val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_DOCUMENT_BEGIN(b,key,child : longint) : longint;
begin
  BSON_APPEND_DOCUMENT_BEGIN:=bson_append_document_begin(b,key,longint(strlen(key)),child);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_ARRAY_BEGIN(b,key,child : longint) : longint;
begin
  BSON_APPEND_ARRAY_BEGIN:=bson_append_array_begin(b,key,longint(strlen(key)),child);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_INT32(b,key,val : longint) : longint;
begin
  BSON_APPEND_INT32:=bson_append_int32(b,key,longint(strlen(key)),val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_INT64(b,key,val : longint) : longint;
begin
  BSON_APPEND_INT64:=bson_append_int64(b,key,longint(strlen(key)),val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_DECIMAL128(b,key,val : longint) : longint;
begin
  BSON_APPEND_DECIMAL128:=bson_append_decimal128(b,key,longint(strlen(key)),val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_ITER(b,key,val : longint) : longint;
begin
  BSON_APPEND_ITER:=bson_append_iter(b,key,longint(strlen(key)),val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_MINKEY(b,key : longint) : longint;
begin
  BSON_APPEND_MINKEY:=bson_append_minkey(b,key,longint(strlen(key)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_MAXKEY(b,key : longint) : longint;
begin
  BSON_APPEND_MAXKEY:=bson_append_maxkey(b,key,longint(strlen(key)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_NULL(b,key : longint) : longint;
begin
  BSON_APPEND_NULL:=bson_append_null(b,key,longint(strlen(key)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_OID(b,key,val : longint) : longint;
begin
  BSON_APPEND_OID:=bson_append_oid(b,key,longint(strlen(key)),val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_REGEX(b,key,val,opt : longint) : longint;
begin
  BSON_APPEND_REGEX:=bson_append_regex(b,key,longint(strlen(key)),val,opt);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_UTF8(b,key,val : longint) : longint;
begin
  BSON_APPEND_UTF8:=bson_append_utf8(b,key,longint(strlen(key)),val,longint(strlen(val)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_SYMBOL(b,key,val : longint) : longint;
begin
  BSON_APPEND_SYMBOL:=bson_append_symbol(b,key,longint(strlen(key)),val,longint(strlen(val)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_TIME_T(b,key,val : longint) : longint;
begin
  BSON_APPEND_TIME_T:=bson_append_time_t(b,key,longint(strlen(key)),val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_TIMEVAL(b,key,val : longint) : longint;
begin
  BSON_APPEND_TIMEVAL:=bson_append_timeval(b,key,longint(strlen(key)),val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_DATE_TIME(b,key,val : longint) : longint;
begin
  BSON_APPEND_DATE_TIME:=bson_append_date_time(b,key,longint(strlen(key)),val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_NOW_UTC(b,key : longint) : longint;
begin
  BSON_APPEND_NOW_UTC:=bson_append_now_utc(b,key,longint(strlen(key)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_TIMESTAMP(b,key,val,inc : longint) : longint;
begin
  BSON_APPEND_TIMESTAMP:=bson_append_timestamp(b,key,longint(strlen(key)),val,inc);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_UNDEFINED(b,key : longint) : longint;
begin
  BSON_APPEND_UNDEFINED:=bson_append_undefined(b,key,longint(strlen(key)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BSON_APPEND_ARRAY_BUILDER_BEGIN(b,key,child : longint) : longint;
begin
  BSON_APPEND_ARRAY_BUILDER_BEGIN:=bson_append_array_builder_begin(b,key,longint(strlen(key)),child);
end;


end.
