unit mongoc_client;

interface

uses
  fp_mongoc, mongoc_uri, mongoc_host_list, mongoc_stream, mongoc_flags, mongoc_read_prefs,mongoc_database,mongoc_gridfs, mongoc_collection,
  mongoc_write_concern, mongoc_read_concern,mongoc_ssl, mongoc_apm, mongoc_server_description, mongoc_change_stream,mongoc_server_api,mongoc_client_side_encryption;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  MONGOC_NAMESPACE_MAX = 128;
  MONGOC_DEFAULT_CONNECTTIMEOUTMS = 10 * 1000;
  MONGOC_DEFAULT_SOCKETTIMEOUTMS = (1000 * 60) * 5;

type
  Pmongoc_client_t = type Pointer;
  Pmongoc_client_session_t = type Pointer;
  Pmongoc_session_opt_t = type Pointer;
  Pmongoc_transaction_opt_t = type Pointer;
  Tmongoc_stream_initiator_t = function(uri: Pmongoc_uri_t; host: Pmongoc_host_list_t; user_data: pointer; error: Pbson_error_t): Pmongoc_stream_t; cdecl;

function mongoc_client_new(uri_string: pchar): Pmongoc_client_t; cdecl; external libmongoc;
function mongoc_client_new_from_uri(uri: Pmongoc_uri_t): Pmongoc_client_t; cdecl; external libmongoc;
function mongoc_client_new_from_uri_with_error(uri: Pmongoc_uri_t; error: Pbson_error_t): Pmongoc_client_t; cdecl; external libmongoc;
function mongoc_client_get_uri(client: Pmongoc_client_t): Pmongoc_uri_t; cdecl; external libmongoc;
procedure mongoc_client_set_stream_initiator(client: Pmongoc_client_t; initiator: Tmongoc_stream_initiator_t; user_data: pointer); cdecl; external libmongoc;
function mongoc_client_command(client: Pmongoc_client_t; db_name: pchar; flags: Tmongoc_query_flags_t; skip: Tuint32_t; limit: Tuint32_t;
  batch_size: Tuint32_t; query: Pbson_t; fields: Pbson_t; read_prefs: Pmongoc_read_prefs_t): Pmongoc_cursor_t; cdecl; external libmongoc;
procedure mongoc_client_kill_cursor(client: Pmongoc_client_t; cursor_id: Tint64_t); cdecl; external libmongoc; deprecated;
function mongoc_client_command_simple(client: Pmongoc_client_t; db_name: pchar; command: Pbson_t; read_prefs: Pmongoc_read_prefs_t; reply: Pbson_t;
  error: Pbson_error_t): Tbool; cdecl; external libmongoc;
function mongoc_client_read_command_with_opts(client: Pmongoc_client_t; db_name: pchar; command: Pbson_t; read_prefs: Pmongoc_read_prefs_t; opts: Pbson_t;
  reply: Pbson_t; error: Pbson_error_t): Tbool; cdecl; external libmongoc;
function mongoc_client_write_command_with_opts(client: Pmongoc_client_t; db_name: pchar; command: Pbson_t; opts: Pbson_t; reply: Pbson_t;
  error: Pbson_error_t): Tbool; cdecl; external libmongoc;
function mongoc_client_read_write_command_with_opts(client: Pmongoc_client_t; db_name: pchar; command: Pbson_t; read_prefs: Pmongoc_read_prefs_t; opts: Pbson_t;
  reply: Pbson_t; error: Pbson_error_t): Tbool; cdecl; external libmongoc;
function mongoc_client_command_with_opts(client: Pmongoc_client_t; db_name: pchar; command: Pbson_t; read_prefs: Pmongoc_read_prefs_t; opts: Pbson_t;
  reply: Pbson_t; error: Pbson_error_t): Tbool; cdecl; external libmongoc;
function mongoc_client_command_simple_with_server_id(client: Pmongoc_client_t; db_name: pchar; command: Pbson_t; read_prefs: Pmongoc_read_prefs_t; server_id: Tuint32_t;
  reply: Pbson_t; error: Pbson_error_t): Tbool; cdecl; external libmongoc;
