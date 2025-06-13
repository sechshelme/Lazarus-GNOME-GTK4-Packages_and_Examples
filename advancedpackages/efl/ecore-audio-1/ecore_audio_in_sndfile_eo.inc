{$IFDEF read_interface}


type
  PEcore_Audio_In_Sndfile = ^TEcore_Audio_In_Sndfile;
  TEcore_Audio_In_Sndfile = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ECORE_AUDIO_IN_SNDFILE_CLASS: PEfl_Class;

function ecore_audio_in_sndfile_class_get: PEfl_Class; cdecl; external libecore_audio;
{$endif}

// === Konventiert am: 13-6-25 19:35:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function ECORE_AUDIO_IN_SNDFILE_CLASS: PEfl_Class;
begin
  ECORE_AUDIO_IN_SNDFILE_CLASS := ecore_audio_in_sndfile_class_get;
end;
{$endif}


{$ENDIF read_implementation}
