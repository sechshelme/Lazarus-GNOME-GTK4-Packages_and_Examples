unit mongoc_database;

interface

uses
  fp_mongoc, mongoc_read_prefs, mongoc_flags,mongoc_collection,mongoc_write_concern,mongoc_read_concern,mongoc_change_stream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pmongoc_database_t = type Pointer;

function mongoc_database_get_name(database: Pmongoc_database_t): pchar; cdecl; external libmongoc;
function mongoc_database_remove_user(database: Pmongoc_database_t; username: pchar; error: Pbson_error_t): Tbool; cdecl; external libmongoc;
function mongoc_database_remove_all_users(database: Pmongoc_database_t; error: Pbson_error_t): Tbool; cdecl; external libmongoc;
function mongoc_database_add_user(database: Pmongoc_database_t; username: pchar; password: pchar; roles: Pbson_t; custom_data: Pbson_t;
  error: Pbson_error_t): Tbool; cdecl; external libmongoc;
procedure mongoc_database_destroy(database: Pmongoc_database_t); cdecl; external libmongoc;
function mongoc_database_aggregate(db: Pmongoc_database_t; pipeline: Pbson_t; opts: Pbson_t; read_prefs: Pmongoc_read_prefs_t): Pmongoc_cursor_t; cdecl; external libmongoc;
function mongoc_database_copy(database: Pmongoc_database_t): Pmongoc_database_t; cdecl; external libmongoc;
function mongoc_database_command(database: Pmongoc_database_t; flags: Tmongoc_query_flags_t; skip: Tuint32_t; limit: Tuint32_t; batch_size: Tuint32_t;
  command: Pbson_t; fields: Pbson_t; read_prefs: Pmongoc_read_prefs_t): Pmongoc_cursor_t; cdecl; external libmongoc;
function mongoc_database_read_command_with_opts(database: Pmongoc_database_t; command: Pbson_t; read_prefs: Pmongoc_read_prefs_t; opts: Pbson_t; reply: Pbson_t;
  error: Pbson_error_t): Tbool; cdecl; external libmongoc;
function mongoc_database_write_command_with_opts(database: Pmongoc_database_t; command: Pbson_t; opts: Pbson_t; reply: Pbson_t; error: Pbson_error_t): Tbool; cdecl; external libmongoc;
function mongoc_database_read_write_command_with_opts(database: Pmongoc_database_t; command: Pbson_t; read_prefs: Pmongoc_read_prefs_t; opts: Pbson_t; reply: Pbson_t;
  error: Pbson_error_t): Tbool; cdecl; external libmongoc;
function mongoc_database_command_with_opts(database: Pmongoc_database_t; command: Pbson_t; read_prefs: Pmongoc_read_prefs_t; opts: Pbson_t; reply: Pbson_t;
  error: Pbson_error_t): Tbool; cdecl; external libmongoc;
function mongoc_database_command_simple(database: Pmongoc_database_t; command: Pbson_t; read_prefs: Pmongoc_read_prefs_t; reply: Pbson_t; error: Pbson_error_t): Tbool; cdecl; external libmongoc;
function mongoc_database_drop(database: Pmongoc_database_t; error: Pbson_error_t): Tbool; cdecl; external libmongoc;
function mongoc_database_drop_with_opts(database: Pmongoc_database_t; opts: Pbson_t; error: Pbson_error_t): Tbool; cdecl; external libmongoc;
function mongoc_database_has_collection(database: Pmongoc_database_t; name: pchar; error: Pbson_error_t): Tbool; cdecl; external libmongoc;
function mongoc_database_create_collection(database: Pmongoc_database_t; name: pchar; options: Pbson_t; error: Pbson_error_t): Pmongoc_collection_t; cdecl; external libmongoc;
function mongoc_database_get_read_prefs(database: Pmongoc_database_t): Pmongoc_read_prefs_t; cdecl; external libmongoc;
procedure mongoc_database_set_read_prefs(database: Pmongoc_database_t; read_prefs: Pmongoc_read_prefs_t); cdecl; external libmongoc;
function mongoc_database_get_write_concern(database: Pmongoc_database_t): Pmongoc_write_concern_t; cdecl; external libmongoc;
procedure mongoc_database_set_write_concern(database: Pmongoc_database_t; write_concern: Pmongoc_write_concern_t); cdecl; external libmongoc;
function mongoc_database_get_read_concern(database: Pmongoc_database_t): Pmongoc_read_concern_t; cdecl; external libmongoc;
procedure mongoc_database_set_read_concern(database: Pmongoc_database_t; read_concern: Pmongoc_read_concern_t); cdecl; external libmongoc;
function mongoc_database_find_collections(database: Pmongoc_database_t; filter: Pbson_t; error: Pbson_error_t): Pmongoc_cursor_t; cdecl; external libmongoc; deprecated;
function mongoc_database_find_collections_with_opts(database: Pmongoc_database_t; opts: Pbson_t): Pmongoc_cursor_t; cdecl; external libmongoc;
function mongoc_database_get_collection_names(database: Pmongoc_database_t; error: Pbson_error_t): PPchar; cdecl; external libmongoc; deprecated;
function mongoc_database_get_collection_names_with_opts(database: Pmongoc_database_t; opts: Pbson_t; error: Pbson_error_t): Ppchar; cdecl; external libmongoc;
function mongoc_database_get_collection(database: Pmongoc_database_t; name: pchar): Pmongoc_collection_t; cdecl; external libmongoc;
function mongoc_database_watch(db: Pmongoc_database_t; pipeline: Pbson_t; opts: Pbson_t): Pmongoc_change_stream_t; cdecl; external libmongoc;

// === Konventiert am: 15-5-26 15:16:06 ===


implementation



end.
