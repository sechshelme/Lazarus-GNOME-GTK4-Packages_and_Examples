
unit mongoc_write_concern;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_write_concern.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_write_concern.h
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
Pbson_t  = ^bson_t;
Pchar  = ^char;
Pmongoc_write_concern_t  = ^mongoc_write_concern_t;
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
{$ifndef MONGOC_WRITE_CONCERN_H}
{$define MONGOC_WRITE_CONCERN_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}

const
  MONGOC_WRITE_CONCERN_W_UNACKNOWLEDGED = 0;  
{ deprecated  }
  MONGOC_WRITE_CONCERN_W_ERRORS_IGNORED = -(1);  
  MONGOC_WRITE_CONCERN_W_DEFAULT = -(2);  
  MONGOC_WRITE_CONCERN_W_MAJORITY = -(3);  
  MONGOC_WRITE_CONCERN_W_TAG = -(4);  
type

function mongoc_write_concern_new:Pmongoc_write_concern_t;cdecl;external;
(* Const before type ignored *)
function mongoc_write_concern_copy(write_concern:Pmongoc_write_concern_t):Pmongoc_write_concern_t;cdecl;external;
procedure mongoc_write_concern_destroy(write_concern:Pmongoc_write_concern_t);cdecl;external;
(* Const before type ignored *)
function mongoc_write_concern_get_fsync(write_concern:Pmongoc_write_concern_t):Tbool;cdecl;external;
{xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;; }
procedure mongoc_write_concern_set_fsync(write_concern:Pmongoc_write_concern_t; fsync_:Tbool);cdecl;external;
{xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;; }
(* Const before type ignored *)
function mongoc_write_concern_get_journal(write_concern:Pmongoc_write_concern_t):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_write_concern_journal_is_set(write_concern:Pmongoc_write_concern_t):Tbool;cdecl;external;
procedure mongoc_write_concern_set_journal(write_concern:Pmongoc_write_concern_t; journal:Tbool);cdecl;external;
(* Const before type ignored *)
function mongoc_write_concern_get_w(write_concern:Pmongoc_write_concern_t):Tint32_t;cdecl;external;
procedure mongoc_write_concern_set_w(write_concern:Pmongoc_write_concern_t; w:Tint32_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_write_concern_get_wtag(write_concern:Pmongoc_write_concern_t):Pchar;cdecl;external;
(* Const before type ignored *)
procedure mongoc_write_concern_set_wtag(write_concern:Pmongoc_write_concern_t; tag:Pchar);cdecl;external;
(* Const before type ignored *)
function mongoc_write_concern_get_wtimeout(write_concern:Pmongoc_write_concern_t):Tint32_t;cdecl;external;
(* Const before type ignored *)
function mongoc_write_concern_get_wtimeout_int64(write_concern:Pmongoc_write_concern_t):Tint64_t;cdecl;external;
procedure mongoc_write_concern_set_wtimeout(write_concern:Pmongoc_write_concern_t; wtimeout_msec:Tint32_t);cdecl;external;
procedure mongoc_write_concern_set_wtimeout_int64(write_concern:Pmongoc_write_concern_t; wtimeout_msec:Tint64_t);cdecl;external;
(* Const before type ignored *)
function mongoc_write_concern_get_wmajority(write_concern:Pmongoc_write_concern_t):Tbool;cdecl;external;
procedure mongoc_write_concern_set_wmajority(write_concern:Pmongoc_write_concern_t; wtimeout_msec:Tint32_t);cdecl;external;
(* Const before type ignored *)
function mongoc_write_concern_is_acknowledged(write_concern:Pmongoc_write_concern_t):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_write_concern_is_valid(write_concern:Pmongoc_write_concern_t):Tbool;cdecl;external;
function mongoc_write_concern_append(write_concern:Pmongoc_write_concern_t; doc:Pbson_t):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_write_concern_is_default(write_concern:Pmongoc_write_concern_t):Tbool;cdecl;external;
{$endif}
{ MONGOC_WRITE_CONCERN_H  }

implementation


end.
