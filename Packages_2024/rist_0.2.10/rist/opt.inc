{$IFDEF read_interface}


type
  Trist_thread_callback_func_t = procedure(handle: pointer; _type: longint; created: Boolean; user_data: pointer); cdecl;

  Prist_thread_callback_t = ^Trist_thread_callback_t;
  Trist_thread_callback_t = record
    thread_callback: Trist_thread_callback_func_t;
  end;

type
  Trist_opt = longint;
const
  RIST_OPT_THREAD_CALLBACK = 0;

function rist_set_opt(ctx: Prist_ctx; opt: Trist_opt; optval1: pointer; optval2: pointer; optval3: pointer): longint; cdecl; external librist;

// === Konventiert am: 15-8-26 19:16:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
