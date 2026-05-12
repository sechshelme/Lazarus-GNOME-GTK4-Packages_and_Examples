
unit mongoc_matcher;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_matcher.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_matcher.h
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
Pbson_t  = ^bson_t;
Pmongoc_matcher_t  = ^mongoc_matcher_t;
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
{$ifndef MONGOC_MATCHER_H}
{$define MONGOC_MATCHER_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
type
(* Const before type ignored *)

function mongoc_matcher_new(query:Pbson_t; error:Pbson_error_t):Pmongoc_matcher_t;cdecl;external;
{xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;; }
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_matcher_match(matcher:Pmongoc_matcher_t; document:Pbson_t):Tbool;cdecl;external;
{xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;; }
procedure mongoc_matcher_destroy(matcher:Pmongoc_matcher_t);cdecl;external;
{xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;; }
{$endif}
{ MONGOC_MATCHER_H  }

implementation


end.
