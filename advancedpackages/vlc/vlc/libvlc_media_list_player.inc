{$IFDEF read_interface}


type
  Plibvlc_media_list_player_t = type Pointer;

type
  Plibvlc_playback_mode_t = ^Tlibvlc_playback_mode_t;
  Tlibvlc_playback_mode_t = longint;

const
  libvlc_playback_mode_default = 0;
  libvlc_playback_mode_loop = 1;
  libvlc_playback_mode_repeat = 2;

function libvlc_media_list_player_new(p_instance: Plibvlc_instance_t): Plibvlc_media_list_player_t; cdecl; external libvlc;
procedure libvlc_media_list_player_release(p_mlp: Plibvlc_media_list_player_t); cdecl; external libvlc;
procedure libvlc_media_list_player_retain(p_mlp: Plibvlc_media_list_player_t); cdecl; external libvlc;
function libvlc_media_list_player_event_manager(p_mlp: Plibvlc_media_list_player_t): Plibvlc_event_manager_t; cdecl; external libvlc;
procedure libvlc_media_list_player_set_media_player(p_mlp: Plibvlc_media_list_player_t; p_mi: Plibvlc_media_player_t); cdecl; external libvlc;
function libvlc_media_list_player_get_media_player(p_mlp: Plibvlc_media_list_player_t): Plibvlc_media_player_t; cdecl; external libvlc;
procedure libvlc_media_list_player_set_media_list(p_mlp: Plibvlc_media_list_player_t; p_mlist: Plibvlc_media_list_t); cdecl; external libvlc;
procedure libvlc_media_list_player_play(p_mlp: Plibvlc_media_list_player_t); cdecl; external libvlc;
procedure libvlc_media_list_player_pause(p_mlp: Plibvlc_media_list_player_t); cdecl; external libvlc;
procedure libvlc_media_list_player_set_pause(p_mlp: Plibvlc_media_list_player_t; do_pause: longint); cdecl; external libvlc;
function libvlc_media_list_player_is_playing(p_mlp: Plibvlc_media_list_player_t): longint; cdecl; external libvlc;
function libvlc_media_list_player_get_state(p_mlp: Plibvlc_media_list_player_t): Tlibvlc_state_t; cdecl; external libvlc;
function libvlc_media_list_player_play_item_at_index(p_mlp: Plibvlc_media_list_player_t; i_index: longint): longint; cdecl; external libvlc;
function libvlc_media_list_player_play_item(p_mlp: Plibvlc_media_list_player_t; p_md: Plibvlc_media_t): longint; cdecl; external libvlc;
procedure libvlc_media_list_player_stop(p_mlp: Plibvlc_media_list_player_t); cdecl; external libvlc;
function libvlc_media_list_player_next(p_mlp: Plibvlc_media_list_player_t): longint; cdecl; external libvlc;
function libvlc_media_list_player_previous(p_mlp: Plibvlc_media_list_player_t): longint; cdecl; external libvlc;
procedure libvlc_media_list_player_set_playback_mode(p_mlp: Plibvlc_media_list_player_t; e_mode: Tlibvlc_playback_mode_t); cdecl; external libvlc;

// === Konventiert am: 13-10-25 19:24:45 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
