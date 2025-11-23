{$IFDEF read_interface}


type
  Psnd_rawmidi_info_t = type Pointer;
  PPsnd_rawmidi_info_t = ^Psnd_rawmidi_info_t;
  Psnd_rawmidi_params_t = type Pointer;
  PPsnd_rawmidi_params_t = ^Psnd_rawmidi_params_t;
  Psnd_rawmidi_status_t = type Pointer;
  PPsnd_rawmidi_status_t = ^Psnd_rawmidi_status_t;

  Psnd_rawmidi_stream_t = ^Tsnd_rawmidi_stream_t;
  Tsnd_rawmidi_stream_t = longint;

const
  SND_RAWMIDI_STREAM_OUTPUT = 0;
  SND_RAWMIDI_STREAM_INPUT = 1;
  SND_RAWMIDI_STREAM_LAST = SND_RAWMIDI_STREAM_INPUT;

const
  SND_RAWMIDI_APPEND = $0001;
  SND_RAWMIDI_NONBLOCK_ = $0002;
  SND_RAWMIDI_SYNC = $0004;

type
  Psnd_rawmidi_t = type Pointer;
  PPsnd_rawmidi_t = ^Psnd_rawmidi_t;

type
  Psnd_rawmidi_type_t = ^Tsnd_rawmidi_type_t;
  Tsnd_rawmidi_type_t = longint;

const
  SND_RAWMIDI_TYPE_HW = 0;
  SND_RAWMIDI_TYPE_SHM = 1;
  SND_RAWMIDI_TYPE_INET = 2;
  SND_RAWMIDI_TYPE_VIRTUAL = 3;

type
  Psnd_rawmidi_clock_t = ^Tsnd_rawmidi_clock_t;
  Tsnd_rawmidi_clock_t = longint;

const
  SND_RAWMIDI_CLOCK_NONE = 0;
  SND_RAWMIDI_CLOCK_REALTIME = 1;
  SND_RAWMIDI_CLOCK_MONOTONIC = 2;
  SND_RAWMIDI_CLOCK_MONOTONIC_RAW = 3;

type
  Psnd_rawmidi_read_mode_t = ^Tsnd_rawmidi_read_mode_t;
  Tsnd_rawmidi_read_mode_t = longint;

const
  SND_RAWMIDI_READ_STANDARD = 0;
  SND_RAWMIDI_READ_TSTAMP = 1;

const
  SND_RAWMIDI_INFO_UMP = $00000008;

function snd_rawmidi_open(in_rmidi: PPsnd_rawmidi_t; out_rmidi: PPsnd_rawmidi_t; name: pchar; mode: longint): longint; cdecl; external libasound;
function snd_rawmidi_open_lconf(in_rmidi: PPsnd_rawmidi_t; out_rmidi: PPsnd_rawmidi_t; name: pchar; mode: longint; lconf: Psnd_config_t): longint; cdecl; external libasound;
function snd_rawmidi_close(rmidi: Psnd_rawmidi_t): longint; cdecl; external libasound;
function snd_rawmidi_poll_descriptors_count(rmidi: Psnd_rawmidi_t): longint; cdecl; external libasound;
function snd_rawmidi_poll_descriptors(rmidi: Psnd_rawmidi_t; pfds: Ppollfd; space: dword): longint; cdecl; external libasound;
function snd_rawmidi_poll_descriptors_revents(rawmidi: Psnd_rawmidi_t; pfds: Ppollfd; nfds: dword; revent: Pword): longint; cdecl; external libasound;
function snd_rawmidi_nonblock(rmidi: Psnd_rawmidi_t; nonblock: longint): longint; cdecl; external libasound;
function snd_rawmidi_info_sizeof: Tsize_t; cdecl; external libasound;

function snd_rawmidi_info_malloc(ptr: PPsnd_rawmidi_info_t): longint; cdecl; external libasound;
procedure snd_rawmidi_info_free(obj: Psnd_rawmidi_info_t); cdecl; external libasound;
procedure snd_rawmidi_info_copy(dst: Psnd_rawmidi_info_t; src: Psnd_rawmidi_info_t); cdecl; external libasound;
function snd_rawmidi_info_get_device(obj: Psnd_rawmidi_info_t): dword; cdecl; external libasound;
function snd_rawmidi_info_get_subdevice(obj: Psnd_rawmidi_info_t): dword; cdecl; external libasound;
function snd_rawmidi_info_get_stream(obj: Psnd_rawmidi_info_t): Tsnd_rawmidi_stream_t; cdecl; external libasound;
function snd_rawmidi_info_get_card(obj: Psnd_rawmidi_info_t): longint; cdecl; external libasound;
function snd_rawmidi_info_get_flags(obj: Psnd_rawmidi_info_t): dword; cdecl; external libasound;
function snd_rawmidi_info_get_id(obj: Psnd_rawmidi_info_t): pchar; cdecl; external libasound;
function snd_rawmidi_info_get_name(obj: Psnd_rawmidi_info_t): pchar; cdecl; external libasound;
function snd_rawmidi_info_get_subdevice_name(obj: Psnd_rawmidi_info_t): pchar; cdecl; external libasound;
function snd_rawmidi_info_get_subdevices_count(obj: Psnd_rawmidi_info_t): dword; cdecl; external libasound;
function snd_rawmidi_info_get_subdevices_avail(obj: Psnd_rawmidi_info_t): dword; cdecl; external libasound;
procedure snd_rawmidi_info_set_device(obj: Psnd_rawmidi_info_t; val: dword); cdecl; external libasound;
procedure snd_rawmidi_info_set_subdevice(obj: Psnd_rawmidi_info_t; val: dword); cdecl; external libasound;
procedure snd_rawmidi_info_set_stream(obj: Psnd_rawmidi_info_t; val: Tsnd_rawmidi_stream_t); cdecl; external libasound;
function snd_rawmidi_info(rmidi: Psnd_rawmidi_t; info: Psnd_rawmidi_info_t): longint; cdecl; external libasound;
function snd_rawmidi_params_sizeof: Tsize_t; cdecl; external libasound;

