
unit bson_clock;
interface

{
  Automatically converted by H2Pas 1.0.0 from bson_clock.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bson_clock.h
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
Ptimeval  = ^timeval;
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
{$include <bson/bson-prelude.h>}
{$ifndef BSON_CLOCK_H}
{$define BSON_CLOCK_H}
{$include <bson/bson-compat.h>}
{$include <bson/bson-macros.h>}
{$include <bson/bson-types.h>}

function bson_get_monotonic_time:Tint64_t;cdecl;external;
function bson_gettimeofday(tv:Ptimeval):longint;cdecl;external;
{$endif}
{ BSON_CLOCK_H  }

implementation


end.
