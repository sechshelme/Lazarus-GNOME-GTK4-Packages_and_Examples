unit http_struct;

interface

uses
  fp_event, http;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  EVHTTP_REQ_OWN_CONNECTION = $0001;
  EVHTTP_PROXY_REQUEST = $0002;
  EVHTTP_USER_OWNED = $0004;
  EVHTTP_REQ_DEFER_FREE = $0008;
  EVHTTP_REQ_NEEDS_FREE = $0010;

type
  Pevhttp_request = ^Tevhttp_request;

  Tevhttp_request = bitpacked record
    next: record
      tqe_next: Pevhttp_request;
      tqe_prev: ^Pevhttp_request;
      end;
    evcon: Pevhttp_connection;
    flags: longint;
    input_headers: Pevkeyvalq;
    output_headers: Pevkeyvalq;
    remote_host: pchar;
    remote_port: Tev_uint16_t;
    host_cache: pchar;
    kind: Tevhttp_request_kind;
    _type: Tevhttp_cmd_type;
    headers_size: Tsize_t;
    body_size: Tsize_t;
    uri: pchar;
    uri_elems: Pevhttp_uri;
    major: char;
    minor: char;
    response_code: longint;
    response_code_line: pchar;
    input_buffer: Pevbuffer;
    ntoread: Tev_int64_t;
    chunked: 0..1;
    userdone: 0..1;
    output_buffer: Pevbuffer;
    cb: procedure(para1: Pevhttp_request; para2: pointer); cdecl;
    cb_arg: pointer;
    chunk_cb: procedure(para1: Pevhttp_request; para2: pointer); cdecl;
    header_cb: function(para1: Pevhttp_request; para2: pointer): longint; cdecl;
    error_cb: procedure(para1: Tevhttp_request_error; para2: pointer); cdecl;
    on_complete_cb: procedure(para1: Pevhttp_request; para2: pointer); cdecl;
    on_complete_cb_arg: pointer;
  end;


  // === Konventiert am: 26-8-25 19:37:50 ===


implementation


end.
