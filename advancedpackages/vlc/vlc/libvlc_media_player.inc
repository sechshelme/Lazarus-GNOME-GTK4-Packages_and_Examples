{$IFDEF read_interface}


type
  Plibvlc_media_player_t = type Pointer;

  Plibvlc_track_description_t = ^Tlibvlc_track_description_t;

  Tlibvlc_track_description_t = record
    i_id: longint;
    psz_name: pchar;
    p_next: Plibvlc_track_description_t;
  end;

const
  libvlc_title_menu = $01;
  libvlc_title_interactive = $02;

type
  Tlibvlc_title_description_t = record
    i_duration: Tint64_t;
    psz_name: pchar;
    i_flags: dword;
  end;
  Plibvlc_title_description_t = ^Tlibvlc_title_description_t;
  PPlibvlc_title_description_t = ^Plibvlc_title_description_t;
  PPPlibvlc_title_description_t = ^PPlibvlc_title_description_t;

  Tlibvlc_chapter_description_t = record
    i_time_offset: Tint64_t;
    i_duration: Tint64_t;
    psz_name: pchar;
  end;
  Plibvlc_chapter_description_t = ^Tlibvlc_chapter_description_t;
  PPlibvlc_chapter_description_t = ^Plibvlc_chapter_description_t;
  PPPlibvlc_chapter_description_t = ^PPlibvlc_chapter_description_t;

  Plibvlc_audio_output_t = ^Tlibvlc_audio_output_t;

  Tlibvlc_audio_output_t = record
    psz_name: pchar;
    psz_description: pchar;
    p_next: Plibvlc_audio_output_t;
  end;

  Plibvlc_audio_output_device_t = ^Tlibvlc_audio_output_device_t;

  Tlibvlc_audio_output_device_t = record
    p_next: Plibvlc_audio_output_device_t;
    psz_device: pchar;
    psz_description: pchar;
  end;

type
  Plibvlc_video_marquee_option_t = ^Tlibvlc_video_marquee_option_t;
  Tlibvlc_video_marquee_option_t = longint;

const
  libvlc_marquee_Enable = 0;
  libvlc_marquee_Text = 1;
  libvlc_marquee_Color = 2;
  libvlc_marquee_Opacity = 3;
  libvlc_marquee_Position = 4;
  libvlc_marquee_Refresh = 5;
  libvlc_marquee_Size = 6;
  libvlc_marquee_Timeout = 7;
  libvlc_marquee_X = 8;
  libvlc_marquee_Y = 9;

type
  Plibvlc_navigate_mode_t = ^Tlibvlc_navigate_mode_t;
  Tlibvlc_navigate_mode_t = longint;

const
  libvlc_navigate_activate = 0;
  libvlc_navigate_up = 1;
  libvlc_navigate_down = 2;
  libvlc_navigate_left = 3;
  libvlc_navigate_right = 4;
  libvlc_navigate_popup = 5;

type
  Plibvlc_position_t = ^Tlibvlc_position_t;
  Tlibvlc_position_t = longint;

const
  libvlc_position_disable = -(1);
  libvlc_position_center = (-(1)) + 1;
  libvlc_position_left = (-(1)) + 2;
  libvlc_position_right = (-(1)) + 3;
  libvlc_position_top = (-(1)) + 4;
  libvlc_position_top_left = (-(1)) + 5;
  libvlc_position_top_right = (-(1)) + 6;
  libvlc_position_bottom = (-(1)) + 7;
  libvlc_position_bottom_left = (-(1)) + 8;
  libvlc_position_bottom_right = (-(1)) + 9;

type
  Plibvlc_teletext_key_t = ^Tlibvlc_teletext_key_t;
  Tlibvlc_teletext_key_t = longint;

const
  libvlc_teletext_key_red = longint('r') shl 16;
  libvlc_teletext_key_green = longint('g') shl 16;
  libvlc_teletext_key_yellow = longint('y') shl 16;
  libvlc_teletext_key_blue = longint('b') shl 16;
  libvlc_teletext_key_index = longint('i') shl 16;

