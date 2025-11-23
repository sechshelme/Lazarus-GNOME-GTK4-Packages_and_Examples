{$IFDEF read_interface}


type
  Tsnd_ump_msg_hdr_t = bitpacked record
    byte2: Tuint8_t;
    byte1: Tuint8_t;
    channel: 0..15;
    status: 0..15;
    group: 0..15;
    type_: 0..15;
  end;
  Psnd_ump_msg_hdr_t = ^Tsnd_ump_msg_hdr_t;

type
  Tsnd_ump_msg_midi1_note_t = bitpacked record
    velocity: Tuint8_t;
    note: Tuint8_t;
    channel: 0..15;
    status: 0..15;
    group: 0..15;
    type_: 0..15;
  end;
  Psnd_ump_msg_midi1_note_t = ^Tsnd_ump_msg_midi1_note_t;

type
  Tsnd_ump_msg_midi1_paf_t = bitpacked record
    data: Tuint8_t;
    note: Tuint8_t;
    channel: 0..15;
    status: 0..15;
    group: 0..15;
    type_: 0..15;
  end;
  Psnd_ump_msg_midi1_paf_t = ^Tsnd_ump_msg_midi1_paf_t;

type
  Tsnd_ump_msg_midi1_cc_t = bitpacked record
    data: Tuint8_t;
    index: Tuint8_t;
    channel: 0..15;
    status: 0..15;
    group: 0..15;
    type_: 0..15;
  end;
  Psnd_ump_msg_midi1_cc_t = ^Tsnd_ump_msg_midi1_cc_t;

type
  Tsnd_ump_msg_midi1_program_t = bitpacked record
    reserved: Tuint8_t;
    prgm: Tuint8_t;
    channel: 0..15;
    status: 0..15;
    group: 0..15;
    type_: 0..15;
  end;
  Psnd_ump_msg_midi1_program_t = ^Tsnd_ump_msg_midi1_program_t;

type
  Tsnd_ump_msg_midi1_caf_t = bitpacked record
    reserved: Tuint8_t;
    data: Tuint8_t;
    channel: 0..15;
    status: 0..15;
    group: 0..15;
    type_: 0..15;
  end;
  Psnd_ump_msg_midi1_caf_t = ^Tsnd_ump_msg_midi1_caf_t;

type
  Tsnd_ump_msg_midi1_pitchbend_t = bitpacked record
    data_msb: Tuint8_t;
    data_lsb: Tuint8_t;
    channel: 0..15;
    status: 0..15;
    group: 0..15;
    type_: 0..15;
  end;
  Psnd_ump_msg_midi1_pitchbend_t = ^Tsnd_ump_msg_midi1_pitchbend_t;

type
  Tsnd_ump_msg_system_t = bitpacked record
    parm1: Tuint8_t;
    parm2: Tuint8_t;
    status: Tuint8_t;
    group: 0..15;
    type_: 0..15;
  end;
  Psnd_ump_msg_system_t = ^Tsnd_ump_msg_system_t;

type
  Tsnd_ump_msg_midi1_t = record
    case longint of
      0: (note_on: Tsnd_ump_msg_midi1_note_t);
      1: (note_off: Tsnd_ump_msg_midi1_note_t);
      2: (poly_pressure: Tsnd_ump_msg_midi1_paf_t);
      3: (control_change: Tsnd_ump_msg_midi1_cc_t);
      4: (program_change: Tsnd_ump_msg_midi1_program_t);
      5: (channel_pressure: Tsnd_ump_msg_midi1_caf_t);
      6: (pitchbend: Tsnd_ump_msg_midi1_pitchbend_t);
      7: (system: Tsnd_ump_msg_system_t);
      8: (hdr: Tsnd_ump_msg_hdr_t);
      9: (raw: Tuint32_t);
  end;
  Psnd_ump_msg_midi1_t = ^Tsnd_ump_msg_midi1_t;

const
  SND_UMP_MIDI2_NOTE_ATTR_NO_DATA = $00;
  SND_UMP_MIDI2_NOTE_ATTR_MANUFACTURER = $01;
  SND_UMP_MIDI2_NOTE_ATTR_PROFILE = $02;
  SND_UMP_MIDI2_NOTE_ATTR_PITCH79 = $03;

type
  Tsnd_ump_msg_midi2_note_t = bitpacked record
    attr_type: Tuint8_t;
    note: Tuint8_t;
    channel: 0..15;
    status: 0..15;
    group: 0..15;
    type_: 0..15;
    attr_data: Tuint16_t;
    velocity: Tuint16_t;
  end;
  Psnd_ump_msg_midi2_note_t = ^Tsnd_ump_msg_midi2_note_t;

