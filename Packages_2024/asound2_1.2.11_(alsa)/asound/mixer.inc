{$IFDEF read_interface}


type
  Psnd_mixer_t = type Pointer;
  PPsnd_mixer_t = ^Psnd_mixer_t;
  Psnd_mixer_class_t = type Pointer;
  PPsnd_mixer_class_t = ^Psnd_mixer_class_t;
  Psnd_mixer_elem_t = type Pointer;
  PPsnd_mixer_elem_t = ^Psnd_mixer_elem_t;

  Tsnd_mixer_callback_t = function(ctl: Psnd_mixer_t; mask: dword; elem: Psnd_mixer_elem_t): longint; cdecl;
  Tsnd_mixer_elem_callback_t = function(elem: Psnd_mixer_elem_t; mask: dword): longint; cdecl;
  Tsnd_mixer_compare_t = function(e1: Psnd_mixer_elem_t; e2: Psnd_mixer_elem_t): longint; cdecl;
  Tsnd_mixer_event_t = function(class_: Psnd_mixer_class_t; mask: dword; helem: Psnd_hctl_elem_t; melem: Psnd_mixer_elem_t): longint; cdecl;

  Psnd_mixer_elem_type_t = ^Tsnd_mixer_elem_type_t;
  Tsnd_mixer_elem_type_t = longint;

const
  SND_MIXER_ELEM_SIMPLE = 0;
  SND_MIXER_ELEM_LAST = SND_MIXER_ELEM_SIMPLE;

function snd_mixer_open(mixer: PPsnd_mixer_t; mode: longint): longint; cdecl; external libasound;
function snd_mixer_close(mixer: Psnd_mixer_t): longint; cdecl; external libasound;
function snd_mixer_first_elem(mixer: Psnd_mixer_t): Psnd_mixer_elem_t; cdecl; external libasound;
function snd_mixer_last_elem(mixer: Psnd_mixer_t): Psnd_mixer_elem_t; cdecl; external libasound;
function snd_mixer_handle_events(mixer: Psnd_mixer_t): longint; cdecl; external libasound;
function snd_mixer_attach(mixer: Psnd_mixer_t; name: pchar): longint; cdecl; external libasound;
function snd_mixer_attach_hctl(mixer: Psnd_mixer_t; hctl: Psnd_hctl_t): longint; cdecl; external libasound;
function snd_mixer_detach(mixer: Psnd_mixer_t; name: pchar): longint; cdecl; external libasound;
function snd_mixer_detach_hctl(mixer: Psnd_mixer_t; hctl: Psnd_hctl_t): longint; cdecl; external libasound;
function snd_mixer_get_hctl(mixer: Psnd_mixer_t; name: pchar; hctl: PPsnd_hctl_t): longint; cdecl; external libasound;
function snd_mixer_poll_descriptors_count(mixer: Psnd_mixer_t): longint; cdecl; external libasound;
function snd_mixer_poll_descriptors(mixer: Psnd_mixer_t; pfds: Ppollfd; space: dword): longint; cdecl; external libasound;
function snd_mixer_poll_descriptors_revents(mixer: Psnd_mixer_t; pfds: Ppollfd; nfds: dword; revents: Pword): longint; cdecl; external libasound;
function snd_mixer_load(mixer: Psnd_mixer_t): longint; cdecl; external libasound;
procedure snd_mixer_free(mixer: Psnd_mixer_t); cdecl; external libasound;
function snd_mixer_wait(mixer: Psnd_mixer_t; timeout: longint): longint; cdecl; external libasound;
function snd_mixer_set_compare(mixer: Psnd_mixer_t; msort: Tsnd_mixer_compare_t): longint; cdecl; external libasound;
procedure snd_mixer_set_callback(obj: Psnd_mixer_t; val: Tsnd_mixer_callback_t); cdecl; external libasound;
function snd_mixer_get_callback_private(obj: Psnd_mixer_t): pointer; cdecl; external libasound;
procedure snd_mixer_set_callback_private(obj: Psnd_mixer_t; val: pointer); cdecl; external libasound;
function snd_mixer_get_count(obj: Psnd_mixer_t): dword; cdecl; external libasound;
function snd_mixer_class_unregister(clss: Psnd_mixer_class_t): longint; cdecl; external libasound;
function snd_mixer_elem_next(elem: Psnd_mixer_elem_t): Psnd_mixer_elem_t; cdecl; external libasound;
function snd_mixer_elem_prev(elem: Psnd_mixer_elem_t): Psnd_mixer_elem_t; cdecl; external libasound;
procedure snd_mixer_elem_set_callback(obj: Psnd_mixer_elem_t; val: Tsnd_mixer_elem_callback_t); cdecl; external libasound;
function snd_mixer_elem_get_callback_private(obj: Psnd_mixer_elem_t): pointer; cdecl; external libasound;
procedure snd_mixer_elem_set_callback_private(obj: Psnd_mixer_elem_t; val: pointer); cdecl; external libasound;
function snd_mixer_elem_get_type(obj: Psnd_mixer_elem_t): Tsnd_mixer_elem_type_t; cdecl; external libasound;
function snd_mixer_class_register(class_: Psnd_mixer_class_t; mixer: Psnd_mixer_t): longint; cdecl; external libasound;

