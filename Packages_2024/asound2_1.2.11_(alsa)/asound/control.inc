{$IFDEF read_interface}


type
  Tsnd_aes_iec958_t = record
    status: array[0..23] of byte;
    subcode: array[0..146] of byte;
    pad: byte;
    dig_subframe: array[0..3] of byte;
  end;
  Psnd_aes_iec958_t = ^Tsnd_aes_iec958_t;

  Psnd_ctl_card_info_t = type Pointer;
  PPsnd_ctl_card_info_t = ^Psnd_ctl_card_info_t;
  Psnd_ctl_elem_id_t = type Pointer;
  PPsnd_ctl_elem_id_t = ^Psnd_ctl_elem_id_t;
  Psnd_ctl_elem_list_t = type Pointer;
  PPsnd_ctl_elem_list_t = ^Psnd_ctl_elem_list_t;
  Psnd_ctl_elem_info_t = type Pointer;
  PPsnd_ctl_elem_info_t = ^Psnd_ctl_elem_info_t;
  Psnd_ctl_elem_value_t = type Pointer;
  PPsnd_ctl_elem_value_t = ^Psnd_ctl_elem_value_t;
  Psnd_ctl_event_t = type Pointer;
  PPsnd_ctl_event_t = ^Psnd_ctl_event_t;

type
  Psnd_ctl_elem_type_t = ^Tsnd_ctl_elem_type_t;
  Tsnd_ctl_elem_type_t = longint;

const
  SND_CTL_ELEM_TYPE_NONE = 0;
  SND_CTL_ELEM_TYPE_BOOLEAN = 1;
  SND_CTL_ELEM_TYPE_INTEGER = 2;
  SND_CTL_ELEM_TYPE_ENUMERATED = 3;
  SND_CTL_ELEM_TYPE_BYTES = 4;
  SND_CTL_ELEM_TYPE_IEC958 = 5;
  SND_CTL_ELEM_TYPE_INTEGER64 = 6;
  SND_CTL_ELEM_TYPE_LAST = SND_CTL_ELEM_TYPE_INTEGER64;

type
  Psnd_ctl_elem_iface_t = ^Tsnd_ctl_elem_iface_t;
  Tsnd_ctl_elem_iface_t = longint;

const
  SND_CTL_ELEM_IFACE_CARD = 0;
  SND_CTL_ELEM_IFACE_HWDEP = 1;
  SND_CTL_ELEM_IFACE_MIXER = 2;
  SND_CTL_ELEM_IFACE_PCM = 3;
  SND_CTL_ELEM_IFACE_RAWMIDI = 4;
  SND_CTL_ELEM_IFACE_TIMER = 5;
  SND_CTL_ELEM_IFACE_SEQUENCER = 6;
  SND_CTL_ELEM_IFACE_LAST = SND_CTL_ELEM_IFACE_SEQUENCER;

type
  Psnd_ctl_event_type_t = ^Tsnd_ctl_event_type_t;
  Tsnd_ctl_event_type_t = longint;

const
  SND_CTL_EVENT_ELEM = 0;
  SND_CTL_EVENT_LAST = SND_CTL_EVENT_ELEM;

const
  SND_CTL_EVENT_MASK_REMOVE = not (0);
  SND_CTL_EVENT_MASK_VALUE = 1 shl 0;
  SND_CTL_EVENT_MASK_INFO = 1 shl 1;
  SND_CTL_EVENT_MASK_ADD = 1 shl 2;
  SND_CTL_EVENT_MASK_TLV = 1 shl 3;
  SND_CTL_NAME_NONE = '';
  SND_CTL_NAME_PLAYBACK = 'Playback ';
  SND_CTL_NAME_CAPTURE = 'Capture ';
  SND_CTL_NAME_IEC958_NONE = '';
  SND_CTL_NAME_IEC958_SWITCH = 'Switch';
  SND_CTL_NAME_IEC958_VOLUME = 'Volume';
  SND_CTL_NAME_IEC958_DEFAULT = 'Default';
  SND_CTL_NAME_IEC958_MASK = 'Mask';
  SND_CTL_NAME_IEC958_CON_MASK = 'Con Mask';
  SND_CTL_NAME_IEC958_PRO_MASK = 'Pro Mask';
  SND_CTL_NAME_IEC958_PCM_STREAM = 'PCM Stream';
  SND_CTL_POWER_MASK = $ff00;
  SND_CTL_POWER_D0 = $0000;
  SND_CTL_POWER_D1 = $0100;
  SND_CTL_POWER_D2 = $0200;
  SND_CTL_POWER_D3 = $0300;
  SND_CTL_POWER_D3hot = SND_CTL_POWER_D3 or $0000;
  SND_CTL_POWER_D3cold = SND_CTL_POWER_D3 or $0001;
  SND_CTL_TLVT_CONTAINER = $0000;
  SND_CTL_TLVT_DB_SCALE = $0001;
  SND_CTL_TLVT_DB_LINEAR = $0002;
  SND_CTL_TLVT_DB_RANGE = $0003;
  SND_CTL_TLVT_DB_MINMAX = $0004;
  SND_CTL_TLVT_DB_MINMAX_MUTE = $0005;
  SND_CTL_TLV_DB_GAIN_MUTE = -(9999999);
  SND_CTL_TLVT_CHMAP_FIXED = $00101;
  SND_CTL_TLVT_CHMAP_VAR = $00102;
  SND_CTL_TLVT_CHMAP_PAIRED = $00103;

