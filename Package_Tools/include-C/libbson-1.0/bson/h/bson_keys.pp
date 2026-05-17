
unit bson_keys;
interface

{
  Automatically converted by H2Pas 1.0.0 from bson_keys.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bson_keys.h
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
 * Copyright 2013 MongoDB, Inc.
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
{$include <bson/bson-prelude.h>}
{$ifndef BSON_KEYS_H}
{$define BSON_KEYS_H}
{$include <bson/bson-macros.h>}
{$include <bson/bson-types.h>}
(* Const before type ignored *)

function bson_uint32_to_string(value:Tuint32_t; strptr:PPchar; str:Pchar; size:Tsize_t):Tsize_t;cdecl;external;
{$endif}
{ BSON_KEYS_H  }

implementation


end.
