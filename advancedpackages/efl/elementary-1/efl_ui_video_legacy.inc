{$IFDEF read_interface}


type
  PElm_Video = ^TElm_Video;
  TElm_Video = TEo;

function elm_player_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
function elm_video_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
function elm_video_file_set(obj: PEo; filename: pchar): TEina_Bool; cdecl; external libelementary;
procedure elm_video_file_get(obj: PEo; filename: PPchar); cdecl; external libelementary;
procedure elm_video_audio_level_set(obj: PEvas_Object; volume: double); cdecl; external libelementary;
function elm_video_audio_level_get(obj: PEvas_Object): double; cdecl; external libelementary;
procedure elm_video_audio_mute_set(obj: PEvas_Object; mute: TEina_Bool); cdecl; external libelementary;
function elm_video_audio_mute_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
function elm_video_play_length_get(obj: PEvas_Object): double; cdecl; external libelementary;
function elm_video_is_seekable_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_video_play_position_set(obj: PEvas_Object; position: double); cdecl; external libelementary;
function elm_video_play_position_get(obj: PEvas_Object): double; cdecl; external libelementary;
function elm_video_is_playing_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_video_play(obj: PEvas_Object); cdecl; external libelementary;
procedure elm_video_stop(obj: PEvas_Object); cdecl; external libelementary;
procedure elm_video_pause(obj: PEvas_Object); cdecl; external libelementary;

// === Konventiert am: 30-5-25 13:11:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