type
  Tmixer_elem_new_proc = procedure(elem: Psnd_mixer_elem_t);

function snd_mixer_elem_new(elem: PPsnd_mixer_elem_t; _type: Tsnd_mixer_elem_type_t; compare_weight: longint; private_data: pointer; private_free: Tmixer_elem_new_proc): longint; cdecl; external libasound;
function snd_mixer_elem_add(elem: Psnd_mixer_elem_t; class_: Psnd_mixer_class_t): longint; cdecl; external libasound;
function snd_mixer_elem_remove(elem: Psnd_mixer_elem_t): longint; cdecl; external libasound;
procedure snd_mixer_elem_free(elem: Psnd_mixer_elem_t); cdecl; external libasound;
function snd_mixer_elem_info(elem: Psnd_mixer_elem_t): longint; cdecl; external libasound;
function snd_mixer_elem_value(elem: Psnd_mixer_elem_t): longint; cdecl; external libasound;
function snd_mixer_elem_attach(melem: Psnd_mixer_elem_t; helem: Psnd_hctl_elem_t): longint; cdecl; external libasound;
function snd_mixer_elem_detach(melem: Psnd_mixer_elem_t; helem: Psnd_hctl_elem_t): longint; cdecl; external libasound;
function snd_mixer_elem_empty(melem: Psnd_mixer_elem_t): longint; cdecl; external libasound;
function snd_mixer_elem_get_private(melem: Psnd_mixer_elem_t): pointer; cdecl; external libasound;
function snd_mixer_class_sizeof: Tsize_t; cdecl; external libasound;

function snd_mixer_class_malloc(ptr: PPsnd_mixer_class_t): longint; cdecl; external libasound;
procedure snd_mixer_class_free(obj: Psnd_mixer_class_t); cdecl; external libasound;
procedure snd_mixer_class_copy(dst: Psnd_mixer_class_t; src: Psnd_mixer_class_t); cdecl; external libasound;
function snd_mixer_class_get_mixer(class_: Psnd_mixer_class_t): Psnd_mixer_t; cdecl; external libasound;
function snd_mixer_class_get_event(class_: Psnd_mixer_class_t): Tsnd_mixer_event_t; cdecl; external libasound;
function snd_mixer_class_get_private(class_: Psnd_mixer_class_t): pointer; cdecl; external libasound;
function snd_mixer_class_get_compare(class_: Psnd_mixer_class_t): Tsnd_mixer_compare_t; cdecl; external libasound;
function snd_mixer_class_set_event(class_: Psnd_mixer_class_t; event: Tsnd_mixer_event_t): longint; cdecl; external libasound;
function snd_mixer_class_set_private(class_: Psnd_mixer_class_t; private_data: pointer): longint; cdecl; external libasound;

type
  Tmixer_mixer_class_proc = procedure(para1: Psnd_mixer_class_t);

function snd_mixer_class_set_private_free(class_: Psnd_mixer_class_t; private_free: Tmixer_mixer_class_proc): longint; cdecl; external libasound;
function snd_mixer_class_set_compare(class_: Psnd_mixer_class_t; compare: Tsnd_mixer_compare_t): longint; cdecl; external libasound;

