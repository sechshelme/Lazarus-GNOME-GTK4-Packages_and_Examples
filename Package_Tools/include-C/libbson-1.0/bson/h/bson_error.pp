
unit bson_error;
interface

{
  Automatically converted by H2Pas 1.0.0 from bson_error.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bson_error.h
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
{$ifndef BSON_ERROR_H}
{$define BSON_ERROR_H}
{$include <bson/bson-compat.h>}
{$include <bson/bson-macros.h>}
{$include <bson/bson-types.h>}

const
  BSON_ERROR_JSON = 1;  
  BSON_ERROR_READER = 2;  
  BSON_ERROR_INVALID = 3;  
(* Const before type ignored *)

procedure bson_set_error(error:Pbson_error_t; domain:Tuint32_t; code:Tuint32_t; format:Pchar; args:array of const);cdecl;external;
procedure bson_set_error(error:Pbson_error_t; domain:Tuint32_t; code:Tuint32_t; format:Pchar);cdecl;external;
function bson_strerror_r(err_code:longint; buf:Pchar; buflen:Tsize_t):Pchar;cdecl;external;
{$endif}
{ BSON_ERROR_H  }

implementation


end.
