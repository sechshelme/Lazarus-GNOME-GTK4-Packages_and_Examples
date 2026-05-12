
unit mongoc_version_functions;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_version_functions.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_version_functions.h
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
{$ifndef MONGOC_VERSION_FUNCTIONS_H}
{$define MONGOC_VERSION_FUNCTIONS_H}
{$include <bson/bson.h> /* for "bool" */}
{$include "mongoc-macros.h"}

function mongoc_get_major_version:longint;cdecl;external;
function mongoc_get_minor_version:longint;cdecl;external;
function mongoc_get_micro_version:longint;cdecl;external;
(* Const before type ignored *)
function mongoc_get_version:Pchar;cdecl;external;
function mongoc_check_version(required_major:longint; required_minor:longint; required_micro:longint):Tbool;cdecl;external;
{$endif}
{ MONGOC_VERSION_FUNCTIONS_H  }

implementation


end.
