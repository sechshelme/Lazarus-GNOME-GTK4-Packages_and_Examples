
unit mongoc_optional;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_optional.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_optional.h
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
Pmongoc_optional_t  = ^mongoc_optional_t;
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
{$ifndef MONGOC_OPTIONAL_H}
{$define MONGOC_OPTIONAL_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
type
  Pmongoc_optional_t = ^Tmongoc_optional_t;
  Tmongoc_optional_t = record
      value : Tbool;
      is_set : Tbool;
    end;

procedure mongoc_optional_init(opt:Pmongoc_optional_t);cdecl;external;
(* Const before type ignored *)
function mongoc_optional_is_set(opt:Pmongoc_optional_t):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_optional_value(opt:Pmongoc_optional_t):Tbool;cdecl;external;
procedure mongoc_optional_set_value(opt:Pmongoc_optional_t; val:Tbool);cdecl;external;
(* Const before type ignored *)
procedure mongoc_optional_copy(source:Pmongoc_optional_t; copy:Pmongoc_optional_t);cdecl;external;
{$endif}
{ MONGOC_OPTIONAL_H  }

implementation


end.
