{$IFDEF read_interface}


type
  PPrist_oob_block = ^Prist_oob_block;
  Prist_oob_block = ^Trist_oob_block;
  Trist_oob_block = record
    peer: Prist_peer;
    payload: pointer;
    payload_len: Tsize_t;
    ts_ntp: Tuint64_t;
  end;

function rist_oob_write(ctx: Prist_ctx; oob_block: Prist_oob_block): longint; cdecl; external librist;
function rist_oob_read(ctx: Prist_ctx; oob_block: PPrist_oob_block): longint; cdecl; external librist;

type
  Toob_callback_func_t = function(arg: pointer; oob_block: Prist_oob_block): longint; cdecl;

function rist_oob_callback_set(ctx: Prist_ctx; callback_func: Toob_callback_func_t; arg: pointer): longint; cdecl; external librist;

// === Konventiert am: 15-8-26 19:16:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
