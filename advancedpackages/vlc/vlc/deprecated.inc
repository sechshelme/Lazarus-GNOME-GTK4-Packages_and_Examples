{$IFDEF read_interface}


function libvlc_media_player_get_fps(p_mi: Plibvlc_media_player_t): single; cdecl; external libvlc;
procedure libvlc_media_player_set_agl(p_mi: Plibvlc_media_player_t; drawable: Tuint32_t); cdecl; external libvlc;
function libvlc_media_player_get_agl(p_mi: Plibvlc_media_player_t): Tuint32_t; cdecl; external libvlc;
procedure libvlc_track_description_release(p_track_description: Plibvlc_track_description_t); cdecl; external libvlc;
function libvlc_video_get_height(p_mi: Plibvlc_media_player_t): longint; cdecl; external libvlc;
function libvlc_video_get_width(p_mi: Plibvlc_media_player_t): longint; cdecl; external libvlc;
function libvlc_video_get_title_description(p_mi: Plibvlc_media_player_t): Plibvlc_track_description_t; cdecl; external libvlc;
function libvlc_video_get_chapter_description(p_mi: Plibvlc_media_player_t; i_title: longint): Plibvlc_track_description_t; cdecl; external libvlc;
function libvlc_video_set_subtitle_file(p_mi: Plibvlc_media_player_t; psz_subtitle: pchar): longint; cdecl; external libvlc;
procedure libvlc_toggle_teletext(p_mi: Plibvlc_media_player_t); cdecl; external libvlc;
function libvlc_audio_output_device_count(p_instance: Plibvlc_instance_t; psz_audio_output: pchar): longint; cdecl; external libvlc;
function libvlc_audio_output_device_longname(p_instance: Plibvlc_instance_t; psz_output: pchar; i_device: longint): pchar; cdecl; external libvlc;
function libvlc_audio_output_device_id(p_instance: Plibvlc_instance_t; psz_audio_output: pchar; i_device: longint): pchar; cdecl; external libvlc;
function libvlc_audio_output_get_device_type(p_mi: Plibvlc_media_player_t): longint; cdecl; external libvlc;
procedure libvlc_audio_output_set_device_type(p_mp: Plibvlc_media_player_t; device_type: longint); cdecl; external libvlc;
procedure libvlc_media_parse(p_md: Plibvlc_media_t); cdecl; external libvlc;
procedure libvlc_media_parse_async(p_md: Plibvlc_media_t); cdecl; external libvlc;
function libvlc_media_is_parsed(p_md: Plibvlc_media_t): longint; cdecl; external libvlc;
function libvlc_media_get_tracks_info(p_md: Plibvlc_media_t; tracks: PPlibvlc_media_track_info_t): longint; cdecl; external libvlc;
function libvlc_media_list_add_file_content(p_ml: Plibvlc_media_list_t; psz_uri: pchar): longint; cdecl; external libvlc;
function libvlc_media_discoverer_new_from_name(p_inst: Plibvlc_instance_t; psz_name: pchar): Plibvlc_media_discoverer_t; cdecl; external libvlc;
function libvlc_media_discoverer_localized_name(p_mdis: Plibvlc_media_discoverer_t): pchar; cdecl; external libvlc;
function libvlc_media_discoverer_event_manager(p_mdis: Plibvlc_media_discoverer_t): Plibvlc_event_manager_t; cdecl; external libvlc;
procedure libvlc_wait(p_instance: Plibvlc_instance_t); cdecl; external libvlc;

type
  Plibvlc_log_iterator_t = type Pointer;

  Tlibvlc_log_message_t = record
    i_severity: longint;
    psz_type: pchar;
    psz_name: pchar;
    psz_header: pchar;
    psz_message: pchar;
  end;
  Plibvlc_log_message_t = ^Tlibvlc_log_message_t;

function libvlc_get_log_verbosity(p_instance: Plibvlc_instance_t): dword; cdecl; external libvlc;
procedure libvlc_set_log_verbosity(p_instance: Plibvlc_instance_t; level: dword); cdecl; external libvlc;
function libvlc_log_open(p_instance: Plibvlc_instance_t): Plibvlc_log_t; cdecl; external libvlc;
procedure libvlc_log_close(p_log: Plibvlc_log_t); cdecl; external libvlc;
function libvlc_log_count(p_log: Plibvlc_log_t): dword; cdecl; external libvlc;
procedure libvlc_log_clear(p_log: Plibvlc_log_t); cdecl; external libvlc;
function libvlc_log_get_iterator(p_log: Plibvlc_log_t): Plibvlc_log_iterator_t; cdecl; external libvlc;
procedure libvlc_log_iterator_free(p_iter: Plibvlc_log_iterator_t); cdecl; external libvlc;
function libvlc_log_iterator_has_next(p_iter: Plibvlc_log_iterator_t): longint; cdecl; external libvlc;
function libvlc_log_iterator_next(p_iter: Plibvlc_log_iterator_t; p_buf: Plibvlc_log_message_t): Plibvlc_log_message_t; cdecl; external libvlc;
procedure libvlc_playlist_play(p_instance: Plibvlc_instance_t; i_id: longint; i_options: longint; ppsz_options: PPchar); cdecl; external libvlc;

// === Konventiert am: 13-10-25 19:24:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
