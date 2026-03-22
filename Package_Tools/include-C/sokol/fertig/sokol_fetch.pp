
unit sokol_fetch;
interface

{
  Automatically converted by H2Pas 1.0.0 from sokol_fetch.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sokol_fetch.h
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
Pchar  = ^char;
Psfetch_allocator_t  = ^sfetch_allocator_t;
Psfetch_desc_t  = ^sfetch_desc_t;
Psfetch_error_t  = ^sfetch_error_t;
Psfetch_handle_t  = ^sfetch_handle_t;
Psfetch_logger_t  = ^sfetch_logger_t;
Psfetch_range_t  = ^sfetch_range_t;
Psfetch_request_t  = ^sfetch_request_t;
Psfetch_response_t  = ^sfetch_response_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    sfetch_logger_t

    Used in sfetch_desc_t to provide a custom logging and error reporting
    callback to sokol-fetch.
 }
(* Const before type ignored *)
{ always "sfetch" }
{ 0=panic, 1=error, 2=warning, 3=info }
{ SFETCH_LOGITEM_* }
(* Const before type ignored *)
{ a message string, may be nullptr in release mode }
{ line number in sokol_fetch.h }
(* Const before type ignored *)
{ source filename, may be nullptr in release mode }
type
  Psfetch_logger_t = ^Tsfetch_logger_t;
  Tsfetch_logger_t = record
      func : procedure (tag:Pchar; log_level:Tuint32_t; log_item_id:Tuint32_t; message_or_null:Pchar; line_nr:Tuint32_t; 
                    filename_or_null:Pchar; user_data:pointer);cdecl;
      user_data : pointer;
    end;
{
    sfetch_range_t

    A pointer-size pair struct to pass memory ranges into and out of sokol-fetch.
    When initialized from a value type (array or struct) you can use the
    SFETCH_RANGE() helper macro to build an sfetch_range_t struct.
 }
(* Const before type ignored *)

  Psfetch_range_t = ^Tsfetch_range_t;
  Tsfetch_range_t = record
      ptr : pointer;
      size : Tsize_t;
    end;
{
    sfetch_allocator_t

    Used in sfetch_desc_t to provide custom memory-alloc and -free functions
    to sokol_fetch.h. If memory management should be overridden, both the
    alloc and free function must be provided (e.g. it's not valid to
    override one function but not the other).
 }

  Psfetch_allocator_t = ^Tsfetch_allocator_t;
  Tsfetch_allocator_t = record
      alloc_fn : function (size:Tsize_t; user_data:pointer):pointer;cdecl;
      free_fn : procedure (ptr:pointer; user_data:pointer);cdecl;
      user_data : pointer;
    end;
{ configuration values for sfetch_setup()  }
{ max number of active requests across all channels (default: 128) }
{ number of channels to fetch requests in parallel (default: 1) }
{ max number of requests active on the same channel (default: 1) }
{ optional memory allocation overrides (default: malloc/free) }
{ optional log function overrides (default: NO LOGGING!) }

  Psfetch_desc_t = ^Tsfetch_desc_t;
  Tsfetch_desc_t = record
      max_requests : Tuint32_t;
      num_channels : Tuint32_t;
      num_lanes : Tuint32_t;
      allocator : Tsfetch_allocator_t;
      logger : Tsfetch_logger_t;
    end;
{ a request handle to identify an active fetch request, returned by sfetch_send()  }

  Psfetch_handle_t = ^Tsfetch_handle_t;
  Tsfetch_handle_t = record
      id : Tuint32_t;
    end;
{ error codes  }
{ check browser console for detailed error info }

  Psfetch_error_t = ^Tsfetch_error_t;
  Tsfetch_error_t =  Longint;
  Const
    SFETCH_ERROR_NO_ERROR = 0;
    SFETCH_ERROR_FILE_NOT_FOUND = 1;
    SFETCH_ERROR_NO_BUFFER = 2;
    SFETCH_ERROR_BUFFER_TOO_SMALL = 3;
    SFETCH_ERROR_UNEXPECTED_EOF = 4;
    SFETCH_ERROR_INVALID_HTTP_STATUS = 5;
    SFETCH_ERROR_CANCELLED = 6;
    SFETCH_ERROR_JS_OTHER = 7;
