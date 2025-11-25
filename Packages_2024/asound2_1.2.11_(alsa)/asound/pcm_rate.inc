{$IFDEF read_interface}


const
  SND_PCM_RATE_PLUGIN_VERSION = $010003;

type
  Tsnd_pcm_rate_side_info_t = record
    format: Tsnd_pcm_format_t;
    rate: dword;
    buffer_size: Tsnd_pcm_uframes_t;
    period_size: Tsnd_pcm_uframes_t;
  end;
  Psnd_pcm_rate_side_info_t = ^Tsnd_pcm_rate_side_info_t;

  Tsnd_pcm_rate_info_t = record
    in_: Tsnd_pcm_rate_side_info_t;
    out_: Tsnd_pcm_rate_side_info_t;
    channels: dword;
  end;
  Psnd_pcm_rate_info_t = ^Tsnd_pcm_rate_info_t;

const
  SND_PCM_RATE_FLAG_INTERLEAVED = 1 shl 0;
  SND_PCM_RATE_FLAG_SYNC_FORMATS = 1 shl 1;

type
  Tsnd_pcm_rate_ops_t = record
    close: procedure(obj: pointer); cdecl;
    init: function(obj: pointer; info: Psnd_pcm_rate_info_t): longint; cdecl;
    free: procedure(obj: pointer); cdecl;
    reset: procedure(obj: pointer); cdecl;
    adjust_pitch: function(obj: pointer; info: Psnd_pcm_rate_info_t): longint; cdecl;
    convert: procedure(obj: pointer; dst_areas: Psnd_pcm_channel_area_t; dst_offset: Tsnd_pcm_uframes_t; dst_frames: dword; src_areas: Psnd_pcm_channel_area_t; src_offset: Tsnd_pcm_uframes_t; src_frames: dword); cdecl;
    convert_s16: procedure(obj: pointer; dst: Pint16_t; dst_frames: dword; src: Pint16_t; src_frames: dword); cdecl;
    input_frames: function(obj: pointer; frames: Tsnd_pcm_uframes_t): Tsnd_pcm_uframes_t; cdecl;
    output_frames: function(obj: pointer; frames: Tsnd_pcm_uframes_t): Tsnd_pcm_uframes_t; cdecl;
    version: dword;
    get_supported_rates: function(obj: pointer; rate_min: Pdword; rate_max: Pdword): longint; cdecl;
    dump: procedure(obj: pointer; out_: Psnd_output_t); cdecl;
    get_supported_formats: function(obj: pointer; in_formats: Puint64_t; out_formats: Puint64_t; flags: Pdword): longint; cdecl;
  end;
  Psnd_pcm_rate_ops_t = ^Tsnd_pcm_rate_ops_t;

  Tsnd_pcm_rate_open_func_t = function(version: dword; objp: Ppointer; opsp: Psnd_pcm_rate_ops_t): longint; cdecl;
  Tsnd_pcm_rate_open_conf_func_t = function(version: dword; objp: Ppointer; opsp: Psnd_pcm_rate_ops_t; conf: Psnd_config_t): longint; cdecl;

type
  Tsnd_pcm_rate_old_ops_t = record
    close: procedure(obj: pointer); cdecl;
    init: function(obj: pointer; info: Psnd_pcm_rate_info_t): longint; cdecl;
    free: procedure(obj: pointer); cdecl;
    reset: procedure(obj: pointer); cdecl;
    adjust_pitch: function(obj: pointer; info: Psnd_pcm_rate_info_t): longint; cdecl;
    convert: procedure(obj: pointer; dst_areas: Psnd_pcm_channel_area_t; dst_offset: Tsnd_pcm_uframes_t; dst_frames: dword; src_areas: Psnd_pcm_channel_area_t; src_offset: Tsnd_pcm_uframes_t; src_frames: dword); cdecl;
    convert_s16: procedure(obj: pointer; dst: Pint16_t; dst_frames: dword; src: Pint16_t; src_frames: dword); cdecl;
    input_frames: function(obj: pointer; frames: Tsnd_pcm_uframes_t): Tsnd_pcm_uframes_t; cdecl;
    output_frames: function(obj: pointer; frames: Tsnd_pcm_uframes_t): Tsnd_pcm_uframes_t; cdecl;
  end;
  Psnd_pcm_rate_old_ops_t = ^Tsnd_pcm_rate_old_ops_t;

  Tsnd_pcm_rate_v2_ops_t = record
    close: procedure(obj: pointer); cdecl;
    init: function(obj: pointer; info: Psnd_pcm_rate_info_t): longint; cdecl;
    free: procedure(obj: pointer); cdecl;
    reset: procedure(obj: pointer); cdecl;
    adjust_pitch: function(obj: pointer; info: Psnd_pcm_rate_info_t): longint; cdecl;
    convert: procedure(obj: pointer; dst_areas: Psnd_pcm_channel_area_t; dst_offset: Tsnd_pcm_uframes_t; dst_frames: dword; src_areas: Psnd_pcm_channel_area_t; src_offset: Tsnd_pcm_uframes_t; src_frames: dword); cdecl;
    convert_s16: procedure(obj: pointer; dst: Pint16_t; dst_frames: dword; src: Pint16_t; src_frames: dword); cdecl;
    input_frames: function(obj: pointer; frames: Tsnd_pcm_uframes_t): Tsnd_pcm_uframes_t; cdecl;
    output_frames: function(obj: pointer; frames: Tsnd_pcm_uframes_t): Tsnd_pcm_uframes_t; cdecl;
    version: dword;
    get_supported_rates: function(obj: pointer; rate_min: Pdword; rate_max: Pdword): longint; cdecl;
    dump: procedure(obj: pointer; out_: Psnd_output_t); cdecl;
  end;
  Psnd_pcm_rate_v2_ops_t = ^Tsnd_pcm_rate_v2_ops_t;

  // === Konventiert am: 19-11-25 16:11:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
