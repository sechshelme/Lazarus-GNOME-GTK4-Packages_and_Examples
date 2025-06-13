{$IFDEF read_interface}


type
  PEcore_Audio_Out_Sndfile = ^TEcore_Audio_Out_Sndfile;
  TEcore_Audio_Out_Sndfile = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ECORE_AUDIO_OUT_SNDFILE_CLASS: PEfl_Class;

function ecore_audio_out_sndfile_class_get: PEfl_Class; cdecl; external libecore_audio;
{$endif}

// === Konventiert am: 13-6-25 19:35:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function ECORE_AUDIO_OUT_SNDFILE_CLASS: PEfl_Class;
begin
  ECORE_AUDIO_OUT_SNDFILE_CLASS := ecore_audio_out_sndfile_class_get;
end;
{$endif}


{$ENDIF read_implementation}