type
  Psnd_mixer_selem_channel_id_t = ^Tsnd_mixer_selem_channel_id_t;
  Tsnd_mixer_selem_channel_id_t = longint;

const
  SND_MIXER_SCHN_UNKNOWN = -(1);
  SND_MIXER_SCHN_FRONT_LEFT = 0;
  SND_MIXER_SCHN_FRONT_RIGHT = 1;
  SND_MIXER_SCHN_REAR_LEFT = 2;
  SND_MIXER_SCHN_REAR_RIGHT = 3;
  SND_MIXER_SCHN_FRONT_CENTER = 4;
  SND_MIXER_SCHN_WOOFER = 5;
  SND_MIXER_SCHN_SIDE_LEFT = 6;
  SND_MIXER_SCHN_SIDE_RIGHT = 7;
  SND_MIXER_SCHN_REAR_CENTER = 8;
  SND_MIXER_SCHN_LAST = 31;
  SND_MIXER_SCHN_MONO = SND_MIXER_SCHN_FRONT_LEFT;

type
  Tsnd_mixer_selem_regopt_abstract = longint;

const
  SND_MIXER_SABSTRACT_NONE = 0;
  SND_MIXER_SABSTRACT_BASIC = 1;

type
  Tsnd_mixer_selem_regopt = record
    ver: longint;
    abstract: Tsnd_mixer_selem_regopt_abstract;
    device: pchar;
    playback_pcm: Psnd_pcm_t;
    capture_pcm: Psnd_pcm_t;
  end;
  Psnd_mixer_selem_regopt = ^Tsnd_mixer_selem_regopt;

  Psnd_mixer_selem_id_t = type Pointer;
  PPsnd_mixer_selem_id_t = ^Psnd_mixer_selem_id_t;

function snd_mixer_selem_channel_name(channel: Tsnd_mixer_selem_channel_id_t): pchar; cdecl; external libasound;
function snd_mixer_selem_register(mixer: Psnd_mixer_t; options: Psnd_mixer_selem_regopt; classp: PPsnd_mixer_class_t): longint; cdecl; external libasound;
procedure snd_mixer_selem_get_id(element: Psnd_mixer_elem_t; id: Psnd_mixer_selem_id_t); cdecl; external libasound;
function snd_mixer_selem_get_name(elem: Psnd_mixer_elem_t): pchar; cdecl; external libasound;
function snd_mixer_selem_get_index(elem: Psnd_mixer_elem_t): dword; cdecl; external libasound;
function snd_mixer_find_selem(mixer: Psnd_mixer_t; id: Psnd_mixer_selem_id_t): Psnd_mixer_elem_t; cdecl; external libasound;
function snd_mixer_selem_is_active(elem: Psnd_mixer_elem_t): longint; cdecl; external libasound;
function snd_mixer_selem_is_playback_mono(elem: Psnd_mixer_elem_t): longint; cdecl; external libasound;
function snd_mixer_selem_has_playback_channel(obj: Psnd_mixer_elem_t; channel: Tsnd_mixer_selem_channel_id_t): longint; cdecl; external libasound;
function snd_mixer_selem_is_capture_mono(elem: Psnd_mixer_elem_t): longint; cdecl; external libasound;
function snd_mixer_selem_has_capture_channel(obj: Psnd_mixer_elem_t; channel: Tsnd_mixer_selem_channel_id_t): longint; cdecl; external libasound;
function snd_mixer_selem_get_capture_group(elem: Psnd_mixer_elem_t): longint; cdecl; external libasound;
function snd_mixer_selem_has_common_volume(elem: Psnd_mixer_elem_t): longint; cdecl; external libasound;
function snd_mixer_selem_has_playback_volume(elem: Psnd_mixer_elem_t): longint; cdecl; external libasound;
function snd_mixer_selem_has_playback_volume_joined(elem: Psnd_mixer_elem_t): longint; cdecl; external libasound;
function snd_mixer_selem_has_capture_volume(elem: Psnd_mixer_elem_t): longint; cdecl; external libasound;
function snd_mixer_selem_has_capture_volume_joined(elem: Psnd_mixer_elem_t): longint; cdecl; external libasound;
function snd_mixer_selem_has_common_switch(elem: Psnd_mixer_elem_t): longint; cdecl; external libasound;
function snd_mixer_selem_has_playback_switch(elem: Psnd_mixer_elem_t): longint; cdecl; external libasound;
function snd_mixer_selem_has_playback_switch_joined(elem: Psnd_mixer_elem_t): longint; cdecl; external libasound;
function snd_mixer_selem_has_capture_switch(elem: Psnd_mixer_elem_t): longint; cdecl; external libasound;
function snd_mixer_selem_has_capture_switch_joined(elem: Psnd_mixer_elem_t): longint; cdecl; external libasound;
function snd_mixer_selem_has_capture_switch_exclusive(elem: Psnd_mixer_elem_t): longint; cdecl; external libasound;