type
  Plibvlc_equalizer_t = type Pointer;

function libvlc_media_player_new(p_libvlc_instance: Plibvlc_instance_t): Plibvlc_media_player_t; cdecl; external libvlc;
function libvlc_media_player_new_from_media(p_md: Plibvlc_media_t): Plibvlc_media_player_t; cdecl; external libvlc;
procedure libvlc_media_player_release(p_mi: Plibvlc_media_player_t); cdecl; external libvlc;
procedure libvlc_media_player_retain(p_mi: Plibvlc_media_player_t); cdecl; external libvlc;
procedure libvlc_media_player_set_media(p_mi: Plibvlc_media_player_t; p_md: Plibvlc_media_t); cdecl; external libvlc;
function libvlc_media_player_get_media(p_mi: Plibvlc_media_player_t): Plibvlc_media_t; cdecl; external libvlc;
function libvlc_media_player_event_manager(p_mi: Plibvlc_media_player_t): Plibvlc_event_manager_t; cdecl; external libvlc;
function libvlc_media_player_is_playing(p_mi: Plibvlc_media_player_t): longint; cdecl; external libvlc;
function libvlc_media_player_play(p_mi: Plibvlc_media_player_t): longint; cdecl; external libvlc;
procedure libvlc_media_player_set_pause(mp: Plibvlc_media_player_t; do_pause: longint); cdecl; external libvlc;
procedure libvlc_media_player_pause(p_mi: Plibvlc_media_player_t); cdecl; external libvlc;
procedure libvlc_media_player_stop(p_mi: Plibvlc_media_player_t); cdecl; external libvlc;
function libvlc_media_player_set_renderer(p_mi: Plibvlc_media_player_t; p_item: Plibvlc_renderer_item_t): longint; cdecl; external libvlc;

type
  Tlibvlc_video_lock_cb = function(opaque: pointer; planes: Ppointer): pointer; cdecl;
  Tlibvlc_video_unlock_cb = procedure(opaque: pointer; picture: pointer; planes: Ppointer); cdecl;
  Tlibvlc_video_display_cb = procedure(opaque: pointer; picture: pointer); cdecl;
  Tlibvlc_video_format_cb = function(opaque: Ppointer; chroma: pchar; width: Pdword; height: Pdword; pitches: Pdword; lines: Pdword): dword; cdecl;
  Tlibvlc_video_cleanup_cb = procedure(opaque: pointer); cdecl;

procedure libvlc_video_set_callbacks(mp: Plibvlc_media_player_t; lock: Tlibvlc_video_lock_cb; unlock: Tlibvlc_video_unlock_cb; display: Tlibvlc_video_display_cb; opaque: pointer); cdecl; external libvlc;
procedure libvlc_video_set_format(mp: Plibvlc_media_player_t; chroma: pchar; width: dword; height: dword; pitch: dword); cdecl; external libvlc;
procedure libvlc_video_set_format_callbacks(mp: Plibvlc_media_player_t; setup: Tlibvlc_video_format_cb; cleanup: Tlibvlc_video_cleanup_cb); cdecl; external libvlc;
procedure libvlc_media_player_set_nsobject(p_mi: Plibvlc_media_player_t; drawable: pointer); cdecl; external libvlc;
function libvlc_media_player_get_nsobject(p_mi: Plibvlc_media_player_t): pointer; cdecl; external libvlc;
procedure libvlc_media_player_set_xwindow(p_mi: Plibvlc_media_player_t; drawable: Tuint32_t); cdecl; external libvlc;
function libvlc_media_player_get_xwindow(p_mi: Plibvlc_media_player_t): Tuint32_t; cdecl; external libvlc;
procedure libvlc_media_player_set_hwnd(p_mi: Plibvlc_media_player_t; drawable: pointer); cdecl; external libvlc;
function libvlc_media_player_get_hwnd(p_mi: Plibvlc_media_player_t): pointer; cdecl; external libvlc;
procedure libvlc_media_player_set_android_context(p_mi: Plibvlc_media_player_t; p_awindow_handler: pointer); cdecl; external libvlc;
function libvlc_media_player_set_evas_object(p_mi: Plibvlc_media_player_t; p_evas_object: pointer): longint; cdecl; external libvlc;

