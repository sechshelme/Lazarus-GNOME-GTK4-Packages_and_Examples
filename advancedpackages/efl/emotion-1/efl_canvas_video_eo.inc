{$IFDEF read_interface}


type
  PEfl_Canvas_Video = ^TEfl_Canvas_Video;
  TEfl_Canvas_Video = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_VIDEO_CLASS: PEfl_Class;

function efl_canvas_video_class_get: PEfl_Class; cdecl; external libemotion;
procedure efl_canvas_video_option_set(obj: PEo; opt: pchar; val: pchar); cdecl; external libemotion;
function efl_canvas_video_engine_set(obj: PEo; module_filename: pchar): TEina_Bool; cdecl; external libemotion;

var
  _EFL_CANVAS_VIDEO_EVENT_FRAME_DECODE: TEfl_Event_Description; cvar;external libemotion;
  _EFL_CANVAS_VIDEO_EVENT_POSITION_CHANGE: TEfl_Event_Description; cvar;external libemotion;
  _EFL_CANVAS_VIDEO_EVENT_LENGTH_CHANGE: TEfl_Event_Description; cvar;external libemotion;
  _EFL_CANVAS_VIDEO_EVENT_FRAME_RESIZE: TEfl_Event_Description; cvar;external libemotion;
  _EFL_CANVAS_VIDEO_EVENT_PLAYBACK_START: TEfl_Event_Description; cvar;external libemotion;
  _EFL_CANVAS_VIDEO_EVENT_PLAYBACK_STOP: TEfl_Event_Description; cvar;external libemotion;
  _EFL_CANVAS_VIDEO_EVENT_VOLUME_CHANGE: TEfl_Event_Description; cvar;external libemotion;
  _EFL_CANVAS_VIDEO_EVENT_CHANNELS_CHANGE: TEfl_Event_Description; cvar;external libemotion;
  _EFL_CANVAS_VIDEO_EVENT_TITLE_CHANGE: TEfl_Event_Description; cvar;external libemotion;
  _EFL_CANVAS_VIDEO_EVENT_PROGRESS_CHANGE: TEfl_Event_Description; cvar;external libemotion;
  _EFL_CANVAS_VIDEO_EVENT_REF_CHANGE: TEfl_Event_Description; cvar;external libemotion;
  _EFL_CANVAS_VIDEO_EVENT_BUTTON_NUM_CHANGE: TEfl_Event_Description; cvar;external libemotion;
  _EFL_CANVAS_VIDEO_EVENT_BUTTON_CHANGE: TEfl_Event_Description; cvar;external libemotion;
  _EFL_CANVAS_VIDEO_EVENT_OPEN_DONE: TEfl_Event_Description; cvar;external libemotion;
  _EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_DONE: TEfl_Event_Description; cvar;external libemotion;
  _EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_FAIL: TEfl_Event_Description; cvar;external libemotion;
  _EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_DONE: TEfl_Event_Description; cvar;external libemotion;
  _EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_FAIL: TEfl_Event_Description; cvar;external libemotion;

function EFL_CANVAS_VIDEO_EVENT_FRAME_DECODE: PEfl_Event_Description;
function EFL_CANVAS_VIDEO_EVENT_POSITION_CHANGE: PEfl_Event_Description;
function EFL_CANVAS_VIDEO_EVENT_LENGTH_CHANGE: PEfl_Event_Description;
function EFL_CANVAS_VIDEO_EVENT_FRAME_RESIZE: PEfl_Event_Description;
function EFL_CANVAS_VIDEO_EVENT_PLAYBACK_START: PEfl_Event_Description;
function EFL_CANVAS_VIDEO_EVENT_PLAYBACK_STOP: PEfl_Event_Description;
function EFL_CANVAS_VIDEO_EVENT_VOLUME_CHANGE: PEfl_Event_Description;
function EFL_CANVAS_VIDEO_EVENT_CHANNELS_CHANGE: PEfl_Event_Description;
function EFL_CANVAS_VIDEO_EVENT_TITLE_CHANGE: PEfl_Event_Description;
function EFL_CANVAS_VIDEO_EVENT_PROGRESS_CHANGE: PEfl_Event_Description;
function EFL_CANVAS_VIDEO_EVENT_REF_CHANGE: PEfl_Event_Description;
function EFL_CANVAS_VIDEO_EVENT_BUTTON_NUM_CHANGE: PEfl_Event_Description;
function EFL_CANVAS_VIDEO_EVENT_BUTTON_CHANGE: PEfl_Event_Description;
function EFL_CANVAS_VIDEO_EVENT_OPEN_DONE: PEfl_Event_Description;
function EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_DONE: PEfl_Event_Description;
function EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_FAIL: PEfl_Event_Description;
function EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_DONE: PEfl_Event_Description;
function EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_FAIL: PEfl_Event_Description;
{$endif}