type
  Psnd_ctl_type_t = ^Tsnd_ctl_type_t;
  Tsnd_ctl_type_t = longint;

const
  SND_CTL_TYPE_HW = 0;
  SND_CTL_TYPE_SHM = 1;
  SND_CTL_TYPE_INET = 2;
  SND_CTL_TYPE_EXT = 3;
  SND_CTL_TYPE_REMAP = 4;

const
  SND_CTL_NONBLOCK_ = $0001;
  SND_CTL_ASYNC = $0002;
  SND_CTL_READONLY = $0004;
  SND_CTL_EINTR = $0080;

type
  Psnd_ctl_t = type Pointer;
  PPsnd_ctl_t = ^Psnd_ctl_t;

const
  SND_SCTL_NOFREE = $0001;

type
  Psnd_sctl_t = type Pointer;
  PPsnd_sctl_t = ^Psnd_sctl_t;

function snd_card_load(card: longint): longint; cdecl; external libasound;
function snd_card_next(card: Plongint): longint; cdecl; external libasound;
function snd_card_get_index(name: pchar): longint; cdecl; external libasound;
function snd_card_get_name(card: longint; name: PPchar): longint; cdecl; external libasound;
function snd_card_get_longname(card: longint; name: PPchar): longint; cdecl; external libasound;
function snd_ctl_open(ctl: PPsnd_ctl_t; name: pchar; mode: longint): longint; cdecl; external libasound;
function snd_ctl_open_lconf(ctl: PPsnd_ctl_t; name: pchar; mode: longint; lconf: Psnd_config_t): longint; cdecl; external libasound;
function snd_ctl_open_fallback(ctl: PPsnd_ctl_t; root: Psnd_config_t; name: pchar; orig_name: pchar; mode: longint): longint; cdecl; external libasound;
function snd_ctl_close(ctl: Psnd_ctl_t): longint; cdecl; external libasound;
function snd_ctl_nonblock(ctl: Psnd_ctl_t; nonblock: longint): longint; cdecl; external libasound;

function snd_ctl_abort(ctl: Psnd_ctl_t): integer; inline;

function snd_async_add_ctl_handler(handler: PPsnd_async_handler_t; ctl: Psnd_ctl_t; callback: Tsnd_async_callback_t; private_data: pointer): longint; cdecl; external libasound;
function snd_async_handler_get_ctl(handler: Psnd_async_handler_t): Psnd_ctl_t; cdecl; external libasound;
function snd_ctl_poll_descriptors_count(ctl: Psnd_ctl_t): longint; cdecl; external libasound;
function snd_ctl_poll_descriptors(ctl: Psnd_ctl_t; pfds: Ppollfd; space: dword): longint; cdecl; external libasound;
function snd_ctl_poll_descriptors_revents(ctl: Psnd_ctl_t; pfds: Ppollfd; nfds: dword; revents: Pword): longint; cdecl; external libasound;
function snd_ctl_subscribe_events(ctl: Psnd_ctl_t; subscribe: longint): longint; cdecl; external libasound;
function snd_ctl_card_info(ctl: Psnd_ctl_t; info: Psnd_ctl_card_info_t): longint; cdecl; external libasound;
function snd_ctl_elem_list(ctl: Psnd_ctl_t; list: Psnd_ctl_elem_list_t): longint; cdecl; external libasound;
function snd_ctl_elem_info(ctl: Psnd_ctl_t; info: Psnd_ctl_elem_info_t): longint; cdecl; external libasound;
function snd_ctl_elem_read(ctl: Psnd_ctl_t; data: Psnd_ctl_elem_value_t): longint; cdecl; external libasound;
function snd_ctl_elem_write(ctl: Psnd_ctl_t; data: Psnd_ctl_elem_value_t): longint; cdecl; external libasound;
function snd_ctl_elem_lock(ctl: Psnd_ctl_t; id: Psnd_ctl_elem_id_t): longint; cdecl; external libasound;
function snd_ctl_elem_unlock(ctl: Psnd_ctl_t; id: Psnd_ctl_elem_id_t): longint; cdecl; external libasound;
function snd_ctl_elem_tlv_read(ctl: Psnd_ctl_t; id: Psnd_ctl_elem_id_t; tlv: Pdword; tlv_size: dword): longint; cdecl; external libasound;
function snd_ctl_elem_tlv_write(ctl: Psnd_ctl_t; id: Psnd_ctl_elem_id_t; tlv: Pdword): longint; cdecl; external libasound;
function snd_ctl_elem_tlv_command(ctl: Psnd_ctl_t; id: Psnd_ctl_elem_id_t; tlv: Pdword): longint; cdecl; external libasound;

function snd_ctl_hwdep_next_device(ctl: Psnd_ctl_t; device: Plongint): longint; cdecl; external libasound;
function snd_ctl_hwdep_info(ctl: Psnd_ctl_t; info: Psnd_hwdep_info_t): longint; cdecl; external libasound;

function snd_ctl_pcm_next_device(ctl: Psnd_ctl_t; device: Plongint): longint; cdecl; external libasound;
function snd_ctl_pcm_info(ctl: Psnd_ctl_t; info: Psnd_pcm_info_t): longint; cdecl; external libasound;
function snd_ctl_pcm_prefer_subdevice(ctl: Psnd_ctl_t; subdev: longint): longint; cdecl; external libasound;

