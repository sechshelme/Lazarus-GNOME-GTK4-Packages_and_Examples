
unit bcon;
interface

{
  Automatically converted by H2Pas 1.0.0 from bcon.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bcon.h
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
Pbcon_append_ctx_frame  = ^bcon_append_ctx_frame;
Pbcon_append_ctx_frame_t  = ^bcon_append_ctx_frame_t;
Pbcon_append_ctx_t  = ^bcon_append_ctx_t;
Pbcon_extract_ctx_frame  = ^bcon_extract_ctx_frame;
Pbcon_extract_ctx_frame_t  = ^bcon_extract_ctx_frame_t;
Pbcon_extract_ctx_t  = ^bcon_extract_ctx_t;
Pbcon_type_t  = ^bcon_type_t;
Pbson_t  = ^bson_t;
Pchar  = ^char;
Pva_list  = ^va_list;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * @file bcon.h
 * @brief BCON (BSON C Object Notation) Declarations
  }
{$include <bson/bson-prelude.h>}
{    Copyright 2009-2013 MongoDB, Inc.
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the License is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the License for the specific language governing permissions and
 *    limitations under the License.
  }
{$ifndef BCON_H_}
{$define BCON_H_}
{$include "bson.h"}
type
  Pbcon_type_t = ^Tbcon_type_t;
  Tbcon_type_t =  Longint;
  Const
    BCON_TYPE_UTF8 = 0;
    BCON_TYPE_DOUBLE = 1;
    BCON_TYPE_DOCUMENT = 2;
    BCON_TYPE_ARRAY = 3;
    BCON_TYPE_BIN = 4;
    BCON_TYPE_UNDEFINED = 5;
    BCON_TYPE_OID = 6;
    BCON_TYPE_BOOL = 7;
    BCON_TYPE_DATE_TIME = 8;
    BCON_TYPE_NULL = 9;
    BCON_TYPE_REGEX = 10;
    BCON_TYPE_DBPOINTER = 11;
    BCON_TYPE_CODE = 12;
    BCON_TYPE_SYMBOL = 13;
    BCON_TYPE_CODEWSCOPE = 14;
    BCON_TYPE_INT32 = 15;
    BCON_TYPE_TIMESTAMP = 16;
    BCON_TYPE_INT64 = 17;
    BCON_TYPE_DECIMAL128 = 18;
    BCON_TYPE_MAXKEY = 19;
    BCON_TYPE_MINKEY = 20;
    BCON_TYPE_BCON = 21;
    BCON_TYPE_ARRAY_START = 22;
    BCON_TYPE_ARRAY_END = 23;
    BCON_TYPE_DOC_START = 24;
    BCON_TYPE_DOC_END = 25;
    BCON_TYPE_END = 26;
    BCON_TYPE_RAW = 27;
    BCON_TYPE_SKIP = 28;
    BCON_TYPE_ITER = 29;
    BCON_TYPE_ERROR = 30;
;
type
  Pbcon_append_ctx_frame = ^Tbcon_append_ctx_frame;
  Tbcon_append_ctx_frame = record
      i : longint;
      is_array : Tbool;
      bson : Tbson_t;
    end;
  Tbcon_append_ctx_frame_t = Tbcon_append_ctx_frame;
  Pbcon_append_ctx_frame_t = ^Tbcon_append_ctx_frame_t;

  Pbcon_extract_ctx_frame = ^Tbcon_extract_ctx_frame;
  Tbcon_extract_ctx_frame = record
      i : longint;
      is_array : Tbool;
      iter : Tbson_iter_t;
    end;
  Tbcon_extract_ctx_frame_t = Tbcon_extract_ctx_frame;
  Pbcon_extract_ctx_frame_t = ^Tbcon_extract_ctx_frame_t;

  Pbcon_append_ctx_t = ^Tbcon_append_ctx_t;
  Tbcon_append_ctx_t = record
      stack : array[0..(BCON_STACK_MAX)-1] of Tbcon_append_ctx_frame_t;
      n : longint;
    end;

  Pbcon_extract_ctx_t = ^Tbcon_extract_ctx_t;
  Tbcon_extract_ctx_t = record
      stack : array[0..(BCON_STACK_MAX)-1] of Tbcon_extract_ctx_frame_t;
      n : longint;
    end;

procedure bcon_append(bson:Pbson_t; args:array of const);cdecl;external;
procedure bcon_append(bson:Pbson_t);cdecl;external;
procedure bcon_append_ctx(bson:Pbson_t; ctx:Pbcon_append_ctx_t; args:array of const);cdecl;external;
procedure bcon_append_ctx(bson:Pbson_t; ctx:Pbcon_append_ctx_t);cdecl;external;
procedure bcon_append_ctx_va(bson:Pbson_t; ctx:Pbcon_append_ctx_t; va:Pva_list);cdecl;external;
procedure bcon_append_ctx_init(ctx:Pbcon_append_ctx_t);cdecl;external;
procedure bcon_extract_ctx_init(ctx:Pbcon_extract_ctx_t);cdecl;external;
procedure bcon_extract_ctx(bson:Pbson_t; ctx:Pbcon_extract_ctx_t; args:array of const);cdecl;external;
procedure bcon_extract_ctx(bson:Pbson_t; ctx:Pbcon_extract_ctx_t);cdecl;external;
function bcon_extract_ctx_va(bson:Pbson_t; ctx:Pbcon_extract_ctx_t; ap:Pva_list):Tbool;cdecl;external;
function bcon_extract(bson:Pbson_t; args:array of const):Tbool;cdecl;external;
function bcon_extract(bson:Pbson_t):Tbool;cdecl;external;
function bcon_extract_va(bson:Pbson_t; ctx:Pbcon_extract_ctx_t; args:array of const):Tbool;cdecl;external;
function bcon_extract_va(bson:Pbson_t; ctx:Pbcon_extract_ctx_t):Tbool;cdecl;external;
function bcon_new(unused:pointer; args:array of const):Pbson_t;cdecl;external;
function bcon_new(unused:pointer):Pbson_t;cdecl;external;
{*
 * The bcon_..() functions are all declared with __attribute__((sentinel)).
 *
 * From GCC manual for "sentinel": "A valid NULL in this context is defined as
 * zero with any pointer type. If your system defines the NULL macro with an
 * integer type then you need to add an explicit cast."
 * Case in point: GCC on Solaris (at least)
  }
(* Const before type ignored *)
function bson_bcon_magic:Pchar;cdecl;external;
(* Const before type ignored *)
function bson_bcone_magic:Pchar;cdecl;external;
{$endif}

implementation


end.
