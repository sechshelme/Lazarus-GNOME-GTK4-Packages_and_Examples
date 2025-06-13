{$IFDEF read_interface}


type
  PEcore_Audio_Type = ^TEcore_Audio_Type;
  TEcore_Audio_Type = longint;

const
  ECORE_AUDIO_TYPE_PULSE = 0;
  ECORE_AUDIO_TYPE_ALSA = 1;
  ECORE_AUDIO_TYPE_SNDFILE = 2;
  ECORE_AUDIO_TYPE_TONE = 3;
  ECORE_AUDIO_TYPE_CORE_AUDIO = 4;
  ECORE_AUDIO_TYPE_CUSTOM = 5;
  ECORE_AUDIO_TYPE_WASAPI = 6;
  ECORE_AUDIO_MODULE_LAST = 7;

type
  TEcore_Audio_Vio = record
    get_length: function(data: pointer; eo_obj: PEo): longint; cdecl;
    seek: function(data: pointer; eo_obj: PEo; offset: longint; whence: longint): longint; cdecl;
    tell: function(data: pointer; eo_obj: PEo): longint; cdecl;
    read: function(data: pointer; eo_obj: PEo; buffer: pointer; length: longint): longint; cdecl;
    write: function(data: pointer; eo_obj: PEo; buffer: pointer; length: longint): longint; cdecl;
  end;
  PEcore_Audio_Vio = ^TEcore_Audio_Vio;

function ecore_audio_init: longint; cdecl; external libecore_audio;
function ecore_audio_shutdown: longint; cdecl; external libecore_audio;
function ecore_audio_obj_name_get(obj: PEfl_Object): pchar; cdecl; external libecore_audio;
procedure ecore_audio_obj_name_set(obj: PEfl_Object; name: pchar); cdecl; external libecore_audio;

// === Konventiert am: 13-6-25 19:34:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