function snd_ctl_rawmidi_next_device(ctl: Psnd_ctl_t; device: Plongint): longint; cdecl; external libasound;
function snd_ctl_rawmidi_info(ctl: Psnd_ctl_t; info: Psnd_rawmidi_info_t): longint; cdecl; external libasound;
function snd_ctl_rawmidi_prefer_subdevice(ctl: Psnd_ctl_t; subdev: longint): longint; cdecl; external libasound;

function snd_ctl_ump_next_device(ctl: Psnd_ctl_t; device: Plongint): longint; cdecl; external libasound;
function snd_ctl_ump_endpoint_info(ctl: Psnd_ctl_t; info: Psnd_ump_endpoint_info_t): longint; cdecl; external libasound;
function snd_ctl_ump_block_info(ctl: Psnd_ctl_t; info: Psnd_ump_block_info_t): longint; cdecl; external libasound;

function snd_ctl_set_power_state(ctl: Psnd_ctl_t; state: dword): longint; cdecl; external libasound;
function snd_ctl_get_power_state(ctl: Psnd_ctl_t; state: Pdword): longint; cdecl; external libasound;
function snd_ctl_read(ctl: Psnd_ctl_t; event: Psnd_ctl_event_t): longint; cdecl; external libasound;
function snd_ctl_wait(ctl: Psnd_ctl_t; timeout: longint): longint; cdecl; external libasound;
function snd_ctl_name(ctl: Psnd_ctl_t): pchar; cdecl; external libasound;
function snd_ctl_type(ctl: Psnd_ctl_t): Tsnd_ctl_type_t; cdecl; external libasound;
function snd_ctl_elem_type_name(_type: Tsnd_ctl_elem_type_t): pchar; cdecl; external libasound;
function snd_ctl_elem_iface_name(iface: Tsnd_ctl_elem_iface_t): pchar; cdecl; external libasound;
function snd_ctl_event_type_name(_type: Tsnd_ctl_event_type_t): pchar; cdecl; external libasound;
function snd_ctl_event_elem_get_mask(obj: Psnd_ctl_event_t): dword; cdecl; external libasound;
function snd_ctl_event_elem_get_numid(obj: Psnd_ctl_event_t): dword; cdecl; external libasound;
procedure snd_ctl_event_elem_get_id(obj: Psnd_ctl_event_t; ptr: Psnd_ctl_elem_id_t); cdecl; external libasound;
function snd_ctl_event_elem_get_interface(obj: Psnd_ctl_event_t): Tsnd_ctl_elem_iface_t; cdecl; external libasound;
function snd_ctl_event_elem_get_device(obj: Psnd_ctl_event_t): dword; cdecl; external libasound;
function snd_ctl_event_elem_get_subdevice(obj: Psnd_ctl_event_t): dword; cdecl; external libasound;
function snd_ctl_event_elem_get_name(obj: Psnd_ctl_event_t): pchar; cdecl; external libasound;
function snd_ctl_event_elem_get_index(obj: Psnd_ctl_event_t): dword; cdecl; external libasound;
function snd_ctl_elem_list_alloc_space(obj: Psnd_ctl_elem_list_t; entries: dword): longint; cdecl; external libasound;
procedure snd_ctl_elem_list_free_space(obj: Psnd_ctl_elem_list_t); cdecl; external libasound;
function snd_ctl_ascii_elem_id_get(id: Psnd_ctl_elem_id_t): pchar; cdecl; external libasound;
function snd_ctl_ascii_elem_id_parse(dst: Psnd_ctl_elem_id_t; str: pchar): longint; cdecl; external libasound;
function snd_ctl_ascii_value_parse(handle: Psnd_ctl_t; dst: Psnd_ctl_elem_value_t; info: Psnd_ctl_elem_info_t; value: pchar): longint; cdecl; external libasound;
function snd_ctl_elem_id_sizeof: Tsize_t; cdecl; external libasound;

function snd_ctl_elem_id_malloc(ptr: PPsnd_ctl_elem_id_t): longint; cdecl; external libasound;
procedure snd_ctl_elem_id_free(obj: Psnd_ctl_elem_id_t); cdecl; external libasound;
procedure snd_ctl_elem_id_clear(obj: Psnd_ctl_elem_id_t); cdecl; external libasound;
procedure snd_ctl_elem_id_copy(dst: Psnd_ctl_elem_id_t; src: Psnd_ctl_elem_id_t); cdecl; external libasound;
function snd_ctl_elem_id_compare_numid(id1: Psnd_ctl_elem_id_t; id2: Psnd_ctl_elem_id_t): longint; cdecl; external libasound;
function snd_ctl_elem_id_compare_set(id1: Psnd_ctl_elem_id_t; id2: Psnd_ctl_elem_id_t): longint; cdecl; external libasound;
function snd_ctl_elem_id_get_numid(obj: Psnd_ctl_elem_id_t): dword; cdecl; external libasound;
function snd_ctl_elem_id_get_interface(obj: Psnd_ctl_elem_id_t): Tsnd_ctl_elem_iface_t; cdecl; external libasound;
function snd_ctl_elem_id_get_device(obj: Psnd_ctl_elem_id_t): dword; cdecl; external libasound;
function snd_ctl_elem_id_get_subdevice(obj: Psnd_ctl_elem_id_t): dword; cdecl; external libasound;
function snd_ctl_elem_id_get_name(obj: Psnd_ctl_elem_id_t): pchar; cdecl; external libasound;
function snd_ctl_elem_id_get_index(obj: Psnd_ctl_elem_id_t): dword; cdecl; external libasound;
procedure snd_ctl_elem_id_set_numid(obj: Psnd_ctl_elem_id_t; val: dword); cdecl; external libasound;
procedure snd_ctl_elem_id_set_interface(obj: Psnd_ctl_elem_id_t; val: Tsnd_ctl_elem_iface_t); cdecl; external libasound;
procedure snd_ctl_elem_id_set_device(obj: Psnd_ctl_elem_id_t; val: dword); cdecl; external libasound;
procedure snd_ctl_elem_id_set_subdevice(obj: Psnd_ctl_elem_id_t; val: dword); cdecl; external libasound;
procedure snd_ctl_elem_id_set_name(obj: Psnd_ctl_elem_id_t; val: pchar); cdecl; external libasound;
procedure snd_ctl_elem_id_set_index(obj: Psnd_ctl_elem_id_t; val: dword); cdecl; external libasound;
function snd_ctl_card_info_sizeof: Tsize_t; cdecl; external libasound;

