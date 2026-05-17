

  {$IFDEF read_struct}
type
  Pmongoc_client_session_t = type Pointer;

  Tmongoc_client_session_with_transaction_cb_t = function(session: Pmongoc_client_session_t; ctx: pointer; reply: PPbson_t; error: Pbson_error_t): Boolean; cdecl;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
type
  Pmongoc_transaction_state_t = ^Tmongoc_transaction_state_t;
  Tmongoc_transaction_state_t = longint;

const
  MONGOC_TRANSACTION_NONE = 0;
  MONGOC_TRANSACTION_STARTING = 1;
  MONGOC_TRANSACTION_IN_PROGRESS = 2;
  MONGOC_TRANSACTION_COMMITTED = 3;
  MONGOC_TRANSACTION_ABORTED = 4;
  {$ENDIF read_enum}

{$IFDEF read_function}
function mongoc_transaction_opts_new: Pmongoc_transaction_opt_t; cdecl; external libmongoc;
function mongoc_transaction_opts_clone(opts: Pmongoc_transaction_opt_t): Pmongoc_transaction_opt_t; cdecl; external libmongoc;
procedure mongoc_transaction_opts_destroy(opts: Pmongoc_transaction_opt_t); cdecl; external libmongoc;
procedure mongoc_transaction_opts_set_max_commit_time_ms(opts: Pmongoc_transaction_opt_t; max_commit_time_ms: Tint64_t); cdecl; external libmongoc;
function mongoc_transaction_opts_get_max_commit_time_ms(opts: Pmongoc_transaction_opt_t): Tint64_t; cdecl; external libmongoc;
procedure mongoc_transaction_opts_set_read_concern(opts: Pmongoc_transaction_opt_t; read_concern: Pmongoc_read_concern_t); cdecl; external libmongoc;
function mongoc_transaction_opts_get_read_concern(opts: Pmongoc_transaction_opt_t): Pmongoc_read_concern_t; cdecl; external libmongoc;
procedure mongoc_transaction_opts_set_write_concern(opts: Pmongoc_transaction_opt_t; write_concern: Pmongoc_write_concern_t); cdecl; external libmongoc;
function mongoc_transaction_opts_get_write_concern(opts: Pmongoc_transaction_opt_t): Pmongoc_write_concern_t; cdecl; external libmongoc;
procedure mongoc_transaction_opts_set_read_prefs(opts: Pmongoc_transaction_opt_t; read_prefs: Pmongoc_read_prefs_t); cdecl; external libmongoc;
function mongoc_transaction_opts_get_read_prefs(opts: Pmongoc_transaction_opt_t): Pmongoc_read_prefs_t; cdecl; external libmongoc;
function mongoc_session_opts_new: Pmongoc_session_opt_t; cdecl; external libmongoc;
procedure mongoc_session_opts_set_causal_consistency(opts: Pmongoc_session_opt_t; causal_consistency: Boolean); cdecl; external libmongoc;
function mongoc_session_opts_get_causal_consistency(opts: Pmongoc_session_opt_t): Boolean; cdecl; external libmongoc;
procedure mongoc_session_opts_set_snapshot(opts: Pmongoc_session_opt_t; snapshot: Boolean); cdecl; external libmongoc;
function mongoc_session_opts_get_snapshot(opts: Pmongoc_session_opt_t): Boolean; cdecl; external libmongoc;
procedure mongoc_session_opts_set_default_transaction_opts(opts: Pmongoc_session_opt_t; txn_opts: Pmongoc_transaction_opt_t); cdecl; external libmongoc;
function mongoc_session_opts_get_default_transaction_opts(opts: Pmongoc_session_opt_t): Pmongoc_transaction_opt_t; cdecl; external libmongoc;
function mongoc_session_opts_get_transaction_opts(session: Pmongoc_client_session_t): Pmongoc_transaction_opt_t; cdecl; external libmongoc;
function mongoc_session_opts_clone(opts: Pmongoc_session_opt_t): Pmongoc_session_opt_t; cdecl; external libmongoc;
procedure mongoc_session_opts_destroy(opts: Pmongoc_session_opt_t); cdecl; external libmongoc;
function mongoc_client_session_get_client(session: Pmongoc_client_session_t): Pmongoc_client_t; cdecl; external libmongoc;
function mongoc_client_session_get_opts(session: Pmongoc_client_session_t): Pmongoc_session_opt_t; cdecl; external libmongoc;
function mongoc_client_session_get_lsid(session: Pmongoc_client_session_t): Pbson_t; cdecl; external libmongoc;
function mongoc_client_session_get_cluster_time(session: Pmongoc_client_session_t): Pbson_t; cdecl; external libmongoc;
procedure mongoc_client_session_advance_cluster_time(session: Pmongoc_client_session_t; cluster_time: Pbson_t); cdecl; external libmongoc;
procedure mongoc_client_session_get_operation_time(session: Pmongoc_client_session_t; timestamp: Puint32_t; increment: Puint32_t); cdecl; external libmongoc;
function mongoc_client_session_get_server_id(session: Pmongoc_client_session_t): Tuint32_t; cdecl; external libmongoc;
procedure mongoc_client_session_advance_operation_time(session: Pmongoc_client_session_t; timestamp: Tuint32_t; increment: Tuint32_t); cdecl; external libmongoc;
function mongoc_client_session_with_transaction(session: Pmongoc_client_session_t; cb: Tmongoc_client_session_with_transaction_cb_t; opts: Pmongoc_transaction_opt_t; ctx: pointer; reply: Pbson_t;
  error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_client_session_start_transaction(session: Pmongoc_client_session_t; opts: Pmongoc_transaction_opt_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_client_session_in_transaction(session: Pmongoc_client_session_t): Boolean; cdecl; external libmongoc;
function mongoc_client_session_get_transaction_state(session: Pmongoc_client_session_t): Tmongoc_transaction_state_t; cdecl; external libmongoc;
function mongoc_client_session_commit_transaction(session: Pmongoc_client_session_t; reply: Pbson_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_client_session_abort_transaction(session: Pmongoc_client_session_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_client_session_append(client_session: Pmongoc_client_session_t; opts: Pbson_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
procedure mongoc_client_session_destroy(session: Pmongoc_client_session_t); cdecl; external libmongoc;
function mongoc_client_session_get_dirty(session: Pmongoc_client_session_t): Boolean; cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:16:20 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
