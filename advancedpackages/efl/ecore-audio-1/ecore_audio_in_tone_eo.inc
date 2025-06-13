{$IFDEF read_interface}


type
  PEcore_Audio_In_Tone = ^TEcore_Audio_In_Tone;
  TEcore_Audio_In_Tone = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ECORE_AUDIO_IN_TONE_CLASS: PEfl_Class;

function ecore_audio_in_tone_class_get: PEfl_Class; cdecl; external libecore_audio;
{$endif}

// === Konventiert am: 13-6-25 19:35:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function ECORE_AUDIO_IN_TONE_CLASS: PEfl_Class;
begin
  ECORE_AUDIO_IN_TONE_CLASS := ecore_audio_in_tone_class_get;
end;
{$endif}


{$ENDIF read_implementation}
