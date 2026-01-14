unit fp_sndfile;

interface

uses
  ctypes;

const
  {$IFDEF linux}
  libsndfile = 'libsndfile';
  {$ENDIF}

  {$IFDEF windows}
  libsndfile = 'libsndfile-1.dll';
  {$ENDIF}


type
  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;
  PPuint8_t = ^Puint8_t;
  Tuint16_t = uint16;
  Puint16_t = ^Tuint16_t;
  PPuint16_t = ^Puint16_t;
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;
  PPuint32_t = ^Puint32_t;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;
  PPuint64_t = ^Puint64_t;

  Tint8_t = int8;
  Pint8_t = ^Tint8_t;
  PPint8_t = ^Pint8_t;
  Tint16_t = int16;
  Pint16_t = ^Tint16_t;
  PPint16_t = ^Pint16_t;
  Tint32_t = int32;
  Pint32_t = ^Tint32_t;
  PPint32_t = ^Pint32_t;
  Tint64_t = int64;
  Pint64_t = ^Tint64_t;
  PPint64_t = ^Pint64_t;

  Tsize_t = SizeUInt;

  Pwchar_t = Pointer;


const // /usr/include/fcntl.h
  SEEK_SET = 0;
  SEEK_CUR = 1;
  SEEK_END = 2;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  SF_FORMAT_WAV = $010000;
  SF_FORMAT_AIFF = $020000;
  SF_FORMAT_AU = $030000;
  SF_FORMAT_RAW = $040000;
  SF_FORMAT_PAF = $050000;
  SF_FORMAT_SVX = $060000;
  SF_FORMAT_NIST = $070000;
  SF_FORMAT_VOC = $080000;
  SF_FORMAT_IRCAM = $0A0000;
  SF_FORMAT_W64 = $0B0000;
  SF_FORMAT_MAT4 = $0C0000;
  SF_FORMAT_MAT5 = $0D0000;
  SF_FORMAT_PVF = $0E0000;
  SF_FORMAT_XI = $0F0000;
  SF_FORMAT_HTK = $100000;
  SF_FORMAT_SDS = $110000;
  SF_FORMAT_AVR = $120000;
  SF_FORMAT_WAVEX = $130000;
  SF_FORMAT_SD2 = $160000;
  SF_FORMAT_FLAC = $170000;
  SF_FORMAT_CAF = $180000;
  SF_FORMAT_WVE = $190000;
  SF_FORMAT_OGG = $200000;
  SF_FORMAT_MPC2K = $210000;
  SF_FORMAT_RF64 = $220000;
  SF_FORMAT_MPEG = $230000;
  SF_FORMAT_PCM_S8 = $0001;
  SF_FORMAT_PCM_16 = $0002;
  SF_FORMAT_PCM_24 = $0003;
  SF_FORMAT_PCM_32 = $0004;
  SF_FORMAT_PCM_U8 = $0005;
  SF_FORMAT_FLOAT = $0006;
  SF_FORMAT_DOUBLE = $0007;
  SF_FORMAT_ULAW = $0010;
  SF_FORMAT_ALAW = $0011;
  SF_FORMAT_IMA_ADPCM = $0012;
  SF_FORMAT_MS_ADPCM = $0013;
  SF_FORMAT_GSM610 = $0020;
  SF_FORMAT_VOX_ADPCM = $0021;
  SF_FORMAT_NMS_ADPCM_16 = $0022;
  SF_FORMAT_NMS_ADPCM_24 = $0023;
  SF_FORMAT_NMS_ADPCM_32 = $0024;
  SF_FORMAT_G721_32 = $0030;
  SF_FORMAT_G723_24 = $0031;
  SF_FORMAT_G723_40 = $0032;
  SF_FORMAT_DWVW_12 = $0040;
  SF_FORMAT_DWVW_16 = $0041;
  SF_FORMAT_DWVW_24 = $0042;
  SF_FORMAT_DWVW_N = $0043;
  SF_FORMAT_DPCM_8 = $0050;
  SF_FORMAT_DPCM_16 = $0051;
  SF_FORMAT_VORBIS = $0060;
  SF_FORMAT_OPUS = $0064;
  SF_FORMAT_ALAC_16 = $0070;
  SF_FORMAT_ALAC_20 = $0071;
  SF_FORMAT_ALAC_24 = $0072;
  SF_FORMAT_ALAC_32 = $0073;
  SF_FORMAT_MPEG_LAYER_I = $0080;
  SF_FORMAT_MPEG_LAYER_II = $0081;
  SF_FORMAT_MPEG_LAYER_III = $0082;
  SF_ENDIAN_FILE = $00000000;
  SF_ENDIAN_LITTLE = $10000000;
  SF_ENDIAN_BIG = $20000000;
  SF_ENDIAN_CPU = $30000000;
  SF_FORMAT_SUBMASK = $0000FFFF;
  SF_FORMAT_TYPEMASK = $0FFF0000;
  SF_FORMAT_ENDMASK = $30000000;