type
  Tsnd_ump_msg_midi2_paf_t = bitpacked record
    reserved: Tuint8_t;
    note: Tuint8_t;
    channel: 0..15;
    status: 0..15;
    group: 0..15;
    type_: 0..15;
    data: Tuint32_t;
  end;
  Psnd_ump_msg_midi2_paf_t = ^Tsnd_ump_msg_midi2_paf_t;

type
  Tsnd_ump_msg_midi2_per_note_cc_t = bitpacked record
    index: Tuint8_t;
    note: Tuint8_t;
    channel: 0..15;
    status: 0..15;
    group: 0..15;
    type_: 0..15;
    data: Tuint32_t;
  end;
  Psnd_ump_msg_midi2_per_note_cc_t = ^Tsnd_ump_msg_midi2_per_note_cc_t;

const
  SND_UMP_MIDI2_PNMGMT_RESET_CONTROLLERS = $01;
  SND_UMP_MIDI2_PNMGMT_DETACH_CONTROLLERS = $02;

type
  Tsnd_ump_msg_midi2_per_note_mgmt_t = bitpacked record
    flags: Tuint8_t;
    note: Tuint8_t;
    flag0: word;
    reserved: Tuint32_t;
  end;
  Psnd_ump_msg_midi2_per_note_mgmt_t = ^Tsnd_ump_msg_midi2_per_note_mgmt_t;

type
  Tsnd_ump_msg_midi2_cc_t = bitpacked record
    reserved: Tuint8_t;
    index: Tuint8_t;
    channel: 0..15;
    status: 0..15;
    group: 0..15;
    type_: 0..15;
    data: Tuint32_t;
  end;
  Psnd_ump_msg_midi2_cc_t = ^Tsnd_ump_msg_midi2_cc_t;

type
  Tsnd_ump_msg_midi2_rpn_t = bitpacked record
    index: Tuint8_t;
    bank: Tuint8_t;
    channel: 0..15;
    status: 0..15;
    group: 0..15;
    type_: 0..15;
    data: Tuint32_t;
  end;
  Psnd_ump_msg_midi2_rpn_t = ^Tsnd_ump_msg_midi2_rpn_t;

type
  Tsnd_ump_msg_midi2_program_t = bitpacked record
    bank_valid_: 0..1;
    reserved: 0..32767;
    channel: 0..15;
    status: 0..15;
    group: 0..15;
    type_: 0..15;
    bank_lsb: Tuint8_t;
    bank_msb: Tuint8_t;
    reserved2: Tuint8_t;
    prg: Tuint8_t;
  end;
  Psnd_ump_msg_midi2_program_t = ^Tsnd_ump_msg_midi2_program_t;

type
  Tsnd_ump_msg_midi2_caf_t = bitpacked record
    reserved: Tuint16_t;
    channel: 0..15;
    status: 0..15;
    group: 0..15;
    type_: 0..15;
    data: Tuint32_t;
  end;
  Psnd_ump_msg_midi2_caf_t = ^Tsnd_ump_msg_midi2_caf_t;

type
  Tsnd_ump_msg_midi2_pitchbend_t = bitpacked record
    reserved: Tuint16_t;
    channel: 0..15;
    status: 0..15;
    group: 0..15;
    type_: 0..15;
    data: Tuint32_t;
  end;
  Psnd_ump_msg_midi2_pitchbend_t = ^Tsnd_ump_msg_midi2_pitchbend_t;

type
  Tsnd_ump_msg_midi2_per_note_pitchbend_t = bitpacked record
    reserved: Tuint8_t;
    note: Tuint8_t;
    flag0: word;
    data: Tuint32_t;
  end;
  Psnd_ump_msg_midi2_per_note_pitchbend_t = ^Tsnd_ump_msg_midi2_per_note_pitchbend_t;

