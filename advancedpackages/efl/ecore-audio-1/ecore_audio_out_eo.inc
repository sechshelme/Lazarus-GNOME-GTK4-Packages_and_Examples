{$IFDEF read_interface}


type
  PEcore_Audio_Out = ^TEcore_Audio_Out;
  TEcore_Audio_Out = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ECORE_AUDIO_OUT_CLASS: PEfl_Class;

function ecore_audio_out_class_get: PEfl_Class; cdecl; external libecore_audio;
function ecore_audio_obj_out_input_attach(obj: PEo; input: PEcore_Audio_In): TEina_Bool; cdecl; external libecore_audio;
function ecore_audio_obj_out_input_detach(obj: PEo; input: PEcore_Audio_In): TEina_Bool; cdecl; external libecore_audio;
function ecore_audio_obj_out_inputs_get(obj: PEo): PEina_List; cdecl; external libecore_audio;
{$endif}

// === Konventiert am: 13-6-25 19:35:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function ECORE_AUDIO_OUT_CLASS: PEfl_Class;
begin
  ECORE_AUDIO_OUT_CLASS := ecore_audio_out_class_get;
end;
{$endif}


{$ENDIF read_implementation}
