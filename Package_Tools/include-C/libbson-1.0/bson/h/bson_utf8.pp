
unit bson_utf8;
interface

{
  Automatically converted by H2Pas 1.0.0 from bson_utf8.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bson_utf8.h
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
Puint32_t  = ^uint32_t;
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
{$ifndef BSON_UTF8_H}
{$define BSON_UTF8_H}
{$include <bson/bson-macros.h>}
{$include <bson/bson-types.h>}
(* Const before type ignored *)

function bson_utf8_validate(utf8:Pchar; utf8_len:Tsize_t; allow_null:Tbool):Tbool;cdecl;external;
(* Const before type ignored *)
function bson_utf8_escape_for_json(utf8:Pchar; utf8_len:Tssize_t):Pchar;cdecl;external;
(* Const before type ignored *)
function bson_utf8_get_char(utf8:Pchar):Tbson_unichar_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function bson_utf8_next_char(utf8:Pchar):Pchar;cdecl;external;
procedure bson_utf8_from_unichar(unichar:Tbson_unichar_t; utf8:array[0..5] of char; len:Puint32_t);cdecl;external;
{$endif}
{ BSON_UTF8_H  }

implementation


end.