const
  SFC_GET_LIB_VERSION = $1000;
  SFC_GET_LOG_INFO = $1001;
  SFC_GET_CURRENT_SF_INFO = $1002;
  SFC_GET_NORM_DOUBLE = $1010;
  SFC_GET_NORM_FLOAT = $1011;
  SFC_SET_NORM_DOUBLE = $1012;
  SFC_SET_NORM_FLOAT = $1013;
  SFC_SET_SCALE_FLOAT_INT_READ = $1014;
  SFC_SET_SCALE_INT_FLOAT_WRITE = $1015;
  SFC_GET_SIMPLE_FORMAT_COUNT = $1020;
  SFC_GET_SIMPLE_FORMAT = $1021;
  SFC_GET_FORMAT_INFO = $1028;
  SFC_GET_FORMAT_MAJOR_COUNT = $1030;
  SFC_GET_FORMAT_MAJOR = $1031;
  SFC_GET_FORMAT_SUBTYPE_COUNT = $1032;
  SFC_GET_FORMAT_SUBTYPE = $1033;
  SFC_CALC_SIGNAL_MAX = $1040;
  SFC_CALC_NORM_SIGNAL_MAX = $1041;
  SFC_CALC_MAX_ALL_CHANNELS = $1042;
  SFC_CALC_NORM_MAX_ALL_CHANNELS = $1043;
  SFC_GET_SIGNAL_MAX = $1044;
  SFC_GET_MAX_ALL_CHANNELS = $1045;
  SFC_SET_ADD_PEAK_CHUNK = $1050;
  SFC_UPDATE_HEADER_NOW = $1060;
  SFC_SET_UPDATE_HEADER_AUTO = $1061;
  SFC_FILE_TRUNCATE = $1080;
  SFC_SET_RAW_START_OFFSET = $1090;
  SFC_SET_DITHER_ON_WRITE = $10A0;
  SFC_SET_DITHER_ON_READ = $10A1;
  SFC_GET_DITHER_INFO_COUNT = $10A2;
  SFC_GET_DITHER_INFO = $10A3;
  SFC_GET_EMBED_FILE_INFO = $10B0;
  SFC_SET_CLIPPING = $10C0;
  SFC_GET_CLIPPING = $10C1;
  SFC_GET_CUE_COUNT = $10CD;
  SFC_GET_CUE = $10CE;
  SFC_SET_CUE = $10CF;
  SFC_GET_INSTRUMENT = $10D0;
  SFC_SET_INSTRUMENT = $10D1;
  SFC_GET_LOOP_INFO = $10E0;
  SFC_GET_BROADCAST_INFO = $10F0;
  SFC_SET_BROADCAST_INFO = $10F1;
  SFC_GET_CHANNEL_MAP_INFO = $1100;
  SFC_SET_CHANNEL_MAP_INFO = $1101;
  SFC_RAW_DATA_NEEDS_ENDSWAP = $1110;
  SFC_WAVEX_SET_AMBISONIC = $1200;
  SFC_WAVEX_GET_AMBISONIC = $1201;
  SFC_RF64_AUTO_DOWNGRADE = $1210;
  SFC_SET_VBR_ENCODING_QUALITY = $1300;
  SFC_SET_COMPRESSION_LEVEL = $1301;
  SFC_SET_OGG_PAGE_LATENCY_MS = $1302;
  SFC_SET_OGG_PAGE_LATENCY = $1303;
  SFC_GET_OGG_STREAM_SERIALNO = $1306;
  SFC_GET_BITRATE_MODE = $1304;
  SFC_SET_BITRATE_MODE = $1305;
  SFC_SET_CART_INFO = $1400;
  SFC_GET_CART_INFO = $1401;
  SFC_SET_ORIGINAL_SAMPLERATE = $1500;
  SFC_GET_ORIGINAL_SAMPLERATE = $1501;
  SFC_TEST_IEEE_FLOAT_REPLACE = $6001;
  SFC_SET_ADD_HEADER_PAD_CHUNK = $1051;
  SFC_SET_ADD_DITHER_ON_WRITE = $1070;
  SFC_SET_ADD_DITHER_ON_READ = $1071;

