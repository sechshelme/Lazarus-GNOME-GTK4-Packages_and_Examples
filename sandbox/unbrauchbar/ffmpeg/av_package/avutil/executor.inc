{$IFDEF read_interface}


type
  PAVExecutor = type Pointer;
  PPAVExecutor = ^PAVExecutor;

  PAVTask = ^TAVTask;

  TAVTask = record
    next: PAVTask;
  end;

  TAVTaskCallbacks = record
    user_data: pointer;
    local_context_size: longint;
    priority_higher: function(a: PAVTask; b: PAVTask): longint; cdecl;
    ready: function(t: PAVTask; user_data: pointer): longint; cdecl;
    run: function(t: PAVTask; local_context: pointer; user_data: pointer): longint; cdecl;
  end;
  PAVTaskCallbacks = ^TAVTaskCallbacks;

function av_executor_alloc(callbacks: PAVTaskCallbacks; thread_count: longint): PAVExecutor; cdecl; external libavutil;
procedure av_executor_free(e: PPAVExecutor); cdecl; external libavutil;
procedure av_executor_execute(e: PAVExecutor; t: PAVTask); cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:00:49 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
