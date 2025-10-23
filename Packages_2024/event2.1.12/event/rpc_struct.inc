{$IFDEF read_interface}

type
  Pevrpc_req_generic = type Pointer;
  Pevrpc_base = type Pointer;

const
  EVRPC_STATUS_ERR_NONE = 0;
  EVRPC_STATUS_ERR_TIMEOUT = 1;
  EVRPC_STATUS_ERR_BADPAYLOAD = 2;
  EVRPC_STATUS_ERR_UNSTARTED = 3;
  EVRPC_STATUS_ERR_HOOKABORTED = 4;

type
  Pevrpc_status = ^Tevrpc_status;

  Tevrpc_status = record
    error: longint;
    http_req: Pevhttp_request;
  end;

  Pevrpc = ^Tevrpc;

  Tevrpc = record
    next: record
      tqe_next: Pevrpc;
      tqe_prev: ^Pevrpc;
      end;
    uri: pchar;
    request_new: function(para1: pointer): pointer; cdecl;
    request_new_arg: pointer;
    request_free: procedure(para1: pointer); cdecl;
    request_unmarshal: function(para1: pointer; para2: Pevbuffer): longint; cdecl;
    reply_new: function(para1: pointer): pointer; cdecl;
    reply_new_arg: pointer;
    reply_free: procedure(para1: pointer); cdecl;
    reply_complete: function(para1: pointer): longint; cdecl;
    reply_marshal: procedure(para1: Pevbuffer; para2: pointer); cdecl;
    cb: procedure(para1: Pevrpc_req_generic; para2: pointer); cdecl;
    cb_arg: pointer;
    base: Pevrpc_base;
  end;



  // === Konventiert am: 26-8-25 19:38:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
