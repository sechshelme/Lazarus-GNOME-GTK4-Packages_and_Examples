{$IFDEF read_interface}


type
  PEcore_Audio_Out_Wasapi = ^TEcore_Audio_Out_Wasapi;
  TEcore_Audio_Out_Wasapi = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ECORE_AUDIO_OUT_WASAPI_CLASS: PEfl_Class;

function ecore_audio_out_wasapi_class_get: PEfl_Class; cdecl; external libecore_audio;

var
  _ECORE_AUDIO_OUT_WASAPI_EVENT_CONTEXT_READY: TEfl_Event_Description; cvar;external libecore_audio;
  _ECORE_AUDIO_OUT_WASAPI_EVENT_CONTEXT_FAIL: TEfl_Event_Description; cvar;external libecore_audio;
  _ECORE_AUDIO_OUT_WASAPI_EVENT_STOP: TEfl_Event_Description; cvar;external libecore_audio;

function ECORE_AUDIO_OUT_WASAPI_EVENT_CONTEXT_READY: PEfl_Event_Description;
function ECORE_AUDIO_OUT_WASAPI_EVENT_CONTEXT_FAIL: PEfl_Event_Description;
function ECORE_AUDIO_OUT_WASAPI_EVENT_STOP: PEfl_Event_Description;
{$endif}

// === Konventiert am: 13-6-25 19:35:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
// Nicht in der clib vorhanden !

function ECORE_AUDIO_OUT_WASAPI_CLASS: PEfl_Class;
begin
//  ECORE_AUDIO_OUT_WASAPI_CLASS := ecore_audio_out_wasapi_class_get;
end;

function ECORE_AUDIO_OUT_WASAPI_EVENT_CONTEXT_READY: PEfl_Event_Description;
begin
//  ECORE_AUDIO_OUT_WASAPI_EVENT_CONTEXT_READY := @(_ECORE_AUDIO_OUT_WASAPI_EVENT_CONTEXT_READY);
end;

function ECORE_AUDIO_OUT_WASAPI_EVENT_CONTEXT_FAIL: PEfl_Event_Description;
begin
//  ECORE_AUDIO_OUT_WASAPI_EVENT_CONTEXT_FAIL := @(_ECORE_AUDIO_OUT_WASAPI_EVENT_CONTEXT_FAIL);
end;

function ECORE_AUDIO_OUT_WASAPI_EVENT_STOP: PEfl_Event_Description;
begin
//  ECORE_AUDIO_OUT_WASAPI_EVENT_STOP := @(_ECORE_AUDIO_OUT_WASAPI_EVENT_STOP);
end;
{$endif}


{$ENDIF read_implementation}
