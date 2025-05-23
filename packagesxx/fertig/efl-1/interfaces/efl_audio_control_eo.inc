{$IFDEF read_interface}


type
  PEfl_Audio_Control = ^TEfl_Audio_Control;
  TEfl_Audio_Control = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_AUDIO_CONTROL_INTERFACE: PEfl_Class;

function efl_audio_control_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_audio_control_volume_set(obj: PEo; volume: double); cdecl; external libefl;
function efl_audio_control_volume_get(obj: PEo): double; cdecl; external libefl;
procedure efl_audio_control_mute_set(obj: PEo; mute: TEina_Bool); cdecl; external libefl;
function efl_audio_control_mute_get(obj: PEo): TEina_Bool; cdecl; external libefl;
{$endif}

// === Konventiert am: 20-5-25 13:47:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_AUDIO_CONTROL_INTERFACE: PEfl_Class;
begin
  EFL_AUDIO_CONTROL_INTERFACE := efl_audio_control_interface_get;
end;
{$endif}


{$ENDIF read_implementation}
