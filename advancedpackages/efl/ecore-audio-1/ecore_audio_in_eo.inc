{$IFDEF read_interface}


type
  PEcore_Audio_In = ^TEcore_Audio_In;
  TEcore_Audio_In = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ECORE_AUDIO_IN_CLASS: PEfl_Class;

function ecore_audio_in_class_get: PEfl_Class; cdecl; external libecore_audio;
procedure ecore_audio_obj_in_speed_set(obj: PEo; speed: double); cdecl; external libecore_audio;
function ecore_audio_obj_in_speed_get(obj: PEo): double; cdecl; external libecore_audio;
procedure ecore_audio_obj_in_samplerate_set(obj: PEo; samplerate: longint); cdecl; external libecore_audio;
function ecore_audio_obj_in_samplerate_get(obj: PEo): longint; cdecl; external libecore_audio;
procedure ecore_audio_obj_in_channels_set(obj: PEo; channels: longint); cdecl; external libecore_audio;
function ecore_audio_obj_in_channels_get(obj: PEo): longint; cdecl; external libecore_audio;
procedure ecore_audio_obj_in_preloaded_set(obj: PEo; preloaded: TEina_Bool); cdecl; external libecore_audio;
function ecore_audio_obj_in_preloaded_get(obj: PEo): TEina_Bool; cdecl; external libecore_audio;
procedure ecore_audio_obj_in_looped_set(obj: PEo; looped: TEina_Bool); cdecl; external libecore_audio;
function ecore_audio_obj_in_looped_get(obj: PEo): TEina_Bool; cdecl; external libecore_audio;
procedure ecore_audio_obj_in_length_set(obj: PEo; length: double); cdecl; external libecore_audio;
function ecore_audio_obj_in_length_get(obj: PEo): double; cdecl; external libecore_audio;
function ecore_audio_obj_in_output_get(obj: PEo): PEcore_Audio; cdecl; external libecore_audio;
function ecore_audio_obj_in_remaining_get(obj: PEo): double; cdecl; external libecore_audio;
function ecore_audio_obj_in_read(obj: PEo; buf: pointer; len: Tsize_t): Tssize_t; cdecl; external libecore_audio;
function ecore_audio_obj_in_read_internal(obj: PEo; buf: pointer; len: Tsize_t): Tssize_t; cdecl; external libecore_audio;
function ecore_audio_obj_in_seek(obj: PEo; offs: double; mode: longint): double; cdecl; external libecore_audio;

var
  _ECORE_AUDIO_IN_EVENT_IN_LOOPED: TEfl_Event_Description; cvar;external libecore_audio;
  _ECORE_AUDIO_IN_EVENT_IN_STOPPED: TEfl_Event_Description; cvar;external libecore_audio;
  _ECORE_AUDIO_IN_EVENT_IN_SAMPLERATE_CHANGED: TEfl_Event_Description; cvar;external libecore_audio;

function ECORE_AUDIO_IN_EVENT_IN_LOOPED: PEfl_Event_Description;
function ECORE_AUDIO_IN_EVENT_IN_STOPPED: PEfl_Event_Description;
function ECORE_AUDIO_IN_EVENT_IN_SAMPLERATE_CHANGED: PEfl_Event_Description;
{$endif}

// === Konventiert am: 13-6-25 19:34:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function ECORE_AUDIO_IN_CLASS: PEfl_Class;
begin
  ECORE_AUDIO_IN_CLASS := ecore_audio_in_class_get;
end;

function ECORE_AUDIO_IN_EVENT_IN_LOOPED: PEfl_Event_Description;
begin
  ECORE_AUDIO_IN_EVENT_IN_LOOPED := @(_ECORE_AUDIO_IN_EVENT_IN_LOOPED);
end;

function ECORE_AUDIO_IN_EVENT_IN_STOPPED: PEfl_Event_Description;
begin
  ECORE_AUDIO_IN_EVENT_IN_STOPPED := @(_ECORE_AUDIO_IN_EVENT_IN_STOPPED);
end;

function ECORE_AUDIO_IN_EVENT_IN_SAMPLERATE_CHANGED: PEfl_Event_Description;
begin
  ECORE_AUDIO_IN_EVENT_IN_SAMPLERATE_CHANGED := @(_ECORE_AUDIO_IN_EVENT_IN_SAMPLERATE_CHANGED);
end;
{$endif}


{$ENDIF read_implementation}
