
unit bson_decimal128;
interface

{
  Automatically converted by H2Pas 1.0.0 from bson_decimal128.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bson_decimal128.h
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
Pbson_decimal128_t  = ^bson_decimal128_t;
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
{$include <bson/bson-prelude.h>}
{$ifndef BSON_DECIMAL128_H}
{$define BSON_DECIMAL128_H}
{$include <string.h>}
{$include <bson/bson-macros.h>}
{$include <bson/bson-config.h>}
{$include <bson/bson-types.h>}
{*
 * BSON_DECIMAL128_STRING:
 *
 * The length of a decimal128 string (with null terminator).
 *
 * 1  for the sign
 * 35 for digits and radix
 * 2  for exponent indicator and sign
 * 4  for exponent digits
  }

const
  BSON_DECIMAL128_STRING = 43;  
  BSON_DECIMAL128_INF = 'Infinity';  
  BSON_DECIMAL128_NAN = 'NaN';  
(* Const before type ignored *)

procedure bson_decimal128_to_string(dec:Pbson_decimal128_t; str:Pchar);cdecl;external;
{ Note: @string must be ASCII characters only!  }
(* Const before type ignored *)
function bson_decimal128_from_string(_string:Pchar; dec:Pbson_decimal128_t):Tbool;cdecl;external;
(* Const before type ignored *)
function bson_decimal128_from_string_w_len(_string:Pchar; len:longint; dec:Pbson_decimal128_t):Tbool;cdecl;external;
{$endif}
{ BSON_DECIMAL128_H  }

implementation


end.
