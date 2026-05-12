
unit mongoc_index;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_index.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_index.h
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
Pbson_t  = ^bson_t;
Pchar  = ^char;
Pmongoc_index_opt_geo_t  = ^mongoc_index_opt_geo_t;
Pmongoc_index_opt_storage_t  = ^mongoc_index_opt_storage_t;
Pmongoc_index_opt_t  = ^mongoc_index_opt_t;
Pmongoc_index_opt_wt_t  = ^mongoc_index_opt_wt_t;
Pmongoc_index_storage_opt_type_t  = ^mongoc_index_storage_opt_type_t;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2013 MongoDB Inc.
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
{$include "mongoc-prelude.h"}
{$ifndef MONGOC_INDEX_H}
{$define MONGOC_INDEX_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
type
  Pmongoc_index_opt_geo_t = ^Tmongoc_index_opt_geo_t;
  Tmongoc_index_opt_geo_t = record
      twod_sphere_version : Tuint8_t;
      twod_bits_precision : Tuint8_t;
      twod_location_min : Tdouble;
      twod_location_max : Tdouble;
      haystack_bucket_size : Tdouble;
      padding : array[0..31] of Puint8_t;
    end;

  Pmongoc_index_opt_storage_t = ^Tmongoc_index_opt_storage_t;
  Tmongoc_index_opt_storage_t = record
      _type : longint;
    end;

  Pmongoc_index_storage_opt_type_t = ^Tmongoc_index_storage_opt_type_t;
  Tmongoc_index_storage_opt_type_t =  Longint;
  Const
    MONGOC_INDEX_STORAGE_OPT_MMAPV1 = 0;
    MONGOC_INDEX_STORAGE_OPT_WIREDTIGER = 1;
;
(* Const before type ignored *)
type
  Pmongoc_index_opt_wt_t = ^Tmongoc_index_opt_wt_t;
  Tmongoc_index_opt_wt_t = record
      base : Tmongoc_index_opt_storage_t;
      config_str : Pchar;
      padding : array[0..7] of pointer;
    end;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  Pmongoc_index_opt_t = ^Tmongoc_index_opt_t;
  Tmongoc_index_opt_t = record
      is_initialized : Tbool;
      background : Tbool;
      unique : Tbool;
      name : Pchar;
      drop_dups : Tbool;
      sparse : Tbool;
      expire_after_seconds : Tint32_t;
      v : Tint32_t;
      weights : Pbson_t;
      default_language : Pchar;
      language_override : Pchar;
      geo_options : Pmongoc_index_opt_geo_t;
      storage_options : Pmongoc_index_opt_storage_t;
      partial_filter_expression : Pbson_t;
      collation : Pbson_t;
      padding : array[0..3] of pointer;
    end;
(* Const before type ignored *)

function mongoc_index_opt_get_default:Pmongoc_index_opt_t;cdecl;external;
(* Const before type ignored *)
function mongoc_index_opt_geo_get_default:Pmongoc_index_opt_geo_t;cdecl;external;
(* Const before type ignored *)
function mongoc_index_opt_wt_get_default:Pmongoc_index_opt_wt_t;cdecl;external;
procedure mongoc_index_opt_init(opt:Pmongoc_index_opt_t);cdecl;external;
procedure mongoc_index_opt_geo_init(opt:Pmongoc_index_opt_geo_t);cdecl;external;
procedure mongoc_index_opt_wt_init(opt:Pmongoc_index_opt_wt_t);cdecl;external;
{$endif}
{ MONGOC_INDEX_H  }

implementation


end.