type
  Tsnd_ump_msg_midi2_t = record
    case longint of
      0: (note_on: Tsnd_ump_msg_midi2_note_t);
      1: (note_off: Tsnd_ump_msg_midi2_note_t);
      2: (poly_pressure: Tsnd_ump_msg_midi2_paf_t);
      3: (per_note_acc: Tsnd_ump_msg_midi2_per_note_cc_t);
      4: (per_note_rcc: Tsnd_ump_msg_midi2_per_note_cc_t);
      5: (per_note_mgmt: Tsnd_ump_msg_midi2_per_note_mgmt_t);
      6: (control_change: Tsnd_ump_msg_midi2_cc_t);
      7: (rpn: Tsnd_ump_msg_midi2_rpn_t);
      8: (nrpn: Tsnd_ump_msg_midi2_rpn_t);
      9: (relative_rpn: Tsnd_ump_msg_midi2_rpn_t);
      10: (relative_nrpn: Tsnd_ump_msg_midi2_rpn_t);
      11: (program_change: Tsnd_ump_msg_midi2_program_t);
      12: (channel_pressure: Tsnd_ump_msg_midi2_caf_t);
      13: (pitchbend: Tsnd_ump_msg_midi2_pitchbend_t);
      14: (per_note_pitchbend: Tsnd_ump_msg_midi2_per_note_pitchbend_t);
      15: (hdr: Tsnd_ump_msg_hdr_t);
      16: (raw: array[0..1] of Tuint32_t);
  end;
  Psnd_ump_msg_midi2_t = ^Tsnd_ump_msg_midi2_t;

const
  SND_UMP_MSG_TYPE_UTILITY = $00;
  SND_UMP_MSG_TYPE_SYSTEM = $01;
  SND_UMP_MSG_TYPE_MIDI1_CHANNEL_VOICE = $02;
  SND_UMP_MSG_TYPE_DATA = $03;
  SND_UMP_MSG_TYPE_MIDI2_CHANNEL_VOICE = $04;
  SND_UMP_MSG_TYPE_EXTENDED_DATA = $05;
  SND_UMP_MSG_TYPE_FLEX_DATA = $0d;
  SND_UMP_MSG_TYPE_STREAM = $0f;

const
  SND_UMP_MSG_PER_NOTE_RCC = $0;
  SND_UMP_MSG_PER_NOTE_ACC = $1;
  SND_UMP_MSG_RPN = $2;
  SND_UMP_MSG_NRPN = $3;
  SND_UMP_MSG_RELATIVE_RPN = $4;
  SND_UMP_MSG_RELATIVE_NRPN = $5;
  SND_UMP_MSG_PER_NOTE_PITCHBEND = $6;
  SND_UMP_MSG_NOTE_OFF = $8;
  SND_UMP_MSG_NOTE_ON = $9;
  SND_UMP_MSG_POLY_PRESSURE = $a;
  SND_UMP_MSG_CONTROL_CHANGE = $b;
  SND_UMP_MSG_PROGRAM_CHANGE = $c;
  SND_UMP_MSG_CHANNEL_PRESSURE = $d;
  SND_UMP_MSG_PITCHBEND = $e;
  SND_UMP_MSG_PER_NOTE_MGMT = $f;

const
  SND_UMP_MSG_REALTIME = $f0;
  SND_UMP_MSG_SYSEX_START = $f0;
  SND_UMP_MSG_MIDI_TIME_CODE = $f1;
  SND_UMP_MSG_SONG_POSITION = $f2;
  SND_UMP_MSG_SONG_SELECT = $f3;
  SND_UMP_MSG_TUNE_REQUEST = $f6;
  SND_UMP_MSG_SYSEX_END = $f7;
  SND_UMP_MSG_TIMING_CLOCK = $f8;
  SND_UMP_MSG_START = $fa;
  SND_UMP_MSG_CONTINUE = $fb;
  SND_UMP_MSG_STOP = $fc;
  SND_UMP_MSG_ACTIVE_SENSING = $fe;
  SND_UMP_MSG_RESET = $ff;

const
  SND_UMP_SYSEX_STATUS_SINGLE = 0;
  SND_UMP_SYSEX_STATUS_START = 1;
  SND_UMP_SYSEX_STATUS_CONTINUE = 2;
  SND_UMP_SYSEX_STATUS_END = 3;

const
  SND_UMP_UTILITY_MSG_STATUS_NOOP = $00;
  SND_UMP_UTILITY_MSG_STATUS_JR_CLOCK = $01;
  SND_UMP_UTILITY_MSG_STATUS_JR_TSTAMP = $02;
  SND_UMP_UTILITY_MSG_STATUS_DCTPQ = $03;
  SND_UMP_UTILITY_MSG_STATUS_DC = $04;

const
  SND_UMP_STREAM_MSG_STATUS_EP_DISCOVERY = $00;
  SND_UMP_STREAM_MSG_STATUS_EP_INFO = $01;
  SND_UMP_STREAM_MSG_STATUS_DEVICE_INFO = $02;
  SND_UMP_STREAM_MSG_STATUS_EP_NAME = $03;
  SND_UMP_STREAM_MSG_STATUS_PRODUCT_ID = $04;
  SND_UMP_STREAM_MSG_STATUS_STREAM_CFG_REQUEST = $05;
  SND_UMP_STREAM_MSG_STATUS_STREAM_CFG = $06;
  SND_UMP_STREAM_MSG_STATUS_FB_DISCOVERY = $10;
  SND_UMP_STREAM_MSG_STATUS_FB_INFO = $11;
  SND_UMP_STREAM_MSG_STATUS_FB_NAME = $12;
  SND_UMP_STREAM_MSG_STATUS_START_CLIP = $20;
  SND_UMP_STREAM_MSG_STATUS_END_CLIP = $21;

