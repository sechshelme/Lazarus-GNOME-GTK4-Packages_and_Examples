unit pcm_ioplug;

interface

uses
  fp_asound, pcm, output;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  SND_PCM_IOPLUG_HW_ACCESS = 0;
  SND_PCM_IOPLUG_HW_FORMAT = 1;
  SND_PCM_IOPLUG_HW_CHANNELS = 2;
  SND_PCM_IOPLUG_HW_RATE = 3;
  SND_PCM_IOPLUG_HW_PERIOD_BYTES = 4;
  SND_PCM_IOPLUG_HW_BUFFER_BYTES = 5;
  SND_PCM_IOPLUG_HW_PERIODS = 6;
  SND_PCM_IOPLUG_HW_PARAMS = 7;

type
  Psnd_pcm_ioplug_t = type Pointer;
  Psnd_pcm_ioplug_callback_t = type Pointer;

const
  SND_PCM_IOPLUG_FLAG_LISTED = 1 shl 0;
  SND_PCM_IOPLUG_FLAG_MONOTONIC = 1 shl 1;
  SND_PCM_IOPLUG_FLAG_BOUNDARY_WA = 1 shl 2;
  SND_PCM_IOPLUG_VERSION_MAJOR = 1;
  SND_PCM_IOPLUG_VERSION_MINOR = 0;
  SND_PCM_IOPLUG_VERSION_TINY = 2;
  SND_PCM_IOPLUG_VERSION = ((SND_PCM_IOPLUG_VERSION_MAJOR shl 16) or (SND_PCM_IOPLUG_VERSION_MINOR shl 8)) or SND_PCM_IOPLUG_VERSION_TINY;

type
  Tsnd_pcm_ioplug = record
    version: dword;
    name: pchar;
    flags: dword;
    poll_fd: longint;
    poll_events: dword;
    mmap_rw: dword;
    callback: Psnd_pcm_ioplug_callback_t;
    private_data: pointer;
    pcm: Psnd_pcm_t;
    stream: Tsnd_pcm_stream_t;
    state: Tsnd_pcm_state_t;
    appl_ptr: Tsnd_pcm_uframes_t;
    hw_ptr: Tsnd_pcm_uframes_t;
    nonblock: longint;
    access: Tsnd_pcm_access_t;
    format: Tsnd_pcm_format_t;
    channels: dword;
    rate: dword;
    period_size: Tsnd_pcm_uframes_t;
    buffer_size: Tsnd_pcm_uframes_t;
  end;
  Psnd_pcm_ioplug = ^Tsnd_pcm_ioplug;

  Tsnd_pcm_ioplug_callback = record
    start: function(io: Psnd_pcm_ioplug_t): longint; cdecl;
    stop: function(io: Psnd_pcm_ioplug_t): longint; cdecl;
    pointer: function(io: Psnd_pcm_ioplug_t): Tsnd_pcm_sframes_t; cdecl;
    transfer: function(io: Psnd_pcm_ioplug_t; areas: Psnd_pcm_channel_area_t; offset: Tsnd_pcm_uframes_t; size: Tsnd_pcm_uframes_t): Tsnd_pcm_sframes_t; cdecl;
    close: function(io: Psnd_pcm_ioplug_t): longint; cdecl;
    hw_params: function(io: Psnd_pcm_ioplug_t; params: Psnd_pcm_hw_params_t): longint; cdecl;
    hw_free: function(io: Psnd_pcm_ioplug_t): longint; cdecl;
    sw_params: function(io: Psnd_pcm_ioplug_t; params: Psnd_pcm_sw_params_t): longint; cdecl;
    prepare: function(io: Psnd_pcm_ioplug_t): longint; cdecl;
    drain: function(io: Psnd_pcm_ioplug_t): longint; cdecl;
    pause: function(io: Psnd_pcm_ioplug_t; enable: longint): longint; cdecl;
    resume: function(io: Psnd_pcm_ioplug_t): longint; cdecl;
    poll_descriptors_count: function(io: Psnd_pcm_ioplug_t): longint; cdecl;
    poll_descriptors: function(io: Psnd_pcm_ioplug_t; pfd: Ppollfd; space: dword): longint; cdecl;
    poll_revents: function(io: Psnd_pcm_ioplug_t; pfd: Ppollfd; nfds: dword; revents: Pword): longint; cdecl;
    dump: procedure(io: Psnd_pcm_ioplug_t; out_: Psnd_output_t); cdecl;
    delay: function(io: Psnd_pcm_ioplug_t; delayp: Psnd_pcm_sframes_t): longint; cdecl;
    query_chmaps: function(io: Psnd_pcm_ioplug_t): PPsnd_pcm_chmap_query_t; cdecl;
    get_chmap: function(io: Psnd_pcm_ioplug_t): Psnd_pcm_chmap_t; cdecl;
    set_chmap: function(io: Psnd_pcm_ioplug_t; map: Psnd_pcm_chmap_t): longint; cdecl;
  end;
  Psnd_pcm_ioplug_callback = ^Tsnd_pcm_ioplug_callback;

function snd_pcm_ioplug_create(io: Psnd_pcm_ioplug_t; name: pchar; stream: Tsnd_pcm_stream_t; mode: longint): longint; cdecl; external libasound;
function snd_pcm_ioplug_delete(io: Psnd_pcm_ioplug_t): longint; cdecl; external libasound;
function snd_pcm_ioplug_reinit_status(ioplug: Psnd_pcm_ioplug_t): longint; cdecl; external libasound;
function snd_pcm_ioplug_mmap_areas(ioplug: Psnd_pcm_ioplug_t): Psnd_pcm_channel_area_t; cdecl; external libasound;
procedure snd_pcm_ioplug_params_reset(io: Psnd_pcm_ioplug_t); cdecl; external libasound;
function snd_pcm_ioplug_set_param_minmax(io: Psnd_pcm_ioplug_t; _type: longint; min: dword; max: dword): longint; cdecl; external libasound;
function snd_pcm_ioplug_set_param_list(io: Psnd_pcm_ioplug_t; _type: longint; num_list: dword; list: Pdword): longint; cdecl; external libasound;
function snd_pcm_ioplug_set_state(ioplug: Psnd_pcm_ioplug_t; state: Tsnd_pcm_state_t): longint; cdecl; external libasound;
function snd_pcm_ioplug_avail(ioplug: Psnd_pcm_ioplug_t; hw_ptr: Tsnd_pcm_uframes_t; appl_ptr: Tsnd_pcm_uframes_t): Tsnd_pcm_uframes_t; cdecl; external libasound;
function snd_pcm_ioplug_hw_avail(ioplug: Psnd_pcm_ioplug_t; hw_ptr: Tsnd_pcm_uframes_t; appl_ptr: Tsnd_pcm_uframes_t): Tsnd_pcm_uframes_t; cdecl; external libasound;

// === Konventiert am: 19-11-25 16:11:59 ===


implementation



end.
