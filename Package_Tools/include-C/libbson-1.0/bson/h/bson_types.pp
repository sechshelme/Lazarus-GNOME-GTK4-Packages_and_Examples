
unit bson_types;
interface

{
  Automatically converted by H2Pas 1.0.0 from bson_types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bson_types.h
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
Pbson_context_flags_t  = ^bson_context_flags_t;
Pbson_decimal128_t  = ^bson_decimal128_t;
Pbson_error_t  = ^bson_error_t;
Pbson_iter_t  = ^bson_iter_t;
Pbson_oid_t  = ^bson_oid_t;
Pbson_reader_t  = ^bson_reader_t;
Pbson_subtype_t  = ^bson_subtype_t;
Pbson_t  = ^bson_t;
Pbson_type_t  = ^bson_type_t;
Pbson_unichar_t  = ^bson_unichar_t;
Pbson_validate_flags_t  = ^bson_validate_flags_t;
Pbson_value_t  = ^bson_value_t;
Pbson_visitor_t  = ^bson_visitor_t;
Pchar  = ^char;
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
{$ifndef BSON_TYPES_H}
{$define BSON_TYPES_H}
{$include <stdlib.h>}
{$include <sys/types.h>}
{$include <bson/bson-macros.h>}
{$include <bson/bson-config.h>}
{$include <bson/bson-compat.h>}
{$include <bson/bson-endian.h>}
{
 *--------------------------------------------------------------------------
 *
 * bson_unichar_t --
 *
 *       bson_unichar_t provides an unsigned 32-bit type for containing
 *       unicode characters. When iterating UTF-8 sequences, this should
 *       be used to avoid losing the high-bits of non-ascii characters.
 *
 * See also:
 *       bson_string_append_unichar()
 *
 *--------------------------------------------------------------------------
  }
type
  Pbson_unichar_t = ^Tbson_unichar_t;
  Tbson_unichar_t = Tuint32_t;
{*
 * @brief Flags configuring the creation of a bson_context_t
  }
{* Use default options  }
{ Deprecated: Generating new OIDs from a bson_context_t is always
      thread-safe  }
{ Deprecated: Does nothing and is ignored  }
{ Call getpid() instead of remembering the result of getpid() when using the
      context  }
{ Deprecated: Does nothing  }

  Pbson_context_flags_t = ^Tbson_context_flags_t;
  Tbson_context_flags_t =  Longint;
  Const
    BSON_CONTEXT_NONE = 0;
    BSON_CONTEXT_THREAD_SAFE = 1 shl 0;
    BSON_CONTEXT_DISABLE_HOST_CACHE = 1 shl 1;
    BSON_CONTEXT_DISABLE_PID_CACHE = 1 shl 2;
    BSON_CONTEXT_USE_TASK_ID = 1 shl 3;
;
{*
 * bson_context_t:
 *
 * This structure manages context for the bson library. It handles
 * configuration for thread-safety and other performance related requirements.
 * Consumers will create a context and may use multiple under a variety of
 * situations.
 *
 * If your program calls fork(), you should initialize a new bson_context_t
 * using bson_context_init().
 *
 * If you are using threading, it is suggested that you use a bson_context_t
 * per thread for best performance. Alternatively, you can initialize the
 * bson_context_t with BSON_CONTEXT_THREAD_SAFE, although a performance penalty
 * will be incurred.
 *
 * Many functions will require that you provide a bson_context_t such as OID
 * generation.
 *
 * This structure is opaque in that you cannot see the contents of the
 * structure. However, it is stack allocatable in that enough padding is
 * provided in _bson_context_t to hold the structure.
  }
type
{*
 * bson_json_opts_t:
 *
 * This structure is used to pass options for serializing BSON into extended
 * JSON to the respective serialization methods.
 *
 * max_len can be either a non-negative integer, or BSON_MAX_LEN_UNLIMITED to
 * set no limit for serialization length.
  }

  Pbson_t = ^Tbson_t;
  Tbson_t = record
      flags : Tuint32_t;
      len : Tuint32_t;
      padding : array[0..119] of Tuint8_t;
    end;

