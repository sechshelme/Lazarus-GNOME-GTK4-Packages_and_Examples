
unit mongoc_read_concern;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_read_concern.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_read_concern.h
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
Pmongoc_read_concern_t  = ^mongoc_read_concern_t;
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
{$ifndef MONGOC_READ_CONCERN_H}
{$define MONGOC_READ_CONCERN_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}

const
  MONGOC_READ_CONCERN_LEVEL_AVAILABLE = 'available';  
  MONGOC_READ_CONCERN_LEVEL_LOCAL = 'local';  
  MONGOC_READ_CONCERN_LEVEL_MAJORITY = 'majority';  
  MONGOC_READ_CONCERN_LEVEL_LINEARIZABLE = 'linearizable';  
  MONGOC_READ_CONCERN_LEVEL_SNAPSHOT = 'snapshot';  
type

function mongoc_read_concern_new:Pmongoc_read_concern_t;cdecl;external;
(* Const before type ignored *)
function mongoc_read_concern_copy(read_concern:Pmongoc_read_concern_t):Pmongoc_read_concern_t;cdecl;external;
procedure mongoc_read_concern_destroy(read_concern:Pmongoc_read_concern_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_read_concern_get_level(read_concern:Pmongoc_read_concern_t):Pchar;cdecl;external;
(* Const before type ignored *)
function mongoc_read_concern_set_level(read_concern:Pmongoc_read_concern_t; level:Pchar):Tbool;cdecl;external;
function mongoc_read_concern_append(read_concern:Pmongoc_read_concern_t; doc:Pbson_t):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_read_concern_is_default(read_concern:Pmongoc_read_concern_t):Tbool;cdecl;external;
{$endif}
{ MONGOC_READ_CONCERN_H  }

implementation


end.
