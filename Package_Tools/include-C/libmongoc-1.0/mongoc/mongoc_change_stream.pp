
unit mongoc_change_stream;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_change_stream.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_change_stream.h
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
Pmongoc_change_stream_t  = ^mongoc_change_stream_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2017-present MongoDB, Inc.
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
{$ifndef MONGOC_CHANGE_STREAM_H}
{$define MONGOC_CHANGE_STREAM_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
type

procedure mongoc_change_stream_destroy(para1:Pmongoc_change_stream_t);cdecl;external;
(* Const before type ignored *)
function mongoc_change_stream_get_resume_token(para1:Pmongoc_change_stream_t):Pbson_t;cdecl;external;
(* Const before type ignored *)
function mongoc_change_stream_next(para1:Pmongoc_change_stream_t; para2:PPbson_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_change_stream_error_document(para1:Pmongoc_change_stream_t; para2:Pbson_error_t; para3:PPbson_t):Tbool;cdecl;external;
{$endif}
{ MONGOC_CHANGE_STREAM_H  }

implementation


end.
