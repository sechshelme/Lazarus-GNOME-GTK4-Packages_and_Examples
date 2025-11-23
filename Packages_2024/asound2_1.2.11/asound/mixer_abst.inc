{$IFDEF read_interface}


const
  SM_PLAY = 0;
  SM_CAPT = 1;
  SM_CAP_GVOLUME = 1 shl 1;
  SM_CAP_GSWITCH = 1 shl 2;
  SM_CAP_PVOLUME = 1 shl 3;
  SM_CAP_PVOLUME_JOIN = 1 shl 4;
  SM_CAP_PSWITCH = 1 shl 5;
  SM_CAP_PSWITCH_JOIN = 1 shl 6;
  SM_CAP_CVOLUME = 1 shl 7;
  SM_CAP_CVOLUME_JOIN = 1 shl 8;
  SM_CAP_CSWITCH = 1 shl 9;
  SM_CAP_CSWITCH_JOIN = 1 shl 10;
  SM_CAP_CSWITCH_EXCL = 1 shl 11;
  SM_CAP_PENUM = 1 shl 12;
  SM_CAP_CENUM = 1 shl 13;
  SM_OPS_IS_ACTIVE = 0;
  SM_OPS_IS_MONO = 1;
  SM_OPS_IS_CHANNEL = 2;
  SM_OPS_IS_ENUMERATED = 3;
  SM_OPS_IS_ENUMCNT = 4;

type
  Tsm_elem_ops = record
    is_: function(elem: Psnd_mixer_elem_t; dir: longint; cmd: longint; val: longint): longint; cdecl;
    get_range: function(elem: Psnd_mixer_elem_t; dir: longint; min: Plong; max: Plong): longint; cdecl;
    set_range: function(elem: Psnd_mixer_elem_t; dir: longint; min: Tlong; max: Tlong): longint; cdecl;
    get_dB_range: function(elem: Psnd_mixer_elem_t; dir: longint; min: Plong; max: Plong): longint; cdecl;
    ask_vol_dB: function(elem: Psnd_mixer_elem_t; dir: longint; value: Tlong; dbValue: Plong): longint; cdecl;
    ask_dB_vol: function(elem: Psnd_mixer_elem_t; dir: longint; dbValue: Tlong; value: Plong; xdir: longint): longint; cdecl;
    get_volume: function(elem: Psnd_mixer_elem_t; dir: longint; channel: Tsnd_mixer_selem_channel_id_t; value: Plong): longint; cdecl;
    get_dB: function(elem: Psnd_mixer_elem_t; dir: longint; channel: Tsnd_mixer_selem_channel_id_t; value: Plong): longint; cdecl;
    set_volume: function(elem: Psnd_mixer_elem_t; dir: longint; channel: Tsnd_mixer_selem_channel_id_t; value: Tlong): longint; cdecl;
    set_dB: function(elem: Psnd_mixer_elem_t; dir: longint; channel: Tsnd_mixer_selem_channel_id_t; value: Tlong; xdir: longint): longint; cdecl;
    get_switch: function(elem: Psnd_mixer_elem_t; dir: longint; channel: Tsnd_mixer_selem_channel_id_t; value: Plongint): longint; cdecl;
    set_switch: function(elem: Psnd_mixer_elem_t; dir: longint; channel: Tsnd_mixer_selem_channel_id_t; value: longint): longint; cdecl;
    enum_item_name: function(elem: Psnd_mixer_elem_t; item: dword; maxlen: Tsize_t; buf: pchar): longint; cdecl;
    get_enum_item: function(elem: Psnd_mixer_elem_t; channel: Tsnd_mixer_selem_channel_id_t; itemp: Pdword): longint; cdecl;
    set_enum_item: function(elem: Psnd_mixer_elem_t; channel: Tsnd_mixer_selem_channel_id_t; item: dword): longint; cdecl;
  end;
  Psm_elem_ops = ^Tsm_elem_ops;

  Tsm_selem_t = record
    id: Psnd_mixer_selem_id_t;
    ops: Psm_elem_ops;
    caps: dword;
    capture_group: dword;
  end;
  Psm_selem_t = ^Tsm_selem_t;

  Tsm_class_basic_t = record
    device: pchar;
    ctl: Psnd_ctl_t;
    hctl: Psnd_hctl_t;
    info: Psnd_ctl_card_info_t;
  end;
  Psm_class_basic_t = ^Tsm_class_basic_t;

function snd_mixer_selem_compare(c1: Psnd_mixer_elem_t; c2: Psnd_mixer_elem_t): longint; cdecl; external libasound;
function snd_mixer_sbasic_info(mixer_class: Psnd_mixer_class_t; info: Psm_class_basic_t): longint; cdecl; external libasound;
function snd_mixer_sbasic_get_private(mixer_class: Psnd_mixer_class_t): pointer; cdecl; external libasound;
procedure snd_mixer_sbasic_set_private(mixer_class: Psnd_mixer_class_t; private_data: pointer); cdecl; external libasound;

type
  TprivateMixelFreeProc = procedure(mixer_class: Psnd_mixer_class_t);

procedure snd_mixer_sbasic_set_private_free(mixer_class: Psnd_mixer_class_t; private_free: TprivateMixelFreeProc); cdecl; external libasound;



// === Konventiert am: 19-11-25 16:12:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