type
  Tlibvlc_audio_play_cb = procedure(data: pointer; samples: pointer; count: dword; pts: Tint64_t); cdecl;
  Tlibvlc_audio_pause_cb = procedure(data: pointer; pts: Tint64_t); cdecl;
  Tlibvlc_audio_resume_cb = procedure(data: pointer; pts: Tint64_t); cdecl;
  Tlibvlc_audio_flush_cb = procedure(data: pointer; pts: Tint64_t); cdecl;
  Tlibvlc_audio_drain_cb = procedure(data: pointer); cdecl;
  Tlibvlc_audio_set_volume_cb = procedure(data: pointer; volume: single; mute: boolean); cdecl;

procedure libvlc_audio_set_callbacks(mp: Plibvlc_media_player_t; play: Tlibvlc_audio_play_cb; pause: Tlibvlc_audio_pause_cb; resume: Tlibvlc_audio_resume_cb; flush: Tlibvlc_audio_flush_cb;
  drain: Tlibvlc_audio_drain_cb; opaque: pointer); cdecl; external libvlc;
procedure libvlc_audio_set_volume_callback(mp: Plibvlc_media_player_t; set_volume: Tlibvlc_audio_set_volume_cb); cdecl; external libvlc;

type
  Tlibvlc_audio_setup_cb = function(data: Ppointer; format: pchar; rate: Pdword; channels: Pdword): longint; cdecl;
  Tlibvlc_audio_cleanup_cb = procedure(data: pointer); cdecl;

