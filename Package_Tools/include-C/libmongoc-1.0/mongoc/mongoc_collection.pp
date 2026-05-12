
unit mongoc_collection;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_collection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_collection.h
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
Pchar  = ^char;
Pmongoc_bulk_operation_t  = ^mongoc_bulk_operation_t;
Pmongoc_change_stream_t  = ^mongoc_change_stream_t;
Pmongoc_collection_t  = ^mongoc_collection_t;
Pmongoc_cursor_t  = ^mongoc_cursor_t;
Pmongoc_find_and_modify_opts_t  = ^mongoc_find_and_modify_opts_t;
Pmongoc_index_model_t  = ^mongoc_index_model_t;
Pmongoc_index_opt_t  = ^mongoc_index_opt_t;
Pmongoc_read_concern_t  = ^mongoc_read_concern_t;
Pmongoc_read_prefs_t  = ^mongoc_read_prefs_t;
Pmongoc_write_concern_t  = ^mongoc_write_concern_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2013-2014 MongoDB, Inc.
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
{$ifndef MONGOC_COLLECTION_H}
{$define MONGOC_COLLECTION_H}
{$include <bson/bson.h>}
{$include "mongoc-change-stream.h"}
{$include "mongoc-macros.h"}
{$include "mongoc-bulk-operation.h"}
{$include "mongoc-flags.h"}
{$include "mongoc-cursor.h"}
{$include "mongoc-index.h"}
{$include "mongoc-read-prefs.h"}
{$include "mongoc-read-concern.h"}
{$include "mongoc-write-concern.h"}
{$include "mongoc-find-and-modify.h"}
type
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function mongoc_collection_aggregate(collection:Pmongoc_collection_t; flags:Tmongoc_query_flags_t; pipeline:Pbson_t; opts:Pbson_t; read_prefs:Pmongoc_read_prefs_t):Pmongoc_cursor_t;cdecl;external;
procedure mongoc_collection_destroy(collection:Pmongoc_collection_t);cdecl;external;
function mongoc_collection_copy(collection:Pmongoc_collection_t):Pmongoc_collection_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_command(collection:Pmongoc_collection_t; flags:Tmongoc_query_flags_t; skip:Tuint32_t; limit:Tuint32_t; batch_size:Tuint32_t; 
           command:Pbson_t; fields:Pbson_t; read_prefs:Pmongoc_read_prefs_t):Pmongoc_cursor_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_read_command_with_opts(collection:Pmongoc_collection_t; command:Pbson_t; read_prefs:Pmongoc_read_prefs_t; opts:Pbson_t; reply:Pbson_t; 
           error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_write_command_with_opts(collection:Pmongoc_collection_t; command:Pbson_t; opts:Pbson_t; reply:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
{ IGNORED  }(* Const before type ignored *)
function mongoc_collection_read_write_command_with_opts(collection:Pmongoc_collection_t; command:Pbson_t; read_prefs:Pmongoc_read_prefs_t; opts:Pbson_t; reply:Pbson_t; 
           error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_command_with_opts(collection:Pmongoc_collection_t; command:Pbson_t; read_prefs:Pmongoc_read_prefs_t; opts:Pbson_t; reply:Pbson_t; 
           error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_command_simple(collection:Pmongoc_collection_t; command:Pbson_t; read_prefs:Pmongoc_read_prefs_t; reply:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_count(collection:Pmongoc_collection_t; flags:Tmongoc_query_flags_t; query:Pbson_t; skip:Tint64_t; limit:Tint64_t; 
           read_prefs:Pmongoc_read_prefs_t; error:Pbson_error_t):Tint64_t;cdecl;external;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_collection_count_documents or                             mongoc_collection_estimated_document_count); }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_count_with_opts(collection:Pmongoc_collection_t; flags:Tmongoc_query_flags_t; query:Pbson_t; skip:Tint64_t; limit:Tint64_t; 
           opts:Pbson_t; read_prefs:Pmongoc_read_prefs_t; error:Pbson_error_t):Tint64_t;cdecl;external;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_collection_count_documents or                             mongoc_collection_estimated_document_count); }
function mongoc_collection_drop(collection:Pmongoc_collection_t; error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_collection_drop_with_opts(collection:Pmongoc_collection_t; opts:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_collection_drop_index(collection:Pmongoc_collection_t; index_name:Pchar; error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_drop_index_with_opts(collection:Pmongoc_collection_t; index_name:Pchar; opts:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_create_index(collection:Pmongoc_collection_t; keys:Pbson_t; opt:Pmongoc_index_opt_t; error:Pbson_error_t):Tbool;cdecl;external;
{xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;; }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_create_index_with_opts(collection:Pmongoc_collection_t; keys:Pbson_t; opt:Pmongoc_index_opt_t; opts:Pbson_t; reply:Pbson_t; 
           error:Pbson_error_t):Tbool;cdecl;external;
{xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;; }
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_ensure_index(collection:Pmongoc_collection_t; keys:Pbson_t; opt:Pmongoc_index_opt_t; error:Pbson_error_t):Tbool;cdecl;external;
{xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;; }
function mongoc_collection_find_indexes(collection:Pmongoc_collection_t; error:Pbson_error_t):Pmongoc_cursor_t;cdecl;external;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_collection_find_indexes_with_opts); }
(* Const before type ignored *)
function mongoc_collection_find_indexes_with_opts(collection:Pmongoc_collection_t; opts:Pbson_t):Pmongoc_cursor_t;cdecl;external;
type
(* Const before type ignored *)
(* Const before type ignored *)

function mongoc_index_model_new(keys:Pbson_t; opts:Pbson_t):Pmongoc_index_model_t;cdecl;external;
procedure mongoc_index_model_destroy(model:Pmongoc_index_model_t);cdecl;external;
(* Const before declarator ignored *)
(* Const before type ignored *)
function mongoc_collection_create_indexes_with_opts(collection:Pmongoc_collection_t; models:PPmongoc_index_model_t; n_models:Tsize_t; opts:Pbson_t; reply:Pbson_t; 
           error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_find(collection:Pmongoc_collection_t; flags:Tmongoc_query_flags_t; skip:Tuint32_t; limit:Tuint32_t; batch_size:Tuint32_t; 
           query:Pbson_t; fields:Pbson_t; read_prefs:Pmongoc_read_prefs_t):Pmongoc_cursor_t;cdecl;external;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_collection_find_with_opts)      ; }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_find_with_opts(collection:Pmongoc_collection_t; filter:Pbson_t; opts:Pbson_t; read_prefs:Pmongoc_read_prefs_t):Pmongoc_cursor_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_insert(collection:Pmongoc_collection_t; flags:Tmongoc_insert_flags_t; document:Pbson_t; write_concern:Pmongoc_write_concern_t; error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_insert_one(collection:Pmongoc_collection_t; document:Pbson_t; opts:Pbson_t; reply:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_insert_many(collection:Pmongoc_collection_t; documents:PPbson_t; n_documents:Tsize_t; opts:Pbson_t; reply:Pbson_t; 
           error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_insert_bulk(collection:Pmongoc_collection_t; flags:Tmongoc_insert_flags_t; documents:PPbson_t; n_documents:Tuint32_t; write_concern:Pmongoc_write_concern_t; 
           error:Pbson_error_t):Tbool;cdecl;external;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_collection_insert_many); }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_update(collection:Pmongoc_collection_t; flags:Tmongoc_update_flags_t; selector:Pbson_t; update:Pbson_t; write_concern:Pmongoc_write_concern_t; 
           error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_update_one(collection:Pmongoc_collection_t; selector:Pbson_t; update:Pbson_t; opts:Pbson_t; reply:Pbson_t; 
           error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_update_many(collection:Pmongoc_collection_t; selector:Pbson_t; update:Pbson_t; opts:Pbson_t; reply:Pbson_t; 
           error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_replace_one(collection:Pmongoc_collection_t; selector:Pbson_t; replacement:Pbson_t; opts:Pbson_t; reply:Pbson_t; 
           error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_delete(collection:Pmongoc_collection_t; flags:Tmongoc_delete_flags_t; selector:Pbson_t; write_concern:Pmongoc_write_concern_t; error:Pbson_error_t):Tbool;cdecl;external;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_collection_delete_one or                             mongoc_collection_delete_many); }
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_save(collection:Pmongoc_collection_t; document:Pbson_t; write_concern:Pmongoc_write_concern_t; error:Pbson_error_t):Tbool;cdecl;external;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_collection_insert_one or                             mongoc_collection_replace_one); }
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_remove(collection:Pmongoc_collection_t; flags:Tmongoc_remove_flags_t; selector:Pbson_t; write_concern:Pmongoc_write_concern_t; error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_delete_one(collection:Pmongoc_collection_t; selector:Pbson_t; opts:Pbson_t; reply:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_delete_many(collection:Pmongoc_collection_t; selector:Pbson_t; opts:Pbson_t; reply:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_rename(collection:Pmongoc_collection_t; new_db:Pchar; new_name:Pchar; drop_target_before_rename:Tbool; error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_rename_with_opts(collection:Pmongoc_collection_t; new_db:Pchar; new_name:Pchar; drop_target_before_rename:Tbool; opts:Pbson_t; 
           error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_find_and_modify_with_opts(collection:Pmongoc_collection_t; query:Pbson_t; opts:Pmongoc_find_and_modify_opts_t; reply:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_find_and_modify(collection:Pmongoc_collection_t; query:Pbson_t; sort:Pbson_t; update:Pbson_t; fields:Pbson_t; 
           _remove:Tbool; upsert:Tbool; _new:Tbool; reply:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_collection_stats(collection:Pmongoc_collection_t; options:Pbson_t; reply:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external;
{xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;; }
(* Const before type ignored *)
function mongoc_collection_create_bulk_operation(collection:Pmongoc_collection_t; ordered:Tbool; write_concern:Pmongoc_write_concern_t):Pmongoc_bulk_operation_t;cdecl;external;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_collection_create_bulk_operation_with_opts); }
(* Const before type ignored *)
function mongoc_collection_create_bulk_operation_with_opts(collection:Pmongoc_collection_t; opts:Pbson_t):Pmongoc_bulk_operation_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_get_read_prefs(collection:Pmongoc_collection_t):Pmongoc_read_prefs_t;cdecl;external;
(* Const before type ignored *)
procedure mongoc_collection_set_read_prefs(collection:Pmongoc_collection_t; read_prefs:Pmongoc_read_prefs_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_get_read_concern(collection:Pmongoc_collection_t):Pmongoc_read_concern_t;cdecl;external;
(* Const before type ignored *)
procedure mongoc_collection_set_read_concern(collection:Pmongoc_collection_t; read_concern:Pmongoc_read_concern_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_get_write_concern(collection:Pmongoc_collection_t):Pmongoc_write_concern_t;cdecl;external;
(* Const before type ignored *)
procedure mongoc_collection_set_write_concern(collection:Pmongoc_collection_t; write_concern:Pmongoc_write_concern_t);cdecl;external;
(* Const before type ignored *)
function mongoc_collection_get_name(collection:Pmongoc_collection_t):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_get_last_error(collection:Pmongoc_collection_t):Pbson_t;cdecl;external;
{xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;; }
(* Const before type ignored *)
function mongoc_collection_keys_to_index_string(keys:Pbson_t):Pchar;cdecl;external;
(* Const before type ignored *)
function mongoc_collection_validate(collection:Pmongoc_collection_t; options:Pbson_t; reply:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external;
{xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;; }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_watch(coll:Pmongoc_collection_t; pipeline:Pbson_t; opts:Pbson_t):Pmongoc_change_stream_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_count_documents(coll:Pmongoc_collection_t; filter:Pbson_t; opts:Pbson_t; read_prefs:Pmongoc_read_prefs_t; reply:Pbson_t; 
           error:Pbson_error_t):Tint64_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_collection_estimated_document_count(coll:Pmongoc_collection_t; opts:Pbson_t; read_prefs:Pmongoc_read_prefs_t; reply:Pbson_t; error:Pbson_error_t):Tint64_t;cdecl;external;
{$endif}
{ MONGOC_COLLECTION_H  }

implementation


end.
