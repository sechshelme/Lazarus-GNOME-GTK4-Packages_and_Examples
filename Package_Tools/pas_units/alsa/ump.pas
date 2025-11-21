unit ump;

interface

uses
  fp_asound, global, rawmidi;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Psnd_ump_t = type Pointer;
  PPsnd_ump_t = ^Psnd_ump_t;
  Psnd_ump_endpoint_info_t = type Pointer;
  PPsnd_ump_endpoint_info_t = ^Psnd_ump_endpoint_info_t;
  Psnd_ump_block_info_t = type Pointer;
  PPsnd_ump_block_info_t = ^Psnd_ump_block_info_t;

function snd_ump_open(inputp: PPsnd_ump_t; outputp: PPsnd_ump_t; name: pchar; mode: longint): longint; cdecl; external libasound;
function snd_ump_close(ump: Psnd_ump_t): longint; cdecl; external libasound;
function snd_ump_rawmidi(ump: Psnd_ump_t): Psnd_rawmidi_t; cdecl; external libasound;
function snd_ump_name(ump: Psnd_ump_t): pchar; cdecl; external libasound;
function snd_ump_poll_descriptors_count(ump: Psnd_ump_t): longint; cdecl; external libasound;
function snd_ump_poll_descriptors(ump: Psnd_ump_t; pfds: Ppollfd; space: dword): longint; cdecl; external libasound;
function snd_ump_poll_descriptors_revents(ump: Psnd_ump_t; pfds: Ppollfd; nfds: dword; revents: Pword): longint; cdecl; external libasound;
function snd_ump_nonblock(ump: Psnd_ump_t; nonblock: longint): longint; cdecl; external libasound;
function snd_ump_rawmidi_info(ump: Psnd_ump_t; info: Psnd_rawmidi_info_t): longint; cdecl; external libasound;
function snd_ump_rawmidi_params(ump: Psnd_ump_t; params: Psnd_rawmidi_params_t): longint; cdecl; external libasound;
function snd_ump_rawmidi_params_current(ump: Psnd_ump_t; params: Psnd_rawmidi_params_t): longint; cdecl; external libasound;
function snd_ump_rawmidi_status(ump: Psnd_ump_t; status: Psnd_rawmidi_status_t): longint; cdecl; external libasound;
function snd_ump_drop(ump: Psnd_ump_t): longint; cdecl; external libasound;
function snd_ump_drain(ump: Psnd_ump_t): longint; cdecl; external libasound;
function snd_ump_write(ump: Psnd_ump_t; buffer: pointer; size: Tsize_t): Tssize_t; cdecl; external libasound;
function snd_ump_read(ump: Psnd_ump_t; buffer: pointer; size: Tsize_t): Tssize_t; cdecl; external libasound;
function snd_ump_tread(ump: Psnd_ump_t; tstamp: Ptimespec; buffer: pointer; size: Tsize_t): Tssize_t; cdecl; external libasound;

const
  SND_UMP_MAX_GROUPS = 16;
  SND_UMP_MAX_BLOCKS = 32;

type
  Tsnd_ump_direction = longint;

const
  SND_UMP_DIR_INPUT = $01;
  SND_UMP_DIR_OUTPUT = $02;
  SND_UMP_DIR_BIDIRECTION = $03;

const
  SND_UMP_EP_INFO_STATIC_BLOCKS = $01;
  SND_UMP_EP_INFO_PROTO_MIDI_MASK = $0300;
  SND_UMP_EP_INFO_PROTO_MIDI1 = $0100;
  SND_UMP_EP_INFO_PROTO_MIDI2 = $0200;
  SND_UMP_EP_INFO_PROTO_JRTS_MASK = $0003;
  SND_UMP_EP_INFO_PROTO_JRTS_TX = $0001;
  SND_UMP_EP_INFO_PROTO_JRTS_RX = $0002;

function snd_ump_endpoint_info_sizeof: Tsize_t; cdecl; external libasound;

