{$IFDEF read_interface}


type
  Psnd_pcm_info_t = type Pointer;
  PPsnd_pcm_info_t = ^Psnd_pcm_info_t;
  Psnd_pcm_hw_params_t = type Pointer;
  PPsnd_pcm_hw_params_t = ^Psnd_pcm_hw_params_t;
  Psnd_pcm_sw_params_t = type Pointer;
  PPsnd_pcm_sw_params_t = ^Psnd_pcm_sw_params_t;
  Psnd_pcm_status_t = type Pointer;
  PPsnd_pcm_status_t = ^Psnd_pcm_status_t;
  Psnd_pcm_access_mask_t = type Pointer;
  PPsnd_pcm_access_mask_t = ^Psnd_pcm_access_mask_t;
  Psnd_pcm_format_mask_t = type Pointer;
  PPsnd_pcm_format_mask_t = ^Psnd_pcm_format_mask_t;
  Psnd_pcm_subformat_mask_t = type Pointer;
  PPsnd_pcm_subformat_mask_t = ^Psnd_pcm_subformat_mask_t;

type
  Psnd_pcm_class_t = ^Tsnd_pcm_class_t;
  Tsnd_pcm_class_t = longint;

const
  SND_PCM_CLASS_GENERIC = 0;
  SND_PCM_CLASS_MULTI = 1;
  SND_PCM_CLASS_MODEM = 2;
  SND_PCM_CLASS_DIGITIZER = 3;
  SND_PCM_CLASS_LAST = SND_PCM_CLASS_DIGITIZER;

type
  Psnd_pcm_subclass_t = ^Tsnd_pcm_subclass_t;
  Tsnd_pcm_subclass_t = longint;

const
  SND_PCM_SUBCLASS_GENERIC_MIX = 0;
  SND_PCM_SUBCLASS_MULTI_MIX = 1;
  SND_PCM_SUBCLASS_LAST = SND_PCM_SUBCLASS_MULTI_MIX;

type
  Psnd_pcm_stream_t = ^Tsnd_pcm_stream_t;
  Tsnd_pcm_stream_t = longint;

const
  SND_PCM_STREAM_PLAYBACK = 0;
  SND_PCM_STREAM_CAPTURE = 1;
  SND_PCM_STREAM_LAST = SND_PCM_STREAM_CAPTURE;

type
  Psnd_pcm_access_t = ^Tsnd_pcm_access_t;
  Tsnd_pcm_access_t = longint;

const
  SND_PCM_ACCESS_MMAP_INTERLEAVED = 0;
  SND_PCM_ACCESS_MMAP_NONINTERLEAVED = 1;
  SND_PCM_ACCESS_MMAP_COMPLEX = 2;
  SND_PCM_ACCESS_RW_INTERLEAVED = 3;
  SND_PCM_ACCESS_RW_NONINTERLEAVED = 4;
  SND_PCM_ACCESS_LAST = SND_PCM_ACCESS_RW_NONINTERLEAVED;

type
  Psnd_pcm_format_t = ^Tsnd_pcm_format_t;
  Tsnd_pcm_format_t = longint;

const
  SND_PCM_FORMAT_UNKNOWN = -(1);
  SND_PCM_FORMAT_S8 = 0;
  SND_PCM_FORMAT_U8 = 1;
  SND_PCM_FORMAT_S16_LE = 2;
  SND_PCM_FORMAT_S16_BE = 3;
  SND_PCM_FORMAT_U16_LE = 4;
  SND_PCM_FORMAT_U16_BE = 5;
  SND_PCM_FORMAT_S24_LE = 6;
  SND_PCM_FORMAT_S24_BE = 7;
  SND_PCM_FORMAT_U24_LE = 8;
  SND_PCM_FORMAT_U24_BE = 9;
  SND_PCM_FORMAT_S32_LE = 10;
  SND_PCM_FORMAT_S32_BE = 11;
  SND_PCM_FORMAT_U32_LE = 12;
  SND_PCM_FORMAT_U32_BE = 13;
  SND_PCM_FORMAT_FLOAT_LE = 14;
  SND_PCM_FORMAT_FLOAT_BE = 15;
  SND_PCM_FORMAT_FLOAT64_LE = 16;
  SND_PCM_FORMAT_FLOAT64_BE = 17;
  SND_PCM_FORMAT_IEC958_SUBFRAME_LE = 18;
  SND_PCM_FORMAT_IEC958_SUBFRAME_BE = 19;
  SND_PCM_FORMAT_MU_LAW = 20;
  SND_PCM_FORMAT_A_LAW = 21;
  SND_PCM_FORMAT_IMA_ADPCM = 22;
  SND_PCM_FORMAT_MPEG = 23;
  SND_PCM_FORMAT_GSM = 24;
  SND_PCM_FORMAT_S20_LE = 25;
  SND_PCM_FORMAT_S20_BE = 26;
  SND_PCM_FORMAT_U20_LE = 27;
  SND_PCM_FORMAT_U20_BE = 28;
  SND_PCM_FORMAT_SPECIAL = 31;
  SND_PCM_FORMAT_S24_3LE = 32;
  SND_PCM_FORMAT_S24_3BE = 33;
  SND_PCM_FORMAT_U24_3LE = 34;
  SND_PCM_FORMAT_U24_3BE = 35;
  SND_PCM_FORMAT_S20_3LE = 36;
  SND_PCM_FORMAT_S20_3BE = 37;
  SND_PCM_FORMAT_U20_3LE = 38;
  SND_PCM_FORMAT_U20_3BE = 39;
  SND_PCM_FORMAT_S18_3LE = 40;
  SND_PCM_FORMAT_S18_3BE = 41;
  SND_PCM_FORMAT_U18_3LE = 42;
  SND_PCM_FORMAT_U18_3BE = 43;
  SND_PCM_FORMAT_G723_24 = 44;
  SND_PCM_FORMAT_G723_24_1B = 45;
  SND_PCM_FORMAT_G723_40 = 46;
  SND_PCM_FORMAT_G723_40_1B = 47;
  SND_PCM_FORMAT_DSD_U8 = 48;
  SND_PCM_FORMAT_DSD_U16_LE = 49;
  SND_PCM_FORMAT_DSD_U32_LE = 50;
  SND_PCM_FORMAT_DSD_U16_BE = 51;
  SND_PCM_FORMAT_DSD_U32_BE = 52;
  SND_PCM_FORMAT_LAST = SND_PCM_FORMAT_DSD_U32_BE;
  SND_PCM_FORMAT_S16 = SND_PCM_FORMAT_S16_LE;
  SND_PCM_FORMAT_U16 = SND_PCM_FORMAT_U16_LE;
  SND_PCM_FORMAT_S24 = SND_PCM_FORMAT_S24_LE;
  SND_PCM_FORMAT_U24 = SND_PCM_FORMAT_U24_LE;
  SND_PCM_FORMAT_S32 = SND_PCM_FORMAT_S32_LE;
  SND_PCM_FORMAT_U32 = SND_PCM_FORMAT_U32_LE;
  SND_PCM_FORMAT_FLOAT_ = SND_PCM_FORMAT_FLOAT_LE;
  SND_PCM_FORMAT_FLOAT64 = SND_PCM_FORMAT_FLOAT64_LE;
  SND_PCM_FORMAT_IEC958_SUBFRAME = SND_PCM_FORMAT_IEC958_SUBFRAME_LE;
  SND_PCM_FORMAT_S20 = SND_PCM_FORMAT_S20_LE;
  SND_PCM_FORMAT_U20 = SND_PCM_FORMAT_U20_LE;

type
  Psnd_pcm_subformat_t = ^Tsnd_pcm_subformat_t;
  Tsnd_pcm_subformat_t = longint;

const
  SND_PCM_SUBFORMAT_UNKNOWN = -(1);
  SND_PCM_SUBFORMAT_STD = 0;
  SND_PCM_SUBFORMAT_MSBITS_MAX = 1;
  SND_PCM_SUBFORMAT_MSBITS_20 = 2;
  SND_PCM_SUBFORMAT_MSBITS_24 = 3;
  SND_PCM_SUBFORMAT_LAST = SND_PCM_SUBFORMAT_MSBITS_24;

type
  Psnd_pcm_state_t = ^Tsnd_pcm_state_t;
  Tsnd_pcm_state_t = longint;

