unit mongoc_collection;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_mongoc, mongoc_flags, mongoc_read_prefs, mongoc_index, mongoc_write_concern, mongoc_find_and_modify, mongoc_bulk_operation, mongoc_read_concern, mongoc_change_stream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  Pmongoc_collection_t = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function mongoc_collection_aggregate(collection: Pmongoc_collection_t; flags: Tmongoc_query_flags_t; pipeline: Pbson_t; opts: Pbson_t; read_prefs: Pmongoc_read_prefs_t): Pmongoc_cursor_t; cdecl; external libmongoc;
procedure mongoc_collection_destroy(collection: Pmongoc_collection_t); cdecl; external libmongoc;
function mongoc_collection_copy(collection: Pmongoc_collection_t): Pmongoc_collection_t; cdecl; external libmongoc;
function mongoc_collection_command(collection: Pmongoc_collection_t; flags: Tmongoc_query_flags_t; skip: Tuint32_t; limit: Tuint32_t; batch_size: Tuint32_t;
  command: Pbson_t; fields: Pbson_t; read_prefs: Pmongoc_read_prefs_t): Pmongoc_cursor_t; cdecl; external libmongoc;
function mongoc_collection_read_command_with_opts(collection: Pmongoc_collection_t; command: Pbson_t; read_prefs: Pmongoc_read_prefs_t; opts: Pbson_t; reply: Pbson_t;
  error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_collection_write_command_with_opts(collection: Pmongoc_collection_t; command: Pbson_t; opts: Pbson_t; reply: Pbson_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_collection_read_write_command_with_opts(collection: Pmongoc_collection_t; command: Pbson_t; read_prefs: Pmongoc_read_prefs_t; opts: Pbson_t; reply: Pbson_t;
  error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_collection_command_with_opts(collection: Pmongoc_collection_t; command: Pbson_t; read_prefs: Pmongoc_read_prefs_t; opts: Pbson_t; reply: Pbson_t;
  error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_collection_command_simple(collection: Pmongoc_collection_t; command: Pbson_t; read_prefs: Pmongoc_read_prefs_t; reply: Pbson_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_collection_count(collection: Pmongoc_collection_t; flags: Tmongoc_query_flags_t; query: Pbson_t; skip: Tint64_t; limit: Tint64_t;
  read_prefs: Pmongoc_read_prefs_t; error: Pbson_error_t): Tint64_t; cdecl; external libmongoc; deprecated;
function mongoc_collection_count_with_opts(collection: Pmongoc_collection_t; flags: Tmongoc_query_flags_t; query: Pbson_t; skip: Tint64_t; limit: Tint64_t;
  opts: Pbson_t; read_prefs: Pmongoc_read_prefs_t; error: Pbson_error_t): Tint64_t; cdecl; external libmongoc; deprecated;
function mongoc_collection_drop(collection: Pmongoc_collection_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_collection_drop_with_opts(collection: Pmongoc_collection_t; opts: Pbson_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_collection_drop_index(collection: Pmongoc_collection_t; index_name: pchar; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_collection_drop_index_with_opts(collection: Pmongoc_collection_t; index_name: pchar; opts: Pbson_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_collection_create_index(collection: Pmongoc_collection_t; keys: Pbson_t; opt: Pmongoc_index_opt_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc; deprecated;
function mongoc_collection_create_index_with_opts(collection: Pmongoc_collection_t; keys: Pbson_t; opt: Pmongoc_index_opt_t; opts: Pbson_t; reply: Pbson_t;
  error: Pbson_error_t): Boolean; cdecl; external libmongoc; deprecated;
function mongoc_collection_ensure_index(collection: Pmongoc_collection_t; keys: Pbson_t; opt: Pmongoc_index_opt_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc; deprecated;
function mongoc_collection_find_indexes(collection: Pmongoc_collection_t; error: Pbson_error_t): Pmongoc_cursor_t; cdecl; external libmongoc; deprecated;
function mongoc_collection_find_indexes_with_opts(collection: Pmongoc_collection_t; opts: Pbson_t): Pmongoc_cursor_t; cdecl; external libmongoc;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  Pmongoc_index_model_t = type Pointer;
  PPmongoc_index_model_t = ^Pmongoc_index_model_t;
  {$ENDIF read_struct}

{$IFDEF read_function}
function mongoc_index_model_new(keys: Pbson_t; opts: Pbson_t): Pmongoc_index_model_t; cdecl; external libmongoc;
procedure mongoc_index_model_destroy(model: Pmongoc_index_model_t); cdecl; external libmongoc;
function mongoc_collection_create_indexes_with_opts(collection: Pmongoc_collection_t; models: PPmongoc_index_model_t; n_models: Tsize_t; opts: Pbson_t; reply: Pbson_t;
  error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_collection_find(collection: Pmongoc_collection_t; flags: Tmongoc_query_flags_t; skip: Tuint32_t; limit: Tuint32_t; batch_size: Tuint32_t;
  query: Pbson_t; fields: Pbson_t; read_prefs: Pmongoc_read_prefs_t): Pmongoc_cursor_t; cdecl; external libmongoc; deprecated;
function mongoc_collection_find_with_opts(collection: Pmongoc_collection_t; filter: Pbson_t; opts: Pbson_t; read_prefs: Pmongoc_read_prefs_t): Pmongoc_cursor_t; cdecl; external libmongoc;
function mongoc_collection_insert(collection: Pmongoc_collection_t; flags: Tmongoc_insert_flags_t; document: Pbson_t; write_concern: Pmongoc_write_concern_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_collection_insert_one(collection: Pmongoc_collection_t; document: Pbson_t; opts: Pbson_t; reply: Pbson_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_collection_insert_many(collection: Pmongoc_collection_t; documents: PPbson_t; n_documents: Tsize_t; opts: Pbson_t; reply: Pbson_t;
  error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_collection_insert_bulk(collection: Pmongoc_collection_t; flags: Tmongoc_insert_flags_t; documents: PPbson_t; n_documents: Tuint32_t; write_concern: Pmongoc_write_concern_t;
  error: Pbson_error_t): Boolean; cdecl; external libmongoc; deprecated;
function mongoc_collection_update(collection: Pmongoc_collection_t; flags: Tmongoc_update_flags_t; selector: Pbson_t; update: Pbson_t; write_concern: Pmongoc_write_concern_t;
  error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_collection_update_one(collection: Pmongoc_collection_t; selector: Pbson_t; update: Pbson_t; opts: Pbson_t; reply: Pbson_t;
  error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_collection_update_many(collection: Pmongoc_collection_t; selector: Pbson_t; update: Pbson_t; opts: Pbson_t; reply: Pbson_t;
  error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_collection_replace_one(collection: Pmongoc_collection_t; selector: Pbson_t; replacement: Pbson_t; opts: Pbson_t; reply: Pbson_t;
  error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_collection_delete(collection: Pmongoc_collection_t; flags: Tmongoc_delete_flags_t; selector: Pbson_t; write_concern: Pmongoc_write_concern_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc; deprecated;
function mongoc_collection_save(collection: Pmongoc_collection_t; document: Pbson_t; write_concern: Pmongoc_write_concern_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc; deprecated;
function mongoc_collection_remove(collection: Pmongoc_collection_t; flags: Tmongoc_remove_flags_t; selector: Pbson_t; write_concern: Pmongoc_write_concern_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_collection_delete_one(collection: Pmongoc_collection_t; selector: Pbson_t; opts: Pbson_t; reply: Pbson_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_collection_delete_many(collection: Pmongoc_collection_t; selector: Pbson_t; opts: Pbson_t; reply: Pbson_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_collection_rename(collection: Pmongoc_collection_t; new_db: pchar; new_name: pchar; drop_target_before_rename: Boolean; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_collection_rename_with_opts(collection: Pmongoc_collection_t; new_db: pchar; new_name: pchar; drop_target_before_rename: Boolean; opts: Pbson_t;
  error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_collection_find_and_modify_with_opts(collection: Pmongoc_collection_t; query: Pbson_t; opts: Pmongoc_find_and_modify_opts_t; reply: Pbson_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_collection_find_and_modify(collection: Pmongoc_collection_t; query: Pbson_t; sort: Pbson_t; update: Pbson_t; fields: Pbson_t;
  _remove: Boolean; upsert: Boolean; _new: Boolean; reply: Pbson_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_collection_stats(collection: Pmongoc_collection_t; options: Pbson_t; reply: Pbson_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc; deprecated;
function mongoc_collection_create_bulk_operation(collection: Pmongoc_collection_t; ordered: Boolean; write_concern: Pmongoc_write_concern_t): Pmongoc_bulk_operation_t; cdecl; external libmongoc; deprecated;
function mongoc_collection_create_bulk_operation_with_opts(collection: Pmongoc_collection_t; opts: Pbson_t): Pmongoc_bulk_operation_t; cdecl; external libmongoc;
function mongoc_collection_get_read_prefs(collection: Pmongoc_collection_t): Pmongoc_read_prefs_t; cdecl; external libmongoc;
procedure mongoc_collection_set_read_prefs(collection: Pmongoc_collection_t; read_prefs: Pmongoc_read_prefs_t); cdecl; external libmongoc;
function mongoc_collection_get_read_concern(collection: Pmongoc_collection_t): Pmongoc_read_concern_t; cdecl; external libmongoc;
procedure mongoc_collection_set_read_concern(collection: Pmongoc_collection_t; read_concern: Pmongoc_read_concern_t); cdecl; external libmongoc;
function mongoc_collection_get_write_concern(collection: Pmongoc_collection_t): Pmongoc_write_concern_t; cdecl; external libmongoc;
procedure mongoc_collection_set_write_concern(collection: Pmongoc_collection_t; write_concern: Pmongoc_write_concern_t); cdecl; external libmongoc;
function mongoc_collection_get_name(collection: Pmongoc_collection_t): pchar; cdecl; external libmongoc;
function mongoc_collection_get_last_error(collection: Pmongoc_collection_t): Pbson_t; cdecl; external libmongoc; deprecated;
function mongoc_collection_keys_to_index_string(keys: Pbson_t): pchar; cdecl; external libmongoc;
function mongoc_collection_validate(collection: Pmongoc_collection_t; options: Pbson_t; reply: Pbson_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc; deprecated;
function mongoc_collection_watch(coll: Pmongoc_collection_t; pipeline: Pbson_t; opts: Pbson_t): Pmongoc_change_stream_t; cdecl; external libmongoc;
function mongoc_collection_count_documents(coll: Pmongoc_collection_t; filter: Pbson_t; opts: Pbson_t; read_prefs: Pmongoc_read_prefs_t; reply: Pbson_t;
  error: Pbson_error_t): Tint64_t; cdecl; external libmongoc;
function mongoc_collection_estimated_document_count(coll: Pmongoc_collection_t; opts: Pbson_t; read_prefs: Pmongoc_read_prefs_t; reply: Pbson_t; error: Pbson_error_t): Tint64_t; cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:16:14 ===


implementation



end.
