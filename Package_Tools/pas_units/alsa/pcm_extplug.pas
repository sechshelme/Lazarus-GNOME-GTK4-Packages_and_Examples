unit pcm_extplug;

interface

uses
  fp_asound, pcm, output, conf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  SND_PCM_EXTPLUG_HW_FORMAT = 0;
  SND_PCM_EXTPLUG_HW_CHANNELS = 1;
  SND_PCM_EXTPLUG_HW_PARAMS = 2;

type
  Psnd_pcm_extplug_t = type Pointer;
  Psnd_pcm_extplug_callback_t = type Pointer;

const
  SND_PCM_EXTPLUG_VERSION_MAJOR = 1;
  SND_PCM_EXTPLUG_VERSION_MINOR = 0;
  SND_PCM_EXTPLUG_VERSION_TINY = 2;
  SND_PCM_EXTPLUG_VERSION = ((SND_PCM_EXTPLUG_VERSION_MAJOR shl 16) or (SND_PCM_EXTPLUG_VERSION_MINOR shl 8)) or SND_PCM_EXTPLUG_VERSION_TINY;

type
  Tsnd_pcm_extplug = record
    version: dword;
    name: pchar;
    callback: Psnd_pcm_extplug_callback_t;
    private_data: pointer;
    pcm: Psnd_pcm_t;
    stream: Tsnd_pcm_stream_t;
    format: Tsnd_pcm_format_t;
    subformat: Tsnd_pcm_subformat_t;
    channels: dword;
    rate: dword;
    slave_format: Tsnd_pcm_format_t;
    slave_subformat: Tsnd_pcm_subformat_t;
    slave_channels: dword;
  end;
  Psnd_pcm_extplug = ^Tsnd_pcm_extplug;

  Tsnd_pcm_extplug_callback = record
    transfer: function(ext: Psnd_pcm_extplug_t; dst_areas: Psnd_pcm_channel_area_t; dst_offset: Tsnd_pcm_uframes_t; src_areas: Psnd_pcm_channel_area_t; src_offset: Tsnd_pcm_uframes_t;
      size: Tsnd_pcm_uframes_t): Tsnd_pcm_sframes_t; cdecl;
    close: function(ext: Psnd_pcm_extplug_t): longint; cdecl;
    hw_params: function(ext: Psnd_pcm_extplug_t; params: Psnd_pcm_hw_params_t): longint; cdecl;
    hw_free: function(ext: Psnd_pcm_extplug_t): longint; cdecl;
    dump: procedure(ext: Psnd_pcm_extplug_t; out_: Psnd_output_t); cdecl;
    init: function(ext: Psnd_pcm_extplug_t): longint; cdecl;
    query_chmaps: function(ext: Psnd_pcm_extplug_t): PPsnd_pcm_chmap_query_t; cdecl;
    get_chmap: function(ext: Psnd_pcm_extplug_t): Psnd_pcm_chmap_t; cdecl;
    set_chmap: function(ext: Psnd_pcm_extplug_t; map: Psnd_pcm_chmap_t): longint; cdecl;
  end;
  Psnd_pcm_extplug_callback = ^Tsnd_pcm_extplug_callback;

function snd_pcm_extplug_create(ext: Psnd_pcm_extplug_t; name: pchar; root: Psnd_config_t; slave_conf: Psnd_config_t; stream: Tsnd_pcm_stream_t;
  mode: longint): longint; cdecl; external libasound;
function snd_pcm_extplug_delete(ext: Psnd_pcm_extplug_t): longint; cdecl; external libasound;
procedure snd_pcm_extplug_params_reset(ext: Psnd_pcm_extplug_t); cdecl; external libasound;
function snd_pcm_extplug_set_param_list(extplug: Psnd_pcm_extplug_t; _type: longint; num_list: dword; list: Pdword): longint; cdecl; external libasound;
function snd_pcm_extplug_set_param_minmax(extplug: Psnd_pcm_extplug_t; _type: longint; min: dword; max: dword): longint; cdecl; external libasound;
function snd_pcm_extplug_set_slave_param_list(extplug: Psnd_pcm_extplug_t; _type: longint; num_list: dword; list: Pdword): longint; cdecl; external libasound;
function snd_pcm_extplug_set_slave_param_minmax(extplug: Psnd_pcm_extplug_t; _type: longint; min: dword; max: dword): longint; cdecl; external libasound;
function snd_pcm_extplug_set_param_link(extplug: Psnd_pcm_extplug_t; _type: longint; keep_link: longint): longint; cdecl; external libasound;

function snd_pcm_extplug_set_param(extplug: Psnd_pcm_extplug_t; typ: integer; val: cardinal): integer; inline;
function snd_pcm_extplug_set_slave_param(extplug: Psnd_pcm_extplug_t; typ: integer; val: cardinal): integer; inline;


// === Konventiert am: 19-11-25 16:12:02 ===


implementation

function snd_pcm_extplug_set_param(extplug: Psnd_pcm_extplug_t; typ: integer; val: cardinal): integer; inline;
begin
  Result := snd_pcm_extplug_set_param_list(extplug, typ, 1, @val);
end;

function snd_pcm_extplug_set_slave_param(extplug: Psnd_pcm_extplug_t; typ: integer; val: cardinal): integer; inline;
begin
  Result := snd_pcm_extplug_set_slave_param_list(extplug, typ, 1, @val);
end;


end.
