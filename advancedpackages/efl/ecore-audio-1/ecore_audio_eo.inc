{$IFDEF read_interface}


type
  PEcore_Audio = ^TEcore_Audio;
  TEcore_Audio = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEcore_Audio_Format = ^TEcore_Audio_Format;
  TEcore_Audio_Format = longint;

const
  ECORE_AUDIO_FORMAT_AUTO = 0;
  ECORE_AUDIO_FORMAT_RAW = 1;
  ECORE_AUDIO_FORMAT_WAV = 2;
  ECORE_AUDIO_FORMAT_OGG = 3;
  ECORE_AUDIO_FORMAT_FLAC = 4;
  ECORE_AUDIO_FORMAT_MP3 = 5;
  ECORE_AUDIO_FORMAT_LAST = 6;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function ECORE_AUDIO_CLASS: PEfl_Class;

function ecore_audio_class_get: PEfl_Class; cdecl; external libecore_audio;
procedure ecore_audio_obj_paused_set(obj: PEo; paused: TEina_Bool); cdecl; external libecore_audio;
function ecore_audio_obj_paused_get(obj: PEo): TEina_Bool; cdecl; external libecore_audio;
procedure ecore_audio_obj_volume_set(obj: PEo; volume: double); cdecl; external libecore_audio;
function ecore_audio_obj_volume_get(obj: PEo): double; cdecl; external libecore_audio;
function ecore_audio_obj_source_set(obj: PEo; source: pchar): TEina_Bool; cdecl; external libecore_audio;
function ecore_audio_obj_source_get(obj: PEo): pchar; cdecl; external libecore_audio;
function ecore_audio_obj_format_set(obj: PEo; format: TEcore_Audio_Format): TEina_Bool; cdecl; external libecore_audio;
function ecore_audio_obj_format_get(obj: PEo): TEcore_Audio_Format; cdecl; external libecore_audio;
procedure ecore_audio_obj_vio_set(obj: PEo; vio: PEcore_Audio_Vio; data: pointer; free_func: Tefl_key_data_free_func); cdecl; external libecore_audio;
{$endif}

// === Konventiert am: 13-6-25 19:34:56 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function ECORE_AUDIO_CLASS: PEfl_Class;
begin
  ECORE_AUDIO_CLASS := ecore_audio_class_get;
end;
{$endif}


{$ENDIF read_implementation}