function snd_ctl_card_info_malloc(ptr: PPsnd_ctl_card_info_t): longint; cdecl; external libasound;
procedure snd_ctl_card_info_free(obj: Psnd_ctl_card_info_t); cdecl; external libasound;
procedure snd_ctl_card_info_clear(obj: Psnd_ctl_card_info_t); cdecl; external libasound;
procedure snd_ctl_card_info_copy(dst: Psnd_ctl_card_info_t; src: Psnd_ctl_card_info_t); cdecl; external libasound;
function snd_ctl_card_info_get_card(obj: Psnd_ctl_card_info_t): longint; cdecl; external libasound;
function snd_ctl_card_info_get_id(obj: Psnd_ctl_card_info_t): pchar; cdecl; external libasound;
function snd_ctl_card_info_get_driver(obj: Psnd_ctl_card_info_t): pchar; cdecl; external libasound;
function snd_ctl_card_info_get_name(obj: Psnd_ctl_card_info_t): pchar; cdecl; external libasound;
function snd_ctl_card_info_get_longname(obj: Psnd_ctl_card_info_t): pchar; cdecl; external libasound;
function snd_ctl_card_info_get_mixername(obj: Psnd_ctl_card_info_t): pchar; cdecl; external libasound;
function snd_ctl_card_info_get_components(obj: Psnd_ctl_card_info_t): pchar; cdecl; external libasound;
function snd_ctl_event_sizeof: Tsize_t; cdecl; external libasound;

function snd_ctl_event_malloc(ptr: PPsnd_ctl_event_t): longint; cdecl; external libasound;
procedure snd_ctl_event_free(obj: Psnd_ctl_event_t); cdecl; external libasound;
procedure snd_ctl_event_clear(obj: Psnd_ctl_event_t); cdecl; external libasound;
procedure snd_ctl_event_copy(dst: Psnd_ctl_event_t; src: Psnd_ctl_event_t); cdecl; external libasound;
function snd_ctl_event_get_type(obj: Psnd_ctl_event_t): Tsnd_ctl_event_type_t; cdecl; external libasound;
function snd_ctl_elem_list_sizeof: Tsize_t; cdecl; external libasound;

function snd_ctl_elem_list_malloc(ptr: PPsnd_ctl_elem_list_t): longint; cdecl; external libasound;
procedure snd_ctl_elem_list_free(obj: Psnd_ctl_elem_list_t); cdecl; external libasound;
procedure snd_ctl_elem_list_clear(obj: Psnd_ctl_elem_list_t); cdecl; external libasound;
procedure snd_ctl_elem_list_copy(dst: Psnd_ctl_elem_list_t; src: Psnd_ctl_elem_list_t); cdecl; external libasound;
procedure snd_ctl_elem_list_set_offset(obj: Psnd_ctl_elem_list_t; val: dword); cdecl; external libasound;
function snd_ctl_elem_list_get_used(obj: Psnd_ctl_elem_list_t): dword; cdecl; external libasound;
function snd_ctl_elem_list_get_count(obj: Psnd_ctl_elem_list_t): dword; cdecl; external libasound;
procedure snd_ctl_elem_list_get_id(obj: Psnd_ctl_elem_list_t; idx: dword; ptr: Psnd_ctl_elem_id_t); cdecl; external libasound;
function snd_ctl_elem_list_get_numid(obj: Psnd_ctl_elem_list_t; idx: dword): dword; cdecl; external libasound;
function snd_ctl_elem_list_get_interface(obj: Psnd_ctl_elem_list_t; idx: dword): Tsnd_ctl_elem_iface_t; cdecl; external libasound;
function snd_ctl_elem_list_get_device(obj: Psnd_ctl_elem_list_t; idx: dword): dword; cdecl; external libasound;
function snd_ctl_elem_list_get_subdevice(obj: Psnd_ctl_elem_list_t; idx: dword): dword; cdecl; external libasound;
function snd_ctl_elem_list_get_name(obj: Psnd_ctl_elem_list_t; idx: dword): pchar; cdecl; external libasound;
function snd_ctl_elem_list_get_index(obj: Psnd_ctl_elem_list_t; idx: dword): dword; cdecl; external libasound;
function snd_ctl_elem_info_sizeof: Tsize_t; cdecl; external libasound;

