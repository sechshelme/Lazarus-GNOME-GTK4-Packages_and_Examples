
unit mongoc_bulk_operation;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_bulk_operation.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_bulk_operation.h
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
Pbson_value_t  = ^bson_value_t;
Pchar  = ^char;
Pmongoc_bulk_operation_t  = ^mongoc_bulk_operation_t;
Pmongoc_client_session_t  = ^mongoc_client_session_t;
Pmongoc_write_concern_t  = ^mongoc_write_concern_t;
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
{$include "mongoc-prelude.h"}
{$ifndef MONGOC_BULK_OPERATION_H}
{$define MONGOC_BULK_OPERATION_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
{$include "mongoc-write-concern.h"}
{ forward decl  }
type
  Pmongoc_client_session_t = ^Tmongoc_client_session_t;
  Tmongoc_client_session_t = record
      {undefined structure}
    end;


procedure mongoc_bulk_operation_destroy(bulk:Pmongoc_bulk_operation_t);cdecl;external;
function mongoc_bulk_operation_execute(bulk:Pmongoc_bulk_operation_t; reply:Pbson_t; error:Pbson_error_t):Tuint32_t;cdecl;external;
(* Const before type ignored *)
procedure mongoc_bulk_operation_delete(bulk:Pmongoc_bulk_operation_t; selector:Pbson_t);cdecl;external;
{xxxxxxxxxxBSON_GNUC_DEPRECATED_FOR (mongoc_bulk_operation_remove); }
(* Const before type ignored *)
procedure mongoc_bulk_operation_delete_one(bulk:Pmongoc_bulk_operation_t; selector:Pbson_t);cdecl;external;
{xxxxxxxxxxBSON_GNUC_DEPRECATED_FOR (mongoc_bulk_operation_remove_one); }
(* Const before type ignored *)
procedure mongoc_bulk_operation_insert(bulk:Pmongoc_bulk_operation_t; document:Pbson_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_bulk_operation_insert_with_opts(bulk:Pmongoc_bulk_operation_t; document:Pbson_t; opts:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external;
{ OUT  }
(* Const before type ignored *)
procedure mongoc_bulk_operation_remove(bulk:Pmongoc_bulk_operation_t; selector:Pbson_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_bulk_operation_remove_many_with_opts(bulk:Pmongoc_bulk_operation_t; selector:Pbson_t; opts:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external;
{ OUT  }
(* Const before type ignored *)
procedure mongoc_bulk_operation_remove_one(bulk:Pmongoc_bulk_operation_t; selector:Pbson_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_bulk_operation_remove_one_with_opts(bulk:Pmongoc_bulk_operation_t; selector:Pbson_t; opts:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external;
{ OUT  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mongoc_bulk_operation_replace_one(bulk:Pmongoc_bulk_operation_t; selector:Pbson_t; document:Pbson_t; upsert:Tbool);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_bulk_operation_replace_one_with_opts(bulk:Pmongoc_bulk_operation_t; selector:Pbson_t; document:Pbson_t; opts:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external;
{ OUT  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mongoc_bulk_operation_update(bulk:Pmongoc_bulk_operation_t; selector:Pbson_t; document:Pbson_t; upsert:Tbool);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_bulk_operation_update_many_with_opts(bulk:Pmongoc_bulk_operation_t; selector:Pbson_t; document:Pbson_t; opts:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external;
{ OUT  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mongoc_bulk_operation_update_one(bulk:Pmongoc_bulk_operation_t; selector:Pbson_t; document:Pbson_t; upsert:Tbool);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_bulk_operation_update_one_with_opts(bulk:Pmongoc_bulk_operation_t; selector:Pbson_t; document:Pbson_t; opts:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external;
{ OUT  }
procedure mongoc_bulk_operation_set_bypass_document_validation(bulk:Pmongoc_bulk_operation_t; bypass:Tbool);cdecl;external;
(* Const before type ignored *)
procedure mongoc_bulk_operation_set_comment(bulk:Pmongoc_bulk_operation_t; comment:Pbson_value_t);cdecl;external;
(* Const before type ignored *)
procedure mongoc_bulk_operation_set_let(bulk:Pmongoc_bulk_operation_t; let:Pbson_t);cdecl;external;
{
 * The following functions are really only useful by language bindings and
 * those wanting to replay a bulk operation to a number of clients or
 * collections.
  }
function mongoc_bulk_operation_new(ordered:Tbool):Pmongoc_bulk_operation_t;cdecl;external;
(* Const before type ignored *)
procedure mongoc_bulk_operation_set_write_concern(bulk:Pmongoc_bulk_operation_t; write_concern:Pmongoc_write_concern_t);cdecl;external;
(* Const before type ignored *)
procedure mongoc_bulk_operation_set_database(bulk:Pmongoc_bulk_operation_t; database:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mongoc_bulk_operation_set_collection(bulk:Pmongoc_bulk_operation_t; collection:Pchar);cdecl;external;
procedure mongoc_bulk_operation_set_client(bulk:Pmongoc_bulk_operation_t; client:pointer);cdecl;external;
procedure mongoc_bulk_operation_set_client_session(bulk:Pmongoc_bulk_operation_t; client_session:Pmongoc_client_session_t);cdecl;external;
{ These names include the term "hint" for backward compatibility, should be
 * mongoc_bulk_operation_get_server_id, mongoc_bulk_operation_set_server_id.  }
procedure mongoc_bulk_operation_set_hint(bulk:Pmongoc_bulk_operation_t; server_id:Tuint32_t);cdecl;external;
(* Const before type ignored *)
function mongoc_bulk_operation_get_hint(bulk:Pmongoc_bulk_operation_t):Tuint32_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_bulk_operation_get_write_concern(bulk:Pmongoc_bulk_operation_t):Pmongoc_write_concern_t;cdecl;external;
{$endif}
{ MONGOC_BULK_OPERATION_H  }

implementation


end.
