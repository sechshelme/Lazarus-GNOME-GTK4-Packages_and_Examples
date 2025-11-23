unit pcm_external;

interface

uses
  fp_asound, conf, control;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function snd_pcm_parse_control_id(conf: Psnd_config_t; ctl_id: Psnd_ctl_elem_id_t; cardp: Plongint; cchannelsp: Plongint; hwctlp: Plongint): longint; cdecl; external libasound;

// === Konventiert am: 19-11-25 16:12:06 ===


implementation



end.