// === Konventiert am: 12-6-25 14:08:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_VIDEO_CLASS: PEfl_Class;
begin
  EFL_CANVAS_VIDEO_CLASS := efl_canvas_video_class_get;
end;

function EFL_CANVAS_VIDEO_EVENT_FRAME_DECODE: PEfl_Event_Description;
begin
  EFL_CANVAS_VIDEO_EVENT_FRAME_DECODE := @(_EFL_CANVAS_VIDEO_EVENT_FRAME_DECODE);
end;

function EFL_CANVAS_VIDEO_EVENT_POSITION_CHANGE: PEfl_Event_Description;
begin
  EFL_CANVAS_VIDEO_EVENT_POSITION_CHANGE := @(_EFL_CANVAS_VIDEO_EVENT_POSITION_CHANGE);
end;

function EFL_CANVAS_VIDEO_EVENT_LENGTH_CHANGE: PEfl_Event_Description;
begin
  EFL_CANVAS_VIDEO_EVENT_LENGTH_CHANGE := @(_EFL_CANVAS_VIDEO_EVENT_LENGTH_CHANGE);
end;

function EFL_CANVAS_VIDEO_EVENT_FRAME_RESIZE: PEfl_Event_Description;
begin
  EFL_CANVAS_VIDEO_EVENT_FRAME_RESIZE := @(_EFL_CANVAS_VIDEO_EVENT_FRAME_RESIZE);
end;

function EFL_CANVAS_VIDEO_EVENT_PLAYBACK_START: PEfl_Event_Description;
begin
  EFL_CANVAS_VIDEO_EVENT_PLAYBACK_START := @(_EFL_CANVAS_VIDEO_EVENT_PLAYBACK_START);
end;

function EFL_CANVAS_VIDEO_EVENT_PLAYBACK_STOP: PEfl_Event_Description;
begin
  EFL_CANVAS_VIDEO_EVENT_PLAYBACK_STOP := @(_EFL_CANVAS_VIDEO_EVENT_PLAYBACK_STOP);
end;

function EFL_CANVAS_VIDEO_EVENT_VOLUME_CHANGE: PEfl_Event_Description;
begin
  EFL_CANVAS_VIDEO_EVENT_VOLUME_CHANGE := @(_EFL_CANVAS_VIDEO_EVENT_VOLUME_CHANGE);
end;

function EFL_CANVAS_VIDEO_EVENT_CHANNELS_CHANGE: PEfl_Event_Description;
begin
  EFL_CANVAS_VIDEO_EVENT_CHANNELS_CHANGE := @(_EFL_CANVAS_VIDEO_EVENT_CHANNELS_CHANGE);
end;

function EFL_CANVAS_VIDEO_EVENT_TITLE_CHANGE: PEfl_Event_Description;
begin
  EFL_CANVAS_VIDEO_EVENT_TITLE_CHANGE := @(_EFL_CANVAS_VIDEO_EVENT_TITLE_CHANGE);
end;

function EFL_CANVAS_VIDEO_EVENT_PROGRESS_CHANGE: PEfl_Event_Description;
begin
  EFL_CANVAS_VIDEO_EVENT_PROGRESS_CHANGE := @(_EFL_CANVAS_VIDEO_EVENT_PROGRESS_CHANGE);
end;

function EFL_CANVAS_VIDEO_EVENT_REF_CHANGE: PEfl_Event_Description;
begin
  EFL_CANVAS_VIDEO_EVENT_REF_CHANGE := @(_EFL_CANVAS_VIDEO_EVENT_REF_CHANGE);
end;

function EFL_CANVAS_VIDEO_EVENT_BUTTON_NUM_CHANGE: PEfl_Event_Description;
begin
  EFL_CANVAS_VIDEO_EVENT_BUTTON_NUM_CHANGE := @(_EFL_CANVAS_VIDEO_EVENT_BUTTON_NUM_CHANGE);
end;

function EFL_CANVAS_VIDEO_EVENT_BUTTON_CHANGE: PEfl_Event_Description;
begin
  EFL_CANVAS_VIDEO_EVENT_BUTTON_CHANGE := @(_EFL_CANVAS_VIDEO_EVENT_BUTTON_CHANGE);
end;

function EFL_CANVAS_VIDEO_EVENT_OPEN_DONE: PEfl_Event_Description;
begin
  EFL_CANVAS_VIDEO_EVENT_OPEN_DONE := @(_EFL_CANVAS_VIDEO_EVENT_OPEN_DONE);
end;

function EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_DONE: PEfl_Event_Description;
begin
  EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_DONE := @(_EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_DONE);
end;

function EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_FAIL: PEfl_Event_Description;
begin
  EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_FAIL := @(_EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_FAIL);
end;

function EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_DONE: PEfl_Event_Description;
begin
  EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_DONE := @(_EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_DONE);
end;

function EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_FAIL: PEfl_Event_Description;
begin
  EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_FAIL := @(_EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_FAIL);
end;
{$endif}


{$ENDIF read_implementation}