const
  SF_STR_TITLE = $01;
  SF_STR_COPYRIGHT = $02;
  SF_STR_SOFTWARE = $03;
  SF_STR_ARTIST = $04;
  SF_STR_COMMENT = $05;
  SF_STR_DATE = $06;
  SF_STR_ALBUM = $07;
  SF_STR_LICENSE = $08;
  SF_STR_TRACKNUMBER = $09;
  SF_STR_GENRE = $10;

  SF_STR_FIRST = SF_STR_TITLE;
  SF_STR_LAST = SF_STR_GENRE;

const
  SF_FALSE = 0;
  SF_TRUE = 1;
  SFM_READ = $10;
  SFM_WRITE = $20;
  SFM_RDWR = $30;
  SF_AMBISONIC_NONE = $40;
  SF_AMBISONIC_B_FORMAT = $41;

const
  SF_ERR_NO_ERROR = 0;
  SF_ERR_UNRECOGNISED_FORMAT = 1;
  SF_ERR_SYSTEM = 2;
  SF_ERR_MALFORMED_FILE = 3;
  SF_ERR_UNSUPPORTED_ENCODING = 4;

const
  SF_CHANNEL_MAP_INVALID = 0;
  SF_CHANNEL_MAP_MONO = 1;
  SF_CHANNEL_MAP_LEFT = 2;
  SF_CHANNEL_MAP_RIGHT = 3;
  SF_CHANNEL_MAP_CENTER = 4;
  SF_CHANNEL_MAP_FRONT_LEFT = 5;
  SF_CHANNEL_MAP_FRONT_RIGHT = 6;
  SF_CHANNEL_MAP_FRONT_CENTER = 7;
  SF_CHANNEL_MAP_REAR_CENTER = 8;
  SF_CHANNEL_MAP_REAR_LEFT = 9;
  SF_CHANNEL_MAP_REAR_RIGHT = 10;
  SF_CHANNEL_MAP_LFE = 11;
  SF_CHANNEL_MAP_FRONT_LEFT_OF_CENTER = 12;
  SF_CHANNEL_MAP_FRONT_RIGHT_OF_CENTER = 13;
  SF_CHANNEL_MAP_SIDE_LEFT = 14;
  SF_CHANNEL_MAP_SIDE_RIGHT = 15;
  SF_CHANNEL_MAP_TOP_CENTER = 16;
  SF_CHANNEL_MAP_TOP_FRONT_LEFT = 17;
  SF_CHANNEL_MAP_TOP_FRONT_RIGHT = 18;
  SF_CHANNEL_MAP_TOP_FRONT_CENTER = 19;
  SF_CHANNEL_MAP_TOP_REAR_LEFT = 20;
  SF_CHANNEL_MAP_TOP_REAR_RIGHT = 21;
  SF_CHANNEL_MAP_TOP_REAR_CENTER = 22;
  SF_CHANNEL_MAP_AMBISONIC_B_W = 23;
  SF_CHANNEL_MAP_AMBISONIC_B_X = 24;
  SF_CHANNEL_MAP_AMBISONIC_B_Y = 25;
  SF_CHANNEL_MAP_AMBISONIC_B_Z = 26;
  SF_CHANNEL_MAP_MAX = 27;

