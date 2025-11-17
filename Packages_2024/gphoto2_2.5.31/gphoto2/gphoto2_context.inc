{$IFDEF read_interface}


type
  PGPContext = type Pointer;

function gp_context_new: PGPContext; cdecl; external libgphoto2;
procedure gp_context_ref(context: PGPContext); cdecl; external libgphoto2;
procedure gp_context_unref(context: PGPContext); cdecl; external libgphoto2;

type
  PGPContextFeedback = ^TGPContextFeedback;
  TGPContextFeedback = longint;

const
  GP_CONTEXT_FEEDBACK_OK = 0;
  GP_CONTEXT_FEEDBACK_CANCEL = 1;

type
  TGPContextIdleFunc = procedure(context: PGPContext; data: pointer); cdecl;
  TGPContextErrorFunc = procedure(context: PGPContext; text: pchar; data: pointer); cdecl;
  TGPContextStatusFunc = procedure(context: PGPContext; text: pchar; data: pointer); cdecl;
  TGPContextMessageFunc = procedure(context: PGPContext; text: pchar; data: pointer); cdecl;
  TGPContextQuestionFunc = function(context: PGPContext; text: pchar; data: pointer): TGPContextFeedback; cdecl;
  TGPContextCancelFunc = function(context: PGPContext; data: pointer): TGPContextFeedback; cdecl;
  TGPContextProgressStartFunc = function(context: PGPContext; target: single; text: pchar; data: pointer): dword; cdecl;
  TGPContextProgressUpdateFunc = procedure(context: PGPContext; id: dword; current: single; data: pointer); cdecl;
  TGPContextProgressStopFunc = procedure(context: PGPContext; id: dword; data: pointer); cdecl;

procedure gp_context_set_idle_func(context: PGPContext; func: TGPContextIdleFunc; data: pointer); cdecl; external libgphoto2;
procedure gp_context_set_progress_funcs(context: PGPContext; start_func: TGPContextProgressStartFunc; update_func: TGPContextProgressUpdateFunc; stop_func: TGPContextProgressStopFunc; data: pointer); cdecl; external libgphoto2;
procedure gp_context_set_error_func(context: PGPContext; func: TGPContextErrorFunc; data: pointer); cdecl; external libgphoto2;
procedure gp_context_set_status_func(context: PGPContext; func: TGPContextStatusFunc; data: pointer); cdecl; external libgphoto2;
procedure gp_context_set_question_func(context: PGPContext; func: TGPContextQuestionFunc; data: pointer); cdecl; external libgphoto2;
procedure gp_context_set_cancel_func(context: PGPContext; func: TGPContextCancelFunc; data: pointer); cdecl; external libgphoto2;
procedure gp_context_set_message_func(context: PGPContext; func: TGPContextMessageFunc; data: pointer); cdecl; external libgphoto2;
procedure gp_context_idle(context: PGPContext); cdecl; external libgphoto2;
procedure gp_context_error(context: PGPContext; format: pchar); cdecl; varargs; external libgphoto2;
procedure gp_context_status(context: PGPContext; format: pchar); cdecl; varargs; external libgphoto2;
procedure gp_context_message(context: PGPContext; format: pchar); cdecl; varargs; external libgphoto2;
function gp_context_question(context: PGPContext; format: pchar): TGPContextFeedback; cdecl; varargs; external libgphoto2;
function gp_context_cancel(context: PGPContext): TGPContextFeedback; cdecl; external libgphoto2;
function gp_context_progress_start(context: PGPContext; target: single; format: pchar): dword; cdecl; varargs; external libgphoto2;
procedure gp_context_progress_update(context: PGPContext; id: dword; current: single); cdecl; external libgphoto2;
procedure gp_context_progress_stop(context: PGPContext; id: dword); cdecl; external libgphoto2;

// === Konventiert am: 17-11-25 15:46:47 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