const
  SND_PCM_STATE_OPEN = 0;
  SND_PCM_STATE_SETUP = 1;
  SND_PCM_STATE_PREPARED = 2;
  SND_PCM_STATE_RUNNING = 3;
  SND_PCM_STATE_XRUN = 4;
  SND_PCM_STATE_DRAINING = 5;
  SND_PCM_STATE_PAUSED = 6;
  SND_PCM_STATE_SUSPENDED = 7;
  SND_PCM_STATE_DISCONNECTED = 8;
  SND_PCM_STATE_LAST = SND_PCM_STATE_DISCONNECTED;
  SND_PCM_STATE_PRIVATE1 = 1024;

type
  Psnd_pcm_start_t = ^Tsnd_pcm_start_t;
  Tsnd_pcm_start_t = longint;

const
  SND_PCM_START_DATA = 0;
  SND_PCM_START_EXPLICIT = 1;
  SND_PCM_START_LAST = SND_PCM_START_EXPLICIT;

type
  Psnd_pcm_xrun_t = ^Tsnd_pcm_xrun_t;
  Tsnd_pcm_xrun_t = longint;

const
  SND_PCM_XRUN_NONE = 0;
  SND_PCM_XRUN_STOP = 1;
  SND_PCM_XRUN_LAST = SND_PCM_XRUN_STOP;

type
  Psnd_pcm_tstamp_t = ^Tsnd_pcm_tstamp_t;
  Tsnd_pcm_tstamp_t = longint;

const
  SND_PCM_TSTAMP_NONE = 0;
  SND_PCM_TSTAMP_ENABLE = 1;
  SND_PCM_TSTAMP_MMAP = SND_PCM_TSTAMP_ENABLE;
  SND_PCM_TSTAMP_LAST = SND_PCM_TSTAMP_ENABLE;

type
  Psnd_pcm_tstamp_type_t = ^Tsnd_pcm_tstamp_type_t;
  Tsnd_pcm_tstamp_type_t = longint;

const
  SND_PCM_TSTAMP_TYPE_GETTIMEOFDAY = 0;
  SND_PCM_TSTAMP_TYPE_MONOTONIC = 1;
  SND_PCM_TSTAMP_TYPE_MONOTONIC_RAW = 2;
  SND_PCM_TSTAMP_TYPE_LAST = SND_PCM_TSTAMP_TYPE_MONOTONIC_RAW;

type
  Psnd_pcm_audio_tstamp_type_t = ^Tsnd_pcm_audio_tstamp_type_t;
  Tsnd_pcm_audio_tstamp_type_t = longint;

const
  SND_PCM_AUDIO_TSTAMP_TYPE_COMPAT = 0;
  SND_PCM_AUDIO_TSTAMP_TYPE_DEFAULT = 1;
  SND_PCM_AUDIO_TSTAMP_TYPE_LINK = 2;
  SND_PCM_AUDIO_TSTAMP_TYPE_LINK_ABSOLUTE = 3;
  SND_PCM_AUDIO_TSTAMP_TYPE_LINK_ESTIMATED = 4;
  SND_PCM_AUDIO_TSTAMP_TYPE_LINK_SYNCHRONIZED = 5;
  SND_PCM_AUDIO_TSTAMP_TYPE_LAST = SND_PCM_AUDIO_TSTAMP_TYPE_LINK_SYNCHRONIZED;

type
  Tsnd_pcm_audio_tstamp_config_t = bitpacked record
    type_requested: 0..15;
    report_delay: 0..1;
  end;
  Psnd_pcm_audio_tstamp_config_t = ^Tsnd_pcm_audio_tstamp_config_t;

type
  Tsnd_pcm_audio_tstamp_report_t = bitpacked record
    valid: 0..1;
    actual_type: 0..15;
    accuracy_report: 0..1;
    accuracy: integer;
  end;
  Psnd_pcm_audio_tstamp_report_t = ^Tsnd_pcm_audio_tstamp_report_t;

type
  Psnd_pcm_uframes_t = ^Tsnd_pcm_uframes_t;
  Tsnd_pcm_uframes_t = dword;

  Psnd_pcm_sframes_t = ^Tsnd_pcm_sframes_t;
  Tsnd_pcm_sframes_t = longint;

const
  SND_PCM_NONBLOCK_ = $00000001;
  SND_PCM_ASYNC = $00000002;
  SND_PCM_EINTR = $00000080;
  SND_PCM_ABORT_ = $00008000;
  SND_PCM_NO_AUTO_RESAMPLE = $00010000;
  SND_PCM_NO_AUTO_CHANNELS = $00020000;
  SND_PCM_NO_AUTO_FORMAT = $00040000;
  SND_PCM_NO_SOFTVOL = $00080000;

type
  Psnd_pcm_t = type Pointer;
  PPsnd_pcm_t = ^Psnd_pcm_t;

type
  Tsnd_pcm_type_t = longint;

const
  SND_PCM_TYPE_HW = 0;
  SND_PCM_TYPE_HOOKS = 1;
  SND_PCM_TYPE_MULTI = 2;
  SND_PCM_TYPE_FILE = 3;
  SND_PCM_TYPE_NULL = 4;
  SND_PCM_TYPE_SHM = 5;
  SND_PCM_TYPE_INET = 6;
  SND_PCM_TYPE_COPY = 7;
  SND_PCM_TYPE_LINEAR = 8;
  SND_PCM_TYPE_ALAW = 9;
  SND_PCM_TYPE_MULAW = 10;
  SND_PCM_TYPE_ADPCM = 11;
  SND_PCM_TYPE_RATE = 12;
  SND_PCM_TYPE_ROUTE = 13;
  SND_PCM_TYPE_PLUG = 14;
  SND_PCM_TYPE_SHARE = 15;
  SND_PCM_TYPE_METER = 16;
  SND_PCM_TYPE_MIX = 17;
  SND_PCM_TYPE_DROUTE = 18;
  SND_PCM_TYPE_LBSERVER = 19;
  SND_PCM_TYPE_LINEAR_FLOAT = 20;
  SND_PCM_TYPE_LADSPA = 21;
  SND_PCM_TYPE_DMIX = 22;
  SND_PCM_TYPE_JACK = 23;
  SND_PCM_TYPE_DSNOOP = 24;
  SND_PCM_TYPE_DSHARE = 25;
  SND_PCM_TYPE_IEC958 = 26;
  SND_PCM_TYPE_SOFTVOL = 27;
  SND_PCM_TYPE_IOPLUG = 28;
  SND_PCM_TYPE_EXTPLUG = 29;
  SND_PCM_TYPE_MMAP_EMUL = 30;
  SND_PCM_TYPE_LAST = SND_PCM_TYPE_MMAP_EMUL;

type
  Tsnd_pcm_channel_area_t = record
    addr: pointer;
    first: dword;
    step: dword;
  end;
  Psnd_pcm_channel_area_t = ^Tsnd_pcm_channel_area_t;
  PPsnd_pcm_channel_area_t = ^Psnd_pcm_channel_area_t;

  Tsnd_pcm_sync_id_t = record
    case longint of
      0: (id: array[0..15] of byte);
      1: (id16: array[0..7] of word);
      2: (id32: array[0..3] of dword);
  end;
  Psnd_pcm_sync_id_t = ^Tsnd_pcm_sync_id_t;

const
  SND_PCM_WAIT_INFINITE = -(1);
  SND_PCM_WAIT_IO = -(10001);
  SND_PCM_WAIT_DRAIN = -(10002);

type
  Psnd_pcm_scope_t = type Pointer;
  PPsnd_pcm_scope_t = ^Psnd_pcm_scope_t;

function snd_pcm_open(pcm: PPsnd_pcm_t; name: pchar; stream: Tsnd_pcm_stream_t; mode: longint): longint; cdecl; external libasound;
function snd_pcm_open_lconf(pcm: PPsnd_pcm_t; name: pchar; stream: Tsnd_pcm_stream_t; mode: longint; lconf: Psnd_config_t): longint; cdecl; external libasound;
function snd_pcm_open_fallback(pcm: PPsnd_pcm_t; root: Psnd_config_t; name: pchar; orig_name: pchar; stream: Tsnd_pcm_stream_t;
  mode: longint): longint; cdecl; external libasound;