  Pbson_oid_t = ^Tbson_oid_t;
  Tbson_oid_t = record
      bytes : array[0..11] of Tuint8_t;
    end;
{*
 * bson_decimal128_t:
 *
 * @high The high-order bytes of the decimal128.  This field contains sign,
 *       combination bits, exponent, and part of the coefficient continuation.
 * @low  The low-order bytes of the decimal128.  This field contains the second
 *       part of the coefficient continuation.
 *
 * This structure is a boxed type containing the value for the BSON decimal128
 * type.  The structure stores the 128 bits such that they correspond to the
 * native format for the IEEE decimal128 type, if it is implemented.
 * }

  Pbson_decimal128_t = ^Tbson_decimal128_t;
  Tbson_decimal128_t = record
      low : Tuint64_t;
      high : Tuint64_t;
    end;
{*
 * bson_validate_flags_t:
 *
 * This enumeration is used for validation of BSON documents. It allows
 * selective control on what you wish to validate.
 *
 * %BSON_VALIDATE_NONE: No additional validation occurs.
 * %BSON_VALIDATE_UTF8: Check that strings are valid UTF-8.
 * %BSON_VALIDATE_DOLLAR_KEYS: Check that keys do not start with $.
 * %BSON_VALIDATE_DOT_KEYS: Check that keys do not contain a period.
 * %BSON_VALIDATE_UTF8_ALLOW_NULL: Allow NUL bytes in UTF-8 text.
 * %BSON_VALIDATE_EMPTY_KEYS: Prohibit zero-length field names
  }

  Pbson_validate_flags_t = ^Tbson_validate_flags_t;
  Tbson_validate_flags_t =  Longint;
  Const
    BSON_VALIDATE_NONE = 0;
    BSON_VALIDATE_UTF8 = 1 shl 0;
    BSON_VALIDATE_DOLLAR_KEYS = 1 shl 1;
    BSON_VALIDATE_DOT_KEYS = 1 shl 2;
    BSON_VALIDATE_UTF8_ALLOW_NULL = 1 shl 3;
    BSON_VALIDATE_EMPTY_KEYS = 1 shl 4;
;
{*
 * bson_type_t:
 *
 * This enumeration contains all of the possible types within a BSON document.
 * Use bson_iter_type() to fetch the type of a field while iterating over it.
  }
type
  Pbson_type_t = ^Tbson_type_t;
  Tbson_type_t =  Longint;
  Const
    BSON_TYPE_EOD = $00;
    BSON_TYPE_DOUBLE = $01;
    BSON_TYPE_UTF8 = $02;
    BSON_TYPE_DOCUMENT = $03;
    BSON_TYPE_ARRAY = $04;
    BSON_TYPE_BINARY = $05;
    BSON_TYPE_UNDEFINED = $06;
    BSON_TYPE_OID = $07;
    BSON_TYPE_BOOL = $08;
    BSON_TYPE_DATE_TIME = $09;
    BSON_TYPE_NULL = $0A;
    BSON_TYPE_REGEX = $0B;
    BSON_TYPE_DBPOINTER = $0C;
    BSON_TYPE_CODE = $0D;
    BSON_TYPE_SYMBOL = $0E;
    BSON_TYPE_CODEWSCOPE = $0F;
    BSON_TYPE_INT32 = $10;
    BSON_TYPE_TIMESTAMP = $11;
    BSON_TYPE_INT64 = $12;
    BSON_TYPE_DECIMAL128 = $13;
    BSON_TYPE_MAXKEY = $7F;
    BSON_TYPE_MINKEY = $FF;
;
{*
 * bson_subtype_t:
 *
 * This enumeration contains the various subtypes that may be used in a binary
 * field. See http://bsonspec.org for more information.
  }
type
  Pbson_subtype_t = ^Tbson_subtype_t;
  Tbson_subtype_t =  Longint;
  Const
    BSON_SUBTYPE_BINARY = $00;
    BSON_SUBTYPE_FUNCTION = $01;
    BSON_SUBTYPE_BINARY_DEPRECATED = $02;
    BSON_SUBTYPE_UUID_DEPRECATED = $03;
    BSON_SUBTYPE_UUID = $04;
    BSON_SUBTYPE_MD5 = $05;
    BSON_SUBTYPE_ENCRYPTED = $06;
    BSON_SUBTYPE_COLUMN = $07;
    BSON_SUBTYPE_SENSITIVE = $08;
    BSON_SUBTYPE_USER = $80;
;
{
 *--------------------------------------------------------------------------
 *
 * bson_value_t --
 *
 *       A boxed type to contain various bson_type_t types.
 *
 * See also:
 *       bson_value_copy()
 *       bson_value_destroy()
 *
 *--------------------------------------------------------------------------
  }
type
  Pbson_value_t = ^Tbson_value_t;
  Tbson_value_t = record
      value_type : Tbson_type_t;
      padding : Tint32_t;
      value : record
          case longint of
            0 : ( v_oid : Tbson_oid_t );
            1 : ( v_int64 : Tint64_t );
            2 : ( v_int32 : Tint32_t );
            3 : ( v_int8 : Tint8_t );
            4 : ( v_double : Tdouble );
            5 : ( v_bool : Tbool );
            6 : ( v_datetime : Tint64_t );
            7 : ( v_timestamp : record
                timestamp : Tuint32_t;
                increment : Tuint32_t;
              end );
            8 : ( v_utf8 : record
                str : Pchar;
                len : Tuint32_t;
              end );
            9 : ( v_doc : record
                data : Puint8_t;
                data_len : Tuint32_t;
              end );
            10 : ( v_binary : record
                data : Puint8_t;
                data_len : Tuint32_t;
                subtype : Tbson_subtype_t;
              end );
            11 : ( v_regex : record
                regex : Pchar;
                options : Pchar;
              end );
            12 : ( v_dbpointer : record
                collection : Pchar;
                collection_len : Tuint32_t;
                oid : Tbson_oid_t;
              end );
            13 : ( v_code : record
                code : Pchar;
                code_len : Tuint32_t;
              end );
            14 : ( v_codewscope : record
                code : Pchar;
                scope_data : Puint8_t;
                code_len : Tuint32_t;
                scope_len : Tuint32_t;
              end );
            15 : ( v_symbol : record
                symbol : Pchar;
                len : Tuint32_t;
              end );
            16 : ( v_decimal128 : Tbson_decimal128_t );
          end;
    end;
{*
 * bson_iter_t:
 *
 * This structure manages iteration over a bson_t structure. It keeps track
 * of the location of the current key and value within the buffer. Using the
 * various functions to get the value of the iter will read from these
 * locations.
 *
 * This structure is safe to discard on the stack. No cleanup is necessary
 * after using it.
  }
(* Const before type ignored *)
{ The raw buffer being iterated.  }
{ The length of raw.  }
{ The offset within the buffer.  }
{ The offset of the type byte.  }
{ The offset of the key byte.  }
{ The offset of the first data byte.  }
{ The offset of the second data byte.  }
{ The offset of the third data byte.  }
{ The offset of the fourth data byte.  }
{ The offset of the next field.  }
{ The offset of the error.  }
{ Internal value for various state.  }

