
unit bson_json;
interface

{
  Automatically converted by H2Pas 1.0.0 from bson_json.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bson_json.h
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
Pbson_error_t  = ^bson_error_t;
Pbson_json_error_code_t  = ^bson_json_error_code_t;
Pbson_json_mode_t  = ^bson_json_mode_t;
Pbson_json_opts_t  = ^bson_json_opts_t;
Pbson_json_reader_t  = ^bson_json_reader_t;
Pbson_t  = ^bson_t;
Pchar  = ^char;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2014 MongoDB, Inc.
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
{$ifndef BSON_JSON_H}
{$define BSON_JSON_H}
{$include "bson.h"}
type

  Pbson_json_error_code_t = ^Tbson_json_error_code_t;
  Tbson_json_error_code_t =  Longint;
  Const
    BSON_JSON_ERROR_READ_CORRUPT_JS = 1;
    BSON_JSON_ERROR_READ_INVALID_PARAM = 2;
    BSON_JSON_ERROR_READ_CB_FAILURE = 3;
;
{*
 * BSON_MAX_LEN_UNLIMITED
 *
 * Denotes unlimited length limit when converting BSON to JSON.
  }
  BSON_MAX_LEN_UNLIMITED = -(1);  
{*
 * bson_json_mode_t:
 *
 * This enumeration contains the different modes to serialize BSON into extended
 * JSON.
  }
type
  Pbson_json_mode_t = ^Tbson_json_mode_t;
  Tbson_json_mode_t =  Longint;
  Const
    BSON_JSON_MODE_LEGACY = 0;
    BSON_JSON_MODE_CANONICAL = 1;
    BSON_JSON_MODE_RELAXED = 2;
;

function bson_json_opts_new(mode:Tbson_json_mode_t; max_len:Tint32_t):Pbson_json_opts_t;cdecl;external;
procedure bson_json_opts_destroy(opts:Pbson_json_opts_t);cdecl;external;
procedure bson_json_opts_set_outermost_array(opts:Pbson_json_opts_t; is_outermost_array:Tbool);cdecl;external;
type

  Tbson_json_reader_cb = function (handle:pointer; buf:Puint8_t; count:Tsize_t):Tssize_t;cdecl;

  Tbson_json_destroy_cb = procedure (handle:pointer);cdecl;

function bson_json_reader_new(data:pointer; cb:Tbson_json_reader_cb; dcb:Tbson_json_destroy_cb; allow_multiple:Tbool; buf_size:Tsize_t):Pbson_json_reader_t;cdecl;external;
function bson_json_reader_new_from_fd(fd:longint; close_on_destroy:Tbool):Pbson_json_reader_t;cdecl;external;
(* Const before type ignored *)
function bson_json_reader_new_from_file(filename:Pchar; error:Pbson_error_t):Pbson_json_reader_t;cdecl;external;
procedure bson_json_reader_destroy(reader:Pbson_json_reader_t);cdecl;external;
function bson_json_reader_read(reader:Pbson_json_reader_t; bson:Pbson_t; error:Pbson_error_t):longint;cdecl;external;
function bson_json_data_reader_new(allow_multiple:Tbool; size:Tsize_t):Pbson_json_reader_t;cdecl;external;
(* Const before type ignored *)
procedure bson_json_data_reader_ingest(reader:Pbson_json_reader_t; data:Puint8_t; len:Tsize_t);cdecl;external;
{$endif}
{ BSON_JSON_H  }

implementation


end.
