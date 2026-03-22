unit sokol_fetch;

interface

uses
  fp_sokol;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tsfetch_logger_t = record
    func: procedure(tag: pchar; log_level: Tuint32_t; log_item_id: Tuint32_t; message_or_null: pchar; line_nr: Tuint32_t;
      filename_or_null: pchar; user_data: pointer); cdecl;
    user_data: pointer;
  end;
  Psfetch_logger_t = ^Tsfetch_logger_t;

  Tsfetch_range_t = record
    ptr: pointer;
    size: Tsize_t;
  end;
  Psfetch_range_t = ^Tsfetch_range_t;

  Tsfetch_allocator_t = record
    alloc_fn: function(size: Tsize_t; user_data: pointer): pointer; cdecl;
    free_fn: procedure(ptr: pointer; user_data: pointer); cdecl;
    user_data: pointer;
  end;
  Psfetch_allocator_t = ^Tsfetch_allocator_t;

  Tsfetch_desc_t = record
    max_requests: Tuint32_t;
    num_channels: Tuint32_t;
    num_lanes: Tuint32_t;
    allocator: Tsfetch_allocator_t;
    logger: Tsfetch_logger_t;
  end;
  Psfetch_desc_t = ^Tsfetch_desc_t;

  Tsfetch_handle_t = record
    id: Tuint32_t;
  end;
  Psfetch_handle_t = ^Tsfetch_handle_t;

type
  Psfetch_error_t = ^Tsfetch_error_t;
  Tsfetch_error_t = longint;

const
  SFETCH_ERROR_NO_ERROR = 0;
  SFETCH_ERROR_FILE_NOT_FOUND = 1;
  SFETCH_ERROR_NO_BUFFER = 2;
  SFETCH_ERROR_BUFFER_TOO_SMALL = 3;
  SFETCH_ERROR_UNEXPECTED_EOF = 4;
  SFETCH_ERROR_INVALID_HTTP_STATUS = 5;
  SFETCH_ERROR_CANCELLED = 6;
  SFETCH_ERROR_JS_OTHER = 7;

type
  Tsfetch_response_t = record
    handle: Tsfetch_handle_t;
    dispatched: Boolean;
    fetched: Boolean;
    paused: Boolean;
    finished: Boolean;
    failed: Boolean;
    cancelled: Boolean;
    error_code: Tsfetch_error_t;
    channel: Tuint32_t;
    lane: Tuint32_t;
    path: pchar;
    user_data: pointer;
    data_offset: Tuint32_t;
    data: Tsfetch_range_t;
    buffer: Tsfetch_range_t;
  end;
  Psfetch_response_t = ^Tsfetch_response_t;

  Tsfetch_request_t = record
    channel: Tuint32_t;
    path: pchar;
    callback: procedure(para1: Psfetch_response_t); cdecl;
    chunk_size: Tuint32_t;
    buffer: Tsfetch_range_t;
    user_data: Tsfetch_range_t;
  end;
  Psfetch_request_t = ^Tsfetch_request_t;

procedure sfetch_setup(desc: Psfetch_desc_t); cdecl; external libsokol;
procedure sfetch_shutdown; cdecl; external libsokol;
function sfetch_valid: Boolean; cdecl; external libsokol;
function sfetch_desc: Tsfetch_desc_t; cdecl; external libsokol;
function sfetch_max_userdata_bytes: longint; cdecl; external libsokol;
function sfetch_max_path: longint; cdecl; external libsokol;
function sfetch_send(request: Psfetch_request_t): Tsfetch_handle_t; cdecl; external libsokol;
function sfetch_handle_valid(h: Tsfetch_handle_t): Boolean; cdecl; external libsokol;
procedure sfetch_dowork; cdecl; external libsokol;
procedure sfetch_bind_buffer(h: Tsfetch_handle_t; buffer: Tsfetch_range_t); cdecl; external libsokol;
function sfetch_unbind_buffer(h: Tsfetch_handle_t): pointer; cdecl; external libsokol;
procedure sfetch_cancel(h: Tsfetch_handle_t); cdecl; external libsokol;
procedure sfetch_pause(h: Tsfetch_handle_t); cdecl; external libsokol;
procedure sfetch_continue(h: Tsfetch_handle_t); cdecl; external libsokol;

// === Konventiert am: 22-3-26 16:22:43 ===


implementation



end.