function snd_pcm_close(pcm: Psnd_pcm_t): longint; cdecl; external libasound;
function snd_pcm_name(pcm: Psnd_pcm_t): pchar; cdecl; external libasound;
function snd_pcm_type(pcm: Psnd_pcm_t): Tsnd_pcm_type_t; cdecl; external libasound;
function snd_pcm_stream(pcm: Psnd_pcm_t): Tsnd_pcm_stream_t; cdecl; external libasound;
function snd_pcm_poll_descriptors_count(pcm: Psnd_pcm_t): longint; cdecl; external libasound;
function snd_pcm_poll_descriptors(pcm: Psnd_pcm_t; pfds: Ppollfd; space: dword): longint; cdecl; external libasound;
function snd_pcm_poll_descriptors_revents(pcm: Psnd_pcm_t; pfds: Ppollfd; nfds: dword; revents: Pword): longint; cdecl; external libasound;
function snd_pcm_nonblock(pcm: Psnd_pcm_t; nonblock: longint): longint; cdecl; external libasound;

function snd_pcm_abort(pcm: Psnd_pcm_t): longint; inline;

function snd_async_add_pcm_handler(handler: PPsnd_async_handler_t; pcm: Psnd_pcm_t; callback: Tsnd_async_callback_t; private_data: pointer): longint; cdecl; external libasound;
function snd_async_handler_get_pcm(handler: Psnd_async_handler_t): Psnd_pcm_t; cdecl; external libasound;
function snd_pcm_info(pcm: Psnd_pcm_t; info: Psnd_pcm_info_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_current(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t): longint; cdecl; external libasound;
function snd_pcm_hw_params(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t): longint; cdecl; external libasound;
function snd_pcm_hw_free(pcm: Psnd_pcm_t): longint; cdecl; external libasound;
function snd_pcm_sw_params_current(pcm: Psnd_pcm_t; params: Psnd_pcm_sw_params_t): longint; cdecl; external libasound;
function snd_pcm_sw_params(pcm: Psnd_pcm_t; params: Psnd_pcm_sw_params_t): longint; cdecl; external libasound;
function snd_pcm_prepare(pcm: Psnd_pcm_t): longint; cdecl; external libasound;
function snd_pcm_reset(pcm: Psnd_pcm_t): longint; cdecl; external libasound;
function snd_pcm_status(pcm: Psnd_pcm_t; status: Psnd_pcm_status_t): longint; cdecl; external libasound;
function snd_pcm_start(pcm: Psnd_pcm_t): longint; cdecl; external libasound;
function snd_pcm_drop(pcm: Psnd_pcm_t): longint; cdecl; external libasound;
function snd_pcm_drain(pcm: Psnd_pcm_t): longint; cdecl; external libasound;
function snd_pcm_pause(pcm: Psnd_pcm_t; enable: longint): longint; cdecl; external libasound;
function snd_pcm_state(pcm: Psnd_pcm_t): Tsnd_pcm_state_t; cdecl; external libasound;
function snd_pcm_hwsync(pcm: Psnd_pcm_t): longint; cdecl; external libasound;
function snd_pcm_delay(pcm: Psnd_pcm_t; delayp: Psnd_pcm_sframes_t): longint; cdecl; external libasound;
function snd_pcm_resume(pcm: Psnd_pcm_t): longint; cdecl; external libasound;
function snd_pcm_htimestamp(pcm: Psnd_pcm_t; avail: Psnd_pcm_uframes_t; tstamp: Psnd_htimestamp_t): longint; cdecl; external libasound;
function snd_pcm_avail(pcm: Psnd_pcm_t): Tsnd_pcm_sframes_t; cdecl; external libasound;
function snd_pcm_avail_update(pcm: Psnd_pcm_t): Tsnd_pcm_sframes_t; cdecl; external libasound;
function snd_pcm_avail_delay(pcm: Psnd_pcm_t; availp: Psnd_pcm_sframes_t; delayp: Psnd_pcm_sframes_t): longint; cdecl; external libasound;
function snd_pcm_rewindable(pcm: Psnd_pcm_t): Tsnd_pcm_sframes_t; cdecl; external libasound;
function snd_pcm_rewind(pcm: Psnd_pcm_t; frames: Tsnd_pcm_uframes_t): Tsnd_pcm_sframes_t; cdecl; external libasound;
function snd_pcm_forwardable(pcm: Psnd_pcm_t): Tsnd_pcm_sframes_t; cdecl; external libasound;
function snd_pcm_forward(pcm: Psnd_pcm_t; frames: Tsnd_pcm_uframes_t): Tsnd_pcm_sframes_t; cdecl; external libasound;
function snd_pcm_writei(pcm: Psnd_pcm_t; buffer: pointer; size: Tsnd_pcm_uframes_t): Tsnd_pcm_sframes_t; cdecl; external libasound;
function snd_pcm_readi(pcm: Psnd_pcm_t; buffer: pointer; size: Tsnd_pcm_uframes_t): Tsnd_pcm_sframes_t; cdecl; external libasound;
function snd_pcm_writen(pcm: Psnd_pcm_t; bufs: Ppointer; size: Tsnd_pcm_uframes_t): Tsnd_pcm_sframes_t; cdecl; external libasound;
function snd_pcm_readn(pcm: Psnd_pcm_t; bufs: Ppointer; size: Tsnd_pcm_uframes_t): Tsnd_pcm_sframes_t; cdecl; external libasound;
function snd_pcm_wait(pcm: Psnd_pcm_t; timeout: longint): longint; cdecl; external libasound;
function snd_pcm_link(pcm1: Psnd_pcm_t; pcm2: Psnd_pcm_t): longint; cdecl; external libasound;
function snd_pcm_unlink(pcm: Psnd_pcm_t): longint; cdecl; external libasound;

const
  SND_CHMAP_API_VERSION = ((1 shl 16) or (0 shl 8)) or 1;

type
  Tsnd_pcm_chmap_type = longint;

const
  SND_CHMAP_TYPE_NONE = 0;
  SND_CHMAP_TYPE_FIXED = 1;
  SND_CHMAP_TYPE_VAR = 2;
  SND_CHMAP_TYPE_PAIRED = 3;
  SND_CHMAP_TYPE_LAST = SND_CHMAP_TYPE_PAIRED;

type
  Tsnd_pcm_chmap_position = longint;

const
  SND_CHMAP_UNKNOWN = 0;
  SND_CHMAP_NA = 1;
  SND_CHMAP_MONO = 2;
  SND_CHMAP_FL = 3;
  SND_CHMAP_FR = 4;
  SND_CHMAP_RL = 5;
  SND_CHMAP_RR = 6;
  SND_CHMAP_FC = 7;
  SND_CHMAP_LFE = 8;
  SND_CHMAP_SL = 9;
  SND_CHMAP_SR = 10;
  SND_CHMAP_RC = 11;
  SND_CHMAP_FLC = 12;
  SND_CHMAP_FRC = 13;
  SND_CHMAP_RLC = 14;
  SND_CHMAP_RRC = 15;
  SND_CHMAP_FLW = 16;
  SND_CHMAP_FRW = 17;
  SND_CHMAP_FLH = 18;
  SND_CHMAP_FCH = 19;
  SND_CHMAP_FRH = 20;
  SND_CHMAP_TC = 21;
  SND_CHMAP_TFL = 22;
  SND_CHMAP_TFR = 23;
  SND_CHMAP_TFC = 24;
  SND_CHMAP_TRL = 25;
  SND_CHMAP_TRR = 26;
  SND_CHMAP_TRC = 27;
  SND_CHMAP_TFLC = 28;
  SND_CHMAP_TFRC = 29;
  SND_CHMAP_TSL = 30;
  SND_CHMAP_TSR = 31;
  SND_CHMAP_LLFE = 32;
  SND_CHMAP_RLFE = 33;
  SND_CHMAP_BC = 34;
  SND_CHMAP_BLC = 35;
  SND_CHMAP_BRC = 36;
  SND_CHMAP_LAST = SND_CHMAP_BRC;

  SND_CHMAP_POSITION_MASK = $ffff;
  SND_CHMAP_PHASE_INVERSE = $01 shl 16;
  SND_CHMAP_DRIVER_SPEC = $02 shl 16;

type
  Tsnd_pcm_chmap_t = record
    channels: dword;
    pos: pdword;
  end;
  Psnd_pcm_chmap_t = ^Tsnd_pcm_chmap_t;

  Tsnd_pcm_chmap_query_t = record
    _type: Tsnd_pcm_chmap_type;
    map: Tsnd_pcm_chmap_t;
  end;
  Psnd_pcm_chmap_query_t = ^Tsnd_pcm_chmap_query_t;
  PPsnd_pcm_chmap_query_t = ^Psnd_pcm_chmap_query_t;

function snd_pcm_query_chmaps(pcm: Psnd_pcm_t): PPsnd_pcm_chmap_query_t; cdecl; external libasound;
function snd_pcm_query_chmaps_from_hw(card: longint; dev: longint; subdev: longint; stream: Tsnd_pcm_stream_t): PPsnd_pcm_chmap_query_t; cdecl; external libasound;
procedure snd_pcm_free_chmaps(maps: PPsnd_pcm_chmap_query_t); cdecl; external libasound;
function snd_pcm_get_chmap(pcm: Psnd_pcm_t): Psnd_pcm_chmap_t; cdecl; external libasound;
function snd_pcm_set_chmap(pcm: Psnd_pcm_t; map: Psnd_pcm_chmap_t): longint; cdecl; external libasound;
function snd_pcm_chmap_type_name(val: Tsnd_pcm_chmap_type): pchar; cdecl; external libasound;
function snd_pcm_chmap_name(val: Tsnd_pcm_chmap_position): pchar; cdecl; external libasound;
function snd_pcm_chmap_long_name(val: Tsnd_pcm_chmap_position): pchar; cdecl; external libasound;
function snd_pcm_chmap_print(map: Psnd_pcm_chmap_t; maxlen: Tsize_t; buf: pchar): longint; cdecl; external libasound;
function snd_pcm_chmap_from_string(str: pchar): dword; cdecl; external libasound;
function snd_pcm_chmap_parse_string(str: pchar): Psnd_pcm_chmap_t; cdecl; external libasound;
function snd_pcm_recover(pcm: Psnd_pcm_t; err: longint; silent: longint): longint; cdecl; external libasound;
function snd_pcm_set_params(pcm: Psnd_pcm_t; format: Tsnd_pcm_format_t; access: Tsnd_pcm_access_t; channels: dword; rate: dword;
  soft_resample: longint; latency: dword): longint; cdecl; external libasound;
function snd_pcm_get_params(pcm: Psnd_pcm_t; buffer_size: Psnd_pcm_uframes_t; period_size: Psnd_pcm_uframes_t): longint; cdecl; external libasound;
function snd_pcm_info_sizeof: Tsize_t; cdecl; external libasound;

function snd_pcm_info_malloc(ptr: PPsnd_pcm_info_t): longint; cdecl; external libasound;
procedure snd_pcm_info_free(obj: Psnd_pcm_info_t); cdecl; external libasound;
procedure snd_pcm_info_copy(dst: Psnd_pcm_info_t; src: Psnd_pcm_info_t); cdecl; external libasound;
function snd_pcm_info_get_device(obj: Psnd_pcm_info_t): dword; cdecl; external libasound;
function snd_pcm_info_get_subdevice(obj: Psnd_pcm_info_t): dword; cdecl; external libasound;
function snd_pcm_info_get_stream(obj: Psnd_pcm_info_t): Tsnd_pcm_stream_t; cdecl; external libasound;
function snd_pcm_info_get_card(obj: Psnd_pcm_info_t): longint; cdecl; external libasound;
function snd_pcm_info_get_id(obj: Psnd_pcm_info_t): pchar; cdecl; external libasound;
function snd_pcm_info_get_name(obj: Psnd_pcm_info_t): pchar; cdecl; external libasound;
function snd_pcm_info_get_subdevice_name(obj: Psnd_pcm_info_t): pchar; cdecl; external libasound;
function snd_pcm_info_get_class(obj: Psnd_pcm_info_t): Tsnd_pcm_class_t; cdecl; external libasound;
function snd_pcm_info_get_subclass(obj: Psnd_pcm_info_t): Tsnd_pcm_subclass_t; cdecl; external libasound;
function snd_pcm_info_get_subdevices_count(obj: Psnd_pcm_info_t): dword; cdecl; external libasound;
function snd_pcm_info_get_subdevices_avail(obj: Psnd_pcm_info_t): dword; cdecl; external libasound;
function snd_pcm_info_get_sync(obj: Psnd_pcm_info_t): Tsnd_pcm_sync_id_t; cdecl; external libasound;
procedure snd_pcm_info_set_device(obj: Psnd_pcm_info_t; val: dword); cdecl; external libasound;
procedure snd_pcm_info_set_subdevice(obj: Psnd_pcm_info_t; val: dword); cdecl; external libasound;
procedure snd_pcm_info_set_stream(obj: Psnd_pcm_info_t; val: Tsnd_pcm_stream_t); cdecl; external libasound;

function snd_pcm_hw_params_any(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_can_mmap_sample_resolution(params: Psnd_pcm_hw_params_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_is_double(params: Psnd_pcm_hw_params_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_is_batch(params: Psnd_pcm_hw_params_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_is_block_transfer(params: Psnd_pcm_hw_params_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_is_monotonic(params: Psnd_pcm_hw_params_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_can_overrange(params: Psnd_pcm_hw_params_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_can_pause(params: Psnd_pcm_hw_params_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_can_resume(params: Psnd_pcm_hw_params_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_is_half_duplex(params: Psnd_pcm_hw_params_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_is_joint_duplex(params: Psnd_pcm_hw_params_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_can_sync_start(params: Psnd_pcm_hw_params_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_can_disable_period_wakeup(params: Psnd_pcm_hw_params_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_is_perfect_drain(params: Psnd_pcm_hw_params_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_supports_audio_wallclock_ts(params: Psnd_pcm_hw_params_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_supports_audio_ts_type(params: Psnd_pcm_hw_params_t; _type: longint): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_rate_numden(params: Psnd_pcm_hw_params_t; rate_num: Pdword; rate_den: Pdword): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_sbits(params: Psnd_pcm_hw_params_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_fifo_size(params: Psnd_pcm_hw_params_t): longint; cdecl; external libasound;

function snd_pcm_hw_params_sizeof: Tsize_t; cdecl; external libasound;

function snd_pcm_hw_params_malloc(ptr: PPsnd_pcm_hw_params_t): longint; cdecl; external libasound;
procedure snd_pcm_hw_params_free(obj: Psnd_pcm_hw_params_t); cdecl; external libasound;
procedure snd_pcm_hw_params_copy(dst: Psnd_pcm_hw_params_t; src: Psnd_pcm_hw_params_t); cdecl; external libasound;

function snd_pcm_hw_params_get_access(params: Psnd_pcm_hw_params_t; _access: Psnd_pcm_access_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_test_access(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; _access: Tsnd_pcm_access_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_access(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; _access: Tsnd_pcm_access_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_access_first(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; _access: Psnd_pcm_access_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_access_last(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; _access: Psnd_pcm_access_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_access_mask(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; mask: Psnd_pcm_access_mask_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_access_mask(params: Psnd_pcm_hw_params_t; mask: Psnd_pcm_access_mask_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_format(params: Psnd_pcm_hw_params_t; val: Psnd_pcm_format_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_test_format(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Tsnd_pcm_format_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_format(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Tsnd_pcm_format_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_format_first(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; format: Psnd_pcm_format_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_format_last(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; format: Psnd_pcm_format_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_format_mask(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; mask: Psnd_pcm_format_mask_t): longint; cdecl; external libasound;
procedure snd_pcm_hw_params_get_format_mask(params: Psnd_pcm_hw_params_t; mask: Psnd_pcm_format_mask_t); cdecl; external libasound;
function snd_pcm_hw_params_get_subformat(params: Psnd_pcm_hw_params_t; subformat: Psnd_pcm_subformat_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_test_subformat(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; subformat: Tsnd_pcm_subformat_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_subformat(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; subformat: Tsnd_pcm_subformat_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_subformat_first(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; subformat: Psnd_pcm_subformat_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_subformat_last(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; subformat: Psnd_pcm_subformat_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_subformat_mask(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; mask: Psnd_pcm_subformat_mask_t): longint; cdecl; external libasound;
procedure snd_pcm_hw_params_get_subformat_mask(params: Psnd_pcm_hw_params_t; mask: Psnd_pcm_subformat_mask_t); cdecl; external libasound;
function snd_pcm_hw_params_get_channels(params: Psnd_pcm_hw_params_t; val: Pdword): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_channels_min(params: Psnd_pcm_hw_params_t; val: Pdword): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_channels_max(params: Psnd_pcm_hw_params_t; val: Pdword): longint; cdecl; external libasound;
function snd_pcm_hw_params_test_channels(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: dword): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_channels(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: dword): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_channels_min(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_channels_max(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_channels_minmax(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; min: Pdword; max: Pdword): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_channels_near(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_channels_first(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_channels_last(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_rate(params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_rate_min(params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_rate_max(params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_test_rate(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: dword; dir: longint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_rate(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: dword; dir: longint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_rate_min(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_rate_max(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_rate_minmax(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; min: Pdword; mindir: Plongint; max: Pdword; maxdir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_rate_near(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_rate_first(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_rate_last(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_rate_resample(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: dword): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_rate_resample(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_export_buffer(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: dword): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_export_buffer(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_period_wakeup(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: dword): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_period_wakeup(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_drain_silence(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: dword): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_drain_silence(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_period_time(params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_period_time_min(params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_period_time_max(params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_test_period_time(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: dword; dir: longint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_period_time(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: dword; dir: longint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_period_time_min(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_period_time_max(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_period_time_minmax(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; min: Pdword; mindir: Plongint; max: Pdword; maxdir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_period_time_near(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_period_time_first(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_period_time_last(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_period_size(params: Psnd_pcm_hw_params_t; frames: Psnd_pcm_uframes_t; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_period_size_min(params: Psnd_pcm_hw_params_t; frames: Psnd_pcm_uframes_t; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_period_size_max(params: Psnd_pcm_hw_params_t; frames: Psnd_pcm_uframes_t; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_test_period_size(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Tsnd_pcm_uframes_t; dir: longint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_period_size(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Tsnd_pcm_uframes_t; dir: longint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_period_size_min(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Psnd_pcm_uframes_t; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_period_size_max(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Psnd_pcm_uframes_t; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_period_size_minmax(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; min: Psnd_pcm_uframes_t; mindir: Plongint; max: Psnd_pcm_uframes_t; maxdir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_period_size_near(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Psnd_pcm_uframes_t; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_period_size_first(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Psnd_pcm_uframes_t; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_period_size_last(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Psnd_pcm_uframes_t; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_period_size_integer(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_periods(params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_periods_min(params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_periods_max(params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_test_periods(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: dword; dir: longint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_periods(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: dword; dir: longint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_periods_min(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_periods_max(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_periods_minmax(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; min: Pdword; mindir: Plongint; max: Pdword; maxdir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_periods_near(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_periods_first(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_periods_last(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_periods_integer(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_buffer_time(params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_buffer_time_min(params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_buffer_time_max(params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_test_buffer_time(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: dword; dir: longint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_buffer_time(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: dword; dir: longint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_buffer_time_min(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_buffer_time_max(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_buffer_time_minmax(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; min: Pdword; mindir: Plongint; max: Pdword; maxdir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_buffer_time_near(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_buffer_time_first(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_buffer_time_last(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_buffer_size(params: Psnd_pcm_hw_params_t; val: Psnd_pcm_uframes_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_buffer_size_min(params: Psnd_pcm_hw_params_t; val: Psnd_pcm_uframes_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_get_buffer_size_max(params: Psnd_pcm_hw_params_t; val: Psnd_pcm_uframes_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_test_buffer_size(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Tsnd_pcm_uframes_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_buffer_size(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Tsnd_pcm_uframes_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_buffer_size_min(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Psnd_pcm_uframes_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_buffer_size_max(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Psnd_pcm_uframes_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_buffer_size_minmax(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; min: Psnd_pcm_uframes_t; max: Psnd_pcm_uframes_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_buffer_size_near(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Psnd_pcm_uframes_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_buffer_size_first(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Psnd_pcm_uframes_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_set_buffer_size_last(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Psnd_pcm_uframes_t): longint; cdecl; external libasound;

function snd_pcm_hw_params_get_min_align(params: Psnd_pcm_hw_params_t; val: Psnd_pcm_uframes_t): longint; cdecl; external libasound;
function snd_pcm_sw_params_sizeof: Tsize_t; cdecl; external libasound;

function snd_pcm_sw_params_malloc(ptr: PPsnd_pcm_sw_params_t): longint; cdecl; external libasound;
procedure snd_pcm_sw_params_free(obj: Psnd_pcm_sw_params_t); cdecl; external libasound;
procedure snd_pcm_sw_params_copy(dst: Psnd_pcm_sw_params_t; src: Psnd_pcm_sw_params_t); cdecl; external libasound;
function snd_pcm_sw_params_get_boundary(params: Psnd_pcm_sw_params_t; val: Psnd_pcm_uframes_t): longint; cdecl; external libasound;

function snd_pcm_sw_params_set_tstamp_mode(pcm: Psnd_pcm_t; params: Psnd_pcm_sw_params_t; val: Tsnd_pcm_tstamp_t): longint; cdecl; external libasound;
function snd_pcm_sw_params_get_tstamp_mode(params: Psnd_pcm_sw_params_t; val: Psnd_pcm_tstamp_t): longint; cdecl; external libasound;
function snd_pcm_sw_params_set_tstamp_type(pcm: Psnd_pcm_t; params: Psnd_pcm_sw_params_t; val: Tsnd_pcm_tstamp_type_t): longint; cdecl; external libasound;
function snd_pcm_sw_params_get_tstamp_type(params: Psnd_pcm_sw_params_t; val: Psnd_pcm_tstamp_type_t): longint; cdecl; external libasound;
function snd_pcm_sw_params_set_avail_min(pcm: Psnd_pcm_t; params: Psnd_pcm_sw_params_t; val: Tsnd_pcm_uframes_t): longint; cdecl; external libasound;
function snd_pcm_sw_params_get_avail_min(params: Psnd_pcm_sw_params_t; val: Psnd_pcm_uframes_t): longint; cdecl; external libasound;
function snd_pcm_sw_params_set_period_event(pcm: Psnd_pcm_t; params: Psnd_pcm_sw_params_t; val: longint): longint; cdecl; external libasound;
function snd_pcm_sw_params_get_period_event(params: Psnd_pcm_sw_params_t; val: Plongint): longint; cdecl; external libasound;
function snd_pcm_sw_params_set_start_threshold(pcm: Psnd_pcm_t; params: Psnd_pcm_sw_params_t; val: Tsnd_pcm_uframes_t): longint; cdecl; external libasound;
function snd_pcm_sw_params_get_start_threshold(paramsm: Psnd_pcm_sw_params_t; val: Psnd_pcm_uframes_t): longint; cdecl; external libasound;
function snd_pcm_sw_params_set_stop_threshold(pcm: Psnd_pcm_t; params: Psnd_pcm_sw_params_t; val: Tsnd_pcm_uframes_t): longint; cdecl; external libasound;
function snd_pcm_sw_params_get_stop_threshold(params: Psnd_pcm_sw_params_t; val: Psnd_pcm_uframes_t): longint; cdecl; external libasound;
function snd_pcm_sw_params_set_silence_threshold(pcm: Psnd_pcm_t; params: Psnd_pcm_sw_params_t; val: Tsnd_pcm_uframes_t): longint; cdecl; external libasound;
function snd_pcm_sw_params_get_silence_threshold(params: Psnd_pcm_sw_params_t; val: Psnd_pcm_uframes_t): longint; cdecl; external libasound;
function snd_pcm_sw_params_set_silence_size(pcm: Psnd_pcm_t; params: Psnd_pcm_sw_params_t; val: Tsnd_pcm_uframes_t): longint; cdecl; external libasound;
function snd_pcm_sw_params_get_silence_size(params: Psnd_pcm_sw_params_t; val: Psnd_pcm_uframes_t): longint; cdecl; external libasound;

function snd_pcm_access_mask_sizeof: Tsize_t; cdecl; external libasound;

function snd_pcm_access_mask_malloc(ptr: PPsnd_pcm_access_mask_t): longint; cdecl; external libasound;
procedure snd_pcm_access_mask_free(obj: Psnd_pcm_access_mask_t); cdecl; external libasound;
procedure snd_pcm_access_mask_copy(dst: Psnd_pcm_access_mask_t; src: Psnd_pcm_access_mask_t); cdecl; external libasound;
procedure snd_pcm_access_mask_none(mask: Psnd_pcm_access_mask_t); cdecl; external libasound;
procedure snd_pcm_access_mask_any(mask: Psnd_pcm_access_mask_t); cdecl; external libasound;
function snd_pcm_access_mask_test(mask: Psnd_pcm_access_mask_t; val: Tsnd_pcm_access_t): longint; cdecl; external libasound;
function snd_pcm_access_mask_empty(mask: Psnd_pcm_access_mask_t): longint; cdecl; external libasound;
procedure snd_pcm_access_mask_set(mask: Psnd_pcm_access_mask_t; val: Tsnd_pcm_access_t); cdecl; external libasound;
procedure snd_pcm_access_mask_reset(mask: Psnd_pcm_access_mask_t; val: Tsnd_pcm_access_t); cdecl; external libasound;
function snd_pcm_format_mask_sizeof: Tsize_t; cdecl; external libasound;

function snd_pcm_format_mask_malloc(ptr: PPsnd_pcm_format_mask_t): longint; cdecl; external libasound;
procedure snd_pcm_format_mask_free(obj: Psnd_pcm_format_mask_t); cdecl; external libasound;
procedure snd_pcm_format_mask_copy(dst: Psnd_pcm_format_mask_t; src: Psnd_pcm_format_mask_t); cdecl; external libasound;
procedure snd_pcm_format_mask_none(mask: Psnd_pcm_format_mask_t); cdecl; external libasound;
procedure snd_pcm_format_mask_any(mask: Psnd_pcm_format_mask_t); cdecl; external libasound;
function snd_pcm_format_mask_test(mask: Psnd_pcm_format_mask_t; val: Tsnd_pcm_format_t): longint; cdecl; external libasound;
function snd_pcm_format_mask_empty(mask: Psnd_pcm_format_mask_t): longint; cdecl; external libasound;
procedure snd_pcm_format_mask_set(mask: Psnd_pcm_format_mask_t; val: Tsnd_pcm_format_t); cdecl; external libasound;
procedure snd_pcm_format_mask_reset(mask: Psnd_pcm_format_mask_t; val: Tsnd_pcm_format_t); cdecl; external libasound;
function snd_pcm_subformat_mask_sizeof: Tsize_t; cdecl; external libasound;

function snd_pcm_subformat_mask_malloc(ptr: PPsnd_pcm_subformat_mask_t): longint; cdecl; external libasound;
procedure snd_pcm_subformat_mask_free(obj: Psnd_pcm_subformat_mask_t); cdecl; external libasound;
procedure snd_pcm_subformat_mask_copy(dst: Psnd_pcm_subformat_mask_t; src: Psnd_pcm_subformat_mask_t); cdecl; external libasound;
procedure snd_pcm_subformat_mask_none(mask: Psnd_pcm_subformat_mask_t); cdecl; external libasound;
procedure snd_pcm_subformat_mask_any(mask: Psnd_pcm_subformat_mask_t); cdecl; external libasound;
function snd_pcm_subformat_mask_test(mask: Psnd_pcm_subformat_mask_t; val: Tsnd_pcm_subformat_t): longint; cdecl; external libasound;
function snd_pcm_subformat_mask_empty(mask: Psnd_pcm_subformat_mask_t): longint; cdecl; external libasound;
procedure snd_pcm_subformat_mask_set(mask: Psnd_pcm_subformat_mask_t; val: Tsnd_pcm_subformat_t); cdecl; external libasound;
procedure snd_pcm_subformat_mask_reset(mask: Psnd_pcm_subformat_mask_t; val: Tsnd_pcm_subformat_t); cdecl; external libasound;
function snd_pcm_status_sizeof: Tsize_t; cdecl; external libasound;

function snd_pcm_status_malloc(ptr: PPsnd_pcm_status_t): longint; cdecl; external libasound;
procedure snd_pcm_status_free(obj: Psnd_pcm_status_t); cdecl; external libasound;
procedure snd_pcm_status_copy(dst: Psnd_pcm_status_t; src: Psnd_pcm_status_t); cdecl; external libasound;
function snd_pcm_status_get_state(obj: Psnd_pcm_status_t): Tsnd_pcm_state_t; cdecl; external libasound;
procedure snd_pcm_status_get_trigger_tstamp(obj: Psnd_pcm_status_t; ptr: Psnd_timestamp_t); cdecl; external libasound;
procedure snd_pcm_status_get_trigger_htstamp(obj: Psnd_pcm_status_t; ptr: Psnd_htimestamp_t); cdecl; external libasound;
procedure snd_pcm_status_get_tstamp(obj: Psnd_pcm_status_t; ptr: Psnd_timestamp_t); cdecl; external libasound;
procedure snd_pcm_status_get_htstamp(obj: Psnd_pcm_status_t; ptr: Psnd_htimestamp_t); cdecl; external libasound;
procedure snd_pcm_status_get_audio_htstamp(obj: Psnd_pcm_status_t; ptr: Psnd_htimestamp_t); cdecl; external libasound;
procedure snd_pcm_status_get_driver_htstamp(obj: Psnd_pcm_status_t; ptr: Psnd_htimestamp_t); cdecl; external libasound;
procedure snd_pcm_status_get_audio_htstamp_report(obj: Psnd_pcm_status_t; audio_tstamp_report: Psnd_pcm_audio_tstamp_report_t); cdecl; external libasound;
procedure snd_pcm_status_set_audio_htstamp_config(obj: Psnd_pcm_status_t; audio_tstamp_config: Psnd_pcm_audio_tstamp_config_t); cdecl; external libasound;

procedure snd_pcm_pack_audio_tstamp_config(data: PUInt32; config: Psnd_pcm_audio_tstamp_config_t); inline;
procedure snd_pcm_unpack_audio_tstamp_report(data: uint32; accuracy: cardinal; report: Psnd_pcm_audio_tstamp_report_t); inline;

function snd_pcm_status_get_delay(obj: Psnd_pcm_status_t): Tsnd_pcm_sframes_t; cdecl; external libasound;
function snd_pcm_status_get_avail(obj: Psnd_pcm_status_t): Tsnd_pcm_uframes_t; cdecl; external libasound;
function snd_pcm_status_get_avail_max(obj: Psnd_pcm_status_t): Tsnd_pcm_uframes_t; cdecl; external libasound;
function snd_pcm_status_get_overrange(obj: Psnd_pcm_status_t): Tsnd_pcm_uframes_t; cdecl; external libasound;

function snd_pcm_type_name(_type: Tsnd_pcm_type_t): pchar; cdecl; external libasound;
function snd_pcm_stream_name(stream: Tsnd_pcm_stream_t): pchar; cdecl; external libasound;
function snd_pcm_access_name(_access: Tsnd_pcm_access_t): pchar; cdecl; external libasound;
function snd_pcm_format_name(format: Tsnd_pcm_format_t): pchar; cdecl; external libasound;
function snd_pcm_format_description(format: Tsnd_pcm_format_t): pchar; cdecl; external libasound;
function snd_pcm_subformat_name(subformat: Tsnd_pcm_subformat_t): pchar; cdecl; external libasound;
function snd_pcm_subformat_description(subformat: Tsnd_pcm_subformat_t): pchar; cdecl; external libasound;
function snd_pcm_subformat_value(name: pchar): Tsnd_pcm_subformat_t; cdecl; external libasound;
function snd_pcm_format_value(name: pchar): Tsnd_pcm_format_t; cdecl; external libasound;
function snd_pcm_tstamp_mode_name(mode: Tsnd_pcm_tstamp_t): pchar; cdecl; external libasound;
function snd_pcm_state_name(state: Tsnd_pcm_state_t): pchar; cdecl; external libasound;

function snd_pcm_dump(pcm: Psnd_pcm_t; out_: Psnd_output_t): longint; cdecl; external libasound;
function snd_pcm_dump_hw_setup(pcm: Psnd_pcm_t; out_: Psnd_output_t): longint; cdecl; external libasound;
function snd_pcm_dump_sw_setup(pcm: Psnd_pcm_t; out_: Psnd_output_t): longint; cdecl; external libasound;
function snd_pcm_dump_setup(pcm: Psnd_pcm_t; out_: Psnd_output_t): longint; cdecl; external libasound;
function snd_pcm_hw_params_dump(params: Psnd_pcm_hw_params_t; out_: Psnd_output_t): longint; cdecl; external libasound;
function snd_pcm_sw_params_dump(params: Psnd_pcm_sw_params_t; out_: Psnd_output_t): longint; cdecl; external libasound;
function snd_pcm_status_dump(status: Psnd_pcm_status_t; out_: Psnd_output_t): longint; cdecl; external libasound;

function snd_pcm_mmap_begin(pcm: Psnd_pcm_t; areas: PPsnd_pcm_channel_area_t; offset: Psnd_pcm_uframes_t; frames: Psnd_pcm_uframes_t): longint; cdecl; external libasound;
function snd_pcm_mmap_commit(pcm: Psnd_pcm_t; offset: Tsnd_pcm_uframes_t; frames: Tsnd_pcm_uframes_t): Tsnd_pcm_sframes_t; cdecl; external libasound;
function snd_pcm_mmap_writei(pcm: Psnd_pcm_t; buffer: pointer; size: Tsnd_pcm_uframes_t): Tsnd_pcm_sframes_t; cdecl; external libasound;
function snd_pcm_mmap_readi(pcm: Psnd_pcm_t; buffer: pointer; size: Tsnd_pcm_uframes_t): Tsnd_pcm_sframes_t; cdecl; external libasound;
function snd_pcm_mmap_writen(pcm: Psnd_pcm_t; bufs: Ppointer; size: Tsnd_pcm_uframes_t): Tsnd_pcm_sframes_t; cdecl; external libasound;
function snd_pcm_mmap_readn(pcm: Psnd_pcm_t; bufs: Ppointer; size: Tsnd_pcm_uframes_t): Tsnd_pcm_sframes_t; cdecl; external libasound;
function snd_pcm_format_signed(format: Tsnd_pcm_format_t): longint; cdecl; external libasound;
function snd_pcm_format_unsigned(format: Tsnd_pcm_format_t): longint; cdecl; external libasound;
function snd_pcm_format_linear(format: Tsnd_pcm_format_t): longint; cdecl; external libasound;
function snd_pcm_format_float(format: Tsnd_pcm_format_t): longint; cdecl; external libasound;
function snd_pcm_format_little_endian(format: Tsnd_pcm_format_t): longint; cdecl; external libasound;
function snd_pcm_format_big_endian(format: Tsnd_pcm_format_t): longint; cdecl; external libasound;
function snd_pcm_format_cpu_endian(format: Tsnd_pcm_format_t): longint; cdecl; external libasound;
function snd_pcm_format_width(format: Tsnd_pcm_format_t): longint; cdecl; external libasound;

function snd_pcm_format_physical_width(format: Tsnd_pcm_format_t): longint; cdecl; external libasound;

function snd_pcm_build_linear_format(width: longint; pwidth: longint; unsignd: longint; big_endian: longint): Tsnd_pcm_format_t; cdecl; external libasound;
function snd_pcm_format_size(format: Tsnd_pcm_format_t; samples: Tsize_t): Tssize_t; cdecl; external libasound;
function snd_pcm_format_silence(format: Tsnd_pcm_format_t): Tuint8_t; cdecl; external libasound;
function snd_pcm_format_silence_16(format: Tsnd_pcm_format_t): Tuint16_t; cdecl; external libasound;
function snd_pcm_format_silence_32(format: Tsnd_pcm_format_t): Tuint32_t; cdecl; external libasound;
function snd_pcm_format_silence_64(format: Tsnd_pcm_format_t): Tuint64_t; cdecl; external libasound;
function snd_pcm_format_set_silence(format: Tsnd_pcm_format_t; buf: pointer; samples: dword): longint; cdecl; external libasound;
function snd_pcm_bytes_to_frames(pcm: Psnd_pcm_t; bytes: Tssize_t): Tsnd_pcm_sframes_t; cdecl; external libasound;
function snd_pcm_frames_to_bytes(pcm: Psnd_pcm_t; frames: Tsnd_pcm_sframes_t): Tssize_t; cdecl; external libasound;
function snd_pcm_bytes_to_samples(pcm: Psnd_pcm_t; bytes: Tssize_t): Tclong; cdecl; external libasound;
function snd_pcm_samples_to_bytes(pcm: Psnd_pcm_t; samples: Tclong): Tssize_t; cdecl; external libasound;
function snd_pcm_area_silence(dst_channel: Psnd_pcm_channel_area_t; dst_offset: Tsnd_pcm_uframes_t; samples: dword; format: Tsnd_pcm_format_t): longint; cdecl; external libasound;
function snd_pcm_areas_silence(dst_channels: Psnd_pcm_channel_area_t; dst_offset: Tsnd_pcm_uframes_t; channels: dword; frames: Tsnd_pcm_uframes_t; format: Tsnd_pcm_format_t): longint; cdecl; external libasound;
function snd_pcm_area_copy(dst_channel: Psnd_pcm_channel_area_t; dst_offset: Tsnd_pcm_uframes_t; src_channel: Psnd_pcm_channel_area_t; src_offset: Tsnd_pcm_uframes_t; samples: dword;
  format: Tsnd_pcm_format_t): longint; cdecl; external libasound;
function snd_pcm_areas_copy(dst_channels: Psnd_pcm_channel_area_t; dst_offset: Tsnd_pcm_uframes_t; src_channels: Psnd_pcm_channel_area_t; src_offset: Tsnd_pcm_uframes_t; channels: dword;
  frames: Tsnd_pcm_uframes_t; format: Tsnd_pcm_format_t): longint; cdecl; external libasound;
function snd_pcm_areas_copy_wrap(dst_channels: Psnd_pcm_channel_area_t; dst_offset: Tsnd_pcm_uframes_t; dst_size: Tsnd_pcm_uframes_t; src_channels: Psnd_pcm_channel_area_t; src_offset: Tsnd_pcm_uframes_t;
  src_size: Tsnd_pcm_uframes_t; channels: dword; frames: Tsnd_pcm_uframes_t; format: Tsnd_pcm_format_t): longint; cdecl; external libasound;

function snd_pcm_channel_area_addr(area: Psnd_pcm_channel_area_t; offset: Tsnd_pcm_uframes_t): Pointer; inline;
function snd_pcm_channel_area_step(area: Psnd_pcm_channel_area_t): cardinal; inline;

type
  Psnd_pcm_hook_type_t = ^Tsnd_pcm_hook_type_t;
  Tsnd_pcm_hook_type_t = longint;

const
  SND_PCM_HOOK_TYPE_HW_PARAMS = 0;
  SND_PCM_HOOK_TYPE_HW_FREE = 1;
  SND_PCM_HOOK_TYPE_CLOSE = 2;
  SND_PCM_HOOK_TYPE_LAST = SND_PCM_HOOK_TYPE_CLOSE;

type
  Psnd_pcm_hook_t = type Pointer;
  PPsnd_pcm_hook_t = ^Psnd_pcm_hook_t;

  Tsnd_pcm_hook_func_t = function(hook: Psnd_pcm_hook_t): longint; cdecl;

function snd_pcm_hook_get_pcm(hook: Psnd_pcm_hook_t): Psnd_pcm_t; cdecl; external libasound;
function snd_pcm_hook_get_private(hook: Psnd_pcm_hook_t): pointer; cdecl; external libasound;
procedure snd_pcm_hook_set_private(hook: Psnd_pcm_hook_t; private_data: pointer); cdecl; external libasound;
function snd_pcm_hook_add(hookp: PPsnd_pcm_hook_t; pcm: Psnd_pcm_t; _type: Tsnd_pcm_hook_type_t; func: Tsnd_pcm_hook_func_t; private_data: pointer): longint; cdecl; external libasound;
function snd_pcm_hook_remove(hook: Psnd_pcm_hook_t): longint; cdecl; external libasound;

type
  Tsnd_pcm_scope_ops_t = record
    enable: function(scope: Psnd_pcm_scope_t): longint; cdecl;
    disable: procedure(scope: Psnd_pcm_scope_t); cdecl;
    start: procedure(scope: Psnd_pcm_scope_t); cdecl;
    stop: procedure(scope: Psnd_pcm_scope_t); cdecl;
    update: procedure(scope: Psnd_pcm_scope_t); cdecl;
    reset: procedure(scope: Psnd_pcm_scope_t); cdecl;
    close: procedure(scope: Psnd_pcm_scope_t); cdecl;
  end;
  Psnd_pcm_scope_ops_t = ^Tsnd_pcm_scope_ops_t;

function snd_pcm_meter_get_bufsize(pcm: Psnd_pcm_t): Tsnd_pcm_uframes_t; cdecl; external libasound;
function snd_pcm_meter_get_channels(pcm: Psnd_pcm_t): dword; cdecl; external libasound;
function snd_pcm_meter_get_rate(pcm: Psnd_pcm_t): dword; cdecl; external libasound;
function snd_pcm_meter_get_now(pcm: Psnd_pcm_t): Tsnd_pcm_uframes_t; cdecl; external libasound;
function snd_pcm_meter_get_boundary(pcm: Psnd_pcm_t): Tsnd_pcm_uframes_t; cdecl; external libasound;
function snd_pcm_meter_add_scope(pcm: Psnd_pcm_t; scope: Psnd_pcm_scope_t): longint; cdecl; external libasound;
function snd_pcm_meter_search_scope(pcm: Psnd_pcm_t; name: pchar): Psnd_pcm_scope_t; cdecl; external libasound;
function snd_pcm_scope_malloc(ptr: PPsnd_pcm_scope_t): longint; cdecl; external libasound;
procedure snd_pcm_scope_set_ops(scope: Psnd_pcm_scope_t; val: Psnd_pcm_scope_ops_t); cdecl; external libasound;
procedure snd_pcm_scope_set_name(scope: Psnd_pcm_scope_t; val: pchar); cdecl; external libasound;
function snd_pcm_scope_get_name(scope: Psnd_pcm_scope_t): pchar; cdecl; external libasound;
function snd_pcm_scope_get_callback_private(scope: Psnd_pcm_scope_t): pointer; cdecl; external libasound;
procedure snd_pcm_scope_set_callback_private(scope: Psnd_pcm_scope_t; val: pointer); cdecl; external libasound;
function snd_pcm_scope_s16_open(pcm: Psnd_pcm_t; name: pchar; scopep: PPsnd_pcm_scope_t): longint; cdecl; external libasound;
function snd_pcm_scope_s16_get_channel_buffer(scope: Psnd_pcm_scope_t; channel: dword): Pint16_t; cdecl; external libasound;

type
  Psnd_spcm_latency_t = ^Tsnd_spcm_latency_t;
  Tsnd_spcm_latency_t = longint;

const
  SND_SPCM_LATENCY_STANDARD = 0;
  SND_SPCM_LATENCY_MEDIUM = 1;
  SND_SPCM_LATENCY_REALTIME = 2;

type
  Tsnd_spcm_xrun_type_t = longint;
  Psnd_spcm_xrun_type_t = ^Tsnd_spcm_xrun_type_t;

const
  SND_SPCM_XRUN_IGNORE = 0;
  SND_SPCM_XRUN_STOP = 1;

type
  Psnd_spcm_duplex_type_t = ^Tsnd_spcm_duplex_type_t;
  Tsnd_spcm_duplex_type_t = longint;

const
  SND_SPCM_DUPLEX_LIBERAL = 0;
  SND_SPCM_DUPLEX_PEDANTIC = 1;

function snd_spcm_init(pcm: Psnd_pcm_t; rate: dword; channels: dword; format: Tsnd_pcm_format_t; subformat: Tsnd_pcm_subformat_t;
  latency: Tsnd_spcm_latency_t; _access: Tsnd_pcm_access_t; xrun_type: Tsnd_spcm_xrun_type_t): longint; cdecl; external libasound;
function snd_spcm_init_duplex(playback_pcm: Psnd_pcm_t; capture_pcm: Psnd_pcm_t; rate: dword; channels: dword; format: Tsnd_pcm_format_t;
  subformat: Tsnd_pcm_subformat_t; latency: Tsnd_spcm_latency_t; _access: Tsnd_pcm_access_t; xrun_type: Tsnd_spcm_xrun_type_t; duplex_type: Tsnd_spcm_duplex_type_t): longint; cdecl; external libasound;
function snd_spcm_init_get_params(pcm: Psnd_pcm_t; rate: Pdword; buffer_size: Psnd_pcm_uframes_t; period_size: Psnd_pcm_uframes_t): longint; cdecl; external libasound;
function snd_pcm_start_mode_name(mode: Tsnd_pcm_start_t): pchar; cdecl; external libasound; deprecated;
function snd_pcm_xrun_mode_name(mode: Tsnd_pcm_xrun_t): pchar; cdecl; external libasound; deprecated;
function snd_pcm_sw_params_set_start_mode(pcm: Psnd_pcm_t; params: Psnd_pcm_sw_params_t; val: Tsnd_pcm_start_t): longint; cdecl; external libasound; deprecated;
function snd_pcm_sw_params_get_start_mode(params: Psnd_pcm_sw_params_t): Tsnd_pcm_start_t; cdecl; external libasound; deprecated;
function snd_pcm_sw_params_set_xrun_mode(pcm: Psnd_pcm_t; params: Psnd_pcm_sw_params_t; val: Tsnd_pcm_xrun_t): longint; cdecl; external libasound; deprecated;
function snd_pcm_sw_params_get_xrun_mode(params: Psnd_pcm_sw_params_t): Tsnd_pcm_xrun_t; cdecl; external libasound; deprecated;

function snd_pcm_sw_params_set_xfer_align(pcm: Psnd_pcm_t; params: Psnd_pcm_sw_params_t; val: Tsnd_pcm_uframes_t): longint; cdecl; external libasound; deprecated;
function snd_pcm_sw_params_get_xfer_align(params: Psnd_pcm_sw_params_t; val: Psnd_pcm_uframes_t): longint; cdecl; external libasound; deprecated;
function snd_pcm_sw_params_set_sleep_min(pcm: Psnd_pcm_t; params: Psnd_pcm_sw_params_t; val: dword): longint; cdecl; external libasound; deprecated;
function snd_pcm_sw_params_get_sleep_min(params: Psnd_pcm_sw_params_t; val: Pdword): longint; cdecl; external libasound; deprecated;

function snd_pcm_hw_params_get_tick_time(params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound; deprecated;
function snd_pcm_hw_params_get_tick_time_min(params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound; deprecated;
function snd_pcm_hw_params_get_tick_time_max(params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound; deprecated;
function snd_pcm_hw_params_test_tick_time(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: dword; dir: longint): longint; cdecl; external libasound; deprecated;
function snd_pcm_hw_params_set_tick_time(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: dword; dir: longint): longint; cdecl; external libasound; deprecated;
function snd_pcm_hw_params_set_tick_time_min(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound; deprecated;
function snd_pcm_hw_params_set_tick_time_max(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound; deprecated;
function snd_pcm_hw_params_set_tick_time_minmax(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; min: Pdword; mindir: Plongint; max: Pdword; maxdir: Plongint): longint; cdecl; external libasound; deprecated;
function snd_pcm_hw_params_set_tick_time_near(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound; deprecated;
function snd_pcm_hw_params_set_tick_time_first(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound; deprecated;
function snd_pcm_hw_params_set_tick_time_last(pcm: Psnd_pcm_t; params: Psnd_pcm_hw_params_t; val: Pdword; dir: Plongint): longint; cdecl; external libasound; deprecated;

// === Konventiert am: 19-11-25 16:12:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function snd_pcm_abort(pcm: Psnd_pcm_t): longint; inline;
begin
  Result := snd_pcm_nonblock(pcm, 2);
end;

procedure snd_pcm_pack_audio_tstamp_config(data: PUInt32; config: Psnd_pcm_audio_tstamp_config_t); inline;
begin
  data^ := config^.report_delay;
  data^ := data^ shl 4;
  data^ := data^ or config^.type_requested;
end;

procedure snd_pcm_unpack_audio_tstamp_report(data: uint32; accuracy: cardinal; report: Psnd_pcm_audio_tstamp_report_t); inline;
begin
  data := data shr 16;
  report^.valid := data and 1;
  report^.actual_type := (data shr 1) and $F;
  report^.accuracy_report := (data shr 5) and 1;
  report^.accuracy := accuracy;
end;

function snd_pcm_channel_area_addr(area: Psnd_pcm_channel_area_t; offset: Tsnd_pcm_uframes_t): Pointer; inline;
begin
  Result := pchar(area^.addr) + area^.first + area^.step * offset div 8;
end;

function snd_pcm_channel_area_step(area: Psnd_pcm_channel_area_t): cardinal; inline;
begin
  Result := area^.step div 8;
end;


{$ENDIF read_implementation}
