unit fp_ethumb;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  __ETHUMB_H__ = 1;

const
  ETHUMB_VERSION_MAJOR = EFL_VERSION_MAJOR;
  ETHUMB_VERSION_MINOR = EFL_VERSION_MINOR;

type
  TEthumb_Version = record
    major: longint;
    minor: longint;
    micro: longint;
    revision: longint;
  end;
  PEthumb_Version = ^TEthumb_Version;

var
  ethumb_version: PEthumb_Version; cvar;external libethumb;

type
  TEthumb = record
  end;
  PEthumb = ^TEthumb;

  TEthumb_Generate_Cb = procedure(data: pointer; e: PEthumb; success: TEina_Bool); cdecl;

function ethumb_init: longint; cdecl; external libethumb;
function ethumb_shutdown: longint; cdecl; external libethumb;
function ethumb_new: PEthumb; cdecl; external libethumb;
procedure ethumb_free(e: PEthumb); cdecl; external libethumb;
function ethumb_frame_set(e: PEthumb; theme_file: pchar; group: pchar; swallow: pchar): TEina_Bool; cdecl; external libethumb;
procedure ethumb_frame_get(e: PEthumb; theme_file: PPchar; group: PPchar; swallow: PPchar); cdecl; external libethumb;
procedure ethumb_thumb_dir_path_set(e: PEthumb; path: pchar); cdecl; external libethumb;
function ethumb_thumb_dir_path_get(e: PEthumb): pchar; cdecl; external libethumb;
procedure ethumb_thumb_category_set(e: PEthumb; category: pchar); cdecl; external libethumb;
function ethumb_thumb_category_get(e: PEthumb): pchar; cdecl; external libethumb;
procedure ethumb_thumb_path_set(e: PEthumb; path: pchar; key: pchar); cdecl; external libethumb;
procedure ethumb_thumb_path_get(e: PEthumb; path: PPchar; key: PPchar); cdecl; external libethumb;
procedure ethumb_thumb_hash(e: PEthumb); cdecl; external libethumb;
procedure ethumb_thumb_hash_copy(dst: PEthumb; src: PEthumb); cdecl; external libethumb;

type
  PEthumb_Thumb_FDO_Size = ^TEthumb_Thumb_FDO_Size;
  TEthumb_Thumb_FDO_Size = longint;

const
  ETHUMB_THUMB_NORMAL = 0;
  ETHUMB_THUMB_LARGE = 1;

type
  PEthumb_Thumb_Format = ^TEthumb_Thumb_Format;
  TEthumb_Thumb_Format = longint;

const
  ETHUMB_THUMB_FDO = 0;
  ETHUMB_THUMB_JPEG = 1;
  ETHUMB_THUMB_EET = 2;

type
  PEthumb_Thumb_Aspect = ^TEthumb_Thumb_Aspect;
  TEthumb_Thumb_Aspect = longint;

const
  ETHUMB_THUMB_KEEP_ASPECT = 0;
  ETHUMB_THUMB_IGNORE_ASPECT = 1;
  ETHUMB_THUMB_CROP = 2;

type
  PEthumb_Thumb_Orientation = ^TEthumb_Thumb_Orientation;
  TEthumb_Thumb_Orientation = longint;

const
  ETHUMB_THUMB_ORIENT_NONE = 0;
  ETHUMB_THUMB_ROTATE_90_CW = 1;
  ETHUMB_THUMB_ROTATE_180 = 2;
  ETHUMB_THUMB_ROTATE_90_CCW = 3;
  ETHUMB_THUMB_FLIP_HORIZONTAL = 4;
  ETHUMB_THUMB_FLIP_VERTICAL = 5;
  ETHUMB_THUMB_FLIP_TRANSPOSE = 6;
  ETHUMB_THUMB_FLIP_TRANSVERSE = 7;
  ETHUMB_THUMB_ORIENT_ORIGINAL = 8;

