

  {$IFDEF read_struct}
type
  Pmongoc_client_pool_t = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function mongoc_client_pool_new(uri: Pmongoc_uri_t): Pmongoc_client_pool_t; cdecl; external libmongoc;
function mongoc_client_pool_new_with_error(uri: Pmongoc_uri_t; error: Pbson_error_t): Pmongoc_client_pool_t; cdecl; external libmongoc;
procedure mongoc_client_pool_destroy(pool: Pmongoc_client_pool_t); cdecl; external libmongoc;
function mongoc_client_pool_pop(pool: Pmongoc_client_pool_t): Pmongoc_client_t; cdecl; external libmongoc;
procedure mongoc_client_pool_push(pool: Pmongoc_client_pool_t; client: Pmongoc_client_t); cdecl; external libmongoc;
function mongoc_client_pool_try_pop(pool: Pmongoc_client_pool_t): Pmongoc_client_t; cdecl; external libmongoc;
procedure mongoc_client_pool_max_size(pool: Pmongoc_client_pool_t; max_pool_size: Tuint32_t); cdecl; external libmongoc;
procedure mongoc_client_pool_min_size(pool: Pmongoc_client_pool_t; min_pool_size: Tuint32_t); cdecl; external libmongoc; deprecated;

procedure mongoc_client_pool_set_ssl_opts(pool: Pmongoc_client_pool_t; opts: Pmongoc_ssl_opt_t); cdecl; external libmongoc;

function mongoc_client_pool_set_apm_callbacks(pool: Pmongoc_client_pool_t; callbacks: Pmongoc_apm_callbacks_t; context: pointer): Boolean; cdecl; external libmongoc;
function mongoc_client_pool_set_error_api(pool: Pmongoc_client_pool_t; version: Tint32_t): Boolean; cdecl; external libmongoc;
function mongoc_client_pool_set_appname(pool: Pmongoc_client_pool_t; appname: pchar): Boolean; cdecl; external libmongoc;
function mongoc_client_pool_enable_auto_encryption(pool: Pmongoc_client_pool_t; opts: Pmongoc_auto_encryption_opts_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_client_pool_set_server_api(pool: Pmongoc_client_pool_t; api: Pmongoc_server_api_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:16:23 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