  Pbson_iter_t = ^Tbson_iter_t;
  Tbson_iter_t = record
      raw : Puint8_t;
      len : Tuint32_t;
      off : Tuint32_t;
      _type : Tuint32_t;
      key : Tuint32_t;
      d1 : Tuint32_t;
      d2 : Tuint32_t;
      d3 : Tuint32_t;
      d4 : Tuint32_t;
      next_off : Tuint32_t;
      err_off : Tuint32_t;
      value : Tbson_value_t;
    end;
{*
 * bson_reader_t:
 *
 * This structure is used to iterate over a sequence of BSON documents. It
 * allows for them to be iterated with the possibility of no additional
 * memory allocations under certain circumstances such as reading from an
 * incoming mongo packet.
  }
{< private > }

  Pbson_reader_t = ^Tbson_reader_t;
  Tbson_reader_t = record
      _type : Tuint32_t;
    end;
{*
 * bson_visitor_t:
 *
 * This structure contains a series of pointers that can be executed for
 * each field of a BSON document based on the field type.
 *
 * For example, if an int32 field is found, visit_int32 will be called.
 *
 * When visiting each field using bson_iter_visit_all(), you may provide a
 * data pointer that will be provided with each callback. This might be useful
 * if you are marshaling to another language.
 *
 * You may pre-maturely stop the visitation of fields by returning true in your
 * visitor. Returning false will continue visitation to further fields.
  }
{ run before / after descending into a document  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ corrupt BSON, or unsupported type and visit_unsupported_type not set  }
(* Const before type ignored *)
{ normal bson field callbacks  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ normal field with deprecated "Undefined" BSON type  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ if set, called instead of visit_corrupt when an apparently valid BSON
    * includes an unrecognized field type (reading future version of BSON)  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  Pbson_visitor_t = ^Tbson_visitor_t;
  Tbson_visitor_t = record
      visit_before : function (iter:Pbson_iter_t; key:Pchar; data:pointer):Tbool;cdecl;
      visit_after : function (iter:Pbson_iter_t; key:Pchar; data:pointer):Tbool;cdecl;
      visit_corrupt : procedure (iter:Pbson_iter_t; data:pointer);cdecl;
      visit_double : function (iter:Pbson_iter_t; key:Pchar; v_double:Tdouble; data:pointer):Tbool;cdecl;
      visit_utf8 : function (iter:Pbson_iter_t; key:Pchar; v_utf8_len:Tsize_t; v_utf8:Pchar; data:pointer):Tbool;cdecl;
      visit_document : function (iter:Pbson_iter_t; key:Pchar; v_document:Pbson_t; data:pointer):Tbool;cdecl;
      visit_array : function (iter:Pbson_iter_t; key:Pchar; v_array:Pbson_t; data:pointer):Tbool;cdecl;
      visit_binary : function (iter:Pbson_iter_t; key:Pchar; v_subtype:Tbson_subtype_t; v_binary_len:Tsize_t; v_binary:Puint8_t; 
                   data:pointer):Tbool;cdecl;
      visit_undefined : function (iter:Pbson_iter_t; key:Pchar; data:pointer):Tbool;cdecl;
      visit_oid : function (iter:Pbson_iter_t; key:Pchar; v_oid:Pbson_oid_t; data:pointer):Tbool;cdecl;
      visit_bool : function (iter:Pbson_iter_t; key:Pchar; v_bool:Tbool; data:pointer):Tbool;cdecl;
      visit_date_time : function (iter:Pbson_iter_t; key:Pchar; msec_since_epoch:Tint64_t; data:pointer):Tbool;cdecl;
      visit_null : function (iter:Pbson_iter_t; key:Pchar; data:pointer):Tbool;cdecl;
      visit_regex : function (iter:Pbson_iter_t; key:Pchar; v_regex:Pchar; v_options:Pchar; data:pointer):Tbool;cdecl;
      visit_dbpointer : function (iter:Pbson_iter_t; key:Pchar; v_collection_len:Tsize_t; v_collection:Pchar; v_oid:Pbson_oid_t; 
                   data:pointer):Tbool;cdecl;
      visit_code : function (iter:Pbson_iter_t; key:Pchar; v_code_len:Tsize_t; v_code:Pchar; data:pointer):Tbool;cdecl;
      visit_symbol : function (iter:Pbson_iter_t; key:Pchar; v_symbol_len:Tsize_t; v_symbol:Pchar; data:pointer):Tbool;cdecl;
      visit_codewscope : function (iter:Pbson_iter_t; key:Pchar; v_code_len:Tsize_t; v_code:Pchar; v_scope:Pbson_t; 
                   data:pointer):Tbool;cdecl;
      visit_int32 : function (iter:Pbson_iter_t; key:Pchar; v_int32:Tint32_t; data:pointer):Tbool;cdecl;
      visit_timestamp : function (iter:Pbson_iter_t; key:Pchar; v_timestamp:Tuint32_t; v_increment:Tuint32_t; data:pointer):Tbool;cdecl;
      visit_int64 : function (iter:Pbson_iter_t; key:Pchar; v_int64:Tint64_t; data:pointer):Tbool;cdecl;
      visit_maxkey : function (iter:Pbson_iter_t; key:Pchar; data:pointer):Tbool;cdecl;
      visit_minkey : function (iter:Pbson_iter_t; key:Pchar; data:pointer):Tbool;cdecl;
      visit_unsupported_type : procedure (iter:Pbson_iter_t; key:Pchar; type_code:Tuint32_t; data:pointer);cdecl;
      visit_decimal128 : function (iter:Pbson_iter_t; key:Pchar; v_decimal128:Pbson_decimal128_t; data:pointer):Tbool;cdecl;
      padding : array[0..6] of pointer;
    end;

const
  BSON_ERROR_BUFFER_SIZE = 504;  
type
  Pbson_error_t = ^Tbson_error_t;
  Tbson_error_t = record
      domain : Tuint32_t;
      code : Tuint32_t;
      message : array[0..(BSON_ERROR_BUFFER_SIZE)-1] of char;
    end;

implementation


end.