procedure libvlc_audio_set_format_callbacks(mp: Plibvlc_media_player_t; setup: Tlibvlc_audio_setup_cb; cleanup: Tlibvlc_audio_cleanup_cb); cdecl; external libvlc;
procedure libvlc_audio_set_format(mp: Plibvlc_media_player_t; format: pchar; rate: dword; channels: dword); cdecl; external libvlc;
function libvlc_media_player_get_length(p_mi: Plibvlc_media_player_t): Tlibvlc_time_t; cdecl; external libvlc;
function libvlc_media_player_get_time(p_mi: Plibvlc_media_player_t): Tlibvlc_time_t; cdecl; external libvlc;
procedure libvlc_media_player_set_time(p_mi: Plibvlc_media_player_t; i_time: Tlibvlc_time_t); cdecl; external libvlc;
function libvlc_media_player_get_position(p_mi: Plibvlc_media_player_t): single; cdecl; external libvlc;
procedure libvlc_media_player_set_position(p_mi: Plibvlc_media_player_t; f_pos: single); cdecl; external libvlc;
procedure libvlc_media_player_set_chapter(p_mi: Plibvlc_media_player_t; i_chapter: longint); cdecl; external libvlc;
function libvlc_media_player_get_chapter(p_mi: Plibvlc_media_player_t): longint; cdecl; external libvlc;
function libvlc_media_player_get_chapter_count(p_mi: Plibvlc_media_player_t): longint; cdecl; external libvlc;
function libvlc_media_player_will_play(p_mi: Plibvlc_media_player_t): longint; cdecl; external libvlc;
function libvlc_media_player_get_chapter_count_for_title(p_mi: Plibvlc_media_player_t; i_title: longint): longint; cdecl; external libvlc;
procedure libvlc_media_player_set_title(p_mi: Plibvlc_media_player_t; i_title: longint); cdecl; external libvlc;
function libvlc_media_player_get_title(p_mi: Plibvlc_media_player_t): longint; cdecl; external libvlc;
function libvlc_media_player_get_title_count(p_mi: Plibvlc_media_player_t): longint; cdecl; external libvlc;
procedure libvlc_media_player_previous_chapter(p_mi: Plibvlc_media_player_t); cdecl; external libvlc;
procedure libvlc_media_player_next_chapter(p_mi: Plibvlc_media_player_t); cdecl; external libvlc;
function libvlc_media_player_get_rate(p_mi: Plibvlc_media_player_t): single; cdecl; external libvlc;
function libvlc_media_player_set_rate(p_mi: Plibvlc_media_player_t; rate: single): longint; cdecl; external libvlc;
function libvlc_media_player_get_state(p_mi: Plibvlc_media_player_t): Tlibvlc_state_t; cdecl; external libvlc;
function libvlc_media_player_has_vout(p_mi: Plibvlc_media_player_t): dword; cdecl; external libvlc;
function libvlc_media_player_is_seekable(p_mi: Plibvlc_media_player_t): longint; cdecl; external libvlc;
function libvlc_media_player_can_pause(p_mi: Plibvlc_media_player_t): longint; cdecl; external libvlc;
function libvlc_media_player_program_scrambled(p_mi: Plibvlc_media_player_t): longint; cdecl; external libvlc;
procedure libvlc_media_player_next_frame(p_mi: Plibvlc_media_player_t); cdecl; external libvlc;
procedure libvlc_media_player_navigate(p_mi: Plibvlc_media_player_t; navigate: dword); cdecl; external libvlc;
procedure libvlc_media_player_set_video_title_display(p_mi: Plibvlc_media_player_t; position: Tlibvlc_position_t; timeout: dword); cdecl; external libvlc;
function libvlc_media_player_add_slave(p_mi: Plibvlc_media_player_t; i_type: Tlibvlc_media_slave_type_t; psz_uri: pchar; b_select: boolean): longint; cdecl; external libvlc;
procedure libvlc_track_description_list_release(p_track_description: Plibvlc_track_description_t); cdecl; external libvlc;
procedure libvlc_toggle_fullscreen(p_mi: Plibvlc_media_player_t); cdecl; external libvlc;
procedure libvlc_set_fullscreen(p_mi: Plibvlc_media_player_t; b_fullscreen: longint); cdecl; external libvlc;
function libvlc_get_fullscreen(p_mi: Plibvlc_media_player_t): longint; cdecl; external libvlc;
procedure libvlc_video_set_key_input(p_mi: Plibvlc_media_player_t; on: dword); cdecl; external libvlc;
procedure libvlc_video_set_mouse_input(p_mi: Plibvlc_media_player_t; on: dword); cdecl; external libvlc;
function libvlc_video_get_size(p_mi: Plibvlc_media_player_t; num: dword; px: Pdword; py: Pdword): longint; cdecl; external libvlc;
function libvlc_video_get_cursor(p_mi: Plibvlc_media_player_t; num: dword; px: Plongint; py: Plongint): longint; cdecl; external libvlc;
function libvlc_video_get_scale(p_mi: Plibvlc_media_player_t): single; cdecl; external libvlc;
procedure libvlc_video_set_scale(p_mi: Plibvlc_media_player_t; f_factor: single); cdecl; external libvlc;
function libvlc_video_get_aspect_ratio(p_mi: Plibvlc_media_player_t): pchar; cdecl; external libvlc;
procedure libvlc_video_set_aspect_ratio(p_mi: Plibvlc_media_player_t; psz_aspect: pchar); cdecl; external libvlc;
function libvlc_video_new_viewpoint: Plibvlc_video_viewpoint_t; cdecl; external libvlc;
function libvlc_video_update_viewpoint(p_mi: Plibvlc_media_player_t; p_viewpoint: Plibvlc_video_viewpoint_t; b_absolute: boolean): longint; cdecl; external libvlc;
function libvlc_video_get_spu(p_mi: Plibvlc_media_player_t): longint; cdecl; external libvlc;
function libvlc_video_get_spu_count(p_mi: Plibvlc_media_player_t): longint; cdecl; external libvlc;
function libvlc_video_get_spu_description(p_mi: Plibvlc_media_player_t): Plibvlc_track_description_t; cdecl; external libvlc;
function libvlc_video_set_spu(p_mi: Plibvlc_media_player_t; i_spu: longint): longint; cdecl; external libvlc;
function libvlc_video_get_spu_delay(p_mi: Plibvlc_media_player_t): Tint64_t; cdecl; external libvlc;
function libvlc_video_set_spu_delay(p_mi: Plibvlc_media_player_t; i_delay: Tint64_t): longint; cdecl; external libvlc;
function libvlc_media_player_get_full_title_descriptions(p_mi: Plibvlc_media_player_t; titles: PPPlibvlc_title_description_t): longint; cdecl; external libvlc;
procedure libvlc_title_descriptions_release(p_titles: PPlibvlc_title_description_t; i_count: dword); cdecl; external libvlc;
function libvlc_media_player_get_full_chapter_descriptions(p_mi: Plibvlc_media_player_t; i_chapters_of_title: longint; pp_chapters: PPPlibvlc_chapter_description_t): longint; cdecl; external libvlc;
procedure libvlc_chapter_descriptions_release(p_chapters: PPlibvlc_chapter_description_t; i_count: dword); cdecl; external libvlc;
function libvlc_video_get_crop_geometry(p_mi: Plibvlc_media_player_t): pchar; cdecl; external libvlc;
procedure libvlc_video_set_crop_geometry(p_mi: Plibvlc_media_player_t; psz_geometry: pchar); cdecl; external libvlc;
function libvlc_video_get_teletext(p_mi: Plibvlc_media_player_t): longint; cdecl; external libvlc;
procedure libvlc_video_set_teletext(p_mi: Plibvlc_media_player_t; i_page: longint); cdecl; external libvlc;
function libvlc_video_get_track_count(p_mi: Plibvlc_media_player_t): longint; cdecl; external libvlc;
function libvlc_video_get_track_description(p_mi: Plibvlc_media_player_t): Plibvlc_track_description_t; cdecl; external libvlc;
function libvlc_video_get_track(p_mi: Plibvlc_media_player_t): longint; cdecl; external libvlc;
function libvlc_video_set_track(p_mi: Plibvlc_media_player_t; i_track: longint): longint; cdecl; external libvlc;
function libvlc_video_take_snapshot(p_mi: Plibvlc_media_player_t; num: dword; psz_filepath: pchar; i_width: dword; i_height: dword): longint; cdecl; external libvlc;
procedure libvlc_video_set_deinterlace(p_mi: Plibvlc_media_player_t; psz_mode: pchar); cdecl; external libvlc;
function libvlc_video_get_marquee_int(p_mi: Plibvlc_media_player_t; option: dword): longint; cdecl; external libvlc;
function libvlc_video_get_marquee_string(p_mi: Plibvlc_media_player_t; option: dword): pchar; cdecl; external libvlc;
procedure libvlc_video_set_marquee_int(p_mi: Plibvlc_media_player_t; option: dword; i_val: longint); cdecl; external libvlc;
procedure libvlc_video_set_marquee_string(p_mi: Plibvlc_media_player_t; option: dword; psz_text: pchar); cdecl; external libvlc;