function snd_rawmidi_params_malloc(ptr: PPsnd_rawmidi_params_t): longint; cdecl; external libasound;
procedure snd_rawmidi_params_free(obj: Psnd_rawmidi_params_t); cdecl; external libasound;
procedure snd_rawmidi_params_copy(dst: Psnd_rawmidi_params_t; src: Psnd_rawmidi_params_t); cdecl; external libasound;
function snd_rawmidi_params_set_buffer_size(rmidi: Psnd_rawmidi_t; params: Psnd_rawmidi_params_t; val: Tsize_t): longint; cdecl; external libasound;
function snd_rawmidi_params_get_buffer_size(params: Psnd_rawmidi_params_t): Tsize_t; cdecl; external libasound;
function snd_rawmidi_params_set_avail_min(rmidi: Psnd_rawmidi_t; params: Psnd_rawmidi_params_t; val: Tsize_t): longint; cdecl; external libasound;
function snd_rawmidi_params_get_avail_min(params: Psnd_rawmidi_params_t): Tsize_t; cdecl; external libasound;
function snd_rawmidi_params_set_no_active_sensing(rmidi: Psnd_rawmidi_t; params: Psnd_rawmidi_params_t; val: longint): longint; cdecl; external libasound;
function snd_rawmidi_params_get_no_active_sensing(params: Psnd_rawmidi_params_t): longint; cdecl; external libasound;
function snd_rawmidi_params_set_read_mode(rawmidi: Psnd_rawmidi_t; params: Psnd_rawmidi_params_t; val: Tsnd_rawmidi_read_mode_t): longint; cdecl; external libasound;
function snd_rawmidi_params_get_read_mode(params: Psnd_rawmidi_params_t): Tsnd_rawmidi_read_mode_t; cdecl; external libasound;
function snd_rawmidi_params_set_clock_type(rawmidi: Psnd_rawmidi_t; params: Psnd_rawmidi_params_t; val: Tsnd_rawmidi_clock_t): longint; cdecl; external libasound;
function snd_rawmidi_params_get_clock_type(params: Psnd_rawmidi_params_t): Tsnd_rawmidi_clock_t; cdecl; external libasound;
function snd_rawmidi_params(rmidi: Psnd_rawmidi_t; params: Psnd_rawmidi_params_t): longint; cdecl; external libasound;
function snd_rawmidi_params_current(rmidi: Psnd_rawmidi_t; params: Psnd_rawmidi_params_t): longint; cdecl; external libasound;
function snd_rawmidi_status_sizeof: Tsize_t; cdecl; external libasound;

function snd_rawmidi_status_malloc(ptr: PPsnd_rawmidi_status_t): longint; cdecl; external libasound;
procedure snd_rawmidi_status_free(obj: Psnd_rawmidi_status_t); cdecl; external libasound;
procedure snd_rawmidi_status_copy(dst: Psnd_rawmidi_status_t; src: Psnd_rawmidi_status_t); cdecl; external libasound;
procedure snd_rawmidi_status_get_tstamp(obj: Psnd_rawmidi_status_t; ptr: Psnd_htimestamp_t); cdecl; external libasound;
function snd_rawmidi_status_get_avail(obj: Psnd_rawmidi_status_t): Tsize_t; cdecl; external libasound;
function snd_rawmidi_status_get_xruns(obj: Psnd_rawmidi_status_t): Tsize_t; cdecl; external libasound;
function snd_rawmidi_status(rmidi: Psnd_rawmidi_t; status: Psnd_rawmidi_status_t): longint; cdecl; external libasound;
function snd_rawmidi_drain(rmidi: Psnd_rawmidi_t): longint; cdecl; external libasound;
function snd_rawmidi_drop(rmidi: Psnd_rawmidi_t): longint; cdecl; external libasound;
function snd_rawmidi_write(rmidi: Psnd_rawmidi_t; buffer: pointer; size: Tsize_t): Tssize_t; cdecl; external libasound;
function snd_rawmidi_read(rmidi: Psnd_rawmidi_t; buffer: pointer; size: Tsize_t): Tssize_t; cdecl; external libasound;
function snd_rawmidi_tread(rmidi: Psnd_rawmidi_t; tstamp: Ptimespec; buffer: pointer; size: Tsize_t): Tssize_t; cdecl; external libasound;
function snd_rawmidi_name(rmidi: Psnd_rawmidi_t): pchar; cdecl; external libasound;
function snd_rawmidi_type(rmidi: Psnd_rawmidi_t): Tsnd_rawmidi_type_t; cdecl; external libasound;
function snd_rawmidi_stream(rawmidi: Psnd_rawmidi_t): Tsnd_rawmidi_stream_t; cdecl; external libasound;

// === Konventiert am: 19-11-25 16:11:49 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
