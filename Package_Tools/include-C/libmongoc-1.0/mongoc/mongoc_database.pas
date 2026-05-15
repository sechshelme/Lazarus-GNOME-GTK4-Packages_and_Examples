unit mongoc_database;

interface

uses
  fp_mongoc;

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
{$ifndef MONGOC_DATABASE_H}
{$define MONGOC_DATABASE_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
{$include "mongoc-cursor.h"}
{$include "mongoc-flags.h"}
{$include "mongoc-read-prefs.h"}
{$include "mongoc-read-concern.h"}
{$include "mongoc-write-concern.h"}
type

function mongoc_database_get_name(database:Pmongoc_database_t):Pchar;cdecl;external libmongoc;
function mongoc_database_remove_user(database:Pmongoc_database_t; username:Pchar; error:Pbson_error_t):Tbool;cdecl;external libmongoc;
function mongoc_database_remove_all_users(database:Pmongoc_database_t; error:Pbson_error_t):Tbool;cdecl;external libmongoc;
function mongoc_database_add_user(database:Pmongoc_database_t; username:Pchar; password:Pchar; roles:Pbson_t; custom_data:Pbson_t; 
           error:Pbson_error_t):Tbool;cdecl;external libmongoc;
procedure mongoc_database_destroy(database:Pmongoc_database_t);cdecl;external libmongoc;
function mongoc_database_aggregate(db:Pmongoc_database_t; pipeline:Pbson_t; opts:Pbson_t; read_prefs:Pmongoc_read_prefs_t):Pmongoc_cursor_t;cdecl;external libmongoc;
function mongoc_database_copy(database:Pmongoc_database_t):Pmongoc_database_t;cdecl;external libmongoc;
function mongoc_database_command(database:Pmongoc_database_t; flags:Tmongoc_query_flags_t; skip:Tuint32_t; limit:Tuint32_t; batch_size:Tuint32_t; 
           command:Pbson_t; fields:Pbson_t; read_prefs:Pmongoc_read_prefs_t):Pmongoc_cursor_t;cdecl;external libmongoc;
function mongoc_database_read_command_with_opts(database:Pmongoc_database_t; command:Pbson_t; read_prefs:Pmongoc_read_prefs_t; opts:Pbson_t; reply:Pbson_t; 
           error:Pbson_error_t):Tbool;cdecl;external libmongoc;
function mongoc_database_write_command_with_opts(database:Pmongoc_database_t; command:Pbson_t; opts:Pbson_t; reply:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external libmongoc;
{ IGNORED  }(* Const before type ignored *)
function mongoc_database_read_write_command_with_opts(database:Pmongoc_database_t; command:Pbson_t; read_prefs:Pmongoc_read_prefs_t; opts:Pbson_t; reply:Pbson_t; 
           error:Pbson_error_t):Tbool;cdecl;external libmongoc;
function mongoc_database_command_with_opts(database:Pmongoc_database_t; command:Pbson_t; read_prefs:Pmongoc_read_prefs_t; opts:Pbson_t; reply:Pbson_t; 
           error:Pbson_error_t):Tbool;cdecl;external libmongoc;
function mongoc_database_command_simple(database:Pmongoc_database_t; command:Pbson_t; read_prefs:Pmongoc_read_prefs_t; reply:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external libmongoc;
function mongoc_database_drop(database:Pmongoc_database_t; error:Pbson_error_t):Tbool;cdecl;external libmongoc;
function mongoc_database_drop_with_opts(database:Pmongoc_database_t; opts:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external libmongoc;
function mongoc_database_has_collection(database:Pmongoc_database_t; name:Pchar; error:Pbson_error_t):Tbool;cdecl;external libmongoc;
function mongoc_database_create_collection(database:Pmongoc_database_t; name:Pchar; options:Pbson_t; error:Pbson_error_t):Pmongoc_collection_t;cdecl;external libmongoc;
function mongoc_database_get_read_prefs(database:Pmongoc_database_t):Pmongoc_read_prefs_t;cdecl;external libmongoc;
procedure mongoc_database_set_read_prefs(database:Pmongoc_database_t; read_prefs:Pmongoc_read_prefs_t);cdecl;external libmongoc;
function mongoc_database_get_write_concern(database:Pmongoc_database_t):Pmongoc_write_concern_t;cdecl;external libmongoc;
procedure mongoc_database_set_write_concern(database:Pmongoc_database_t; write_concern:Pmongoc_write_concern_t);cdecl;external libmongoc;
function mongoc_database_get_read_concern(database:Pmongoc_database_t):Pmongoc_read_concern_t;cdecl;external libmongoc;
procedure mongoc_database_set_read_concern(database:Pmongoc_database_t; read_concern:Pmongoc_read_concern_t);cdecl;external libmongoc;
function mongoc_database_find_collections(database:Pmongoc_database_t; filter:Pbson_t; error:Pbson_error_t):Pmongoc_cursor_t;cdecl;external libmongoc;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_database_find_collections_with_opts); }
function mongoc_database_find_collections_with_opts(database:Pmongoc_database_t; opts:Pbson_t):Pmongoc_cursor_t;cdecl;external libmongoc;
function mongoc_database_get_collection_names(database:Pmongoc_database_t; error:Pbson_error_t):^Pchar;cdecl;external libmongoc;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_database_get_collection_names_with_opts); }
function mongoc_database_get_collection_names_with_opts(database:Pmongoc_database_t; opts:Pbson_t; error:Pbson_error_t):^Pchar;cdecl;external libmongoc;
function mongoc_database_get_collection(database:Pmongoc_database_t; name:Pchar):Pmongoc_collection_t;cdecl;external libmongoc;
function mongoc_database_watch(db:Pmongoc_database_t; pipeline:Pbson_t; opts:Pbson_t):Pmongoc_change_stream_t;cdecl;external libmongoc;
{$endif}
{ MONGOC_DATABASE_H  }

// === Konventiert am: 15-5-26 15:16:06 ===


implementation



end.
