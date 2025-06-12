{$IFDEF read_interface}


type
  PEmotion_Event = ^TEmotion_Event;
  TEmotion_Event = longint;

const
  EMOTION_EVENT_MENU1 = 0;
  EMOTION_EVENT_MENU2 = 1;
  EMOTION_EVENT_MENU3 = 2;
  EMOTION_EVENT_MENU4 = 3;
  EMOTION_EVENT_MENU5 = 4;
  EMOTION_EVENT_MENU6 = 5;
  EMOTION_EVENT_MENU7 = 6;
  EMOTION_EVENT_UP = 7;
  EMOTION_EVENT_DOWN = 8;
  EMOTION_EVENT_LEFT = 9;
  EMOTION_EVENT_RIGHT = 10;
  EMOTION_EVENT_SELECT = 11;
  EMOTION_EVENT_NEXT = 12;
  EMOTION_EVENT_PREV = 13;
  EMOTION_EVENT_ANGLE_NEXT = 14;
  EMOTION_EVENT_ANGLE_PREV = 15;
  EMOTION_EVENT_FORCE = 16;
  EMOTION_EVENT_0 = 17;
  EMOTION_EVENT_1 = 18;
  EMOTION_EVENT_2 = 19;
  EMOTION_EVENT_3 = 20;
  EMOTION_EVENT_4 = 21;
  EMOTION_EVENT_5 = 22;
  EMOTION_EVENT_6 = 23;
  EMOTION_EVENT_7 = 24;
  EMOTION_EVENT_8 = 25;
  EMOTION_EVENT_9 = 26;
  EMOTION_EVENT_10 = 27;

type
  PEmotion_Meta_Info = ^TEmotion_Meta_Info;
  TEmotion_Meta_Info = longint;

const
  EMOTION_META_INFO_TRACK_TITLE = 0;
  EMOTION_META_INFO_TRACK_ARTIST = 1;
  EMOTION_META_INFO_TRACK_ALBUM = 2;
  EMOTION_META_INFO_TRACK_YEAR = 3;
  EMOTION_META_INFO_TRACK_GENRE = 4;
  EMOTION_META_INFO_TRACK_COMMENT = 5;
  EMOTION_META_INFO_TRACK_DISC_ID = 6;
  EMOTION_META_INFO_TRACK_COUNT = 7;

type
  PEmotion_Artwork_Info = ^TEmotion_Artwork_Info;
  TEmotion_Artwork_Info = longint;

const
  EMOTION_ARTWORK_IMAGE = 0;
  EMOTION_ARTWORK_PREVIEW_IMAGE = 1;

type
  PEmotion_Vis = ^TEmotion_Vis;
  TEmotion_Vis = longint;

const
  EMOTION_VIS_NONE = 0;
  EMOTION_VIS_GOOM = 1;
  EMOTION_VIS_LIBVISUAL_BUMPSCOPE = 2;
  EMOTION_VIS_LIBVISUAL_CORONA = 3;
  EMOTION_VIS_LIBVISUAL_DANCING_PARTICLES = 4;
  EMOTION_VIS_LIBVISUAL_GDKPIXBUF = 5;
  EMOTION_VIS_LIBVISUAL_G_FORCE = 6;
  EMOTION_VIS_LIBVISUAL_GOOM = 7;
  EMOTION_VIS_LIBVISUAL_INFINITE = 8;
  EMOTION_VIS_LIBVISUAL_JAKDAW = 9;
  EMOTION_VIS_LIBVISUAL_JESS = 10;
  EMOTION_VIS_LIBVISUAL_LV_ANALYSER = 11;
  EMOTION_VIS_LIBVISUAL_LV_FLOWER = 12;
  EMOTION_VIS_LIBVISUAL_LV_GLTEST = 13;
  EMOTION_VIS_LIBVISUAL_LV_SCOPE = 14;
  EMOTION_VIS_LIBVISUAL_MADSPIN = 15;
  EMOTION_VIS_LIBVISUAL_NEBULUS = 16;
  EMOTION_VIS_LIBVISUAL_OINKSIE = 17;
  EMOTION_VIS_LIBVISUAL_PLASMA = 18;
  EMOTION_VIS_LAST = 19;

type
  PEmotion_Suspend = ^TEmotion_Suspend;
  TEmotion_Suspend = longint;

const
  EMOTION_WAKEUP = 0;
  EMOTION_SLEEP = 1;
  EMOTION_DEEP_SLEEP = 2;
  EMOTION_HIBERNATE = 3;

type
  PEmotion_Aspect = ^TEmotion_Aspect;
  TEmotion_Aspect = longint;

const
  EMOTION_ASPECT_KEEP_NONE = 0;
  EMOTION_ASPECT_KEEP_WIDTH = 1;
  EMOTION_ASPECT_KEEP_HEIGHT = 2;
  EMOTION_ASPECT_KEEP_BOTH = 3;
  EMOTION_ASPECT_CROP = 4;
  EMOTION_ASPECT_CUSTOM = 5;