type
  Tlibvlc_video_logo_option_t = longint;

const
  libvlc_logo_enable = 0;
  libvlc_logo_file = 1;
  libvlc_logo_x = 2;
  libvlc_logo_y = 3;
  libvlc_logo_delay = 4;
  libvlc_logo_repeat = 5;
  libvlc_logo_opacity = 6;
  libvlc_logo_position = 7;

function libvlc_video_get_logo_int(p_mi: Plibvlc_media_player_t; option: dword): longint; cdecl; external libvlc;
procedure libvlc_video_set_logo_int(p_mi: Plibvlc_media_player_t; option: dword; value: longint); cdecl; external libvlc;
procedure libvlc_video_set_logo_string(p_mi: Plibvlc_media_player_t; option: dword; psz_value: pchar); cdecl; external libvlc;

type
  Tlibvlc_video_adjust_option_t = longint;

const
  libvlc_adjust_Enable = 0;
  libvlc_adjust_Contrast = 1;
  libvlc_adjust_Brightness = 2;
  libvlc_adjust_Hue = 3;
  libvlc_adjust_Saturation = 4;
  libvlc_adjust_Gamma = 5;

function libvlc_video_get_adjust_int(p_mi: Plibvlc_media_player_t; option: dword): longint; cdecl; external libvlc;
procedure libvlc_video_set_adjust_int(p_mi: Plibvlc_media_player_t; option: dword; value: longint); cdecl; external libvlc;
function libvlc_video_get_adjust_float(p_mi: Plibvlc_media_player_t; option: dword): single; cdecl; external libvlc;
procedure libvlc_video_set_adjust_float(p_mi: Plibvlc_media_player_t; option: dword; value: single); cdecl; external libvlc;

