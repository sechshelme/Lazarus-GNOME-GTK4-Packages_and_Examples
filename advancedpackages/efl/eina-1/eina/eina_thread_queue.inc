{$IFDEF read_interface}


type
  TEina_Thread_Queue_Msg = record
    size: longint;
  end;
  PEina_Thread_Queue_Msg = ^TEina_Thread_Queue_Msg;

  TEina_Thread_Queue = record
  end;
  PEina_Thread_Queue = ^TEina_Thread_Queue;

  TEina_Thread_Queue_Msg_Sub = record
    head: TEina_Thread_Queue_Msg;
    queue: PEina_Thread_Queue;
  end;
  PEina_Thread_Queue_Msg_Sub = ^TEina_Thread_Queue_Msg_Sub;

function eina_thread_queue_new: PEina_Thread_Queue; cdecl; external libeina;
procedure eina_thread_queue_free(thq: PEina_Thread_Queue); cdecl; external libeina;
function eina_thread_queue_send(thq: PEina_Thread_Queue; size: longint; allocref: Ppointer): pointer; cdecl; external libeina;
procedure eina_thread_queue_send_done(thq: PEina_Thread_Queue; allocref: pointer); cdecl; external libeina;
function eina_thread_queue_wait(thq: PEina_Thread_Queue; allocref: Ppointer): pointer; cdecl; external libeina;
procedure eina_thread_queue_wait_done(thq: PEina_Thread_Queue; allocref: pointer); cdecl; external libeina;
function eina_thread_queue_poll(thq: PEina_Thread_Queue; allocref: Ppointer): pointer; cdecl; external libeina;
function eina_thread_queue_pending_get(thq: PEina_Thread_Queue): longint; cdecl; external libeina;
procedure eina_thread_queue_parent_set(thq: PEina_Thread_Queue; thq_parent: PEina_Thread_Queue); cdecl; external libeina;
function eina_thread_queue_parent_get(thq: PEina_Thread_Queue): PEina_Thread_Queue; cdecl; external libeina;
procedure eina_thread_queue_fd_set(thq: PEina_Thread_Queue; fd: longint); cdecl; external libeina;
function eina_thread_queue_fd_get(thq: PEina_Thread_Queue): longint; cdecl; external libeina;

// === Konventiert am: 17-5-25 15:25:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