const
  EMOTION_CHANNEL_AUTO = -(1);
  EMOTION_CHANNEL_DEFAULT = 0;
  EMOTION_VERSION_MAJOR = EFL_VERSION_MAJOR;
  EMOTION_VERSION_MINOR = EFL_VERSION_MINOR;

type
  TEmotion_Version = record
    major: longint;
    minor: longint;
    micro: longint;
    revision: longint;
  end;
  PEmotion_Version = ^TEmotion_Version;

var
  emotion_version: PEmotion_Version; cvar;external libemotion;

function emotion_init: TEina_Bool; cdecl; external libemotion;
function emotion_shutdown: TEina_Bool; cdecl; external libemotion;
function emotion_object_add(evas: PEvas): PEvas_Object; cdecl; external libemotion;
procedure emotion_object_border_set(obj: PEvas_Object; l: longint; r: longint; t: longint; b: longint); cdecl; external libemotion;
procedure emotion_object_border_get(obj: PEvas_Object; l: Plongint; r: Plongint; t: Plongint; b: Plongint); cdecl; external libemotion;
procedure emotion_object_bg_color_set(obj: PEvas_Object; r: longint; g: longint; b: longint; a: longint); cdecl; external libemotion;
procedure emotion_object_bg_color_get(obj: PEvas_Object; r: Plongint; g: Plongint; b: Plongint; a: Plongint); cdecl; external libemotion;
procedure emotion_object_keep_aspect_set(obj: PEvas_Object; a: TEmotion_Aspect); cdecl; external libemotion;
function emotion_object_keep_aspect_get(obj: PEvas_Object): TEmotion_Aspect; cdecl; external libemotion;
function emotion_object_file_set(obj: PEvas_Object; filename: pchar): TEina_Bool; cdecl; external libemotion;
function emotion_object_file_get(obj: PEvas_Object): pchar; cdecl; external libemotion;
procedure emotion_object_play_set(obj: PEvas_Object; play: TEina_Bool); cdecl; external libemotion;
function emotion_object_play_get(obj: PEvas_Object): TEina_Bool; cdecl; external libemotion;
procedure emotion_object_position_set(obj: PEvas_Object; sec: double); cdecl; external libemotion;
function emotion_object_position_get(obj: PEvas_Object): double; cdecl; external libemotion;
function emotion_object_buffer_size_get(obj: PEvas_Object): double; cdecl; external libemotion;
function emotion_object_seekable_get(obj: PEvas_Object): TEina_Bool; cdecl; external libemotion;
function emotion_object_play_length_get(obj: PEvas_Object): double; cdecl; external libemotion;
procedure emotion_object_play_speed_set(obj: PEvas_Object; speed: double); cdecl; external libemotion;
function emotion_object_play_speed_get(obj: PEvas_Object): double; cdecl; external libemotion;
function emotion_object_progress_info_get(obj: PEvas_Object): pchar; cdecl; external libemotion;
function emotion_object_progress_status_get(obj: PEvas_Object): double; cdecl; external libemotion;
function emotion_object_video_handled_get(obj: PEvas_Object): TEina_Bool; cdecl; external libemotion;
function emotion_object_audio_handled_get(obj: PEvas_Object): TEina_Bool; cdecl; external libemotion;
function emotion_object_ratio_get(obj: PEvas_Object): double; cdecl; external libemotion;
procedure emotion_object_size_get(obj: PEvas_Object; iw: Plongint; ih: Plongint); cdecl; external libemotion;
procedure emotion_object_smooth_scale_set(obj: PEvas_Object; smooth: TEina_Bool); cdecl; external libemotion;
function emotion_object_smooth_scale_get(obj: PEvas_Object): TEina_Bool; cdecl; external libemotion;
procedure emotion_object_event_simple_send(obj: PEvas_Object; ev: TEmotion_Event); cdecl; external libemotion;
procedure emotion_object_audio_volume_set(obj: PEvas_Object; vol: double); cdecl; external libemotion;
function emotion_object_audio_volume_get(obj: PEvas_Object): double; cdecl; external libemotion;
procedure emotion_object_audio_mute_set(obj: PEvas_Object; mute: TEina_Bool); cdecl; external libemotion;
function emotion_object_audio_mute_get(obj: PEvas_Object): TEina_Bool; cdecl; external libemotion;
function emotion_object_audio_channel_count(obj: PEvas_Object): longint; cdecl; external libemotion;
function emotion_object_audio_channel_name_get(obj: PEvas_Object; channel: longint): pchar; cdecl; external libemotion;
procedure emotion_object_audio_channel_set(obj: PEvas_Object; channel: longint); cdecl; external libemotion;
function emotion_object_audio_channel_get(obj: PEvas_Object): longint; cdecl; external libemotion;
procedure emotion_object_video_mute_set(obj: PEvas_Object; mute: TEina_Bool); cdecl; external libemotion;
function emotion_object_video_mute_get(obj: PEvas_Object): TEina_Bool; cdecl; external libemotion;
procedure emotion_object_video_subtitle_file_set(obj: PEvas_Object; filepath: pchar); cdecl; external libemotion;
function emotion_object_video_subtitle_file_get(obj: PEvas_Object): pchar; cdecl; external libemotion;
function emotion_object_video_channel_count(obj: PEvas_Object): longint; cdecl; external libemotion;
function emotion_object_video_channel_name_get(obj: PEvas_Object; channel: longint): pchar; cdecl; external libemotion;
procedure emotion_object_video_channel_set(obj: PEvas_Object; channel: longint); cdecl; external libemotion;
function emotion_object_video_channel_get(obj: PEvas_Object): longint; cdecl; external libemotion;
procedure emotion_object_spu_mute_set(obj: PEvas_Object; mute: TEina_Bool); cdecl; external libemotion;
function emotion_object_spu_mute_get(obj: PEvas_Object): TEina_Bool; cdecl; external libemotion;
function emotion_object_spu_channel_count(obj: PEvas_Object): longint; cdecl; external libemotion;
function emotion_object_spu_channel_name_get(obj: PEvas_Object; channel: longint): pchar; cdecl; external libemotion;
procedure emotion_object_spu_channel_set(obj: PEvas_Object; channel: longint); cdecl; external libemotion;
function emotion_object_spu_channel_get(obj: PEvas_Object): longint; cdecl; external libemotion;
function emotion_object_chapter_count(obj: PEvas_Object): longint; cdecl; external libemotion;
procedure emotion_object_chapter_set(obj: PEvas_Object; chapter: longint); cdecl; external libemotion;
function emotion_object_chapter_get(obj: PEvas_Object): longint; cdecl; external libemotion;
function emotion_object_chapter_name_get(obj: PEvas_Object; chapter: longint): pchar; cdecl; external libemotion;
procedure emotion_object_eject(obj: PEvas_Object); cdecl; external libemotion;
function emotion_object_title_get(obj: PEvas_Object): pchar; cdecl; external libemotion;
function emotion_object_ref_file_get(obj: PEvas_Object): pchar; cdecl; external libemotion;
function emotion_object_ref_num_get(obj: PEvas_Object): longint; cdecl; external libemotion;
function emotion_object_spu_button_count_get(obj: PEvas_Object): longint; cdecl; external libemotion;
function emotion_object_spu_button_get(obj: PEvas_Object): longint; cdecl; external libemotion;
function emotion_object_meta_info_get(obj: PEvas_Object; meta: TEmotion_Meta_Info): pchar; cdecl; external libemotion;
procedure emotion_object_vis_set(obj: PEvas_Object; visualization: TEmotion_Vis); cdecl; external libemotion;
function emotion_object_vis_get(obj: PEvas_Object): TEmotion_Vis; cdecl; external libemotion;
function emotion_object_vis_supported(obj: PEvas_Object; visualization: TEmotion_Vis): TEina_Bool; cdecl; external libemotion;
procedure emotion_object_priority_set(obj: PEvas_Object; priority: TEina_Bool); cdecl; external libemotion;
function emotion_object_priority_get(obj: PEvas_Object): TEina_Bool; cdecl; external libemotion;
procedure emotion_object_suspend_set(obj: PEvas_Object; state: TEmotion_Suspend); cdecl; external libemotion;
function emotion_object_suspend_get(obj: PEvas_Object): TEmotion_Suspend; cdecl; external libemotion;
procedure emotion_object_last_position_load(obj: PEvas_Object); cdecl; external libemotion;
procedure emotion_object_last_position_save(obj: PEvas_Object); cdecl; external libemotion;
function emotion_object_extension_may_play_fast_get(file_: pchar): TEina_Bool; cdecl; external libemotion;
function emotion_object_extension_may_play_get(file_: pchar): TEina_Bool; cdecl; external libemotion;
function emotion_object_image_get(obj: PEvas_Object): PEvas_Object; cdecl; external libemotion;

type
  TEmotion_Webcam = record
  end;
  PEmotion_Webcam = ^TEmotion_Webcam;

var
  EMOTION_WEBCAM_UPDATE: longint; cvar;external libemotion;
  EMOTION_WEBCAM_ADD: longint; cvar;external libemotion;
  EMOTION_WEBCAM_DEL: longint; cvar;external libemotion;

function emotion_webcams_get: PEina_List; cdecl; external libemotion;
function emotion_webcam_name_get(ew: PEmotion_Webcam): pchar; cdecl; external libemotion;
function emotion_webcam_device_get(ew: PEmotion_Webcam): pchar; cdecl; external libemotion;
function emotion_file_meta_artwork_get(obj: PEvas_Object; path: pchar; _type: TEmotion_Artwork_Info): PEvas_Object; cdecl; external libemotion;

// === Konventiert am: 12-6-25 14:08:12 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
