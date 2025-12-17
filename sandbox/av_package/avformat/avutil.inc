{$IFDEF read_interface}


function avutil_version: dword; cdecl; external libavutil;
function av_version_info: pchar; cdecl; external libavutil;
function avutil_configuration: pchar; cdecl; external libavutil;
function avutil_license: pchar; cdecl; external libavutil;

type
  TAVMediaType = longint;

const
  AVMEDIA_TYPE_UNKNOWN = -(1);
  AVMEDIA_TYPE_VIDEO = (-(1)) + 1;
  AVMEDIA_TYPE_AUDIO = (-(1)) + 2;
  AVMEDIA_TYPE_DATA = (-(1)) + 3;
  AVMEDIA_TYPE_SUBTITLE = (-(1)) + 4;
  AVMEDIA_TYPE_ATTACHMENT = (-(1)) + 5;
  AVMEDIA_TYPE_NB = (-(1)) + 6;

function av_get_media_type_string(media_type: TAVMediaType): pchar; cdecl; external libavutil;

const
  FF_LAMBDA_SHIFT = 7;
  FF_LAMBDA_SCALE = 1 shl FF_LAMBDA_SHIFT;
  FF_QP2LAMBDA = 118;
  FF_LAMBDA_MAX = (256 * 128) - 1;
  FF_QUALITY_SCALE = FF_LAMBDA_SCALE;

  AV_NOPTS_VALUE = Tint64_t($8000000000000000);

const
  AV_TIME_BASE = 1000000;

type
  TAVPictureType = longint;

const
  AV_PICTURE_TYPE_NONE = 0;
  AV_PICTURE_TYPE_I = 1;
  AV_PICTURE_TYPE_P = 2;
  AV_PICTURE_TYPE_B = 3;
  AV_PICTURE_TYPE_S = 4;
  AV_PICTURE_TYPE_SI = 5;
  AV_PICTURE_TYPE_SP = 6;
  AV_PICTURE_TYPE_BI = 7;

function av_get_picture_type_char(pict_type: TAVPictureType): char; cdecl; external libavutil;
function av_int_list_length_for_size(elsize: dword; list: pointer; term: Tuint64_t): dword; cdecl; external libavutil;
function av_fopen_utf8(path: pchar; mode: pchar): PFILE; cdecl; external libavutil; deprecated;
function av_get_time_base_q: TAVRational; cdecl; external libavutil;

const
  AV_FOURCC_MAX_STRING_SIZE = 32;

function av_fourcc_make_string(buf: pchar; fourcc: Tuint32_t): pchar; cdecl; external libavutil;

// === Konventiert am: 14-12-25 15:59:45 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}




{$ENDIF read_implementation}
