{$IFDEF read_interface}



function snd_pcm_parse_control_id(conf: Psnd_config_t; ctl_id: Psnd_ctl_elem_id_t; cardp: Plongint; cchannelsp: Plongint; hwctlp: Plongint): longint; cdecl; external libasound;

// === Konventiert am: 19-11-25 16:12:06 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
