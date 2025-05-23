{$IFDEF read_interface}


type
  PEfl_Player = ^TEfl_Player;
  TEfl_Player = TEo;

function EFL_PLAYER_INTERFACE: PEfl_Class;

function efl_player_interface_get: PEfl_Class; cdecl; external libefl;
function efl_player_playing_set(obj: PEo; playing: TEina_Bool): TEina_Bool; cdecl; external libefl;
function efl_player_playing_get(obj: PEo): TEina_Bool; cdecl; external libefl;
function efl_player_paused_set(obj: PEo; paused: TEina_Bool): TEina_Bool; cdecl; external libefl;
function efl_player_paused_get(obj: PEo): TEina_Bool; cdecl; external libefl;
procedure efl_player_playback_position_set(obj: PEo; sec: double); cdecl; external libefl;
function efl_player_playback_position_get(obj: PEo): double; cdecl; external libefl;
procedure efl_player_playback_progress_set(obj: PEo; progress: double); cdecl; external libefl;
function efl_player_playback_progress_get(obj: PEo): double; cdecl; external libefl;
procedure efl_player_playback_speed_set(obj: PEo; speed: double); cdecl; external libefl;
function efl_player_playback_speed_get(obj: PEo): double; cdecl; external libefl;
procedure efl_player_autoplay_set(obj: PEo; autoplay: TEina_Bool); cdecl; external libefl;
function efl_player_autoplay_get(obj: PEo): TEina_Bool; cdecl; external libefl;
procedure efl_player_playback_loop_set(obj: PEo; looping: TEina_Bool); cdecl; external libefl;
function efl_player_playback_loop_get(obj: PEo): TEina_Bool; cdecl; external libefl;

var
  _EFL_PLAYER_EVENT_PLAYING_CHANGED: TEfl_Event_Description; cvar;external libefl;
  _EFL_PLAYER_EVENT_PAUSED_CHANGED: TEfl_Event_Description; cvar;external libefl;
  _EFL_PLAYER_EVENT_PLAYBACK_PROGRESS_CHANGED: TEfl_Event_Description; cvar;external libefl;
  _EFL_PLAYER_EVENT_PLAYBACK_POSITION_CHANGED: TEfl_Event_Description; cvar;external libefl;
  _EFL_PLAYER_EVENT_PLAYBACK_REPEATED: TEfl_Event_Description; cvar;external libefl;
  _EFL_PLAYER_EVENT_PLAYBACK_FINISHED: TEfl_Event_Description; cvar;external libefl;

function EFL_PLAYER_EVENT_PLAYING_CHANGED: PEfl_Event_Description;
function EFL_PLAYER_EVENT_PAUSED_CHANGED: PEfl_Event_Description;
function EFL_PLAYER_EVENT_PLAYBACK_PROGRESS_CHANGED: PEfl_Event_Description;
function EFL_PLAYER_EVENT_PLAYBACK_POSITION_CHANGED: PEfl_Event_Description;
function EFL_PLAYER_EVENT_PLAYBACK_REPEATED: PEfl_Event_Description;
function EFL_PLAYER_EVENT_PLAYBACK_FINISHED: PEfl_Event_Description;

// === Konventiert am: 19-5-25 17:35:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



function EFL_PLAYER_INTERFACE: PEfl_Class;
begin
  EFL_PLAYER_INTERFACE := efl_player_interface_get;
end;

function EFL_PLAYER_EVENT_PLAYING_CHANGED: PEfl_Event_Description;
begin
  EFL_PLAYER_EVENT_PLAYING_CHANGED := @(_EFL_PLAYER_EVENT_PLAYING_CHANGED);
end;

function EFL_PLAYER_EVENT_PAUSED_CHANGED: PEfl_Event_Description;
begin
  EFL_PLAYER_EVENT_PAUSED_CHANGED := @(_EFL_PLAYER_EVENT_PAUSED_CHANGED);
end;

function EFL_PLAYER_EVENT_PLAYBACK_PROGRESS_CHANGED: PEfl_Event_Description;
begin
  EFL_PLAYER_EVENT_PLAYBACK_PROGRESS_CHANGED := @(_EFL_PLAYER_EVENT_PLAYBACK_PROGRESS_CHANGED);
end;

function EFL_PLAYER_EVENT_PLAYBACK_POSITION_CHANGED: PEfl_Event_Description;
begin
  EFL_PLAYER_EVENT_PLAYBACK_POSITION_CHANGED := @(_EFL_PLAYER_EVENT_PLAYBACK_POSITION_CHANGED);
end;

function EFL_PLAYER_EVENT_PLAYBACK_REPEATED: PEfl_Event_Description;
begin
  EFL_PLAYER_EVENT_PLAYBACK_REPEATED := @(_EFL_PLAYER_EVENT_PLAYBACK_REPEATED);
end;

function EFL_PLAYER_EVENT_PLAYBACK_FINISHED: PEfl_Event_Description;
begin
  EFL_PLAYER_EVENT_PLAYBACK_FINISHED := @(_EFL_PLAYER_EVENT_PLAYBACK_FINISHED);
end;


{$ENDIF read_implementation}
