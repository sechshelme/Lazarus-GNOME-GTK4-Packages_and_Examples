{$IFDEF read_interface}


type
  Plibvlc_media_list_t = type Pointer;

type
  Plibvlc_media_t = type Pointer;

type
  Plibvlc_meta_t = ^Tlibvlc_meta_t;
  Tlibvlc_meta_t = longint;

const
  libvlc_meta_Title = 0;
  libvlc_meta_Artist = 1;
  libvlc_meta_Genre = 2;
  libvlc_meta_Copyright = 3;
  libvlc_meta_Album = 4;
  libvlc_meta_TrackNumber = 5;
  libvlc_meta_Description = 6;
  libvlc_meta_Rating = 7;
  libvlc_meta_Date = 8;
  libvlc_meta_Setting = 9;
  libvlc_meta_URL = 10;
  libvlc_meta_Language = 11;
  libvlc_meta_NowPlaying = 12;
  libvlc_meta_Publisher = 13;
  libvlc_meta_EncodedBy = 14;
  libvlc_meta_ArtworkURL = 15;
  libvlc_meta_TrackID = 16;
  libvlc_meta_TrackTotal = 17;
  libvlc_meta_Director = 18;
  libvlc_meta_Season = 19;
  libvlc_meta_Episode = 20;
  libvlc_meta_ShowName = 21;
  libvlc_meta_Actors = 22;
  libvlc_meta_AlbumArtist = 23;
  libvlc_meta_DiscNumber = 24;
  libvlc_meta_DiscTotal = 25;

type
  Plibvlc_state_t = ^Tlibvlc_state_t;
  Tlibvlc_state_t = longint;

const
  libvlc_NothingSpecial = 0;
  libvlc_Opening = 1;
  libvlc_Buffering = 2;
  libvlc_Playing = 3;
  libvlc_Paused = 4;
  libvlc_Stopped = 5;
  libvlc_Ended = 6;
  libvlc_Error = 7;

const
  libvlc_media_option_trusted = $2;
  libvlc_media_option_unique = $100;

type
  Plibvlc_track_type_t = ^Tlibvlc_track_type_t;
  Tlibvlc_track_type_t = longint;

const
  libvlc_track_unknown = -(1);
  libvlc_track_audio = 0;
  libvlc_track_video = 1;
  libvlc_track_text = 2;

type
  Tlibvlc_media_stats_t = record
    i_read_bytes: longint;
    f_input_bitrate: single;
    i_demux_read_bytes: longint;
    f_demux_bitrate: single;
    i_demux_corrupted: longint;
    i_demux_discontinuity: longint;
    i_decoded_video: longint;
    i_decoded_audio: longint;
    i_displayed_pictures: longint;
    i_lost_pictures: longint;
    i_played_abuffers: longint;
    i_lost_abuffers: longint;
    i_sent_packets: longint;
    i_sent_bytes: longint;
    f_send_bitrate: single;
  end;
  Plibvlc_media_stats_t = ^Tlibvlc_media_stats_t;

  Tlibvlc_media_track_info_t = record
    i_codec: Tuint32_t;
    i_id: longint;
    i_type: Tlibvlc_track_type_t;
    i_profile: longint;
    i_level: longint;
    u: record
      case longint of
        0: (audio: record
            i_channels: dword;
            i_rate: dword;
            end);
        1: (video: record
            i_height: dword;
            i_width: dword;
            end);
      end;
  end;
  Plibvlc_media_track_info_t = ^Tlibvlc_media_track_info_t;
  PPlibvlc_media_track_info_t = ^Plibvlc_media_track_info_t;

  Tlibvlc_audio_track_t = record
    i_channels: dword;
    i_rate: dword;
  end;
  Plibvlc_audio_track_t = ^Tlibvlc_audio_track_t;

type
  Plibvlc_video_orient_t = ^Tlibvlc_video_orient_t;
  Tlibvlc_video_orient_t = longint;

const
  libvlc_video_orient_top_left = 0;
  libvlc_video_orient_top_right = 1;
  libvlc_video_orient_bottom_left = 2;
  libvlc_video_orient_bottom_right = 3;
  libvlc_video_orient_left_top = 4;
  libvlc_video_orient_left_bottom = 5;
  libvlc_video_orient_right_top = 6;
  libvlc_video_orient_right_bottom = 7;

type
  Plibvlc_video_projection_t = ^Tlibvlc_video_projection_t;
  Tlibvlc_video_projection_t = longint;

