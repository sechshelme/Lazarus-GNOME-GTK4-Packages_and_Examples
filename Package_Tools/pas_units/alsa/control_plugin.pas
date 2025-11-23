unit control_plugin;

interface

uses
  fp_asound, conf, control;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function snd_ctl_hw_open(handle: PPsnd_ctl_t; name: pchar; card: longint; mode: longint): longint; cdecl; external libasound;
function _snd_ctl_hw_open(handlep: PPsnd_ctl_t; name: pchar; root: Psnd_config_t; conf: Psnd_config_t; mode: longint): longint; cdecl; external libasound;
function snd_ctl_remap_open(handlep: PPsnd_ctl_t; name: pchar; remap: Psnd_config_t; map: Psnd_config_t; child: Psnd_ctl_t; mode: longint): longint; cdecl; external libasound;
function _snd_ctl_remap_open(handlep: PPsnd_ctl_t; name: pchar; root: Psnd_config_t; conf: Psnd_config_t; mode: longint): longint; cdecl; external libasound;

// === Konventiert am: 19-11-25 16:12:32 ===


implementation



end.
