
unit bson_oid;
interface

{
  Automatically converted by H2Pas 1.0.0 from bson_oid.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bson_oid.h
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
Pbson_context_t  = ^bson_context_t;
Pbson_oid_t  = ^bson_oid_t;
Pchar  = ^char;
Puint8_t  = ^uint8_t;
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
{$ifndef BSON_OID_H}
{$define BSON_OID_H}
{$include <time.h>}
{$include <bson/bson-context.h>}
{$include <bson/bson-macros.h>}
{$include <bson/bson-types.h>}
{$include <bson/bson-endian.h>}
(* Const before type ignored *)
(* Const before type ignored *)

function bson_oid_compare(oid1:Pbson_oid_t; oid2:Pbson_oid_t):longint;cdecl;external;
(* Const before type ignored *)
procedure bson_oid_copy(src:Pbson_oid_t; dst:Pbson_oid_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function bson_oid_equal(oid1:Pbson_oid_t; oid2:Pbson_oid_t):Tbool;cdecl;external;
(* Const before type ignored *)
function bson_oid_is_valid(str:Pchar; length:Tsize_t):Tbool;cdecl;external;
(* Const before type ignored *)
function bson_oid_get_time_t(oid:Pbson_oid_t):Ttime_t;cdecl;external;
(* Const before type ignored *)
function bson_oid_hash(oid:Pbson_oid_t):Tuint32_t;cdecl;external;
procedure bson_oid_init(oid:Pbson_oid_t; context:Pbson_context_t);cdecl;external;
(* Const before type ignored *)
procedure bson_oid_init_from_data(oid:Pbson_oid_t; data:Puint8_t);cdecl;external;
(* Const before type ignored *)
procedure bson_oid_init_from_string(oid:Pbson_oid_t; str:Pchar);cdecl;external;
procedure bson_oid_init_sequence(oid:Pbson_oid_t; context:Pbson_context_t);cdecl;external;
{xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;;_FOR (bson_oid_init); }
(* Const before type ignored *)
procedure bson_oid_to_string(oid:Pbson_oid_t; str:array[0..24] of char);cdecl;external;
{*
 * bson_oid_compare_unsafe:
 * @oid1: A bson_oid_t.
 * @oid2: A bson_oid_t.
 *
 * Performs a qsort() style comparison between @oid1 and @oid2.
 *
 * This function is meant to be as fast as possible and therefore performs
 * no argument validation. That is the callers responsibility.
 *
 * Returns: An integer < 0 if @oid1 is less than @oid2. Zero if they are equal.
 *          An integer > 0 if @oid1 is greater than @oid2.
  }
{$endif}
{ BSON_OID_H  }

implementation


end.