type
  Plibvlc_audio_output_device_types_t = ^Tlibvlc_audio_output_device_types_t;
  Tlibvlc_audio_output_device_types_t = longint;

const
  libvlc_AudioOutputDevice_Error = -(1);
  libvlc_AudioOutputDevice_Mono = 1;
  libvlc_AudioOutputDevice_Stereo = 2;
  libvlc_AudioOutputDevice_2F2R = 4;
  libvlc_AudioOutputDevice_3F2R = 5;
  libvlc_AudioOutputDevice_5_1 = 6;
  libvlc_AudioOutputDevice_6_1 = 7;
  libvlc_AudioOutputDevice_7_1 = 8;
  libvlc_AudioOutputDevice_SPDIF = 10;

type
  Plibvlc_audio_output_channel_t = ^Tlibvlc_audio_output_channel_t;
  Tlibvlc_audio_output_channel_t = longint;

const
  libvlc_AudioChannel_Error = -(1);
  libvlc_AudioChannel_Stereo = 1;
  libvlc_AudioChannel_RStereo = 2;
  libvlc_AudioChannel_Left = 3;
  libvlc_AudioChannel_Right = 4;
  libvlc_AudioChannel_Dolbys = 5;

function libvlc_audio_output_list_get(p_instance: Plibvlc_instance_t): Plibvlc_audio_output_t; cdecl; external libvlc;
procedure libvlc_audio_output_list_release(p_list: Plibvlc_audio_output_t); cdecl; external libvlc;
function libvlc_audio_output_set(p_mi: Plibvlc_media_player_t; psz_name: pchar): longint; cdecl; external libvlc;
function libvlc_audio_output_device_enum(mp: Plibvlc_media_player_t): Plibvlc_audio_output_device_t; cdecl; external libvlc;
function libvlc_audio_output_device_list_get(p_instance: Plibvlc_instance_t; aout: pchar): Plibvlc_audio_output_device_t; cdecl; external libvlc;
procedure libvlc_audio_output_device_list_release(p_list: Plibvlc_audio_output_device_t); cdecl; external libvlc;
procedure libvlc_audio_output_device_set(mp: Plibvlc_media_player_t; module: pchar; device_id: pchar); cdecl; external libvlc;
function libvlc_audio_output_device_get(mp: Plibvlc_media_player_t): pchar; cdecl; external libvlc;
procedure libvlc_audio_toggle_mute(p_mi: Plibvlc_media_player_t); cdecl; external libvlc;
function libvlc_audio_get_mute(p_mi: Plibvlc_media_player_t): longint; cdecl; external libvlc;
procedure libvlc_audio_set_mute(p_mi: Plibvlc_media_player_t; status: longint); cdecl; external libvlc;
function libvlc_audio_get_volume(p_mi: Plibvlc_media_player_t): longint; cdecl; external libvlc;
function libvlc_audio_set_volume(p_mi: Plibvlc_media_player_t; i_volume: longint): longint; cdecl; external libvlc;
function libvlc_audio_get_track_count(p_mi: Plibvlc_media_player_t): longint; cdecl; external libvlc;
function libvlc_audio_get_track_description(p_mi: Plibvlc_media_player_t): Plibvlc_track_description_t; cdecl; external libvlc;
function libvlc_audio_get_track(p_mi: Plibvlc_media_player_t): longint; cdecl; external libvlc;
function libvlc_audio_set_track(p_mi: Plibvlc_media_player_t; i_track: longint): longint; cdecl; external libvlc;
function libvlc_audio_get_channel(p_mi: Plibvlc_media_player_t): longint; cdecl; external libvlc;
function libvlc_audio_set_channel(p_mi: Plibvlc_media_player_t; channel: longint): longint; cdecl; external libvlc;
function libvlc_audio_get_delay(p_mi: Plibvlc_media_player_t): Tint64_t; cdecl; external libvlc;
function libvlc_audio_set_delay(p_mi: Plibvlc_media_player_t; i_delay: Tint64_t): longint; cdecl; external libvlc;
function libvlc_audio_equalizer_get_preset_count: dword; cdecl; external libvlc;
function libvlc_audio_equalizer_get_preset_name(u_index: dword): pchar; cdecl; external libvlc;
function libvlc_audio_equalizer_get_band_count: dword; cdecl; external libvlc;
function libvlc_audio_equalizer_get_band_frequency(u_index: dword): single; cdecl; external libvlc;
function libvlc_audio_equalizer_new: Plibvlc_equalizer_t; cdecl; external libvlc;
function libvlc_audio_equalizer_new_from_preset(u_index: dword): Plibvlc_equalizer_t; cdecl; external libvlc;
procedure libvlc_audio_equalizer_release(p_equalizer: Plibvlc_equalizer_t); cdecl; external libvlc;
function libvlc_audio_equalizer_set_preamp(p_equalizer: Plibvlc_equalizer_t; f_preamp: single): longint; cdecl; external libvlc;
function libvlc_audio_equalizer_get_preamp(p_equalizer: Plibvlc_equalizer_t): single; cdecl; external libvlc;
function libvlc_audio_equalizer_set_amp_at_index(p_equalizer: Plibvlc_equalizer_t; f_amp: single; u_band: dword): longint; cdecl; external libvlc;
function libvlc_audio_equalizer_get_amp_at_index(p_equalizer: Plibvlc_equalizer_t; u_band: dword): single; cdecl; external libvlc;
function libvlc_media_player_set_equalizer(p_mi: Plibvlc_media_player_t; p_equalizer: Plibvlc_equalizer_t): longint; cdecl; external libvlc;

type
  Plibvlc_media_player_role = ^Tlibvlc_media_player_role;
  Tlibvlc_media_player_role = longint;

const
  libvlc_role_None = 0;
  libvlc_role_Music = 1;
  libvlc_role_Video = 2;
  libvlc_role_Communication = 3;
  libvlc_role_Game = 4;
  libvlc_role_Notification = 5;
  libvlc_role_Animation = 6;
  libvlc_role_Production = 7;
  libvlc_role_Accessibility = 8;
  libvlc_role_Test = 9;

  libvlc_role_Last = libvlc_role_Test;

type
  Tlibvlc_media_player_role_t = Tlibvlc_media_player_role;
  Plibvlc_media_player_role_t = ^Tlibvlc_media_player_role_t;

function libvlc_media_player_get_role(p_mi: Plibvlc_media_player_t): longint; cdecl; external libvlc;
function libvlc_media_player_set_role(p_mi: Plibvlc_media_player_t; role: dword): longint; cdecl; external libvlc;

// === Konventiert am: 13-10-25 19:24:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
