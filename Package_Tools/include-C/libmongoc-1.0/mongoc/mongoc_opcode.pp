
unit mongoc_opcode;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_opcode.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_opcode.h
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
Pmongoc_opcode_t  = ^mongoc_opcode_t;
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
{$include "mongoc-prelude.h"}
{$ifndef MONGOC_OPCODE_H}
{$define MONGOC_OPCODE_H}
{$include <bson/bson.h>}
type
  Pmongoc_opcode_t = ^Tmongoc_opcode_t;
  Tmongoc_opcode_t =  Longint;
  Const
    MONGOC_OPCODE_REPLY = 1;
    MONGOC_OPCODE_UPDATE = 2001;
    MONGOC_OPCODE_INSERT = 2002;
    MONGOC_OPCODE_QUERY = 2004;
    MONGOC_OPCODE_GET_MORE = 2005;
    MONGOC_OPCODE_DELETE = 2006;
    MONGOC_OPCODE_KILL_CURSORS = 2007;
    MONGOC_OPCODE_COMPRESSED = 2012;
    MONGOC_OPCODE_MSG = 2013;
;
{$endif}
{ MONGOC_OPCODE_H  }

implementation


end.