const
  SND_UMP_STREAM_MSG_REQUEST_EP_INFO = 1 shl 0;
  SND_UMP_STREAM_MSG_REQUEST_DEVICE_INFO = 1 shl 1;
  SND_UMP_STREAM_MSG_REQUEST_EP_NAME = 1 shl 2;
  SND_UMP_STREAM_MSG_REQUEST_PRODUCT_ID = 1 shl 3;
  SND_UMP_STREAM_MSG_REQUEST_STREAM_CFG = 1 shl 4;

const
  SND_UMP_STREAM_MSG_REQUEST_FB_INFO = 1 shl 0;
  SND_UMP_STREAM_MSG_REQUEST_FB_NAME = 1 shl 1;

const
  SND_UMP_STREAM_MSG_EP_INFO_CAP_TXJR = 1 shl 0;
  SND_UMP_STREAM_MSG_EP_INFO_CAP_RXJR = 1 shl 1;
  SND_UMP_STREAM_MSG_EP_INFO_CAP_MIDI1 = 1 shl 8;
  SND_UMP_STREAM_MSG_EP_INFO_CAP_MIDI2 = 1 shl 9;

const
  SND_UMP_STREAM_MSG_FORMAT_SINGLE = 0;
  SND_UMP_STREAM_MSG_FORMAT_START = 1;
  SND_UMP_STREAM_MSG_FORMAT_CONTINUE = 2;
  SND_UMP_STREAM_MSG_FORMAT_END = 3;

function snd_ump_msg_hdr_status(ump: cardinal): byte; inline;
function snd_ump_msg_hdr_channel(ump: cardinal): byte; inline;
function snd_ump_msg_hdr_type(ump: cardinal): byte; inline;
function snd_ump_msg_type_is_groupless(type_: byte): boolean; inline;
function snd_ump_msg_hdr_group(ump: cardinal): byte; inline;
function snd_ump_msg_status(ump: PCardinal): byte; inline;
function snd_ump_msg_channel(ump: PCardinal): byte; inline;
function snd_ump_msg_type(ump: PCardinal): byte; inline;
function snd_ump_msg_group(ump: PCardinal): byte; inline;
function snd_ump_sysex_msg_status(ump: PCardinal): byte; inline;
function snd_ump_sysex_msg_length(ump: PCardinal): byte; inline;

function snd_ump_msg_sysex_expand(ump: Puint32_t; buf: Puint8_t; maxlen: Tsize_t; filled: Psize_t): longint; cdecl; external libasound;

// === Konventiert am: 19-11-25 16:11:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function snd_ump_msg_hdr_status(ump: cardinal): byte; inline;
begin
  Result := (ump shr 20) and $0F;
end;

function snd_ump_msg_hdr_channel(ump: cardinal): byte; inline;
begin
  Result := (ump shr 16) and $0F;
end;

function snd_ump_msg_hdr_type(ump: cardinal): byte; inline;
begin
  Result := (ump shr 28) and $0F;
end;

function snd_ump_msg_type_is_groupless(type_: byte): boolean; inline;
begin
  Result := (type_ = SND_UMP_MSG_TYPE_UTILITY) or (type_ = SND_UMP_MSG_TYPE_STREAM);
end;

function snd_ump_msg_hdr_group(ump: cardinal): byte; inline;
begin
  Result := (ump shr 24) and $0F;
end;

function snd_ump_msg_status(ump: PCardinal): byte;
begin
  Result := snd_ump_msg_hdr_status(ump^);
end;

function snd_ump_msg_channel(ump: PCardinal): byte;
begin
  Result := snd_ump_msg_hdr_channel(ump^);
end;

function snd_ump_msg_type(ump: PCardinal): byte;
begin
  Result := snd_ump_msg_hdr_type(ump^);
end;

function snd_ump_msg_group(ump: PCardinal): byte;
begin
  Result := snd_ump_msg_hdr_group(ump^);
end;

function snd_ump_sysex_msg_status(ump: PCardinal): byte;
begin
  Result := (ump^ shr 20) and $0F;
end;

function snd_ump_sysex_msg_length(ump: PCardinal): byte;
begin
  Result := (ump^ shr 16) and $0F;
end;




{$ENDIF read_implementation}