const
  SF_BITRATE_MODE_CONSTANT = 0;
  SF_BITRATE_MODE_AVERAGE = 1;
  SF_BITRATE_MODE_VARIABLE = 2;

type
  TSNDFILE = type Pointer;
  PSNDFILE = ^TSNDFILE;

  Psf_count_t = ^Tsf_count_t;
  Tsf_count_t = Tint64_t;

const
  SF_COUNT_MAX = High(int64);

type
  TSF_INFO = record
    frames: Tsf_count_t;
    samplerate: longint;
    channels: longint;
    format: longint;
    sections: longint;
    seekable: longint;
  end;
  PSF_INFO = ^TSF_INFO;

  TSF_FORMAT_INFO = record
    format: longint;
    name: pchar;
    extension: pchar;
  end;
  PSF_FORMAT_INFO = ^TSF_FORMAT_INFO;

const
  SFD_DEFAULT_LEVEL = 0;
  SFD_CUSTOM_LEVEL = $40000000;
  SFD_NO_DITHER = 500;
  SFD_WHITE = 501;
  SFD_TRIANGULAR_PDF = 502;

type
  TSF_DITHER_INFO = record
    _type: longint;
    level: double;
    name: pchar;
  end;
  PSF_DITHER_INFO = ^TSF_DITHER_INFO;

  TSF_EMBED_FILE_INFO = record
    offset: Tsf_count_t;
    length: Tsf_count_t;
  end;
  PSF_EMBED_FILE_INFO = ^TSF_EMBED_FILE_INFO;

  TSF_CUE_POINT = record
    indx: Tint32_t;
    position: Tuint32_t;
    fcc_chunk: Tint32_t;
    chunk_start: Tint32_t;
    block_start: Tint32_t;
    sample_offset: Tuint32_t;
    name: array[0..255] of char;
  end;
  PSF_CUE_POINT = ^TSF_CUE_POINT;


type
  TSF_CUES = record
    cue_count: uint32;
    cue_points: array[0..99] of TSF_CUE_POINT;
  end;
  PSF_CUES = ^TSF_CUES;

const
  SF_LOOP_NONE = 800;
  SF_LOOP_FORWARD = 801;
  SF_LOOP_BACKWARD = 802;
  SF_LOOP_ALTERNATING = 803;

type
  TSF_INSTRUMENT = record
    gain: longint;
    basenote: char;
    detune: char;
    velocity_lo: char;
    velocity_hi: char;
    key_lo: char;
    key_hi: char;
    loop_count: longint;
    loops: array[0..15] of record
      mode: longint;
      start: Tuint32_t;
      end_: Tuint32_t;
      count: Tuint32_t;
      end;
  end;
  PSF_INSTRUMENT = ^TSF_INSTRUMENT;

  TSF_LOOP_INFO = record
    time_sig_num: smallint;
    time_sig_den: smallint;
    loop_mode: longint;
    num_beats: longint;
    bpm: single;
    root_key: longint;
    future: array[0..5] of longint;
  end;
  PSF_LOOP_INFO = ^TSF_LOOP_INFO;

type
  TSF_BROADCAST_INFO = record
    description: array[0..255] of ansichar;
    originator: array[0..31] of ansichar;
    originator_reference: array[0..31] of ansichar;
    origination_date: array[0..9] of ansichar;
    origination_time: array[0..7] of ansichar;
    time_reference_low: uint32;
    time_reference_high: uint32;
    version: smallint;
    umid: array[0..63] of ansichar;
    loudness_value: int16;
    loudness_range: int16;
    max_true_peak_level: int16;
    max_momentary_loudness: int16;
    max_shortterm_loudness: int16;
    reserved: array[0..179] of ansichar;
    coding_history_size: uint32;
    coding_history: array[0..255] of ansichar;
  end;
  PSF_BROADCAST_INFO = ^TSF_BROADCAST_INFO;

  PSF_CART_TIMER = ^TSF_CART_TIMER;

  TSF_CART_TIMER = record
    usage: array[0..3] of char;
    value: Tint32_t;
  end;

