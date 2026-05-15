
unit mongoc_topology_description;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_topology_description.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_topology_description.h
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
Pmongoc_read_prefs_t  = ^mongoc_read_prefs_t;
Pmongoc_server_description_t  = ^mongoc_server_description_t;
Pmongoc_topology_description_t  = ^mongoc_topology_description_t;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2016 MongoDB, Inc.
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
{$ifndef MONGOC_TOPOLOGY_DESCRIPTION_H}
{$define MONGOC_TOPOLOGY_DESCRIPTION_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
{$include "mongoc-read-prefs.h"}
type

procedure mongoc_topology_description_destroy(description:Pmongoc_topology_description_t);cdecl;external;
(* Const before type ignored *)
function mongoc_topology_description_new_copy(description:Pmongoc_topology_description_t):Pmongoc_topology_description_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_topology_description_has_readable_server(td:Pmongoc_topology_description_t; prefs:Pmongoc_read_prefs_t):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_topology_description_has_writable_server(td:Pmongoc_topology_description_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_topology_description_type(td:Pmongoc_topology_description_t):Pchar;cdecl;external;
(* Const before type ignored *)
function mongoc_topology_description_get_servers(td:Pmongoc_topology_description_t; n:Psize_t):^Pmongoc_server_description_t;cdecl;external;
{$endif}
{ MONGOC_TOPOLOGY_DESCRIPTION_H  }

implementation


end.
