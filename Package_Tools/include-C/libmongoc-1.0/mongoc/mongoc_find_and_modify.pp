
unit mongoc_find_and_modify;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_find_and_modify.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_find_and_modify.h
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
Pmongoc_find_and_modify_flags_t  = ^mongoc_find_and_modify_flags_t;
Pmongoc_find_and_modify_opts_t  = ^mongoc_find_and_modify_opts_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2015 MongoDB, Inc.
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
{$ifndef MONGOC_FIND_AND_MODIFY_H}
{$define MONGOC_FIND_AND_MODIFY_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
type
  Pmongoc_find_and_modify_flags_t = ^Tmongoc_find_and_modify_flags_t;
  Tmongoc_find_and_modify_flags_t =  Longint;
  Const
    MONGOC_FIND_AND_MODIFY_NONE = 0;
    MONGOC_FIND_AND_MODIFY_REMOVE = 1 shl 0;
    MONGOC_FIND_AND_MODIFY_UPSERT = 1 shl 1;
    MONGOC_FIND_AND_MODIFY_RETURN_NEW = 1 shl 2;
;
type

function mongoc_find_and_modify_opts_new:Pmongoc_find_and_modify_opts_t;cdecl;external;
(* Const before type ignored *)
function mongoc_find_and_modify_opts_set_sort(opts:Pmongoc_find_and_modify_opts_t; sort:Pbson_t):Tbool;cdecl;external;
(* Const before type ignored *)
procedure mongoc_find_and_modify_opts_get_sort(opts:Pmongoc_find_and_modify_opts_t; sort:Pbson_t);cdecl;external;
(* Const before type ignored *)
function mongoc_find_and_modify_opts_set_update(opts:Pmongoc_find_and_modify_opts_t; update:Pbson_t):Tbool;cdecl;external;
(* Const before type ignored *)
procedure mongoc_find_and_modify_opts_get_update(opts:Pmongoc_find_and_modify_opts_t; update:Pbson_t);cdecl;external;
(* Const before type ignored *)
function mongoc_find_and_modify_opts_set_fields(opts:Pmongoc_find_and_modify_opts_t; fields:Pbson_t):Tbool;cdecl;external;
(* Const before type ignored *)
procedure mongoc_find_and_modify_opts_get_fields(opts:Pmongoc_find_and_modify_opts_t; fields:Pbson_t);cdecl;external;
(* Const before type ignored *)
function mongoc_find_and_modify_opts_set_flags(opts:Pmongoc_find_and_modify_opts_t; flags:Tmongoc_find_and_modify_flags_t):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_find_and_modify_opts_get_flags(opts:Pmongoc_find_and_modify_opts_t):Tmongoc_find_and_modify_flags_t;cdecl;external;
function mongoc_find_and_modify_opts_set_bypass_document_validation(opts:Pmongoc_find_and_modify_opts_t; bypass:Tbool):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_find_and_modify_opts_get_bypass_document_validation(opts:Pmongoc_find_and_modify_opts_t):Tbool;cdecl;external;
function mongoc_find_and_modify_opts_set_max_time_ms(opts:Pmongoc_find_and_modify_opts_t; max_time_ms:Tuint32_t):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_find_and_modify_opts_get_max_time_ms(opts:Pmongoc_find_and_modify_opts_t):Tuint32_t;cdecl;external;
(* Const before type ignored *)
function mongoc_find_and_modify_opts_append(opts:Pmongoc_find_and_modify_opts_t; extra:Pbson_t):Tbool;cdecl;external;
(* Const before type ignored *)
procedure mongoc_find_and_modify_opts_get_extra(opts:Pmongoc_find_and_modify_opts_t; extra:Pbson_t);cdecl;external;
procedure mongoc_find_and_modify_opts_destroy(opts:Pmongoc_find_and_modify_opts_t);cdecl;external;
{$endif}
{ MONGOC_FIND_AND_MODIFY_H  }

implementation


end.