function snd_ump_endpoint_info_malloc(info: PPsnd_ump_endpoint_info_t): longint; cdecl; external libasound;
procedure snd_ump_endpoint_info_free(info: Psnd_ump_endpoint_info_t); cdecl; external libasound;
procedure snd_ump_endpoint_info_copy(dst: Psnd_ump_endpoint_info_t; src: Psnd_ump_endpoint_info_t); cdecl; external libasound;
function snd_ump_endpoint_info_get_card(info: Psnd_ump_endpoint_info_t): longint; cdecl; external libasound;
function snd_ump_endpoint_info_get_device(info: Psnd_ump_endpoint_info_t): longint; cdecl; external libasound;
function snd_ump_endpoint_info_get_flags(info: Psnd_ump_endpoint_info_t): dword; cdecl; external libasound;
function snd_ump_endpoint_info_get_protocol_caps(info: Psnd_ump_endpoint_info_t): dword; cdecl; external libasound;
function snd_ump_endpoint_info_get_protocol(info: Psnd_ump_endpoint_info_t): dword; cdecl; external libasound;
function snd_ump_endpoint_info_get_num_blocks(info: Psnd_ump_endpoint_info_t): dword; cdecl; external libasound;
function snd_ump_endpoint_info_get_version(info: Psnd_ump_endpoint_info_t): dword; cdecl; external libasound;
function snd_ump_endpoint_info_get_manufacturer_id(info: Psnd_ump_endpoint_info_t): dword; cdecl; external libasound;
function snd_ump_endpoint_info_get_family_id(info: Psnd_ump_endpoint_info_t): dword; cdecl; external libasound;
function snd_ump_endpoint_info_get_model_id(info: Psnd_ump_endpoint_info_t): dword; cdecl; external libasound;
function snd_ump_endpoint_info_get_sw_revision(info: Psnd_ump_endpoint_info_t): pbyte; cdecl; external libasound;
function snd_ump_endpoint_info_get_name(info: Psnd_ump_endpoint_info_t): pchar; cdecl; external libasound;
function snd_ump_endpoint_info_get_product_id(info: Psnd_ump_endpoint_info_t): pchar; cdecl; external libasound;
function snd_ump_endpoint_info(ump: Psnd_ump_t; info: Psnd_ump_endpoint_info_t): longint; cdecl; external libasound;

const
  SND_UMP_BLOCK_IS_MIDI1 = 1 shl 0;
  SND_UMP_BLOCK_IS_LOWSPEED = 1 shl 1;

type
  Tsnd_ump_block_ui_hint = longint;

const
  SND_UMP_BLOCK_UI_HINT_UNKNOWN = $00;
  SND_UMP_BLOCK_UI_HINT_RECEIVER = $01;
  SND_UMP_BLOCK_UI_HINT_SENDER = $02;
  SND_UMP_BLOCK_UI_HINT_BOTH = $03;

function snd_ump_block_info_sizeof: Tsize_t; cdecl; external libasound;

function snd_ump_block_info_malloc(info: PPsnd_ump_block_info_t): longint; cdecl; external libasound;
procedure snd_ump_block_info_free(info: Psnd_ump_block_info_t); cdecl; external libasound;
procedure snd_ump_block_info_copy(dst: Psnd_ump_block_info_t; src: Psnd_ump_block_info_t); cdecl; external libasound;
function snd_ump_block_info_get_card(info: Psnd_ump_block_info_t): longint; cdecl; external libasound;
function snd_ump_block_info_get_device(info: Psnd_ump_block_info_t): longint; cdecl; external libasound;
function snd_ump_block_info_get_block_id(info: Psnd_ump_block_info_t): dword; cdecl; external libasound;
procedure snd_ump_block_info_set_block_id(info: Psnd_ump_block_info_t; id: dword); cdecl; external libasound;
function snd_ump_block_info_get_active(info: Psnd_ump_block_info_t): dword; cdecl; external libasound;
function snd_ump_block_info_get_flags(info: Psnd_ump_block_info_t): dword; cdecl; external libasound;
function snd_ump_block_info_get_direction(info: Psnd_ump_block_info_t): dword; cdecl; external libasound;
function snd_ump_block_info_get_first_group(info: Psnd_ump_block_info_t): dword; cdecl; external libasound;
function snd_ump_block_info_get_num_groups(info: Psnd_ump_block_info_t): dword; cdecl; external libasound;
function snd_ump_block_info_get_midi_ci_version(info: Psnd_ump_block_info_t): dword; cdecl; external libasound;
function snd_ump_block_info_get_sysex8_streams(info: Psnd_ump_block_info_t): dword; cdecl; external libasound;
function snd_ump_block_info_get_ui_hint(info: Psnd_ump_block_info_t): dword; cdecl; external libasound;
function snd_ump_block_info_get_name(info: Psnd_ump_block_info_t): pchar; cdecl; external libasound;
function snd_ump_block_info(ump: Psnd_ump_t; info: Psnd_ump_block_info_t): longint; cdecl; external libasound;

// === Konventiert am: 19-11-25 16:11:32 ===


implementation


end.
