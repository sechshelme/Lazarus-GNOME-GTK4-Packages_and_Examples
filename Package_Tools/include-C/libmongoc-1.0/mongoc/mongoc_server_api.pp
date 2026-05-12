
unit mongoc_server_api;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_server_api.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_server_api.h
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
Pchar  = ^char;
Pmongoc_optional_t  = ^mongoc_optional_t;
Pmongoc_server_api_t  = ^mongoc_server_api_t;
Pmongoc_server_api_version_t  = ^mongoc_server_api_version_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2021 MongoDB, Inc.
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
{$ifndef MONGOC_SERVER_API_H}
{$define MONGOC_SERVER_API_H}
{$include <bson/bson.h>}
{$include "mongoc-optional.h"}
{$include "mongoc-macros.h"}
type
  Pmongoc_server_api_version_t = ^Tmongoc_server_api_version_t;
  Tmongoc_server_api_version_t =  Longint;
  Const
    MONGOC_SERVER_API_V1 = 0;
;
type
(* Const before type ignored *)

function mongoc_server_api_version_to_string(version:Tmongoc_server_api_version_t):Pchar;cdecl;external;
(* Const before type ignored *)
function mongoc_server_api_version_from_string(version:Pchar; out:Pmongoc_server_api_version_t):Tbool;cdecl;external;
function mongoc_server_api_new(version:Tmongoc_server_api_version_t):Pmongoc_server_api_t;cdecl;external;
(* Const before type ignored *)
function mongoc_server_api_copy(api:Pmongoc_server_api_t):Pmongoc_server_api_t;cdecl;external;
procedure mongoc_server_api_destroy(api:Pmongoc_server_api_t);cdecl;external;
procedure mongoc_server_api_strict(api:Pmongoc_server_api_t; strict:Tbool);cdecl;external;
procedure mongoc_server_api_deprecation_errors(api:Pmongoc_server_api_t; deprecation_errors:Tbool);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_server_api_get_deprecation_errors(api:Pmongoc_server_api_t):Pmongoc_optional_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_server_api_get_strict(api:Pmongoc_server_api_t):Pmongoc_optional_t;cdecl;external;
(* Const before type ignored *)
function mongoc_server_api_get_version(api:Pmongoc_server_api_t):Tmongoc_server_api_version_t;cdecl;external;
{$endif}
{ MONGOC_SERVER_API_H  }

implementation


end.