procedure mongoc_client_destroy(client: Pmongoc_client_t); cdecl; external libmongoc;
function mongoc_client_start_session(client: Pmongoc_client_t; opts: Pmongoc_session_opt_t; error: Pbson_error_t): Pmongoc_client_session_t; cdecl; external libmongoc;
function mongoc_client_get_database(client: Pmongoc_client_t; name: pchar): Pmongoc_database_t; cdecl; external libmongoc;
function mongoc_client_get_default_database(client: Pmongoc_client_t): Pmongoc_database_t; cdecl; external libmongoc;
function mongoc_client_get_gridfs(client: Pmongoc_client_t; db: pchar; prefix: pchar; error: Pbson_error_t): Pmongoc_gridfs_t; cdecl; external libmongoc;
function mongoc_client_get_collection(client: Pmongoc_client_t; db: pchar; collection: pchar): Pmongoc_collection_t; cdecl; external libmongoc;
function mongoc_client_get_database_names(client: Pmongoc_client_t; error: Pbson_error_t): PPchar; cdecl; external libmongoc; deprecated;
function mongoc_client_get_database_names_with_opts(client: Pmongoc_client_t; opts: Pbson_t; error: Pbson_error_t): PPchar; cdecl; external libmongoc;
function mongoc_client_find_databases(client: Pmongoc_client_t; error: Pbson_error_t): Pmongoc_cursor_t; cdecl; external libmongoc; deprecated;
function mongoc_client_find_databases_with_opts(client: Pmongoc_client_t; opts: Pbson_t): Pmongoc_cursor_t; cdecl; external libmongoc;
function mongoc_client_get_server_status(client: Pmongoc_client_t; read_prefs: Pmongoc_read_prefs_t; reply: Pbson_t; error: Pbson_error_t): Tbool; cdecl; external libmongoc; deprecated;
function mongoc_client_get_max_message_size(client: Pmongoc_client_t): Tint32_t; cdecl; external libmongoc; deprecated;
function mongoc_client_get_max_bson_size(client: Pmongoc_client_t): Tint32_t; cdecl; external libmongoc; deprecated;
function mongoc_client_get_write_concern(client: Pmongoc_client_t): Pmongoc_write_concern_t; cdecl; external libmongoc;
procedure mongoc_client_set_write_concern(client: Pmongoc_client_t; write_concern: Pmongoc_write_concern_t); cdecl; external libmongoc;
function mongoc_client_get_read_concern(client: Pmongoc_client_t): Pmongoc_read_concern_t; cdecl; external libmongoc;
procedure mongoc_client_set_read_concern(client: Pmongoc_client_t; read_concern: Pmongoc_read_concern_t); cdecl; external libmongoc;
function mongoc_client_get_read_prefs(client: Pmongoc_client_t): Pmongoc_read_prefs_t; cdecl; external libmongoc;
procedure mongoc_client_set_read_prefs(client: Pmongoc_client_t; read_prefs: Pmongoc_read_prefs_t); cdecl; external libmongoc;

procedure mongoc_client_set_ssl_opts(client: Pmongoc_client_t; opts: Pmongoc_ssl_opt_t); cdecl; external libmongoc;

function mongoc_client_set_apm_callbacks(client: Pmongoc_client_t; callbacks: Pmongoc_apm_callbacks_t; context: pointer): Tbool; cdecl; external libmongoc;
function mongoc_client_get_server_description(client: Pmongoc_client_t; server_id: Tuint32_t): Pmongoc_server_description_t; cdecl; external libmongoc;
function mongoc_client_get_server_descriptions(client: Pmongoc_client_t; n: Psize_t): PPmongoc_server_description_t; cdecl; external libmongoc;
procedure mongoc_server_descriptions_destroy_all(sds: PPmongoc_server_description_t; n: Tsize_t); cdecl; external libmongoc;
function mongoc_client_select_server(client: Pmongoc_client_t; for_writes: Tbool; prefs: Pmongoc_read_prefs_t; error: Pbson_error_t): Pmongoc_server_description_t; cdecl; external libmongoc;
function mongoc_client_set_error_api(client: Pmongoc_client_t; version: Tint32_t): Tbool; cdecl; external libmongoc;
function mongoc_client_set_appname(client: Pmongoc_client_t; appname: pchar): Tbool; cdecl; external libmongoc;
function mongoc_client_watch(client: Pmongoc_client_t; pipeline: Pbson_t; opts: Pbson_t): Pmongoc_change_stream_t; cdecl; external libmongoc;
procedure mongoc_client_reset(client: Pmongoc_client_t); cdecl; external libmongoc;
function mongoc_client_enable_auto_encryption(client: Pmongoc_client_t; opts: Pmongoc_auto_encryption_opts_t; error: Pbson_error_t): Tbool; cdecl; external libmongoc;
function mongoc_client_get_crypt_shared_version(client: Pmongoc_client_t): pchar; cdecl; external libmongoc;
function mongoc_client_set_server_api(client: Pmongoc_client_t; api: Pmongoc_server_api_t; error: Pbson_error_t): Tbool; cdecl; external libmongoc;
function mongoc_client_get_handshake_description(client: Pmongoc_client_t; server_id: Tuint32_t; opts: Pbson_t; error: Pbson_error_t): Pmongoc_server_description_t; cdecl; external libmongoc;

// === Konventiert am: 15-5-26 15:16:26 ===


implementation



end.