type
  SF_CART_INFO = record
    version: array[0..3] of ansichar;
    title: array[0..63] of ansichar;
    artist: array[0..63] of ansichar;
    cut_id: array[0..63] of ansichar;
    client_id: array[0..63] of ansichar;
    category: array[0..63] of ansichar;
    classification: array[0..63] of ansichar;
    out_cue: array[0..63] of ansichar;
    start_date: array[0..9] of ansichar;
    start_time: array[0..7] of ansichar;
    end_date: array[0..9] of ansichar;
    end_time: array[0..7] of ansichar;
    producer_app_id: array[0..63] of ansichar;
    producer_app_version: array[0..63] of ansichar;
    user_def: array[0..63] of ansichar;
    level_reference: int32;
    post_timers: array[0..7] of TSF_CART_TIMER;
    reserved: array[0..275] of ansichar;
    url: array[0..1023] of ansichar;
    tag_text_size: uint32;
    tag_text: array[0..255] of ansichar;
  end;

  Tsf_vio_get_filelen = function(user_data: pointer): Tsf_count_t; cdecl;
  Tsf_vio_seek = function(offset: Tsf_count_t; whence: longint; user_data: pointer): Tsf_count_t; cdecl;
  Tsf_vio_read = function(ptr: pointer; count: Tsf_count_t; user_data: pointer): Tsf_count_t; cdecl;
  Tsf_vio_write = function(ptr: pointer; count: Tsf_count_t; user_data: pointer): Tsf_count_t; cdecl;
  Tsf_vio_tell = function(user_data: pointer): Tsf_count_t; cdecl;

  PSF_VIRTUAL_IO = ^TSF_VIRTUAL_IO;

  TSF_VIRTUAL_IO = record
    get_filelen: Tsf_vio_get_filelen;
    seek: Tsf_vio_seek;
    read: Tsf_vio_read;
    write: Tsf_vio_write;
    tell: Tsf_vio_tell;
  end;

function sf_open(path: pchar; mode: longint; sfinfo: PSF_INFO): PSNDFILE; cdecl; external libsndfile;
function sf_open_fd(fd: longint; mode: longint; sfinfo: PSF_INFO; close_desc: longint): PSNDFILE; cdecl; external libsndfile;
function sf_open_virtual(sfvirtual: PSF_VIRTUAL_IO; mode: longint; sfinfo: PSF_INFO; user_data: pointer): PSNDFILE; cdecl; external libsndfile;
function sf_error(sndfile: PSNDFILE): longint; cdecl; external libsndfile;
function sf_strerror(sndfile: PSNDFILE): pchar; cdecl; external libsndfile;
function sf_error_number(errnum: longint): pchar; cdecl; external libsndfile;
function sf_perror(sndfile: PSNDFILE): longint; cdecl; external libsndfile;
function sf_error_str(sndfile: PSNDFILE; str: pchar; len: Tsize_t): longint; cdecl; external libsndfile;
function sf_command(sndfile: PSNDFILE; command: longint; data: pointer; datasize: longint): longint; cdecl; external libsndfile;
function sf_format_check(info: PSF_INFO): longint; cdecl; external libsndfile;

const
  SF_SEEK_SET = SEEK_SET;
  SF_SEEK_CUR = SEEK_CUR;
  SF_SEEK_END = SEEK_END;