procedure ethumb_thumb_fdo_set(e: PEthumb; s: TEthumb_Thumb_FDO_Size); cdecl; external libethumb;
procedure ethumb_thumb_size_set(e: PEthumb; tw: longint; th: longint); cdecl; external libethumb;
procedure ethumb_thumb_size_get(e: PEthumb; tw: Plongint; th: Plongint); cdecl; external libethumb;
procedure ethumb_thumb_format_set(e: PEthumb; f: TEthumb_Thumb_Format); cdecl; external libethumb;
function ethumb_thumb_format_get(e: PEthumb): TEthumb_Thumb_Format; cdecl; external libethumb;
procedure ethumb_thumb_aspect_set(e: PEthumb; aspect: TEthumb_Thumb_Aspect); cdecl; external libethumb;
function ethumb_thumb_aspect_get(e: PEthumb): TEthumb_Thumb_Aspect; cdecl; external libethumb;
procedure ethumb_thumb_orientation_set(e: PEthumb; orientation: TEthumb_Thumb_Orientation); cdecl; external libethumb;
function ethumb_thumb_orientation_get(e: PEthumb): TEthumb_Thumb_Orientation; cdecl; external libethumb;
procedure ethumb_thumb_crop_align_set(e: PEthumb; x: single; y: single); cdecl; external libethumb;
procedure ethumb_thumb_crop_align_get(e: PEthumb; x: Psingle; y: Psingle); cdecl; external libethumb;
procedure ethumb_thumb_quality_set(e: PEthumb; quality: longint); cdecl; external libethumb;
function ethumb_thumb_quality_get(e: PEthumb): longint; cdecl; external libethumb;
procedure ethumb_thumb_compress_set(e: PEthumb; compress: longint); cdecl; external libethumb;
function ethumb_thumb_compress_get(e: PEthumb): longint; cdecl; external libethumb;
procedure ethumb_video_start_set(e: PEthumb; start: single); cdecl; external libethumb;
function ethumb_video_start_get(e: PEthumb): single; cdecl; external libethumb;
procedure ethumb_video_time_set(e: PEthumb; time: single); cdecl; external libethumb;
function ethumb_video_time_get(e: PEthumb): single; cdecl; external libethumb;
procedure ethumb_video_interval_set(e: PEthumb; interval: single); cdecl; external libethumb;
function ethumb_video_interval_get(e: PEthumb): single; cdecl; external libethumb;
procedure ethumb_video_ntimes_set(e: PEthumb; ntimes: dword); cdecl; external libethumb;
function ethumb_video_ntimes_get(e: PEthumb): dword; cdecl; external libethumb;
procedure ethumb_video_fps_set(e: PEthumb; fps: dword); cdecl; external libethumb;
function ethumb_video_fps_get(e: PEthumb): dword; cdecl; external libethumb;
procedure ethumb_document_page_set(e: PEthumb; page: dword); cdecl; external libethumb;
function ethumb_document_page_get(e: PEthumb): dword; cdecl; external libethumb;
function ethumb_file_set(e: PEthumb; path: pchar; key: pchar): TEina_Bool; cdecl; external libethumb;
procedure ethumb_file_get(e: PEthumb; path: PPchar; key: PPchar); cdecl; external libethumb;
procedure ethumb_file_free(e: PEthumb); cdecl; external libethumb;
function ethumb_generate(e: PEthumb; finished_cb: TEthumb_Generate_Cb; data: pointer; free_data: TEina_Free_Cb): TEina_Bool; cdecl; external libethumb;
function ethumb_exists(e: PEthumb): TEina_Bool; cdecl; external libethumb;
function ethumb_dup(e: PEthumb): PEthumb; cdecl; external libethumb;
function ethumb_cmp(e1: PEthumb; e2: PEthumb): TEina_Bool; cdecl; external libethumb;
function ethumb_hash(key: pointer; key_length: longint): longint; cdecl; external libethumb;
function ethumb_key_cmp(key1: pointer; key1_length: longint; key2: pointer; key2_length: longint): longint; cdecl; external libethumb;
function ethumb_length(key: pointer): dword; cdecl; external libethumb;

// === Konventiert am: 28-5-25 19:14:25 ===


implementation



end.
