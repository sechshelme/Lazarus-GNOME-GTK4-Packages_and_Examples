unit use_case;

interface

uses
  fp_asound;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  SND_USE_CASE_VERB_INACTIVE = 'Inactive';
  SND_USE_CASE_VERB_HIFI = 'HiFi';
  SND_USE_CASE_VERB_HIFI_LOW_POWER = 'HiFi Low Power';
  SND_USE_CASE_VERB_VOICE = 'Voice';
  SND_USE_CASE_VERB_VOICE_LOW_POWER = 'Voice Low Power';
  SND_USE_CASE_VERB_VOICECALL = 'Voice Call';
  SND_USE_CASE_VERB_IP_VOICECALL = 'Voice Call IP';
  SND_USE_CASE_VERB_ANALOG_RADIO = 'FM Analog Radio';
  SND_USE_CASE_VERB_DIGITAL_RADIO = 'FM Digital Radio';
  SND_USE_CASE_DEV_NONE = 'None';
  SND_USE_CASE_DEV_SPEAKER = 'Speaker';
  SND_USE_CASE_DEV_LINE = 'Line';
  SND_USE_CASE_DEV_MIC = 'Mic';
  SND_USE_CASE_DEV_HEADPHONES = 'Headphones';
  SND_USE_CASE_DEV_HEADSET = 'Headset';
  SND_USE_CASE_DEV_HANDSET = 'Handset';
  SND_USE_CASE_DEV_BLUETOOTH = 'Bluetooth';
  SND_USE_CASE_DEV_EARPIECE = 'Earpiece';
  SND_USE_CASE_DEV_SPDIF = 'SPDIF';
  SND_USE_CASE_DEV_HDMI = 'HDMI';
  SND_USE_CASE_DEV_USB = 'USB';
  SND_USE_CASE_DEV_DIRECT = 'Direct';
  SND_USE_CASE_MOD_CAPTURE_VOICE = 'Capture Voice';
  SND_USE_CASE_MOD_CAPTURE_MUSIC = 'Capture Music';
  SND_USE_CASE_MOD_PLAY_MUSIC = 'Play Music';
  SND_USE_CASE_MOD_PLAY_VOICE = 'Play Voice';
  SND_USE_CASE_MOD_PLAY_TONE = 'Play Tone';
  SND_USE_CASE_MOD_ECHO_REF = 'Echo Reference';
  SND_USE_CASE_TQ_MUSIC = 'Music';
  SND_USE_CASE_TQ_VOICE = 'Voice';
  SND_USE_CASE_TQ_TONES = 'Tones';

type
  Psnd_use_case_mgr_t = type PointerArray;
  PPsnd_use_case_mgr_t = ^Psnd_use_case_mgr_t;

function snd_use_case_identifier(fmt: pchar): pchar; cdecl; varargs; external libasound;
function snd_use_case_free_list(list: PPchar; items: longint): longint; cdecl; external libasound;
function snd_use_case_get_list(uc_mgr: Psnd_use_case_mgr_t; identifier: pchar; list: PPPchar): longint; cdecl; external libasound;
function snd_use_case_get(uc_mgr: Psnd_use_case_mgr_t; identifier: pchar; value: PPchar): longint; cdecl; external libasound;
function snd_use_case_geti(uc_mgr: Psnd_use_case_mgr_t; identifier: pchar; value: Plongint): longint; cdecl; external libasound;
function snd_use_case_set(uc_mgr: Psnd_use_case_mgr_t; identifier: pchar; value: pchar): longint; cdecl; external libasound;
function snd_use_case_mgr_open(uc_mgr: PPsnd_use_case_mgr_t; card_name: pchar): longint; cdecl; external libasound;
function snd_use_case_mgr_reload(uc_mgr: Psnd_use_case_mgr_t): longint; cdecl; external libasound;
function snd_use_case_mgr_close(uc_mgr: Psnd_use_case_mgr_t): longint; cdecl; external libasound;
function snd_use_case_mgr_reset(uc_mgr: Psnd_use_case_mgr_t): longint; cdecl; external libasound;

function snd_use_case_card_list(list: PPAnsiChar): Integer; inline;
function snd_use_case_verb_list(uc_mgr: Pointer; list: PPAnsiChar): Integer; inline;

function snd_use_case_parse_ctl_elem_id(dst: Psnd_ctl_elem_id_t; ucm_id: pchar; value: pchar): longint; cdecl; external libasound;
function snd_use_case_parse_selem_id(dst: Psnd_mixer_selem_id_t; ucm_id: pchar; value: pchar): longint; cdecl; external libasound;

// === Konventiert am: 19-11-25 16:11:25 ===


implementation

function snd_use_case_card_list(list: PPAnsiChar): Integer;
begin
  Result := snd_use_case_get_list(nil, nil, list);
end;

function snd_use_case_verb_list(uc_mgr: Pointer; list: PPAnsiChar): Integer;
begin
  Result := snd_use_case_get_list(uc_mgr, '_verbs', list);
end;



end.