function sf_seek(sndfile: PSNDFILE; frames: Tsf_count_t; whence: longint): Tsf_count_t; cdecl; external libsndfile;
function sf_set_string(sndfile: PSNDFILE; str_type: longint; str: pchar): longint; cdecl; external libsndfile;
function sf_get_string(sndfile: PSNDFILE; str_type: longint): pchar; cdecl; external libsndfile;
function sf_version_string: pchar; cdecl; external libsndfile;
function sf_current_byterate(sndfile: PSNDFILE): longint; cdecl; external libsndfile;
function sf_read_raw(sndfile: PSNDFILE; ptr: pointer; bytes: Tsf_count_t): Tsf_count_t; cdecl; external libsndfile;
function sf_write_raw(sndfile: PSNDFILE; ptr: pointer; bytes: Tsf_count_t): Tsf_count_t; cdecl; external libsndfile;
function sf_readf_short(sndfile: PSNDFILE; ptr: Psmallint; frames: Tsf_count_t): Tsf_count_t; cdecl; external libsndfile;
function sf_writef_short(sndfile: PSNDFILE; ptr: Psmallint; frames: Tsf_count_t): Tsf_count_t; cdecl; external libsndfile;
function sf_readf_int(sndfile: PSNDFILE; ptr: Plongint; frames: Tsf_count_t): Tsf_count_t; cdecl; external libsndfile;
function sf_writef_int(sndfile: PSNDFILE; ptr: Plongint; frames: Tsf_count_t): Tsf_count_t; cdecl; external libsndfile;
function sf_readf_float(sndfile: PSNDFILE; ptr: Psingle; frames: Tsf_count_t): Tsf_count_t; cdecl; external libsndfile;
function sf_writef_float(sndfile: PSNDFILE; ptr: Psingle; frames: Tsf_count_t): Tsf_count_t; cdecl; external libsndfile;
function sf_readf_double(sndfile: PSNDFILE; ptr: Pdouble; frames: Tsf_count_t): Tsf_count_t; cdecl; external libsndfile;
function sf_writef_double(sndfile: PSNDFILE; ptr: Pdouble; frames: Tsf_count_t): Tsf_count_t; cdecl; external libsndfile;
function sf_read_short(sndfile: PSNDFILE; ptr: Psmallint; items: Tsf_count_t): Tsf_count_t; cdecl; external libsndfile;
function sf_write_short(sndfile: PSNDFILE; ptr: Psmallint; items: Tsf_count_t): Tsf_count_t; cdecl; external libsndfile;
function sf_read_int(sndfile: PSNDFILE; ptr: Plongint; items: Tsf_count_t): Tsf_count_t; cdecl; external libsndfile;
function sf_write_int(sndfile: PSNDFILE; ptr: Plongint; items: Tsf_count_t): Tsf_count_t; cdecl; external libsndfile;
function sf_read_float(sndfile: PSNDFILE; ptr: Psingle; items: Tsf_count_t): Tsf_count_t; cdecl; external libsndfile;
function sf_write_float(sndfile: PSNDFILE; ptr: Psingle; items: Tsf_count_t): Tsf_count_t; cdecl; external libsndfile;
function sf_read_double(sndfile: PSNDFILE; ptr: Pdouble; items: Tsf_count_t): Tsf_count_t; cdecl; external libsndfile;
function sf_write_double(sndfile: PSNDFILE; ptr: Pdouble; items: Tsf_count_t): Tsf_count_t; cdecl; external libsndfile;
function sf_close(sndfile: PSNDFILE): longint; cdecl; external libsndfile;
procedure sf_write_sync(sndfile: PSNDFILE); cdecl; external libsndfile;

{$ifdef windows}
function sf_wchar_open(wpath: Pwchar_t; mode: longint; sfinfo: PSF_INFO): PSNDFILE; cdecl; external libsndfile;
{$endif}
type
  TSF_CHUNK_INFO = record
    id: array[0..63] of char;
    id_size: dword;
    datalen: dword;
    data: pointer;
  end;
  PSF_CHUNK_INFO = ^TSF_CHUNK_INFO;

  PSF_CHUNK_ITERATOR = type Pointer;

function sf_set_chunk(sndfile: PSNDFILE; chunk_info: PSF_CHUNK_INFO): longint; cdecl; external libsndfile;
function sf_get_chunk_iterator(sndfile: PSNDFILE; chunk_info: PSF_CHUNK_INFO): PSF_CHUNK_ITERATOR; cdecl; external libsndfile;
function sf_next_chunk_iterator(iterator: PSF_CHUNK_ITERATOR): PSF_CHUNK_ITERATOR; cdecl; external libsndfile;
function sf_get_chunk_size(it: PSF_CHUNK_ITERATOR; chunk_info: PSF_CHUNK_INFO): longint; cdecl; external libsndfile;
function sf_get_chunk_data(it: PSF_CHUNK_ITERATOR; chunk_info: PSF_CHUNK_INFO): longint; cdecl; external libsndfile;

// === Konventiert am: 14-9-25 16:57:08 ===


implementation



end.