function snd_mixer_selem_ask_playback_vol_dB(elem: Psnd_mixer_elem_t; value: Tlong; dBvalue: Plong): longint; cdecl; external libasound;
function snd_mixer_selem_ask_capture_vol_dB(elem: Psnd_mixer_elem_t; value: Tlong; dBvalue: Plong): longint; cdecl; external libasound;
function snd_mixer_selem_ask_playback_dB_vol(elem: Psnd_mixer_elem_t; dBvalue: Tlong; dir: longint; value: Plong): longint; cdecl; external libasound;
function snd_mixer_selem_ask_capture_dB_vol(elem: Psnd_mixer_elem_t; dBvalue: Tlong; dir: longint; value: Plong): longint; cdecl; external libasound;
function snd_mixer_selem_get_playback_volume(elem: Psnd_mixer_elem_t; channel: Tsnd_mixer_selem_channel_id_t; value: Plong): longint; cdecl; external libasound;
function snd_mixer_selem_get_capture_volume(elem: Psnd_mixer_elem_t; channel: Tsnd_mixer_selem_channel_id_t; value: Plong): longint; cdecl; external libasound;
function snd_mixer_selem_get_playback_dB(elem: Psnd_mixer_elem_t; channel: Tsnd_mixer_selem_channel_id_t; value: Plong): longint; cdecl; external libasound;
function snd_mixer_selem_get_capture_dB(elem: Psnd_mixer_elem_t; channel: Tsnd_mixer_selem_channel_id_t; value: Plong): longint; cdecl; external libasound;
function snd_mixer_selem_get_playback_switch(elem: Psnd_mixer_elem_t; channel: Tsnd_mixer_selem_channel_id_t; value: Plongint): longint; cdecl; external libasound;
function snd_mixer_selem_get_capture_switch(elem: Psnd_mixer_elem_t; channel: Tsnd_mixer_selem_channel_id_t; value: Plongint): longint; cdecl; external libasound;
function snd_mixer_selem_set_playback_volume(elem: Psnd_mixer_elem_t; channel: Tsnd_mixer_selem_channel_id_t; value: Tlong): longint; cdecl; external libasound;
function snd_mixer_selem_set_capture_volume(elem: Psnd_mixer_elem_t; channel: Tsnd_mixer_selem_channel_id_t; value: Tlong): longint; cdecl; external libasound;
function snd_mixer_selem_set_playback_dB(elem: Psnd_mixer_elem_t; channel: Tsnd_mixer_selem_channel_id_t; value: Tlong; dir: longint): longint; cdecl; external libasound;
function snd_mixer_selem_set_capture_dB(elem: Psnd_mixer_elem_t; channel: Tsnd_mixer_selem_channel_id_t; value: Tlong; dir: longint): longint; cdecl; external libasound;
function snd_mixer_selem_set_playback_volume_all(elem: Psnd_mixer_elem_t; value: Tlong): longint; cdecl; external libasound;
function snd_mixer_selem_set_capture_volume_all(elem: Psnd_mixer_elem_t; value: Tlong): longint; cdecl; external libasound;
function snd_mixer_selem_set_playback_dB_all(elem: Psnd_mixer_elem_t; value: Tlong; dir: longint): longint; cdecl; external libasound;
function snd_mixer_selem_set_capture_dB_all(elem: Psnd_mixer_elem_t; value: Tlong; dir: longint): longint; cdecl; external libasound;
function snd_mixer_selem_set_playback_switch(elem: Psnd_mixer_elem_t; channel: Tsnd_mixer_selem_channel_id_t; value: longint): longint; cdecl; external libasound;
function snd_mixer_selem_set_capture_switch(elem: Psnd_mixer_elem_t; channel: Tsnd_mixer_selem_channel_id_t; value: longint): longint; cdecl; external libasound;
function snd_mixer_selem_set_playback_switch_all(elem: Psnd_mixer_elem_t; value: longint): longint; cdecl; external libasound;
function snd_mixer_selem_set_capture_switch_all(elem: Psnd_mixer_elem_t; value: longint): longint; cdecl; external libasound;
function snd_mixer_selem_get_playback_volume_range(elem: Psnd_mixer_elem_t; min: Plong; max: Plong): longint; cdecl; external libasound;
function snd_mixer_selem_get_playback_dB_range(elem: Psnd_mixer_elem_t; min: Plong; max: Plong): longint; cdecl; external libasound;
function snd_mixer_selem_set_playback_volume_range(elem: Psnd_mixer_elem_t; min: Tlong; max: Tlong): longint; cdecl; external libasound;
function snd_mixer_selem_get_capture_volume_range(elem: Psnd_mixer_elem_t; min: Plong; max: Plong): longint; cdecl; external libasound;
function snd_mixer_selem_get_capture_dB_range(elem: Psnd_mixer_elem_t; min: Plong; max: Plong): longint; cdecl; external libasound;
function snd_mixer_selem_set_capture_volume_range(elem: Psnd_mixer_elem_t; min: Tlong; max: Tlong): longint; cdecl; external libasound;
function snd_mixer_selem_is_enumerated(elem: Psnd_mixer_elem_t): longint; cdecl; external libasound;
function snd_mixer_selem_is_enum_playback(elem: Psnd_mixer_elem_t): longint; cdecl; external libasound;
function snd_mixer_selem_is_enum_capture(elem: Psnd_mixer_elem_t): longint; cdecl; external libasound;
function snd_mixer_selem_get_enum_items(elem: Psnd_mixer_elem_t): longint; cdecl; external libasound;
function snd_mixer_selem_get_enum_item_name(elem: Psnd_mixer_elem_t; idx: dword; maxlen: Tsize_t; str: pchar): longint; cdecl; external libasound;
function snd_mixer_selem_get_enum_item(elem: Psnd_mixer_elem_t; channel: Tsnd_mixer_selem_channel_id_t; idxp: Pdword): longint; cdecl; external libasound;
function snd_mixer_selem_set_enum_item(elem: Psnd_mixer_elem_t; channel: Tsnd_mixer_selem_channel_id_t; idx: dword): longint; cdecl; external libasound;
function snd_mixer_selem_id_sizeof: Tsize_t; cdecl; external libasound;

function snd_mixer_selem_id_malloc(ptr: PPsnd_mixer_selem_id_t): longint; cdecl; external libasound;
procedure snd_mixer_selem_id_free(obj: Psnd_mixer_selem_id_t); cdecl; external libasound;
procedure snd_mixer_selem_id_copy(dst: Psnd_mixer_selem_id_t; src: Psnd_mixer_selem_id_t); cdecl; external libasound;
function snd_mixer_selem_id_get_name(obj: Psnd_mixer_selem_id_t): pchar; cdecl; external libasound;
function snd_mixer_selem_id_get_index(obj: Psnd_mixer_selem_id_t): dword; cdecl; external libasound;
procedure snd_mixer_selem_id_set_name(obj: Psnd_mixer_selem_id_t; val: pchar); cdecl; external libasound;
procedure snd_mixer_selem_id_set_index(obj: Psnd_mixer_selem_id_t; val: dword); cdecl; external libasound;
function snd_mixer_selem_id_parse(dst: Psnd_mixer_selem_id_t; str: pchar): longint; cdecl; external libasound;

// === Konventiert am: 19-11-25 16:12:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