const
  libvlc_video_projection_rectangular = 0;
  libvlc_video_projection_equirectangular = 1;
  libvlc_video_projection_cubemap_layout_standard = $100;

type
  Tlibvlc_video_viewpoint_t = record
    f_yaw: single;
    f_pitch: single;
    f_roll: single;
    f_field_of_view: single;
  end;
  Plibvlc_video_viewpoint_t = ^Tlibvlc_video_viewpoint_t;

  Tlibvlc_video_track_t = record
    i_height: dword;
    i_width: dword;
    i_sar_num: dword;
    i_sar_den: dword;
    i_frame_rate_num: dword;
    i_frame_rate_den: dword;
    i_orientation: Tlibvlc_video_orient_t;
    i_projection: Tlibvlc_video_projection_t;
    pose: Tlibvlc_video_viewpoint_t;
  end;
  Plibvlc_video_track_t = ^Tlibvlc_video_track_t;

  Tlibvlc_subtitle_track_t = record
    psz_encoding: pchar;
  end;
  Plibvlc_subtitle_track_t = ^Tlibvlc_subtitle_track_t;

  Tlibvlc_media_track_t = record
    i_codec: Tuint32_t;
    i_original_fourcc: Tuint32_t;
    i_id: longint;
    i_type: Tlibvlc_track_type_t;
    i_profile: longint;
    i_level: longint;
    xxxxxxx: record
      case longint of
        0: (audio: Plibvlc_audio_track_t);
        1: (video: Plibvlc_video_track_t);
        2: (subtitle: Plibvlc_subtitle_track_t);
      end;
    i_bitrate: dword;
    psz_language: pchar;
    psz_description: pchar;
  end;
  Plibvlc_media_track_t = ^Tlibvlc_media_track_t;
  PPlibvlc_media_track_t = ^Plibvlc_media_track_t;
  PPPlibvlc_media_track_t = ^PPlibvlc_media_track_t;

type
  Plibvlc_media_type_t = ^Tlibvlc_media_type_t;
  Tlibvlc_media_type_t = longint;

const
  libvlc_media_type_unknown = 0;
  libvlc_media_type_file = 1;
  libvlc_media_type_directory = 2;
  libvlc_media_type_disc = 3;
  libvlc_media_type_stream = 4;
  libvlc_media_type_playlist = 5;

type
  Plibvlc_media_parse_flag_t = ^Tlibvlc_media_parse_flag_t;
  Tlibvlc_media_parse_flag_t = longint;

const
  libvlc_media_parse_local = $00;
  libvlc_media_parse_network = $01;
  libvlc_media_fetch_local = $02;
  libvlc_media_fetch_network = $04;
  libvlc_media_do_interact = $08;

type
  Plibvlc_media_parsed_status_t = ^Tlibvlc_media_parsed_status_t;
  Tlibvlc_media_parsed_status_t = longint;

const
  libvlc_media_parsed_status_skipped = 1;
  libvlc_media_parsed_status_failed = 2;
  libvlc_media_parsed_status_timeout = 3;
  libvlc_media_parsed_status_done = 4;

type
  Plibvlc_media_slave_type_t = ^Tlibvlc_media_slave_type_t;
  Tlibvlc_media_slave_type_t = longint;

const
  libvlc_media_slave_type_subtitle = 0;
  libvlc_media_slave_type_audio = 1;

type
  Tlibvlc_media_slave_t = record
    psz_uri: pchar;
    i_type: Tlibvlc_media_slave_type_t;
    i_priority: dword;
  end;
  Plibvlc_media_slave_t = ^Tlibvlc_media_slave_t;
  PPlibvlc_media_slave_t = ^Plibvlc_media_slave_t;
  PPPlibvlc_media_slave_t = ^PPlibvlc_media_slave_t;

  Tlibvlc_media_open_cb = function(opaque: pointer; datap: Ppointer; sizep: Puint64_t): longint; cdecl;
  Tlibvlc_media_read_cb = function(opaque: pointer; buf: pbyte; len: Tsize_t): Tssize_t; cdecl;
  Tlibvlc_media_seek_cb = function(opaque: pointer; offset: Tuint64_t): longint; cdecl;
  Tlibvlc_media_close_cb = procedure(opaque: pointer); cdecl;