function snd_ctl_elem_info_malloc(ptr: PPsnd_ctl_elem_info_t): longint; cdecl; external libasound;
procedure snd_ctl_elem_info_free(obj: Psnd_ctl_elem_info_t); cdecl; external libasound;
procedure snd_ctl_elem_info_clear(obj: Psnd_ctl_elem_info_t); cdecl; external libasound;
procedure snd_ctl_elem_info_copy(dst: Psnd_ctl_elem_info_t; src: Psnd_ctl_elem_info_t); cdecl; external libasound;
function snd_ctl_elem_info_get_type(obj: Psnd_ctl_elem_info_t): Tsnd_ctl_elem_type_t; cdecl; external libasound;
function snd_ctl_elem_info_is_readable(obj: Psnd_ctl_elem_info_t): longint; cdecl; external libasound;
function snd_ctl_elem_info_is_writable(obj: Psnd_ctl_elem_info_t): longint; cdecl; external libasound;
function snd_ctl_elem_info_is_volatile(obj: Psnd_ctl_elem_info_t): longint; cdecl; external libasound;
function snd_ctl_elem_info_is_inactive(obj: Psnd_ctl_elem_info_t): longint; cdecl; external libasound;
function snd_ctl_elem_info_is_locked(obj: Psnd_ctl_elem_info_t): longint; cdecl; external libasound;
function snd_ctl_elem_info_is_tlv_readable(obj: Psnd_ctl_elem_info_t): longint; cdecl; external libasound;
function snd_ctl_elem_info_is_tlv_writable(obj: Psnd_ctl_elem_info_t): longint; cdecl; external libasound;
function snd_ctl_elem_info_is_tlv_commandable(obj: Psnd_ctl_elem_info_t): longint; cdecl; external libasound;
function snd_ctl_elem_info_is_owner(obj: Psnd_ctl_elem_info_t): longint; cdecl; external libasound;
function snd_ctl_elem_info_is_user(obj: Psnd_ctl_elem_info_t): longint; cdecl; external libasound;
function snd_ctl_elem_info_get_owner(obj: Psnd_ctl_elem_info_t): Tpid_t; cdecl; external libasound;
function snd_ctl_elem_info_get_count(obj: Psnd_ctl_elem_info_t): dword; cdecl; external libasound;
function snd_ctl_elem_info_get_min(obj: Psnd_ctl_elem_info_t): Tclong; cdecl; external libasound;
function snd_ctl_elem_info_get_max(obj: Psnd_ctl_elem_info_t): Tclong; cdecl; external libasound;
function snd_ctl_elem_info_get_step(obj: Psnd_ctl_elem_info_t): Tclong; cdecl; external libasound;
function snd_ctl_elem_info_get_min64(obj: Psnd_ctl_elem_info_t): int64; cdecl; external libasound;
function snd_ctl_elem_info_get_max64(obj: Psnd_ctl_elem_info_t): int64; cdecl; external libasound;
function snd_ctl_elem_info_get_step64(obj: Psnd_ctl_elem_info_t): int64; cdecl; external libasound;
function snd_ctl_elem_info_get_items(obj: Psnd_ctl_elem_info_t): dword; cdecl; external libasound;
procedure snd_ctl_elem_info_set_item(obj: Psnd_ctl_elem_info_t; val: dword); cdecl; external libasound;
function snd_ctl_elem_info_get_item_name(obj: Psnd_ctl_elem_info_t): pchar; cdecl; external libasound;
function snd_ctl_elem_info_get_dimensions(obj: Psnd_ctl_elem_info_t): longint; cdecl; external libasound;
function snd_ctl_elem_info_get_dimension(obj: Psnd_ctl_elem_info_t; idx: dword): longint; cdecl; external libasound;
function snd_ctl_elem_info_set_dimension(info: Psnd_ctl_elem_info_t; dimension: Plongint): longint; cdecl; external libasound;
procedure snd_ctl_elem_info_get_id(obj: Psnd_ctl_elem_info_t; ptr: Psnd_ctl_elem_id_t); cdecl; external libasound;
function snd_ctl_elem_info_get_numid(obj: Psnd_ctl_elem_info_t): dword; cdecl; external libasound;
function snd_ctl_elem_info_get_interface(obj: Psnd_ctl_elem_info_t): Tsnd_ctl_elem_iface_t; cdecl; external libasound;
function snd_ctl_elem_info_get_device(obj: Psnd_ctl_elem_info_t): dword; cdecl; external libasound;
function snd_ctl_elem_info_get_subdevice(obj: Psnd_ctl_elem_info_t): dword; cdecl; external libasound;
function snd_ctl_elem_info_get_name(obj: Psnd_ctl_elem_info_t): pchar; cdecl; external libasound;
function snd_ctl_elem_info_get_index(obj: Psnd_ctl_elem_info_t): dword; cdecl; external libasound;
procedure snd_ctl_elem_info_set_id(obj: Psnd_ctl_elem_info_t; ptr: Psnd_ctl_elem_id_t); cdecl; external libasound;
procedure snd_ctl_elem_info_set_numid(obj: Psnd_ctl_elem_info_t; val: dword); cdecl; external libasound;
procedure snd_ctl_elem_info_set_interface(obj: Psnd_ctl_elem_info_t; val: Tsnd_ctl_elem_iface_t); cdecl; external libasound;
procedure snd_ctl_elem_info_set_device(obj: Psnd_ctl_elem_info_t; val: dword); cdecl; external libasound;
procedure snd_ctl_elem_info_set_subdevice(obj: Psnd_ctl_elem_info_t; val: dword); cdecl; external libasound;
procedure snd_ctl_elem_info_set_name(obj: Psnd_ctl_elem_info_t; val: pchar); cdecl; external libasound;
procedure snd_ctl_elem_info_set_index(obj: Psnd_ctl_elem_info_t; val: dword); cdecl; external libasound;
procedure snd_ctl_elem_info_set_read_write(obj: Psnd_ctl_elem_info_t; rval: longint; wval: longint); cdecl; external libasound;
procedure snd_ctl_elem_info_set_tlv_read_write(obj: Psnd_ctl_elem_info_t; rval: longint; wval: longint); cdecl; external libasound;
procedure snd_ctl_elem_info_set_inactive(obj: Psnd_ctl_elem_info_t; val: longint); cdecl; external libasound;
function snd_ctl_add_integer_elem_set(ctl: Psnd_ctl_t; info: Psnd_ctl_elem_info_t; element_count: dword; member_count: dword; min: Tclong;
  max: Tclong; step: Tclong): longint; cdecl; external libasound;
