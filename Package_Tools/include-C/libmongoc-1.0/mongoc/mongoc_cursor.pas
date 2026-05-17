unit mongoc_cursor;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_mongoc, mongoc_host_list, mongoc_client;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  Pmongoc_cursor_t = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function mongoc_cursor_clone(cursor: Pmongoc_cursor_t): Pmongoc_cursor_t; cdecl; external libmongoc;
procedure mongoc_cursor_destroy(cursor: Pmongoc_cursor_t); cdecl; external libmongoc;
function mongoc_cursor_more(cursor: Pmongoc_cursor_t): Boolean; cdecl; external libmongoc;
function mongoc_cursor_next(cursor: Pmongoc_cursor_t; bson: PPbson_t): Boolean; cdecl; external libmongoc;
function mongoc_cursor_error(cursor: Pmongoc_cursor_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_cursor_error_document(cursor: Pmongoc_cursor_t; error: Pbson_error_t; doc: PPbson_t): Boolean; cdecl; external libmongoc;
procedure mongoc_cursor_get_host(cursor: Pmongoc_cursor_t; host: Pmongoc_host_list_t); cdecl; external libmongoc;
function mongoc_cursor_is_alive(cursor: Pmongoc_cursor_t): Boolean; cdecl; external libmongoc; deprecated;
function mongoc_cursor_current(cursor: Pmongoc_cursor_t): Pbson_t; cdecl; external libmongoc;
procedure mongoc_cursor_set_batch_size(cursor: Pmongoc_cursor_t; batch_size: Tuint32_t); cdecl; external libmongoc;
function mongoc_cursor_get_batch_size(cursor: Pmongoc_cursor_t): Tuint32_t; cdecl; external libmongoc;
function mongoc_cursor_set_limit(cursor: Pmongoc_cursor_t; limit: Tint64_t): Boolean; cdecl; external libmongoc;
function mongoc_cursor_get_limit(cursor: Pmongoc_cursor_t): Tint64_t; cdecl; external libmongoc;
function mongoc_cursor_set_hint(cursor: Pmongoc_cursor_t; server_id: Tuint32_t): Boolean; cdecl; external libmongoc;
function mongoc_cursor_get_hint(cursor: Pmongoc_cursor_t): Tuint32_t; cdecl; external libmongoc;
function mongoc_cursor_get_id(cursor: Pmongoc_cursor_t): Tint64_t; cdecl; external libmongoc;
procedure mongoc_cursor_set_max_await_time_ms(cursor: Pmongoc_cursor_t; max_await_time_ms: Tuint32_t); cdecl; external libmongoc;
function mongoc_cursor_get_max_await_time_ms(cursor: Pmongoc_cursor_t): Tuint32_t; cdecl; external libmongoc;
function mongoc_cursor_new_from_command_reply(client: Pmongoc_client_t; reply: Pbson_t; server_id: Tuint32_t): Pmongoc_cursor_t; cdecl; external libmongoc; deprecated;
function mongoc_cursor_new_from_command_reply_with_opts(client: Pmongoc_client_t; reply: Pbson_t; opts: Pbson_t): Pmongoc_cursor_t; cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:16:09 ===


implementation



end.