function libvlc_media_new_location(p_instance: Plibvlc_instance_t; psz_mrl: pchar): Plibvlc_media_t; cdecl; external libvlc;
function libvlc_media_new_path(p_instance: Plibvlc_instance_t; path: pchar): Plibvlc_media_t; cdecl; external libvlc;
function libvlc_media_new_fd(p_instance: Plibvlc_instance_t; fd: longint): Plibvlc_media_t; cdecl; external libvlc;
function libvlc_media_new_callbacks(instance: Plibvlc_instance_t; open_cb: Tlibvlc_media_open_cb; read_cb: Tlibvlc_media_read_cb; seek_cb: Tlibvlc_media_seek_cb; close_cb: Tlibvlc_media_close_cb;
  opaque: pointer): Plibvlc_media_t; cdecl; external libvlc;
function libvlc_media_new_as_node(p_instance: Plibvlc_instance_t; psz_name: pchar): Plibvlc_media_t; cdecl; external libvlc;
procedure libvlc_media_add_option(p_md: Plibvlc_media_t; psz_options: pchar); cdecl; external libvlc;
procedure libvlc_media_add_option_flag(p_md: Plibvlc_media_t; psz_options: pchar; i_flags: dword); cdecl; external libvlc;
procedure libvlc_media_retain(p_md: Plibvlc_media_t); cdecl; external libvlc;
procedure libvlc_media_release(p_md: Plibvlc_media_t); cdecl; external libvlc;
function libvlc_media_get_mrl(p_md: Plibvlc_media_t): pchar; cdecl; external libvlc;
function libvlc_media_duplicate(p_md: Plibvlc_media_t): Plibvlc_media_t; cdecl; external libvlc;
function libvlc_media_get_meta(p_md: Plibvlc_media_t; e_meta: Tlibvlc_meta_t): pchar; cdecl; external libvlc;
procedure libvlc_media_set_meta(p_md: Plibvlc_media_t; e_meta: Tlibvlc_meta_t; psz_value: pchar); cdecl; external libvlc;
function libvlc_media_save_meta(p_md: Plibvlc_media_t): longint; cdecl; external libvlc;
function libvlc_media_get_state(p_md: Plibvlc_media_t): Tlibvlc_state_t; cdecl; external libvlc;
function libvlc_media_get_stats(p_md: Plibvlc_media_t; p_stats: Plibvlc_media_stats_t): longint; cdecl; external libvlc;
function libvlc_media_subitems(p_md: Plibvlc_media_t): Plibvlc_media_list_t; cdecl; external libvlc;
function libvlc_media_event_manager(p_md: Plibvlc_media_t): Pointer; cdecl; external libvlc;
function libvlc_media_get_duration(p_md: Plibvlc_media_t): Tlibvlc_time_t; cdecl; external libvlc;
function libvlc_media_parse_with_options(p_md: Plibvlc_media_t; parse_flag: Tlibvlc_media_parse_flag_t; timeout: longint): longint; cdecl; external libvlc;
procedure libvlc_media_parse_stop(p_md: Plibvlc_media_t); cdecl; external libvlc;
function libvlc_media_get_parsed_status(p_md: Plibvlc_media_t): Tlibvlc_media_parsed_status_t; cdecl; external libvlc;
procedure libvlc_media_set_user_data(p_md: Plibvlc_media_t; p_new_user_data: pointer); cdecl; external libvlc;
function libvlc_media_get_user_data(p_md: Plibvlc_media_t): pointer; cdecl; external libvlc;
function libvlc_media_tracks_get(p_md: Plibvlc_media_t; tracks: PPPlibvlc_media_track_t): dword; cdecl; external libvlc;
function libvlc_media_get_codec_description(i_type: Tlibvlc_track_type_t; i_codec: Tuint32_t): pchar; cdecl; external libvlc;
procedure libvlc_media_tracks_release(p_tracks: PPlibvlc_media_track_t; i_count: dword); cdecl; external libvlc;
function libvlc_media_get_type(p_md: Plibvlc_media_t): Tlibvlc_media_type_t; cdecl; external libvlc;
function libvlc_media_slaves_add(p_md: Plibvlc_media_t; i_type: Tlibvlc_media_slave_type_t; i_priority: dword; psz_uri: pchar): longint; cdecl; external libvlc;
procedure libvlc_media_slaves_clear(p_md: Plibvlc_media_t); cdecl; external libvlc;
function libvlc_media_slaves_get(p_md: Plibvlc_media_t; ppp_slaves: PPPlibvlc_media_slave_t): dword; cdecl; external libvlc;
procedure libvlc_media_slaves_release(pp_slaves: PPlibvlc_media_slave_t; i_count: dword); cdecl; external libvlc;

// === Konventiert am: 13-10-25 19:24:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
