
unit mongoc_server_description;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_server_description.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_server_description.h
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
Pmongoc_host_list_t  = ^mongoc_host_list_t;
Pmongoc_server_description_t  = ^mongoc_server_description_t;
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
{$include "mongoc-prelude.h"}
{$ifndef MONGOC_SERVER_DESCRIPTION_H}
{$define MONGOC_SERVER_DESCRIPTION_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
{$include "mongoc-read-prefs.h"}
{$include "mongoc-host-list.h"}
type

procedure mongoc_server_description_destroy(description:Pmongoc_server_description_t);cdecl;external;
(* Const before type ignored *)
function mongoc_server_description_new_copy(description:Pmongoc_server_description_t):Pmongoc_server_description_t;cdecl;external;
(* Const before type ignored *)
function mongoc_server_description_id(description:Pmongoc_server_description_t):Tuint32_t;cdecl;external;
(* Const before type ignored *)
function mongoc_server_description_host(description:Pmongoc_server_description_t):Pmongoc_host_list_t;cdecl;external;
(* Const before type ignored *)
function mongoc_server_description_last_update_time(description:Pmongoc_server_description_t):Tint64_t;cdecl;external;
(* Const before type ignored *)
function mongoc_server_description_round_trip_time(description:Pmongoc_server_description_t):Tint64_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_server_description_type(description:Pmongoc_server_description_t):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_server_description_hello_response(description:Pmongoc_server_description_t):Pbson_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_server_description_ismaster(description:Pmongoc_server_description_t):Pbson_t;cdecl;external;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_server_description_hello_response); }
(* Const before type ignored *)
function mongoc_server_description_compressor_id(description:Pmongoc_server_description_t):Tint32_t;cdecl;external;
{$endif}

implementation


end.