function snd_ctl_add_integer64_elem_set(ctl: Psnd_ctl_t; info: Psnd_ctl_elem_info_t; element_count: dword; member_count: dword; min: int64;
  max: int64; step: int64): longint; cdecl; external libasound;
function snd_ctl_add_boolean_elem_set(ctl: Psnd_ctl_t; info: Psnd_ctl_elem_info_t; element_count: dword; member_count: dword): longint; cdecl; external libasound;
function snd_ctl_add_enumerated_elem_set(ctl: Psnd_ctl_t; info: Psnd_ctl_elem_info_t; element_count: dword; member_count: dword; items: dword;
  labels: PPchar): longint; cdecl; external libasound;
function snd_ctl_add_bytes_elem_set(ctl: Psnd_ctl_t; info: Psnd_ctl_elem_info_t; element_count: dword; member_count: dword): longint; cdecl; external libasound;
function snd_ctl_elem_add_integer(ctl: Psnd_ctl_t; id: Psnd_ctl_elem_id_t; count: dword; imin: Tclong; imax: Tclong;
  istep: Tclong): longint; cdecl; external libasound;
function snd_ctl_elem_add_integer64(ctl: Psnd_ctl_t; id: Psnd_ctl_elem_id_t; count: dword; imin: int64; imax: int64;
  istep: int64): longint; cdecl; external libasound;
function snd_ctl_elem_add_boolean(ctl: Psnd_ctl_t; id: Psnd_ctl_elem_id_t; count: dword): longint; cdecl; external libasound;
function snd_ctl_elem_add_enumerated(ctl: Psnd_ctl_t; id: Psnd_ctl_elem_id_t; count: dword; items: dword; names: PPchar): longint; cdecl; external libasound;
function snd_ctl_elem_add_iec958(ctl: Psnd_ctl_t; id: Psnd_ctl_elem_id_t): longint; cdecl; external libasound;
function snd_ctl_elem_remove(ctl: Psnd_ctl_t; id: Psnd_ctl_elem_id_t): longint; cdecl; external libasound;
function snd_ctl_elem_value_sizeof: Tsize_t; cdecl; external libasound;