;
{ the response struct passed to the response callback  }
{ request handle this response belongs to }
{ true when request is in DISPATCHED state (lane has been assigned) }
{ true when request is in FETCHED state (fetched data is available) }
{ request is currently in paused state }
{ this is the last response for this request }
{ request has failed (always set together with 'finished') }
{ request was cancelled (always set together with 'finished') }
{ more detailed error code when failed is true }
{ the channel which processes this request }
{ the lane this request occupies on its channel }
(* Const before type ignored *)
{ the original filesystem path of the request }
{ pointer to read/write user-data area }
{ current offset of fetched data chunk in the overall file data }
{ the fetched data as ptr/size pair (data.ptr == buffer.ptr, data.size <= buffer.size) }
{ the user-provided buffer which holds the fetched data }
type
  Psfetch_response_t = ^Tsfetch_response_t;
  Tsfetch_response_t = record
      handle : Tsfetch_handle_t;
      dispatched : Tbool;
      fetched : Tbool;
      paused : Tbool;
      finished : Tbool;
      failed : Tbool;
      cancelled : Tbool;
      error_code : Tsfetch_error_t;
      channel : Tuint32_t;
      lane : Tuint32_t;
      path : Pchar;
      user_data : pointer;
      data_offset : Tuint32_t;
      data : Tsfetch_range_t;
      buffer : Tsfetch_range_t;
    end;
{ request parameters passed to sfetch_send()  }
{ index of channel this request is assigned to (default: 0) }
(* Const before type ignored *)
{ filesystem path or HTTP URL (required) }
(* Const before type ignored *)
{ response callback function pointer (required) }
{ number of bytes to load per stream-block (optional) }
{ a memory buffer where the data will be loaded into (optional) }
{ ptr/size of a POD user data block which will be memcpy'd (optional) }

  Psfetch_request_t = ^Tsfetch_request_t;
  Tsfetch_request_t = record
      channel : Tuint32_t;
      path : Pchar;
      callback : procedure (para1:Psfetch_response_t);cdecl;
      chunk_size : Tuint32_t;
      buffer : Tsfetch_range_t;
      user_data : Tsfetch_range_t;
    end;
{ setup sokol-fetch (can be called on multiple threads)  }
(* Const before type ignored *)

procedure sfetch_setup(desc:Psfetch_desc_t);cdecl;external;
{ discard a sokol-fetch context  }
procedure sfetch_shutdown;cdecl;external;
{ return true if sokol-fetch has been setup  }
function sfetch_valid:Tbool;cdecl;external;
{ get the desc struct that was passed to sfetch_setup()  }
function sfetch_desc:Tsfetch_desc_t;cdecl;external;
{ return the max userdata size in number of bytes (SFETCH_MAX_USERDATA_UINT64 * sizeof(uint64_t))  }
function sfetch_max_userdata_bytes:longint;cdecl;external;
{ return the value of the SFETCH_MAX_PATH implementation config value  }
function sfetch_max_path:longint;cdecl;external;
{ send a fetch-request, get handle to request back  }
(* Const before type ignored *)
function sfetch_send(request:Psfetch_request_t):Tsfetch_handle_t;cdecl;external;
{ return true if a handle is valid *and* the request is alive  }
function sfetch_handle_valid(h:Tsfetch_handle_t):Tbool;cdecl;external;
{ do per-frame work, moves requests into and out of IO threads, and invokes response-callbacks  }
procedure sfetch_dowork;cdecl;external;
{ bind a data buffer to a request (request must not currently have a buffer bound, must be called from response callback  }
procedure sfetch_bind_buffer(h:Tsfetch_handle_t; buffer:Tsfetch_range_t);cdecl;external;
{ clear the 'buffer binding' of a request, returns previous buffer pointer (can be 0), must be called from response callback  }
function sfetch_unbind_buffer(h:Tsfetch_handle_t):pointer;cdecl;external;
{ cancel a request that's in flight (will call response callback with .cancelled + .finished)  }
procedure sfetch_cancel(h:Tsfetch_handle_t);cdecl;external;
{ pause a request (will call response callback each frame with .paused)  }
procedure sfetch_pause(h:Tsfetch_handle_t);cdecl;external;
{ continue a paused request  }
procedure sfetch_continue(h:Tsfetch_handle_t);cdecl;external;

implementation


end.
