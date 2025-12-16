unit threadmessage;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAVThreadMessageQueue = type Pointer;
  PPAVThreadMessageQueue = ^PAVThreadMessageQueue;

  PAVThreadMessageFlags = ^TAVThreadMessageFlags;
  TAVThreadMessageFlags = longint;

const
  AV_THREAD_MESSAGE_NONBLOCK = 1;

type
  Tfree_func = procedure(msg: pointer); cdecl;

function av_thread_message_queue_alloc(mq: PPAVThreadMessageQueue; nelem: dword; elsize: dword): longint; cdecl; external libavutil;
procedure av_thread_message_queue_free(mq: PPAVThreadMessageQueue); cdecl; external libavutil;
function av_thread_message_queue_send(mq: PAVThreadMessageQueue; msg: pointer; flags: dword): longint; cdecl; external libavutil;
function av_thread_message_queue_recv(mq: PAVThreadMessageQueue; msg: pointer; flags: dword): longint; cdecl; external libavutil;
procedure av_thread_message_queue_set_err_send(mq: PAVThreadMessageQueue; err: longint); cdecl; external libavutil;
procedure av_thread_message_queue_set_err_recv(mq: PAVThreadMessageQueue; err: longint); cdecl; external libavutil;
procedure av_thread_message_queue_set_free_func(mq: PAVThreadMessageQueue; free_func: Tfree_func); cdecl; external libavutil;
function av_thread_message_queue_nb_elems(mq: PAVThreadMessageQueue): longint; cdecl; external libavutil;
procedure av_thread_message_flush(mq: PAVThreadMessageQueue); cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:42:24 ===


implementation



end.