function snd_ctl_elem_value_malloc(ptr: PPsnd_ctl_elem_value_t): longint; cdecl; external libasound;
procedure snd_ctl_elem_value_free(obj: Psnd_ctl_elem_value_t); cdecl; external libasound;
procedure snd_ctl_elem_value_clear(obj: Psnd_ctl_elem_value_t); cdecl; external libasound;
procedure snd_ctl_elem_value_copy(dst: Psnd_ctl_elem_value_t; src: Psnd_ctl_elem_value_t); cdecl; external libasound;
function snd_ctl_elem_value_compare(left: Psnd_ctl_elem_value_t; right: Psnd_ctl_elem_value_t): longint; cdecl; external libasound;
procedure snd_ctl_elem_value_get_id(obj: Psnd_ctl_elem_value_t; ptr: Psnd_ctl_elem_id_t); cdecl; external libasound;
function snd_ctl_elem_value_get_numid(obj: Psnd_ctl_elem_value_t): dword; cdecl; external libasound;
function snd_ctl_elem_value_get_interface(obj: Psnd_ctl_elem_value_t): Tsnd_ctl_elem_iface_t; cdecl; external libasound;
function snd_ctl_elem_value_get_device(obj: Psnd_ctl_elem_value_t): dword; cdecl; external libasound;
function snd_ctl_elem_value_get_subdevice(obj: Psnd_ctl_elem_value_t): dword; cdecl; external libasound;
function snd_ctl_elem_value_get_name(obj: Psnd_ctl_elem_value_t): pchar; cdecl; external libasound;
function snd_ctl_elem_value_get_index(obj: Psnd_ctl_elem_value_t): dword; cdecl; external libasound;
procedure snd_ctl_elem_value_set_id(obj: Psnd_ctl_elem_value_t; ptr: Psnd_ctl_elem_id_t); cdecl; external libasound;
procedure snd_ctl_elem_value_set_numid(obj: Psnd_ctl_elem_value_t; val: dword); cdecl; external libasound;
procedure snd_ctl_elem_value_set_interface(obj: Psnd_ctl_elem_value_t; val: Tsnd_ctl_elem_iface_t); cdecl; external libasound;
procedure snd_ctl_elem_value_set_device(obj: Psnd_ctl_elem_value_t; val: dword); cdecl; external libasound;
procedure snd_ctl_elem_value_set_subdevice(obj: Psnd_ctl_elem_value_t; val: dword); cdecl; external libasound;
procedure snd_ctl_elem_value_set_name(obj: Psnd_ctl_elem_value_t; val: pchar); cdecl; external libasound;
procedure snd_ctl_elem_value_set_index(obj: Psnd_ctl_elem_value_t; val: dword); cdecl; external libasound;
function snd_ctl_elem_value_get_boolean(obj: Psnd_ctl_elem_value_t; idx: dword): longint; cdecl; external libasound;
function snd_ctl_elem_value_get_integer(obj: Psnd_ctl_elem_value_t; idx: dword): Tclong; cdecl; external libasound;
function snd_ctl_elem_value_get_integer64(obj: Psnd_ctl_elem_value_t; idx: dword): int64; cdecl; external libasound;
function snd_ctl_elem_value_get_enumerated(obj: Psnd_ctl_elem_value_t; idx: dword): dword; cdecl; external libasound;
function snd_ctl_elem_value_get_byte(obj: Psnd_ctl_elem_value_t; idx: dword): byte; cdecl; external libasound;
procedure snd_ctl_elem_value_set_boolean(obj: Psnd_ctl_elem_value_t; idx: dword; val: Tclong); cdecl; external libasound;
procedure snd_ctl_elem_value_set_integer(obj: Psnd_ctl_elem_value_t; idx: dword; val: Tclong); cdecl; external libasound;
procedure snd_ctl_elem_value_set_integer64(obj: Psnd_ctl_elem_value_t; idx: dword; val: int64); cdecl; external libasound;
procedure snd_ctl_elem_value_set_enumerated(obj: Psnd_ctl_elem_value_t; idx: dword; val: dword); cdecl; external libasound;
procedure snd_ctl_elem_value_set_byte(obj: Psnd_ctl_elem_value_t; idx: dword; val: byte); cdecl; external libasound;
procedure snd_ctl_elem_set_bytes(obj: Psnd_ctl_elem_value_t; data: pointer; size: Tsize_t); cdecl; external libasound;
function snd_ctl_elem_value_get_bytes(obj: Psnd_ctl_elem_value_t): pointer; cdecl; external libasound;
procedure snd_ctl_elem_value_get_iec958(obj: Psnd_ctl_elem_value_t; ptr: Psnd_aes_iec958_t); cdecl; external libasound;
procedure snd_ctl_elem_value_set_iec958(obj: Psnd_ctl_elem_value_t; ptr: Psnd_aes_iec958_t); cdecl; external libasound;
function snd_tlv_parse_dB_info(tlv: Pdword; tlv_size: dword; db_tlvp: PPdword): longint; cdecl; external libasound;
function snd_tlv_get_dB_range(tlv: Pdword; rangemin: Tclong; rangemax: Tclong; min: Pclong; max: Pclong): longint; cdecl; external libasound;
function snd_tlv_convert_to_dB(tlv: Pdword; rangemin: Tclong; rangemax: Tclong; volume: Pclong; db_gain: Pclong): longint; cdecl; external libasound;
function snd_tlv_convert_from_dB(tlv: Pdword; rangemin: Tclong; rangemax: Tclong; db_gain: Pclong; value: Pclong;
  xdir: longint): longint; cdecl; external libasound;
function snd_ctl_get_dB_range(ctl: Psnd_ctl_t; id: Psnd_ctl_elem_id_t; min: Pclong; max: PLongBool): longint; cdecl; external libasound;
function snd_ctl_convert_to_dB(ctl: Psnd_ctl_t; id: Psnd_ctl_elem_id_t; volume: Tclong; db_gain: Pclong): longint; cdecl; external libasound;
function snd_ctl_convert_from_dB(ctl: Psnd_ctl_t; id: Psnd_ctl_elem_id_t; db_gain: Tclong; value: PLongBool; xdir: longint): longint; cdecl; external libasound;

type
  Psnd_hctl_elem_t = type Pointer;
  Psnd_hctl_t = type Pointer;
  PPsnd_hctl_t = ^Psnd_hctl_t;

  Tsnd_hctl_compare_t = function(e1: Psnd_hctl_elem_t; e2: Psnd_hctl_elem_t): longint; cdecl;

function snd_hctl_compare_fast(c1: Psnd_hctl_elem_t; c2: Psnd_hctl_elem_t): longint; cdecl; external libasound;

type
  Tsnd_hctl_callback_t = function(hctl: Psnd_hctl_t; mask: dword; elem: Psnd_hctl_elem_t): longint; cdecl;
  Tsnd_hctl_elem_callback_t = function(elem: Psnd_hctl_elem_t; mask: dword): longint; cdecl;

function snd_hctl_open(hctl: PPsnd_hctl_t; name: pchar; mode: longint): longint; cdecl; external libasound;
function snd_hctl_open_ctl(hctlp: PPsnd_hctl_t; ctl: Psnd_ctl_t): longint; cdecl; external libasound;
function snd_hctl_close(hctl: Psnd_hctl_t): longint; cdecl; external libasound;
function snd_hctl_nonblock(hctl: Psnd_hctl_t; nonblock: longint): longint; cdecl; external libasound;

function snd_hctl_abort(hctl: Psnd_hctl_t): integer; inline;

