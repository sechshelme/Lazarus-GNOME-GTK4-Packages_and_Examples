unit pcm_plugin;

interface

uses
  fp_asound, pcm, conf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  SND_PCM_PLUGIN_RATE_MIN = 4000;
  SND_PCM_PLUGIN_RATE_MAX = 768000;

const
  SND_PCM_PLUGIN_ROUTE_RESOLUTION = 16;

const
  SND_PCM_PLUGIN_ROUTE_HALF = 0.5;
  SND_PCM_PLUGIN_ROUTE_FULL = 1.0;

type
  Psnd_pcm_route_ttable_entry_t = type Pointer;

function snd_pcm_hw_open(pcmp: PPsnd_pcm_t; name: pchar; card: longint; device: longint; subdevice: longint;
  stream: Tsnd_pcm_stream_t; mode: longint; mmap_emulation: longint; sync_ptr_ioctl: longint): longint; cdecl; external libasound;
function _snd_pcm_hw_open(pcmp: PPsnd_pcm_t; name: pchar; root: Psnd_config_t; conf: Psnd_config_t; stream: Tsnd_pcm_stream_t;
  mode: longint): longint; cdecl; external libasound;
function snd_pcm_copy_open(pcmp: PPsnd_pcm_t; name: pchar; slave: Psnd_pcm_t; close_slave: longint): longint; cdecl; external libasound;
function _snd_pcm_copy_open(pcmp: PPsnd_pcm_t; name: pchar; root: Psnd_config_t; conf: Psnd_config_t; stream: Tsnd_pcm_stream_t;
  mode: longint): longint; cdecl; external libasound;
function snd_pcm_linear_open(pcmp: PPsnd_pcm_t; name: pchar; sformat: Tsnd_pcm_format_t; slave: Psnd_pcm_t; close_slave: longint): longint; cdecl; external libasound;
function _snd_pcm_linear_open(pcmp: PPsnd_pcm_t; name: pchar; root: Psnd_config_t; conf: Psnd_config_t; stream: Tsnd_pcm_stream_t;
  mode: longint): longint; cdecl; external libasound;
function snd_pcm_lfloat_open(pcmp: PPsnd_pcm_t; name: pchar; sformat: Tsnd_pcm_format_t; slave: Psnd_pcm_t; close_slave: longint): longint; cdecl; external libasound;
function _snd_pcm_lfloat_open(pcmp: PPsnd_pcm_t; name: pchar; root: Psnd_config_t; conf: Psnd_config_t; stream: Tsnd_pcm_stream_t;
  mode: longint): longint; cdecl; external libasound;
function snd_pcm_mulaw_open(pcmp: PPsnd_pcm_t; name: pchar; sformat: Tsnd_pcm_format_t; slave: Psnd_pcm_t; close_slave: longint): longint; cdecl; external libasound;
function _snd_pcm_mulaw_open(pcmp: PPsnd_pcm_t; name: pchar; root: Psnd_config_t; conf: Psnd_config_t; stream: Tsnd_pcm_stream_t;
  mode: longint): longint; cdecl; external libasound;
function snd_pcm_alaw_open(pcmp: PPsnd_pcm_t; name: pchar; sformat: Tsnd_pcm_format_t; slave: Psnd_pcm_t; close_slave: longint): longint; cdecl; external libasound;
function _snd_pcm_alaw_open(pcmp: PPsnd_pcm_t; name: pchar; root: Psnd_config_t; conf: Psnd_config_t; stream: Tsnd_pcm_stream_t;
  mode: longint): longint; cdecl; external libasound;
function snd_pcm_adpcm_open(pcmp: PPsnd_pcm_t; name: pchar; sformat: Tsnd_pcm_format_t; slave: Psnd_pcm_t; close_slave: longint): longint; cdecl; external libasound;
function _snd_pcm_adpcm_open(pcmp: PPsnd_pcm_t; name: pchar; root: Psnd_config_t; conf: Psnd_config_t; stream: Tsnd_pcm_stream_t;
  mode: longint): longint; cdecl; external libasound;
function snd_pcm_route_load_ttable(tt: Psnd_config_t; ttable: Psnd_pcm_route_ttable_entry_t; tt_csize: dword; tt_ssize: dword; tt_cused: Pdword;
  tt_sused: Pdword; schannels: longint): longint; cdecl; external libasound;
function snd_pcm_route_determine_ttable(tt: Psnd_config_t; tt_csize: Pdword; tt_ssize: Pdword): longint; cdecl; external libasound;
function snd_pcm_route_open(pcmp: PPsnd_pcm_t; name: pchar; sformat: Tsnd_pcm_format_t; schannels: longint; ttable: Psnd_pcm_route_ttable_entry_t;
  tt_ssize: dword; tt_cused: dword; tt_sused: dword; slave: Psnd_pcm_t; close_slave: longint): longint; cdecl; external libasound;
function _snd_pcm_route_open(pcmp: PPsnd_pcm_t; name: pchar; root: Psnd_config_t; conf: Psnd_config_t; stream: Tsnd_pcm_stream_t;
  mode: longint): longint; cdecl; external libasound;
function snd_pcm_rate_open(pcmp: PPsnd_pcm_t; name: pchar; sformat: Tsnd_pcm_format_t; srate: dword; converter: Psnd_config_t;
  slave: Psnd_pcm_t; close_slave: longint): longint; cdecl; external libasound;
function _snd_pcm_rate_open(pcmp: PPsnd_pcm_t; name: pchar; root: Psnd_config_t; conf: Psnd_config_t; stream: Tsnd_pcm_stream_t;
  mode: longint): longint; cdecl; external libasound;
function snd_pcm_hooks_open(pcmp: PPsnd_pcm_t; name: pchar; slave: Psnd_pcm_t; close_slave: longint): longint; cdecl; external libasound;
function _snd_pcm_hooks_open(pcmp: PPsnd_pcm_t; name: pchar; root: Psnd_config_t; conf: Psnd_config_t; stream: Tsnd_pcm_stream_t;
  mode: longint): longint; cdecl; external libasound;
function snd_pcm_ladspa_open(pcmp: PPsnd_pcm_t; name: pchar; ladspa_path: pchar; channels: dword; ladspa_pplugins: Psnd_config_t;
  ladspa_cplugins: Psnd_config_t; slave: Psnd_pcm_t; close_slave: longint): longint; cdecl; external libasound;
function _snd_pcm_ladspa_open(pcmp: PPsnd_pcm_t; name: pchar; root: Psnd_config_t; conf: Psnd_config_t; stream: Tsnd_pcm_stream_t;
  mode: longint): longint; cdecl; external libasound;
function snd_pcm_jack_open(pcmp: PPsnd_pcm_t; name: pchar; playback_conf: Psnd_config_t; capture_conf: Psnd_config_t; stream: Tsnd_pcm_stream_t;
  mode: longint): longint; cdecl; external libasound;
function _snd_pcm_jack_open(pcmp: PPsnd_pcm_t; name: pchar; root: Psnd_config_t; conf: Psnd_config_t; stream: Tsnd_pcm_stream_t;
  mode: longint): longint; cdecl; external libasound;

// === Konventiert am: 19-11-25 16:11:56 ===


implementation



end.
