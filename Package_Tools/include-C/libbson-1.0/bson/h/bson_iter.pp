
unit bson_iter;
interface

{
  Automatically converted by H2Pas 1.0.0 from bson_iter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bson_iter.h
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
Pbson_decimal128_t  = ^bson_decimal128_t;
Pbson_iter_t  = ^bson_iter_t;
Pbson_oid_t  = ^bson_oid_t;
Pbson_subtype_t  = ^bson_subtype_t;
Pbson_t  = ^bson_t;
Pbson_value_t  = ^bson_value_t;
Pbson_visitor_t  = ^bson_visitor_t;
Pchar  = ^char;
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
{$include <bson/bson-prelude.h>}
{$ifndef BSON_ITER_H}
{$define BSON_ITER_H}
{$include "bson.h"}
{$include <bson/bson-endian.h>}
{$include <bson/bson-macros.h>}
{$include <bson/bson-types.h>}
(* Const before type ignored *)

function bson_iter_value(iter:Pbson_iter_t):Pbson_value_t;cdecl;external;
{*
 * bson_iter_utf8_len_unsafe:
 * @iter: a bson_iter_t.
 *
 * Returns the length of a string currently pointed to by @iter. This performs
 * no validation so the is responsible for knowing the BSON is valid. Calling
 * bson_validate() is one way to do this ahead of time.
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure bson_iter_array(iter:Pbson_iter_t; array_len:Puint32_t; array:PPuint8_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure bson_iter_binary(iter:Pbson_iter_t; subtype:Pbson_subtype_t; binary_len:Puint32_t; binary:PPuint8_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function bson_iter_code(iter:Pbson_iter_t; length:Puint32_t):Pchar;cdecl;external;
{*
 * bson_iter_code_unsafe:
 * @iter: A bson_iter_t.
 * @length: A location for the length of the resulting string.
 *
 * Like bson_iter_code() but performs no integrity checks.
 *
 * Returns: A string that should not be modified or freed.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function bson_iter_codewscope(iter:Pbson_iter_t; length:Puint32_t; scope_len:Puint32_t; scope:PPuint8_t):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure bson_iter_dbpointer(iter:Pbson_iter_t; collection_len:Puint32_t; collection:PPchar; oid:PPbson_oid_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure bson_iter_document(iter:Pbson_iter_t; document_len:Puint32_t; document:PPuint8_t);cdecl;external;
(* Const before type ignored *)
function bson_iter_double(iter:Pbson_iter_t):Tdouble;cdecl;external;
(* Const before type ignored *)
function bson_iter_as_double(iter:Pbson_iter_t):Tdouble;cdecl;external;
{*
 * bson_iter_double_unsafe:
 * @iter: A bson_iter_t.
 *
 * Similar to bson_iter_double() but does not perform an integrity checking.
 *
 * Returns: A double.
  }
(* Const before type ignored *)
function bson_iter_init(iter:Pbson_iter_t; bson:Pbson_t):Tbool;cdecl;external;
(* Const before type ignored *)
function bson_iter_init_from_data(iter:Pbson_iter_t; data:Puint8_t; length:Tsize_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function bson_iter_init_find(iter:Pbson_iter_t; bson:Pbson_t; key:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function bson_iter_init_find_w_len(iter:Pbson_iter_t; bson:Pbson_t; key:Pchar; keylen:longint):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function bson_iter_init_find_case(iter:Pbson_iter_t; bson:Pbson_t; key:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
function bson_iter_init_from_data_at_offset(iter:Pbson_iter_t; data:Puint8_t; length:Tsize_t; offset:Tuint32_t; keylen:Tuint32_t):Tbool;cdecl;external;
(* Const before type ignored *)
function bson_iter_int32(iter:Pbson_iter_t):Tint32_t;cdecl;external;
{*
 * bson_iter_int32_unsafe:
 * @iter: A bson_iter_t.
 *
 * Similar to bson_iter_int32() but with no integrity checking.
 *
 * Returns: A 32-bit signed integer.
  }
(* Const before type ignored *)
function bson_iter_int64(iter:Pbson_iter_t):Tint64_t;cdecl;external;
(* Const before type ignored *)
function bson_iter_as_int64(iter:Pbson_iter_t):Tint64_t;cdecl;external;
{*
 * bson_iter_int64_unsafe:
 * @iter: a bson_iter_t.
 *
 * Similar to bson_iter_int64() but without integrity checking.
 *
 * Returns: A 64-bit signed integer.
  }
(* Const before type ignored *)
function bson_iter_find(iter:Pbson_iter_t; key:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
function bson_iter_find_w_len(iter:Pbson_iter_t; key:Pchar; keylen:longint):Tbool;cdecl;external;
(* Const before type ignored *)
function bson_iter_find_case(iter:Pbson_iter_t; key:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
function bson_iter_find_descendant(iter:Pbson_iter_t; dotkey:Pchar; descendant:Pbson_iter_t):Tbool;cdecl;external;
function bson_iter_next(iter:Pbson_iter_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function bson_iter_oid(iter:Pbson_iter_t):Pbson_oid_t;cdecl;external;
{*
 * bson_iter_oid_unsafe:
 * @iter: A #bson_iter_t.
 *
 * Similar to bson_iter_oid() but performs no integrity checks.
 *
 * Returns: A #bson_oid_t that should not be modified or freed.
  }
(* Const before type ignored *)
function bson_iter_decimal128(iter:Pbson_iter_t; dec:Pbson_decimal128_t):Tbool;cdecl;external;
{*
 * bson_iter_decimal128_unsafe:
 * @iter: A #bson_iter_t.
 *
 * Similar to bson_iter_decimal128() but performs no integrity checks.
 *
 * Returns: A #bson_decimal128_t.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function bson_iter_key(iter:Pbson_iter_t):Pchar;cdecl;external;
(* Const before type ignored *)
function bson_iter_key_len(iter:Pbson_iter_t):Tuint32_t;cdecl;external;
{*
 * bson_iter_key_unsafe:
 * @iter: A bson_iter_t.
 *
 * Similar to bson_iter_key() but performs no integrity checking.
 *
 * Returns: A string that should not be modified or freed.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function bson_iter_utf8(iter:Pbson_iter_t; length:Puint32_t):Pchar;cdecl;external;
{*
 * bson_iter_utf8_unsafe:
 *
 * Similar to bson_iter_utf8() but performs no integrity checking.
 *
 * Returns: A string that should not be modified or freed.
  }
(* Const before type ignored *)
function bson_iter_dup_utf8(iter:Pbson_iter_t; length:Puint32_t):Pchar;cdecl;external;
(* Const before type ignored *)
function bson_iter_date_time(iter:Pbson_iter_t):Tint64_t;cdecl;external;
(* Const before type ignored *)
function bson_iter_time_t(iter:Pbson_iter_t):Ttime_t;cdecl;external;
{*
 * bson_iter_time_t_unsafe:
 * @iter: A bson_iter_t.
 *
 * Similar to bson_iter_time_t() but performs no integrity checking.
 *
 * Returns: A time_t containing the number of seconds since UNIX epoch
 *          in UTC.
  }
(* Const before type ignored *)
procedure bson_iter_timeval(iter:Pbson_iter_t; tv:Ptimeval);cdecl;external;
{*
 * bson_iter_timeval_unsafe:
 * @iter: A bson_iter_t.
 * @tv: A struct timeval.
 *
 * Similar to bson_iter_timeval() but performs no integrity checking.
  }
(* Const before type ignored *)
procedure bson_iter_timestamp(iter:Pbson_iter_t; timestamp:Puint32_t; increment:Puint32_t);cdecl;external;
(* Const before type ignored *)
function bson_iter_bool(iter:Pbson_iter_t):Tbool;cdecl;external;
{*
 * bson_iter_bool_unsafe:
 * @iter: A bson_iter_t.
 *
 * Similar to bson_iter_bool() but performs no integrity checking.
 *
 * Returns: true or false.
  }
(* Const before type ignored *)
function bson_iter_as_bool(iter:Pbson_iter_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function bson_iter_regex(iter:Pbson_iter_t; options:PPchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function bson_iter_symbol(iter:Pbson_iter_t; length:Puint32_t):Pchar;cdecl;external;
(* Const before type ignored *)
function bson_iter_type(iter:Pbson_iter_t):Tbson_type_t;cdecl;external;
{*
 * bson_iter_type_unsafe:
 * @iter: A bson_iter_t.
 *
 * Similar to bson_iter_type() but performs no integrity checking.
 *
 * Returns: A bson_type_t.
  }
(* Const before type ignored *)
function bson_iter_recurse(iter:Pbson_iter_t; child:Pbson_iter_t):Tbool;cdecl;external;
procedure bson_iter_overwrite_int32(iter:Pbson_iter_t; value:Tint32_t);cdecl;external;
procedure bson_iter_overwrite_int64(iter:Pbson_iter_t; value:Tint64_t);cdecl;external;
procedure bson_iter_overwrite_double(iter:Pbson_iter_t; value:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure bson_iter_overwrite_decimal128(iter:Pbson_iter_t; value:Pbson_decimal128_t);cdecl;external;
procedure bson_iter_overwrite_bool(iter:Pbson_iter_t; value:Tbool);cdecl;external;
(* Const before type ignored *)
procedure bson_iter_overwrite_oid(iter:Pbson_iter_t; value:Pbson_oid_t);cdecl;external;
procedure bson_iter_overwrite_timestamp(iter:Pbson_iter_t; timestamp:Tuint32_t; increment:Tuint32_t);cdecl;external;
procedure bson_iter_overwrite_date_time(iter:Pbson_iter_t; value:Tint64_t);cdecl;external;
(* Const before type ignored *)
function bson_iter_visit_all(iter:Pbson_iter_t; visitor:Pbson_visitor_t; data:pointer):Tbool;cdecl;external;
function bson_iter_offset(iter:Pbson_iter_t):Tuint32_t;cdecl;external;
{$endif}
{ BSON_ITER_H  }

implementation


end.