function snd_hctl_poll_descriptors_count(hctl: Psnd_hctl_t): longint; cdecl; external libasound;
function snd_hctl_poll_descriptors(hctl: Psnd_hctl_t; pfds: Ppollfd; space: dword): longint; cdecl; external libasound;
function snd_hctl_poll_descriptors_revents(ctl: Psnd_hctl_t; pfds: Ppollfd; nfds: dword; revents: Pword): longint; cdecl; external libasound;
function snd_hctl_get_count(hctl: Psnd_hctl_t): dword; cdecl; external libasound;
function snd_hctl_set_compare(hctl: Psnd_hctl_t; hsort: Tsnd_hctl_compare_t): longint; cdecl; external libasound;
function snd_hctl_first_elem(hctl: Psnd_hctl_t): Psnd_hctl_elem_t; cdecl; external libasound;
function snd_hctl_last_elem(hctl: Psnd_hctl_t): Psnd_hctl_elem_t; cdecl; external libasound;
function snd_hctl_find_elem(hctl: Psnd_hctl_t; id: Psnd_ctl_elem_id_t): Psnd_hctl_elem_t; cdecl; external libasound;
procedure snd_hctl_set_callback(hctl: Psnd_hctl_t; callback: Tsnd_hctl_callback_t); cdecl; external libasound;
procedure snd_hctl_set_callback_private(hctl: Psnd_hctl_t; data: pointer); cdecl; external libasound;
function snd_hctl_get_callback_private(hctl: Psnd_hctl_t): pointer; cdecl; external libasound;
function snd_hctl_load(hctl: Psnd_hctl_t): longint; cdecl; external libasound;
function snd_hctl_free(hctl: Psnd_hctl_t): longint; cdecl; external libasound;
function snd_hctl_handle_events(hctl: Psnd_hctl_t): longint; cdecl; external libasound;
function snd_hctl_name(hctl: Psnd_hctl_t): pchar; cdecl; external libasound;
function snd_hctl_wait(hctl: Psnd_hctl_t; timeout: longint): longint; cdecl; external libasound;
function snd_hctl_ctl(hctl: Psnd_hctl_t): Psnd_ctl_t; cdecl; external libasound;
function snd_hctl_elem_next(elem: Psnd_hctl_elem_t): Psnd_hctl_elem_t; cdecl; external libasound;
function snd_hctl_elem_prev(elem: Psnd_hctl_elem_t): Psnd_hctl_elem_t; cdecl; external libasound;
function snd_hctl_elem_info(elem: Psnd_hctl_elem_t; info: Psnd_ctl_elem_info_t): longint; cdecl; external libasound;
function snd_hctl_elem_read(elem: Psnd_hctl_elem_t; value: Psnd_ctl_elem_value_t): longint; cdecl; external libasound;
function snd_hctl_elem_write(elem: Psnd_hctl_elem_t; value: Psnd_ctl_elem_value_t): longint; cdecl; external libasound;
function snd_hctl_elem_tlv_read(elem: Psnd_hctl_elem_t; tlv: Pdword; tlv_size: dword): longint; cdecl; external libasound;
function snd_hctl_elem_tlv_write(elem: Psnd_hctl_elem_t; tlv: Pdword): longint; cdecl; external libasound;
function snd_hctl_elem_tlv_command(elem: Psnd_hctl_elem_t; tlv: Pdword): longint; cdecl; external libasound;
function snd_hctl_elem_get_hctl(elem: Psnd_hctl_elem_t): Psnd_hctl_t; cdecl; external libasound;
procedure snd_hctl_elem_get_id(obj: Psnd_hctl_elem_t; ptr: Psnd_ctl_elem_id_t); cdecl; external libasound;
function snd_hctl_elem_get_numid(obj: Psnd_hctl_elem_t): dword; cdecl; external libasound;
function snd_hctl_elem_get_interface(obj: Psnd_hctl_elem_t): Tsnd_ctl_elem_iface_t; cdecl; external libasound;
function snd_hctl_elem_get_device(obj: Psnd_hctl_elem_t): dword; cdecl; external libasound;
function snd_hctl_elem_get_subdevice(obj: Psnd_hctl_elem_t): dword; cdecl; external libasound;
function snd_hctl_elem_get_name(obj: Psnd_hctl_elem_t): pchar; cdecl; external libasound;
function snd_hctl_elem_get_index(obj: Psnd_hctl_elem_t): dword; cdecl; external libasound;
procedure snd_hctl_elem_set_callback(obj: Psnd_hctl_elem_t; val: Tsnd_hctl_elem_callback_t); cdecl; external libasound;
function snd_hctl_elem_get_callback_private(obj: Psnd_hctl_elem_t): pointer; cdecl; external libasound;
procedure snd_hctl_elem_set_callback_private(obj: Psnd_hctl_elem_t; val: pointer); cdecl; external libasound;

function snd_sctl_build(ctl: PPsnd_sctl_t; handle: Psnd_ctl_t; config: Psnd_config_t; private_data: Psnd_config_t; mode: longint): longint; cdecl; external libasound;
function snd_sctl_free(handle: Psnd_sctl_t): longint; cdecl; external libasound;
function snd_sctl_install(handle: Psnd_sctl_t): longint; cdecl; external libasound;
function snd_sctl_remove(handle: Psnd_sctl_t): longint; cdecl; external libasound;

function snd_device_name_hint(card: longint; iface: pchar; hints: PPpointer): longint; cdecl; external libasound;
function snd_device_name_free_hint(hints: Ppointer): longint; cdecl; external libasound;
function snd_device_name_get_hint(hint: pointer; id: pchar): pchar; cdecl; external libasound;

// === Konventiert am: 19-11-25 16:12:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function snd_ctl_abort(ctl: Psnd_ctl_t): integer; inline;
begin
  Result := snd_ctl_nonblock(ctl, 2);
end;

function snd_hctl_abort(hctl: Psnd_hctl_t): integer; inline;
begin
  Result := snd_hctl_nonblock(hctl, 2);
end;


{$ENDIF read_implementation}
