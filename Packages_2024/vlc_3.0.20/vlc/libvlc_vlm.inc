{$IFDEF read_interface}


procedure libvlc_vlm_release(p_instance: Plibvlc_instance_t); cdecl; external libvlc;
function libvlc_vlm_add_broadcast(p_instance: Plibvlc_instance_t; psz_name: pchar; psz_input: pchar; psz_output: pchar; i_options: longint;
  ppsz_options: PPchar; b_enabled: longint; b_loop: longint): longint; cdecl; external libvlc;
function libvlc_vlm_add_vod(p_instance: Plibvlc_instance_t; psz_name: pchar; psz_input: pchar; i_options: longint; ppsz_options: PPchar;
  b_enabled: longint; psz_mux: pchar): longint; cdecl; external libvlc;
function libvlc_vlm_del_media(p_instance: Plibvlc_instance_t; psz_name: pchar): longint; cdecl; external libvlc;
function libvlc_vlm_set_enabled(p_instance: Plibvlc_instance_t; psz_name: pchar; b_enabled: longint): longint; cdecl; external libvlc;
function libvlc_vlm_set_output(p_instance: Plibvlc_instance_t; psz_name: pchar; psz_output: pchar): longint; cdecl; external libvlc;
function libvlc_vlm_set_input(p_instance: Plibvlc_instance_t; psz_name: pchar; psz_input: pchar): longint; cdecl; external libvlc;
function libvlc_vlm_add_input(p_instance: Plibvlc_instance_t; psz_name: pchar; psz_input: pchar): longint; cdecl; external libvlc;
function libvlc_vlm_set_loop(p_instance: Plibvlc_instance_t; psz_name: pchar; b_loop: longint): longint; cdecl; external libvlc;
function libvlc_vlm_set_mux(p_instance: Plibvlc_instance_t; psz_name: pchar; psz_mux: pchar): longint; cdecl; external libvlc;
function libvlc_vlm_change_media(p_instance: Plibvlc_instance_t; psz_name: pchar; psz_input: pchar; psz_output: pchar; i_options: longint;
  ppsz_options: PPchar; b_enabled: longint; b_loop: longint): longint; cdecl; external libvlc;
function libvlc_vlm_play_media(p_instance: Plibvlc_instance_t; psz_name: pchar): longint; cdecl; external libvlc;
function libvlc_vlm_stop_media(p_instance: Plibvlc_instance_t; psz_name: pchar): longint; cdecl; external libvlc;
function libvlc_vlm_pause_media(p_instance: Plibvlc_instance_t; psz_name: pchar): longint; cdecl; external libvlc;
function libvlc_vlm_seek_media(p_instance: Plibvlc_instance_t; psz_name: pchar; f_percentage: single): longint; cdecl; external libvlc;
function libvlc_vlm_show_media(p_instance: Plibvlc_instance_t; psz_name: pchar): pchar; cdecl; external libvlc;
function libvlc_vlm_get_media_instance_position(p_instance: Plibvlc_instance_t; psz_name: pchar; i_instance: longint): single; cdecl; external libvlc;
function libvlc_vlm_get_media_instance_time(p_instance: Plibvlc_instance_t; psz_name: pchar; i_instance: longint): longint; cdecl; external libvlc;
function libvlc_vlm_get_media_instance_length(p_instance: Plibvlc_instance_t; psz_name: pchar; i_instance: longint): longint; cdecl; external libvlc;
function libvlc_vlm_get_media_instance_rate(p_instance: Plibvlc_instance_t; psz_name: pchar; i_instance: longint): longint; cdecl; external libvlc;
function libvlc_vlm_get_event_manager(p_instance: Plibvlc_instance_t): Plibvlc_event_manager_t; cdecl; external libvlc;

// === Konventiert am: 13-10-25 19:24:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
