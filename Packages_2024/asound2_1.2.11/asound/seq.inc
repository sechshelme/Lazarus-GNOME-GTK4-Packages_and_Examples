{$IFDEF read_interface}


type
  Psnd_seq_t = type Pointer;
  PPsnd_seq_t = ^Psnd_seq_t;

const
  SND_SEQ_OPEN_OUTPUT = 1;
  SND_SEQ_OPEN_INPUT = 2;
  SND_SEQ_OPEN_DUPLEX = SND_SEQ_OPEN_OUTPUT or SND_SEQ_OPEN_INPUT;
  SND_SEQ_NONBLOCK_ = $0001;

type
  Psnd_seq_type_t = ^Tsnd_seq_type_t;
  Tsnd_seq_type_t = longint;

const
  SND_SEQ_TYPE_HW = 0;
  SND_SEQ_TYPE_SHM = 1;
  SND_SEQ_TYPE_INET = 2;

const
  SND_SEQ_ADDRESS_UNKNOWN = 253;
  SND_SEQ_ADDRESS_SUBSCRIBERS = 254;
  SND_SEQ_ADDRESS_BROADCAST = 255;
  SND_SEQ_CLIENT_SYSTEM = 0;

function snd_seq_open(handle: PPsnd_seq_t; name: pchar; streams: longint; mode: longint): longint; cdecl; external libasound;
function snd_seq_open_lconf(handle: PPsnd_seq_t; name: pchar; streams: longint; mode: longint; lconf: Psnd_config_t): longint; cdecl; external libasound;
function snd_seq_name(seq: Psnd_seq_t): pchar; cdecl; external libasound;
function snd_seq_type(seq: Psnd_seq_t): Tsnd_seq_type_t; cdecl; external libasound;
function snd_seq_close(handle: Psnd_seq_t): longint; cdecl; external libasound;
function snd_seq_poll_descriptors_count(handle: Psnd_seq_t; events: smallint): longint; cdecl; external libasound;
function snd_seq_poll_descriptors(handle: Psnd_seq_t; pfds: Ppollfd; space: dword; events: smallint): longint; cdecl; external libasound;
function snd_seq_poll_descriptors_revents(seq: Psnd_seq_t; pfds: Ppollfd; nfds: dword; revents: Pword): longint; cdecl; external libasound;
function snd_seq_nonblock(handle: Psnd_seq_t; nonblock: longint): longint; cdecl; external libasound;
function snd_seq_client_id(handle: Psnd_seq_t): longint; cdecl; external libasound;
function snd_seq_get_output_buffer_size(handle: Psnd_seq_t): Tsize_t; cdecl; external libasound;
function snd_seq_get_input_buffer_size(handle: Psnd_seq_t): Tsize_t; cdecl; external libasound;
function snd_seq_set_output_buffer_size(handle: Psnd_seq_t; size: Tsize_t): longint; cdecl; external libasound;
function snd_seq_set_input_buffer_size(handle: Psnd_seq_t; size: Tsize_t): longint; cdecl; external libasound;

type
  Psnd_seq_system_info_t = type Pointer;
  PPsnd_seq_system_info_t = ^Psnd_seq_system_info_t;

function snd_seq_system_info_sizeof: Tsize_t; cdecl; external libasound;

function snd_seq_system_info_malloc(ptr: PPsnd_seq_system_info_t): longint; cdecl; external libasound;
procedure snd_seq_system_info_free(ptr: Psnd_seq_system_info_t); cdecl; external libasound;
procedure snd_seq_system_info_copy(dst: Psnd_seq_system_info_t; src: Psnd_seq_system_info_t); cdecl; external libasound;
function snd_seq_system_info_get_queues(info: Psnd_seq_system_info_t): longint; cdecl; external libasound;
function snd_seq_system_info_get_clients(info: Psnd_seq_system_info_t): longint; cdecl; external libasound;
function snd_seq_system_info_get_ports(info: Psnd_seq_system_info_t): longint; cdecl; external libasound;
function snd_seq_system_info_get_channels(info: Psnd_seq_system_info_t): longint; cdecl; external libasound;
function snd_seq_system_info_get_cur_clients(info: Psnd_seq_system_info_t): longint; cdecl; external libasound;
function snd_seq_system_info_get_cur_queues(info: Psnd_seq_system_info_t): longint; cdecl; external libasound;
function snd_seq_system_info(handle: Psnd_seq_t; info: Psnd_seq_system_info_t): longint; cdecl; external libasound;

type
  Psnd_seq_client_info_t = type Pointer;
  PPsnd_seq_client_info_t = ^Psnd_seq_client_info_t;

  Psnd_seq_client_type_t = ^Tsnd_seq_client_type_t;
  Tsnd_seq_client_type_t = longint;

const
  SND_SEQ_USER_CLIENT = 1;
  SND_SEQ_KERNEL_CLIENT = 2;

const
  SND_SEQ_CLIENT_LEGACY_MIDI = 0;
  SND_SEQ_CLIENT_UMP_MIDI_1_0 = 1;
  SND_SEQ_CLIENT_UMP_MIDI_2_0 = 2;

function snd_seq_client_info_sizeof: Tsize_t; cdecl; external libasound;

function snd_seq_client_info_malloc(ptr: PPsnd_seq_client_info_t): longint; cdecl; external libasound;
procedure snd_seq_client_info_free(ptr: Psnd_seq_client_info_t); cdecl; external libasound;
procedure snd_seq_client_info_copy(dst: Psnd_seq_client_info_t; src: Psnd_seq_client_info_t); cdecl; external libasound;
function snd_seq_client_info_get_client(info: Psnd_seq_client_info_t): longint; cdecl; external libasound;
function snd_seq_client_info_get_type(info: Psnd_seq_client_info_t): Tsnd_seq_client_type_t; cdecl; external libasound;
function snd_seq_client_info_get_name(info: Psnd_seq_client_info_t): pchar; cdecl; external libasound;
function snd_seq_client_info_get_broadcast_filter(info: Psnd_seq_client_info_t): longint; cdecl; external libasound;
function snd_seq_client_info_get_error_bounce(info: Psnd_seq_client_info_t): longint; cdecl; external libasound;
function snd_seq_client_info_get_card(info: Psnd_seq_client_info_t): longint; cdecl; external libasound;
function snd_seq_client_info_get_pid(info: Psnd_seq_client_info_t): longint; cdecl; external libasound;
function snd_seq_client_info_get_event_filter(info: Psnd_seq_client_info_t): pbyte; cdecl; external libasound;
function snd_seq_client_info_get_num_ports(info: Psnd_seq_client_info_t): longint; cdecl; external libasound;
function snd_seq_client_info_get_event_lost(info: Psnd_seq_client_info_t): longint; cdecl; external libasound;
function snd_seq_client_info_get_midi_version(info: Psnd_seq_client_info_t): longint; cdecl; external libasound;
function snd_seq_client_info_get_ump_group_enabled(info: Psnd_seq_client_info_t; group: longint): longint; cdecl; external libasound;
function snd_seq_client_info_get_ump_groupless_enabled(info: Psnd_seq_client_info_t): longint; cdecl; external libasound;
function snd_seq_client_info_get_ump_conversion(info: Psnd_seq_client_info_t): longint; cdecl; external libasound;
procedure snd_seq_client_info_set_client(info: Psnd_seq_client_info_t; client: longint); cdecl; external libasound;
procedure snd_seq_client_info_set_name(info: Psnd_seq_client_info_t; name: pchar); cdecl; external libasound;
procedure snd_seq_client_info_set_broadcast_filter(info: Psnd_seq_client_info_t; val: longint); cdecl; external libasound;
procedure snd_seq_client_info_set_error_bounce(info: Psnd_seq_client_info_t; val: longint); cdecl; external libasound;
procedure snd_seq_client_info_set_event_filter(info: Psnd_seq_client_info_t; filter: pbyte); cdecl; external libasound;
procedure snd_seq_client_info_set_midi_version(info: Psnd_seq_client_info_t; midi_version: longint); cdecl; external libasound;
procedure snd_seq_client_info_set_ump_group_enabled(info: Psnd_seq_client_info_t; group: longint; enable: longint); cdecl; external libasound;
procedure snd_seq_client_info_set_ump_groupless_enabled(info: Psnd_seq_client_info_t; enable: longint); cdecl; external libasound;
procedure snd_seq_client_info_set_ump_conversion(info: Psnd_seq_client_info_t; enable: longint); cdecl; external libasound;
procedure snd_seq_client_info_event_filter_clear(info: Psnd_seq_client_info_t); cdecl; external libasound;
procedure snd_seq_client_info_event_filter_add(info: Psnd_seq_client_info_t; event_type: longint); cdecl; external libasound;
procedure snd_seq_client_info_event_filter_del(info: Psnd_seq_client_info_t; event_type: longint); cdecl; external libasound;
function snd_seq_client_info_event_filter_check(info: Psnd_seq_client_info_t; event_type: longint): longint; cdecl; external libasound;
function snd_seq_get_client_info(handle: Psnd_seq_t; info: Psnd_seq_client_info_t): longint; cdecl; external libasound;
function snd_seq_get_any_client_info(handle: Psnd_seq_t; client: longint; info: Psnd_seq_client_info_t): longint; cdecl; external libasound;
function snd_seq_set_client_info(handle: Psnd_seq_t; info: Psnd_seq_client_info_t): longint; cdecl; external libasound;
function snd_seq_query_next_client(handle: Psnd_seq_t; info: Psnd_seq_client_info_t): longint; cdecl; external libasound;
function snd_seq_get_ump_endpoint_info(seq: Psnd_seq_t; client: longint; info: pointer): longint; cdecl; external libasound;
function snd_seq_get_ump_block_info(seq: Psnd_seq_t; client: longint; blk: longint; info: pointer): longint; cdecl; external libasound;
function snd_seq_set_ump_endpoint_info(seq: Psnd_seq_t; info: pointer): longint; cdecl; external libasound;
function snd_seq_set_ump_block_info(seq: Psnd_seq_t; blk: longint; info: pointer): longint; cdecl; external libasound;

type
  Psnd_seq_client_pool_t = type Pointer;
  PPsnd_seq_client_pool_t = ^Psnd_seq_client_pool_t;

function snd_seq_client_pool_sizeof: Tsize_t; cdecl; external libasound;
function snd_seq_client_pool_malloc(ptr: PPsnd_seq_client_pool_t): longint; cdecl; external libasound;
procedure snd_seq_client_pool_free(ptr: Psnd_seq_client_pool_t); cdecl; external libasound;
procedure snd_seq_client_pool_copy(dst: Psnd_seq_client_pool_t; src: Psnd_seq_client_pool_t); cdecl; external libasound;
function snd_seq_client_pool_get_client(info: Psnd_seq_client_pool_t): longint; cdecl; external libasound;
function snd_seq_client_pool_get_output_pool(info: Psnd_seq_client_pool_t): Tsize_t; cdecl; external libasound;
function snd_seq_client_pool_get_input_pool(info: Psnd_seq_client_pool_t): Tsize_t; cdecl; external libasound;
function snd_seq_client_pool_get_output_room(info: Psnd_seq_client_pool_t): Tsize_t; cdecl; external libasound;
function snd_seq_client_pool_get_output_free(info: Psnd_seq_client_pool_t): Tsize_t; cdecl; external libasound;
function snd_seq_client_pool_get_input_free(info: Psnd_seq_client_pool_t): Tsize_t; cdecl; external libasound;
procedure snd_seq_client_pool_set_output_pool(info: Psnd_seq_client_pool_t; size: Tsize_t); cdecl; external libasound;
procedure snd_seq_client_pool_set_input_pool(info: Psnd_seq_client_pool_t; size: Tsize_t); cdecl; external libasound;
procedure snd_seq_client_pool_set_output_room(info: Psnd_seq_client_pool_t; size: Tsize_t); cdecl; external libasound;
function snd_seq_get_client_pool(handle: Psnd_seq_t; info: Psnd_seq_client_pool_t): longint; cdecl; external libasound;
function snd_seq_set_client_pool(handle: Psnd_seq_t; info: Psnd_seq_client_pool_t): longint; cdecl; external libasound;

type
  Psnd_seq_port_info_t = type Pointer;
  PPsnd_seq_port_info_t = ^Psnd_seq_port_info_t;

const
  SND_SEQ_PORT_SYSTEM_TIMER = 0;
  SND_SEQ_PORT_SYSTEM_ANNOUNCE = 1;
  SND_SEQ_PORT_CAP_READ = 1 shl 0;
  SND_SEQ_PORT_CAP_WRITE = 1 shl 1;
  SND_SEQ_PORT_CAP_SYNC_READ = 1 shl 2;
  SND_SEQ_PORT_CAP_SYNC_WRITE = 1 shl 3;
  SND_SEQ_PORT_CAP_DUPLEX = 1 shl 4;
  SND_SEQ_PORT_CAP_SUBS_READ = 1 shl 5;
  SND_SEQ_PORT_CAP_SUBS_WRITE = 1 shl 6;
  SND_SEQ_PORT_CAP_NO_EXPORT = 1 shl 7;
  SND_SEQ_PORT_CAP_INACTIVE = 1 shl 8;
  SND_SEQ_PORT_CAP_UMP_ENDPOINT = 1 shl 9;
  SND_SEQ_PORT_DIR_UNKNOWN = 0;
  SND_SEQ_PORT_DIR_INPUT = 1;
  SND_SEQ_PORT_DIR_OUTPUT = 2;
  SND_SEQ_PORT_DIR_BIDIRECTION = 3;
  SND_SEQ_PORT_TYPE_SPECIFIC = 1 shl 0;
  SND_SEQ_PORT_TYPE_MIDI_GENERIC = 1 shl 1;
  SND_SEQ_PORT_TYPE_MIDI_GM = 1 shl 2;
  SND_SEQ_PORT_TYPE_MIDI_GS = 1 shl 3;
  SND_SEQ_PORT_TYPE_MIDI_XG = 1 shl 4;
  SND_SEQ_PORT_TYPE_MIDI_MT32 = 1 shl 5;
  SND_SEQ_PORT_TYPE_MIDI_GM2 = 1 shl 6;
  SND_SEQ_PORT_TYPE_MIDI_UMP = 1 shl 7;
  SND_SEQ_PORT_TYPE_SYNTH = 1 shl 10;
  SND_SEQ_PORT_TYPE_DIRECT_SAMPLE = 1 shl 11;
  SND_SEQ_PORT_TYPE_SAMPLE = 1 shl 12;
  SND_SEQ_PORT_TYPE_HARDWARE = 1 shl 16;
  SND_SEQ_PORT_TYPE_SOFTWARE = 1 shl 17;
  SND_SEQ_PORT_TYPE_SYNTHESIZER = 1 shl 18;
  SND_SEQ_PORT_TYPE_PORT = 1 shl 19;
  SND_SEQ_PORT_TYPE_APPLICATION = 1 shl 20;

function snd_seq_port_info_sizeof: Tsize_t; cdecl; external libasound;

function snd_seq_port_info_malloc(ptr: PPsnd_seq_port_info_t): longint; cdecl; external libasound;
procedure snd_seq_port_info_free(ptr: Psnd_seq_port_info_t); cdecl; external libasound;
procedure snd_seq_port_info_copy(dst: Psnd_seq_port_info_t; src: Psnd_seq_port_info_t); cdecl; external libasound;
function snd_seq_port_info_get_client(info: Psnd_seq_port_info_t): longint; cdecl; external libasound;
function snd_seq_port_info_get_port(info: Psnd_seq_port_info_t): longint; cdecl; external libasound;
function snd_seq_port_info_get_addr(info: Psnd_seq_port_info_t): Psnd_seq_addr_t; cdecl; external libasound;
function snd_seq_port_info_get_name(info: Psnd_seq_port_info_t): pchar; cdecl; external libasound;
function snd_seq_port_info_get_capability(info: Psnd_seq_port_info_t): dword; cdecl; external libasound;
function snd_seq_port_info_get_type(info: Psnd_seq_port_info_t): dword; cdecl; external libasound;
function snd_seq_port_info_get_midi_channels(info: Psnd_seq_port_info_t): longint; cdecl; external libasound;
function snd_seq_port_info_get_midi_voices(info: Psnd_seq_port_info_t): longint; cdecl; external libasound;
function snd_seq_port_info_get_synth_voices(info: Psnd_seq_port_info_t): longint; cdecl; external libasound;
function snd_seq_port_info_get_read_use(info: Psnd_seq_port_info_t): longint; cdecl; external libasound;
function snd_seq_port_info_get_write_use(info: Psnd_seq_port_info_t): longint; cdecl; external libasound;
function snd_seq_port_info_get_port_specified(info: Psnd_seq_port_info_t): longint; cdecl; external libasound;
function snd_seq_port_info_get_timestamping(info: Psnd_seq_port_info_t): longint; cdecl; external libasound;
function snd_seq_port_info_get_timestamp_real(info: Psnd_seq_port_info_t): longint; cdecl; external libasound;
function snd_seq_port_info_get_timestamp_queue(info: Psnd_seq_port_info_t): longint; cdecl; external libasound;
function snd_seq_port_info_get_direction(info: Psnd_seq_port_info_t): longint; cdecl; external libasound;
function snd_seq_port_info_get_ump_group(info: Psnd_seq_port_info_t): longint; cdecl; external libasound;
procedure snd_seq_port_info_set_client(info: Psnd_seq_port_info_t; client: longint); cdecl; external libasound;
procedure snd_seq_port_info_set_port(info: Psnd_seq_port_info_t; port: longint); cdecl; external libasound;
procedure snd_seq_port_info_set_addr(info: Psnd_seq_port_info_t; addr: Psnd_seq_addr_t); cdecl; external libasound;
procedure snd_seq_port_info_set_name(info: Psnd_seq_port_info_t; name: pchar); cdecl; external libasound;
procedure snd_seq_port_info_set_capability(info: Psnd_seq_port_info_t; capability: dword); cdecl; external libasound;
procedure snd_seq_port_info_set_type(info: Psnd_seq_port_info_t; _type: dword); cdecl; external libasound;
procedure snd_seq_port_info_set_midi_channels(info: Psnd_seq_port_info_t; channels: longint); cdecl; external libasound;
procedure snd_seq_port_info_set_midi_voices(info: Psnd_seq_port_info_t; voices: longint); cdecl; external libasound;
procedure snd_seq_port_info_set_synth_voices(info: Psnd_seq_port_info_t; voices: longint); cdecl; external libasound;
procedure snd_seq_port_info_set_port_specified(info: Psnd_seq_port_info_t; val: longint); cdecl; external libasound;
procedure snd_seq_port_info_set_timestamping(info: Psnd_seq_port_info_t; enable: longint); cdecl; external libasound;
procedure snd_seq_port_info_set_timestamp_real(info: Psnd_seq_port_info_t; realtime: longint); cdecl; external libasound;
procedure snd_seq_port_info_set_timestamp_queue(info: Psnd_seq_port_info_t; queue: longint); cdecl; external libasound;
procedure snd_seq_port_info_set_direction(info: Psnd_seq_port_info_t; direction: longint); cdecl; external libasound;
procedure snd_seq_port_info_set_ump_group(info: Psnd_seq_port_info_t; ump_group: longint); cdecl; external libasound;
function snd_seq_create_port(handle: Psnd_seq_t; info: Psnd_seq_port_info_t): longint; cdecl; external libasound;
function snd_seq_delete_port(handle: Psnd_seq_t; port: longint): longint; cdecl; external libasound;
function snd_seq_get_port_info(handle: Psnd_seq_t; port: longint; info: Psnd_seq_port_info_t): longint; cdecl; external libasound;
function snd_seq_get_any_port_info(handle: Psnd_seq_t; client: longint; port: longint; info: Psnd_seq_port_info_t): longint; cdecl; external libasound;
function snd_seq_set_port_info(handle: Psnd_seq_t; port: longint; info: Psnd_seq_port_info_t): longint; cdecl; external libasound;
function snd_seq_query_next_port(handle: Psnd_seq_t; info: Psnd_seq_port_info_t): longint; cdecl; external libasound;

type
  Psnd_seq_port_subscribe_t = type Pointer;
  PPsnd_seq_port_subscribe_t = ^Psnd_seq_port_subscribe_t;

function snd_seq_port_subscribe_sizeof: Tsize_t; cdecl; external libasound;

function snd_seq_port_subscribe_malloc(ptr: PPsnd_seq_port_subscribe_t): longint; cdecl; external libasound;
procedure snd_seq_port_subscribe_free(ptr: Psnd_seq_port_subscribe_t); cdecl; external libasound;
procedure snd_seq_port_subscribe_copy(dst: Psnd_seq_port_subscribe_t; src: Psnd_seq_port_subscribe_t); cdecl; external libasound;
function snd_seq_port_subscribe_get_sender(info: Psnd_seq_port_subscribe_t): Psnd_seq_addr_t; cdecl; external libasound;
function snd_seq_port_subscribe_get_dest(info: Psnd_seq_port_subscribe_t): Psnd_seq_addr_t; cdecl; external libasound;
function snd_seq_port_subscribe_get_queue(info: Psnd_seq_port_subscribe_t): longint; cdecl; external libasound;
function snd_seq_port_subscribe_get_exclusive(info: Psnd_seq_port_subscribe_t): longint; cdecl; external libasound;
function snd_seq_port_subscribe_get_time_update(info: Psnd_seq_port_subscribe_t): longint; cdecl; external libasound;
function snd_seq_port_subscribe_get_time_real(info: Psnd_seq_port_subscribe_t): longint; cdecl; external libasound;
procedure snd_seq_port_subscribe_set_sender(info: Psnd_seq_port_subscribe_t; addr: Psnd_seq_addr_t); cdecl; external libasound;
procedure snd_seq_port_subscribe_set_dest(info: Psnd_seq_port_subscribe_t; addr: Psnd_seq_addr_t); cdecl; external libasound;
procedure snd_seq_port_subscribe_set_queue(info: Psnd_seq_port_subscribe_t; q: longint); cdecl; external libasound;
procedure snd_seq_port_subscribe_set_exclusive(info: Psnd_seq_port_subscribe_t; val: longint); cdecl; external libasound;
procedure snd_seq_port_subscribe_set_time_update(info: Psnd_seq_port_subscribe_t; val: longint); cdecl; external libasound;
procedure snd_seq_port_subscribe_set_time_real(info: Psnd_seq_port_subscribe_t; val: longint); cdecl; external libasound;
function snd_seq_get_port_subscription(handle: Psnd_seq_t; sub: Psnd_seq_port_subscribe_t): longint; cdecl; external libasound;
function snd_seq_subscribe_port(handle: Psnd_seq_t; sub: Psnd_seq_port_subscribe_t): longint; cdecl; external libasound;
function snd_seq_unsubscribe_port(handle: Psnd_seq_t; sub: Psnd_seq_port_subscribe_t): longint; cdecl; external libasound;

type
  Psnd_seq_query_subscribe_t = type Pointer;
  PPsnd_seq_query_subscribe_t = ^Psnd_seq_query_subscribe_t;

  Psnd_seq_query_subs_type_t = ^Tsnd_seq_query_subs_type_t;
  Tsnd_seq_query_subs_type_t = longint;

const
  SND_SEQ_QUERY_SUBS_READ = 0;
  SND_SEQ_QUERY_SUBS_WRITE = 1;

function snd_seq_query_subscribe_sizeof: Tsize_t; cdecl; external libasound;

function snd_seq_query_subscribe_malloc(ptr: PPsnd_seq_query_subscribe_t): longint; cdecl; external libasound;
procedure snd_seq_query_subscribe_free(ptr: Psnd_seq_query_subscribe_t); cdecl; external libasound;
procedure snd_seq_query_subscribe_copy(dst: Psnd_seq_query_subscribe_t; src: Psnd_seq_query_subscribe_t); cdecl; external libasound;
function snd_seq_query_subscribe_get_client(info: Psnd_seq_query_subscribe_t): longint; cdecl; external libasound;
function snd_seq_query_subscribe_get_port(info: Psnd_seq_query_subscribe_t): longint; cdecl; external libasound;
function snd_seq_query_subscribe_get_root(info: Psnd_seq_query_subscribe_t): Psnd_seq_addr_t; cdecl; external libasound;
function snd_seq_query_subscribe_get_type(info: Psnd_seq_query_subscribe_t): Tsnd_seq_query_subs_type_t; cdecl; external libasound;
function snd_seq_query_subscribe_get_index(info: Psnd_seq_query_subscribe_t): longint; cdecl; external libasound;
function snd_seq_query_subscribe_get_num_subs(info: Psnd_seq_query_subscribe_t): longint; cdecl; external libasound;
function snd_seq_query_subscribe_get_addr(info: Psnd_seq_query_subscribe_t): Psnd_seq_addr_t; cdecl; external libasound;
function snd_seq_query_subscribe_get_queue(info: Psnd_seq_query_subscribe_t): longint; cdecl; external libasound;
function snd_seq_query_subscribe_get_exclusive(info: Psnd_seq_query_subscribe_t): longint; cdecl; external libasound;
function snd_seq_query_subscribe_get_time_update(info: Psnd_seq_query_subscribe_t): longint; cdecl; external libasound;
function snd_seq_query_subscribe_get_time_real(info: Psnd_seq_query_subscribe_t): longint; cdecl; external libasound;
procedure snd_seq_query_subscribe_set_client(info: Psnd_seq_query_subscribe_t; client: longint); cdecl; external libasound;
procedure snd_seq_query_subscribe_set_port(info: Psnd_seq_query_subscribe_t; port: longint); cdecl; external libasound;
procedure snd_seq_query_subscribe_set_root(info: Psnd_seq_query_subscribe_t; addr: Psnd_seq_addr_t); cdecl; external libasound;
procedure snd_seq_query_subscribe_set_type(info: Psnd_seq_query_subscribe_t; _type: Tsnd_seq_query_subs_type_t); cdecl; external libasound;
procedure snd_seq_query_subscribe_set_index(info: Psnd_seq_query_subscribe_t; _index: longint); cdecl; external libasound;
function snd_seq_query_port_subscribers(seq: Psnd_seq_t; subs: Psnd_seq_query_subscribe_t): longint; cdecl; external libasound;

type
  Psnd_seq_queue_info_t = type Pointer;
  PPsnd_seq_queue_info_t = ^Psnd_seq_queue_info_t;
  Psnd_seq_queue_status_t = type Pointer;
  PPsnd_seq_queue_status_t = ^Psnd_seq_queue_status_t;
  Psnd_seq_queue_tempo_t = type Pointer;
  PPsnd_seq_queue_tempo_t = ^Psnd_seq_queue_tempo_t;
  Psnd_seq_queue_timer_t = type Pointer;
  PPsnd_seq_queue_timer_t = ^Psnd_seq_queue_timer_t;

const
  SND_SEQ_QUEUE_DIRECT = 253;

function snd_seq_queue_info_sizeof: Tsize_t; cdecl; external libasound;

function snd_seq_queue_info_malloc(ptr: PPsnd_seq_queue_info_t): longint; cdecl; external libasound;
procedure snd_seq_queue_info_free(ptr: Psnd_seq_queue_info_t); cdecl; external libasound;
procedure snd_seq_queue_info_copy(dst: Psnd_seq_queue_info_t; src: Psnd_seq_queue_info_t); cdecl; external libasound;
function snd_seq_queue_info_get_queue(info: Psnd_seq_queue_info_t): longint; cdecl; external libasound;
function snd_seq_queue_info_get_name(info: Psnd_seq_queue_info_t): pchar; cdecl; external libasound;
function snd_seq_queue_info_get_owner(info: Psnd_seq_queue_info_t): longint; cdecl; external libasound;
function snd_seq_queue_info_get_locked(info: Psnd_seq_queue_info_t): longint; cdecl; external libasound;
function snd_seq_queue_info_get_flags(info: Psnd_seq_queue_info_t): dword; cdecl; external libasound;
procedure snd_seq_queue_info_set_name(info: Psnd_seq_queue_info_t; name: pchar); cdecl; external libasound;
procedure snd_seq_queue_info_set_owner(info: Psnd_seq_queue_info_t; owner: longint); cdecl; external libasound;
procedure snd_seq_queue_info_set_locked(info: Psnd_seq_queue_info_t; locked: longint); cdecl; external libasound;
procedure snd_seq_queue_info_set_flags(info: Psnd_seq_queue_info_t; flags: dword); cdecl; external libasound;
function snd_seq_create_queue(seq: Psnd_seq_t; info: Psnd_seq_queue_info_t): longint; cdecl; external libasound;
function snd_seq_alloc_named_queue(seq: Psnd_seq_t; name: pchar): longint; cdecl; external libasound;
function snd_seq_alloc_queue(handle: Psnd_seq_t): longint; cdecl; external libasound;
function snd_seq_free_queue(handle: Psnd_seq_t; q: longint): longint; cdecl; external libasound;
function snd_seq_get_queue_info(seq: Psnd_seq_t; q: longint; info: Psnd_seq_queue_info_t): longint; cdecl; external libasound;
function snd_seq_set_queue_info(seq: Psnd_seq_t; q: longint; info: Psnd_seq_queue_info_t): longint; cdecl; external libasound;
function snd_seq_query_named_queue(seq: Psnd_seq_t; name: pchar): longint; cdecl; external libasound;
function snd_seq_get_queue_usage(handle: Psnd_seq_t; q: longint): longint; cdecl; external libasound;
function snd_seq_set_queue_usage(handle: Psnd_seq_t; q: longint; used: longint): longint; cdecl; external libasound;

function snd_seq_queue_status_sizeof: Tsize_t; cdecl; external libasound;

function snd_seq_queue_status_malloc(ptr: PPsnd_seq_queue_status_t): longint; cdecl; external libasound;
procedure snd_seq_queue_status_free(ptr: Psnd_seq_queue_status_t); cdecl; external libasound;
procedure snd_seq_queue_status_copy(dst: Psnd_seq_queue_status_t; src: Psnd_seq_queue_status_t); cdecl; external libasound;
function snd_seq_queue_status_get_queue(info: Psnd_seq_queue_status_t): longint; cdecl; external libasound;
function snd_seq_queue_status_get_events(info: Psnd_seq_queue_status_t): longint; cdecl; external libasound;
function snd_seq_queue_status_get_tick_time(info: Psnd_seq_queue_status_t): Tsnd_seq_tick_time_t; cdecl; external libasound;
function snd_seq_queue_status_get_real_time(info: Psnd_seq_queue_status_t): Psnd_seq_real_time_t; cdecl; external libasound;
function snd_seq_queue_status_get_status(info: Psnd_seq_queue_status_t): dword; cdecl; external libasound;
function snd_seq_get_queue_status(handle: Psnd_seq_t; q: longint; status: Psnd_seq_queue_status_t): longint; cdecl; external libasound;

function snd_seq_queue_tempo_sizeof: Tsize_t; cdecl; external libasound;

function snd_seq_queue_tempo_malloc(ptr: PPsnd_seq_queue_tempo_t): longint; cdecl; external libasound;
procedure snd_seq_queue_tempo_free(ptr: Psnd_seq_queue_tempo_t); cdecl; external libasound;
procedure snd_seq_queue_tempo_copy(dst: Psnd_seq_queue_tempo_t; src: Psnd_seq_queue_tempo_t); cdecl; external libasound;
function snd_seq_queue_tempo_get_queue(info: Psnd_seq_queue_tempo_t): longint; cdecl; external libasound;
function snd_seq_queue_tempo_get_tempo(info: Psnd_seq_queue_tempo_t): dword; cdecl; external libasound;
function snd_seq_queue_tempo_get_ppq(info: Psnd_seq_queue_tempo_t): longint; cdecl; external libasound;
function snd_seq_queue_tempo_get_skew(info: Psnd_seq_queue_tempo_t): dword; cdecl; external libasound;
function snd_seq_queue_tempo_get_skew_base(info: Psnd_seq_queue_tempo_t): dword; cdecl; external libasound;
procedure snd_seq_queue_tempo_set_tempo(info: Psnd_seq_queue_tempo_t; tempo: dword); cdecl; external libasound;
procedure snd_seq_queue_tempo_set_ppq(info: Psnd_seq_queue_tempo_t; ppq: longint); cdecl; external libasound;
procedure snd_seq_queue_tempo_set_skew(info: Psnd_seq_queue_tempo_t; skew: dword); cdecl; external libasound;
procedure snd_seq_queue_tempo_set_skew_base(info: Psnd_seq_queue_tempo_t; base: dword); cdecl; external libasound;
function snd_seq_get_queue_tempo(handle: Psnd_seq_t; q: longint; tempo: Psnd_seq_queue_tempo_t): longint; cdecl; external libasound;
function snd_seq_set_queue_tempo(handle: Psnd_seq_t; q: longint; tempo: Psnd_seq_queue_tempo_t): longint; cdecl; external libasound;

type
  Psnd_seq_queue_timer_type_t = ^Tsnd_seq_queue_timer_type_t;
  Tsnd_seq_queue_timer_type_t = longint;

const
  SND_SEQ_TIMER_ALSA = 0;
  SND_SEQ_TIMER_MIDI_CLOCK = 1;
  SND_SEQ_TIMER_MIDI_TICK = 2;

function snd_seq_queue_timer_sizeof: Tsize_t; cdecl; external libasound;

function snd_seq_queue_timer_malloc(ptr: PPsnd_seq_queue_timer_t): longint; cdecl; external libasound;
procedure snd_seq_queue_timer_free(ptr: Psnd_seq_queue_timer_t); cdecl; external libasound;
procedure snd_seq_queue_timer_copy(dst: Psnd_seq_queue_timer_t; src: Psnd_seq_queue_timer_t); cdecl; external libasound;
function snd_seq_queue_timer_get_queue(info: Psnd_seq_queue_timer_t): longint; cdecl; external libasound;
function snd_seq_queue_timer_get_type(info: Psnd_seq_queue_timer_t): Tsnd_seq_queue_timer_type_t; cdecl; external libasound;
function snd_seq_queue_timer_get_id(info: Psnd_seq_queue_timer_t): Psnd_timer_id_t; cdecl; external libasound;
function snd_seq_queue_timer_get_resolution(info: Psnd_seq_queue_timer_t): dword; cdecl; external libasound;
procedure snd_seq_queue_timer_set_type(info: Psnd_seq_queue_timer_t; _type: Tsnd_seq_queue_timer_type_t); cdecl; external libasound;
procedure snd_seq_queue_timer_set_id(info: Psnd_seq_queue_timer_t; id: Psnd_timer_id_t); cdecl; external libasound;
procedure snd_seq_queue_timer_set_resolution(info: Psnd_seq_queue_timer_t; resolution: dword); cdecl; external libasound;
function snd_seq_get_queue_timer(handle: Psnd_seq_t; q: longint; timer: Psnd_seq_queue_timer_t): longint; cdecl; external libasound;
function snd_seq_set_queue_timer(handle: Psnd_seq_t; q: longint; timer: Psnd_seq_queue_timer_t): longint; cdecl; external libasound;

function snd_seq_free_event(ev: Psnd_seq_event_t): longint; cdecl; external libasound;
function snd_seq_event_length(ev: Psnd_seq_event_t): Tssize_t; cdecl; external libasound;
function snd_seq_event_output(handle: Psnd_seq_t; ev: Psnd_seq_event_t): longint; cdecl; external libasound;
function snd_seq_event_output_buffer(handle: Psnd_seq_t; ev: Psnd_seq_event_t): longint; cdecl; external libasound;
function snd_seq_event_output_direct(handle: Psnd_seq_t; ev: Psnd_seq_event_t): longint; cdecl; external libasound;
function snd_seq_event_input(handle: Psnd_seq_t; ev: PPsnd_seq_event_t): longint; cdecl; external libasound;
function snd_seq_event_input_pending(seq: Psnd_seq_t; fetch_sequencer: longint): longint; cdecl; external libasound;
function snd_seq_drain_output(handle: Psnd_seq_t): longint; cdecl; external libasound;
function snd_seq_event_output_pending(seq: Psnd_seq_t): longint; cdecl; external libasound;
function snd_seq_extract_output(handle: Psnd_seq_t; ev: PPsnd_seq_event_t): longint; cdecl; external libasound;
function snd_seq_drop_output(handle: Psnd_seq_t): longint; cdecl; external libasound;
function snd_seq_drop_output_buffer(handle: Psnd_seq_t): longint; cdecl; external libasound;
function snd_seq_drop_input(handle: Psnd_seq_t): longint; cdecl; external libasound;
function snd_seq_drop_input_buffer(handle: Psnd_seq_t): longint; cdecl; external libasound;

type
  Psnd_seq_remove_events_t = type Pointer;
  PPsnd_seq_remove_events_t = ^Psnd_seq_remove_events_t;

const
  SND_SEQ_REMOVE_INPUT = 1 shl 0;
  SND_SEQ_REMOVE_OUTPUT = 1 shl 1;
  SND_SEQ_REMOVE_DEST = 1 shl 2;
  SND_SEQ_REMOVE_DEST_CHANNEL = 1 shl 3;
  SND_SEQ_REMOVE_TIME_BEFORE = 1 shl 4;
  SND_SEQ_REMOVE_TIME_AFTER = 1 shl 5;
  SND_SEQ_REMOVE_TIME_TICK = 1 shl 6;
  SND_SEQ_REMOVE_EVENT_TYPE = 1 shl 7;
  SND_SEQ_REMOVE_IGNORE_OFF = 1 shl 8;
  SND_SEQ_REMOVE_TAG_MATCH = 1 shl 9;

function snd_seq_remove_events_sizeof: Tsize_t; cdecl; external libasound;

function snd_seq_remove_events_malloc(ptr: PPsnd_seq_remove_events_t): longint; cdecl; external libasound;
procedure snd_seq_remove_events_free(ptr: Psnd_seq_remove_events_t); cdecl; external libasound;
procedure snd_seq_remove_events_copy(dst: Psnd_seq_remove_events_t; src: Psnd_seq_remove_events_t); cdecl; external libasound;
function snd_seq_remove_events_get_condition(info: Psnd_seq_remove_events_t): dword; cdecl; external libasound;
function snd_seq_remove_events_get_queue(info: Psnd_seq_remove_events_t): longint; cdecl; external libasound;
function snd_seq_remove_events_get_time(info: Psnd_seq_remove_events_t): Psnd_seq_timestamp_t; cdecl; external libasound;
function snd_seq_remove_events_get_dest(info: Psnd_seq_remove_events_t): Psnd_seq_addr_t; cdecl; external libasound;
function snd_seq_remove_events_get_channel(info: Psnd_seq_remove_events_t): longint; cdecl; external libasound;
function snd_seq_remove_events_get_event_type(info: Psnd_seq_remove_events_t): longint; cdecl; external libasound;
function snd_seq_remove_events_get_tag(info: Psnd_seq_remove_events_t): longint; cdecl; external libasound;
procedure snd_seq_remove_events_set_condition(info: Psnd_seq_remove_events_t; flags: dword); cdecl; external libasound;
procedure snd_seq_remove_events_set_queue(info: Psnd_seq_remove_events_t; queue: longint); cdecl; external libasound;
procedure snd_seq_remove_events_set_time(info: Psnd_seq_remove_events_t; time: Psnd_seq_timestamp_t); cdecl; external libasound;
procedure snd_seq_remove_events_set_dest(info: Psnd_seq_remove_events_t; addr: Psnd_seq_addr_t); cdecl; external libasound;
procedure snd_seq_remove_events_set_channel(info: Psnd_seq_remove_events_t; channel: longint); cdecl; external libasound;
procedure snd_seq_remove_events_set_event_type(info: Psnd_seq_remove_events_t; _type: longint); cdecl; external libasound;
procedure snd_seq_remove_events_set_tag(info: Psnd_seq_remove_events_t; tag: longint); cdecl; external libasound;
function snd_seq_remove_events(handle: Psnd_seq_t; info: Psnd_seq_remove_events_t): longint; cdecl; external libasound;
function snd_seq_ump_event_output(seq: Psnd_seq_t; ev: Psnd_seq_ump_event_t): longint; cdecl; external libasound;
function snd_seq_ump_event_output_buffer(seq: Psnd_seq_t; ev: Psnd_seq_ump_event_t): longint; cdecl; external libasound;
function snd_seq_ump_extract_output(seq: Psnd_seq_t; ev_res: PPsnd_seq_ump_event_t): longint; cdecl; external libasound;
function snd_seq_ump_event_output_direct(seq: Psnd_seq_t; ev: Psnd_seq_ump_event_t): longint; cdecl; external libasound;
function snd_seq_ump_event_input(seq: Psnd_seq_t; ev: PPsnd_seq_ump_event_t): longint; cdecl; external libasound;

procedure snd_seq_set_bit(nr: longint; arr: pointer); cdecl; external libasound;
procedure snd_seq_unset_bit(nr: longint; arr: pointer); cdecl; external libasound;
function snd_seq_change_bit(nr: longint; arr: pointer): longint; cdecl; external libasound;
function snd_seq_get_bit(nr: longint; arr: pointer): longint; cdecl; external libasound;

const
  SND_SEQ_EVFLG_RESULT = 0;
  SND_SEQ_EVFLG_NOTE = 1;
  SND_SEQ_EVFLG_CONTROL = 2;
  SND_SEQ_EVFLG_QUEUE = 3;
  SND_SEQ_EVFLG_SYSTEM = 4;
  SND_SEQ_EVFLG_MESSAGE = 5;
  SND_SEQ_EVFLG_CONNECTION = 6;
  SND_SEQ_EVFLG_SAMPLE = 7;
  SND_SEQ_EVFLG_USERS = 8;
  SND_SEQ_EVFLG_INSTR = 9;
  SND_SEQ_EVFLG_QUOTE = 10;
  SND_SEQ_EVFLG_NONE = 11;
  SND_SEQ_EVFLG_RAW = 12;
  SND_SEQ_EVFLG_FIXED = 13;
  SND_SEQ_EVFLG_VARIABLE = 14;
  SND_SEQ_EVFLG_VARUSR = 15;

const
  SND_SEQ_EVFLG_NOTE_ONEARG = 0;
  SND_SEQ_EVFLG_NOTE_TWOARG = 1;

const
  SND_SEQ_EVFLG_QUEUE_NOARG = 0;
  SND_SEQ_EVFLG_QUEUE_TICK = 1;
  SND_SEQ_EVFLG_QUEUE_TIME = 2;
  SND_SEQ_EVFLG_QUEUE_VALUE = 3;

var
  snd_seq_event_types: Pdword; cvar;external libasound;

function _SND_SEQ_TYPE(x: DWord): DWord;
function _SND_SEQ_TYPE_OPT(x: DWord): DWord;

function snd_seq_type_check(ev: Psnd_seq_event_t; x: DWord): DWord;
function snd_seq_ev_is_result_type(ev: Psnd_seq_event_t): DWord;
function snd_seq_ev_is_note_type(ev: Psnd_seq_event_t): DWord;
function snd_seq_ev_is_control_type(ev: Psnd_seq_event_t): DWord;
function snd_seq_ev_is_channel_type(ev: Psnd_seq_event_t): DWord;
function snd_seq_ev_is_queue_type(ev: Psnd_seq_event_t): DWord;
function snd_seq_ev_is_message_type(ev: Psnd_seq_event_t): DWord;
function snd_seq_ev_is_subscribe_type(ev: Psnd_seq_event_t): DWord;
function snd_seq_ev_is_sample_type(ev: Psnd_seq_event_t): DWord;
function snd_seq_ev_is_user_type(ev: Psnd_seq_event_t): DWord;
function snd_seq_ev_is_instr_type(ev: Psnd_seq_event_t): DWord;
function snd_seq_ev_is_fixed_type(ev: Psnd_seq_event_t): DWord;
function snd_seq_ev_is_variable_type(ev: Psnd_seq_event_t): DWord;
function snd_seq_ev_is_varusr_type(ev: Psnd_seq_event_t): DWord;
function snd_seq_ev_is_reserved(ev: Psnd_seq_event_t): DWord;
function snd_seq_ev_is_prior(ev: Psnd_seq_event_t): boolean;
function snd_seq_ev_is_fixed(ev: Psnd_seq_event_t): boolean;
function snd_seq_ev_is_variable(ev: Psnd_seq_event_t): boolean;
function snd_seq_ev_is_varusr(ev: Psnd_seq_event_t): boolean;
function snd_seq_ev_is_tick(ev: Psnd_seq_event_t): boolean;
function snd_seq_ev_is_real(ev: Psnd_seq_event_t): boolean;
function snd_seq_ev_is_abstime(ev: Psnd_seq_event_t): boolean;
function snd_seq_ev_is_reltime(ev: Psnd_seq_event_t): boolean;
function snd_seq_ev_is_direct(ev: Psnd_seq_event_t): boolean;
function snd_seq_ev_is_ump(ev: Psnd_seq_event_t): DWord;
function snd_seq_ev_length_type(ev: Psnd_seq_event_t): longint;
function snd_seq_ev_timestamp_type(ev: Psnd_seq_event_t): longint;

function snd_seq_ev_timemode_type(ev: Psnd_seq_event_t): longint;



// === Konventiert am: 19-11-25 16:11:47 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function _SND_SEQ_TYPE(x: DWord): DWord;
begin
  _SND_SEQ_TYPE := 1 shl x;
end;

function _SND_SEQ_TYPE_OPT(x: DWord): DWord;
begin
  _SND_SEQ_TYPE_OPT := x shl 24;
end;

function snd_seq_type_check(ev: Psnd_seq_event_t; x: DWord): DWord;
begin
  snd_seq_type_check := (snd_seq_event_types[ev^._type]) and (_SND_SEQ_TYPE(x));
end;

function snd_seq_ev_is_result_type(ev: Psnd_seq_event_t): DWord;
begin
  snd_seq_ev_is_result_type := snd_seq_type_check(ev, SND_SEQ_EVFLG_RESULT);
end;

function snd_seq_ev_is_note_type(ev: Psnd_seq_event_t): DWord;
begin
  snd_seq_ev_is_note_type := snd_seq_type_check(ev, SND_SEQ_EVFLG_NOTE);
end;

function snd_seq_ev_is_control_type(ev: Psnd_seq_event_t): DWord;
begin
  snd_seq_ev_is_control_type := snd_seq_type_check(ev, SND_SEQ_EVFLG_CONTROL);
end;

function snd_seq_ev_is_channel_type(ev: Psnd_seq_event_t): DWord;
begin
  snd_seq_ev_is_channel_type := (snd_seq_event_types[ev^._type]) and ((_SND_SEQ_TYPE(SND_SEQ_EVFLG_NOTE)) or (_SND_SEQ_TYPE(SND_SEQ_EVFLG_CONTROL)));
end;

function snd_seq_ev_is_queue_type(ev: Psnd_seq_event_t): DWord;
begin
  snd_seq_ev_is_queue_type := snd_seq_type_check(ev, SND_SEQ_EVFLG_QUEUE);
end;

function snd_seq_ev_is_message_type(ev: Psnd_seq_event_t): DWord;
begin
  snd_seq_ev_is_message_type := snd_seq_type_check(ev, SND_SEQ_EVFLG_MESSAGE);
end;

function snd_seq_ev_is_subscribe_type(ev: Psnd_seq_event_t): DWord;
begin
  snd_seq_ev_is_subscribe_type := snd_seq_type_check(ev, SND_SEQ_EVFLG_CONNECTION);
end;

function snd_seq_ev_is_sample_type(ev: Psnd_seq_event_t): DWord;
begin
  snd_seq_ev_is_sample_type := snd_seq_type_check(ev, SND_SEQ_EVFLG_SAMPLE);
end;

function snd_seq_ev_is_user_type(ev: Psnd_seq_event_t): DWord;
begin
  snd_seq_ev_is_user_type := snd_seq_type_check(ev, SND_SEQ_EVFLG_USERS);
end;

function snd_seq_ev_is_instr_type(ev: Psnd_seq_event_t): DWord;
begin
  snd_seq_ev_is_instr_type := snd_seq_type_check(ev, SND_SEQ_EVFLG_INSTR);
end;

function snd_seq_ev_is_fixed_type(ev: Psnd_seq_event_t): DWord;
begin
  snd_seq_ev_is_fixed_type := snd_seq_type_check(ev, SND_SEQ_EVFLG_FIXED);
end;

function snd_seq_ev_is_variable_type(ev: Psnd_seq_event_t): DWord;
begin
  snd_seq_ev_is_variable_type := snd_seq_type_check(ev, SND_SEQ_EVFLG_VARIABLE);
end;

function snd_seq_ev_is_varusr_type(ev: Psnd_seq_event_t): DWord;
begin
  snd_seq_ev_is_varusr_type := snd_seq_type_check(ev, SND_SEQ_EVFLG_VARUSR);
end;

function snd_seq_ev_is_reserved(ev: Psnd_seq_event_t): DWord;
begin
  snd_seq_ev_is_reserved := not (snd_seq_event_types[ev^._type]);
end;

function snd_seq_ev_is_prior(ev: Psnd_seq_event_t): boolean;
begin
  snd_seq_ev_is_prior := ((ev^.flags) and SND_SEQ_PRIORITY_MASK) = SND_SEQ_PRIORITY_HIGH;
end;

function snd_seq_ev_length_type(ev: Psnd_seq_event_t): longint;
begin
  snd_seq_ev_length_type := (ev^.flags) and SND_SEQ_EVENT_LENGTH_MASK;
end;

function snd_seq_ev_is_fixed(ev: Psnd_seq_event_t): boolean;
begin
  snd_seq_ev_is_fixed := (snd_seq_ev_length_type(ev)) = SND_SEQ_EVENT_LENGTH_FIXED;
end;

function snd_seq_ev_is_variable(ev: Psnd_seq_event_t): boolean;
begin
  snd_seq_ev_is_variable := (snd_seq_ev_length_type(ev)) = SND_SEQ_EVENT_LENGTH_VARIABLE;
end;

function snd_seq_ev_is_varusr(ev: Psnd_seq_event_t): boolean;
begin
  snd_seq_ev_is_varusr := (snd_seq_ev_length_type(ev)) = SND_SEQ_EVENT_LENGTH_VARUSR;
end;

function snd_seq_ev_timestamp_type(ev: Psnd_seq_event_t): longint;
begin
  snd_seq_ev_timestamp_type := (ev^.flags) and SND_SEQ_TIME_STAMP_MASK;
end;

function snd_seq_ev_is_tick(ev: Psnd_seq_event_t): boolean;
begin
  snd_seq_ev_is_tick := (snd_seq_ev_timestamp_type(ev)) = SND_SEQ_TIME_STAMP_TICK;
end;

function snd_seq_ev_is_real(ev: Psnd_seq_event_t): boolean;
begin
  snd_seq_ev_is_real := (snd_seq_ev_timestamp_type(ev)) = SND_SEQ_TIME_STAMP_REAL;
end;

function snd_seq_ev_timemode_type(ev: Psnd_seq_event_t): longint;
begin
  snd_seq_ev_timemode_type := (ev^.flags) and SND_SEQ_TIME_MODE_MASK;
end;

function snd_seq_ev_is_abstime(ev: Psnd_seq_event_t): boolean;
begin
  snd_seq_ev_is_abstime := (snd_seq_ev_timemode_type(ev)) = SND_SEQ_TIME_MODE_ABS;
end;

function snd_seq_ev_is_reltime(ev: Psnd_seq_event_t): boolean;
begin
  snd_seq_ev_is_reltime := (snd_seq_ev_timemode_type(ev)) = SND_SEQ_TIME_MODE_REL;
end;

function snd_seq_ev_is_direct(ev: Psnd_seq_event_t): boolean;
begin
  snd_seq_ev_is_direct := (ev^.queue) = SND_SEQ_QUEUE_DIRECT;
end;

function snd_seq_ev_is_ump(ev: Psnd_seq_event_t): DWord;
begin
  snd_seq_ev_is_ump := (ev^.flags) and SND_SEQ_EVENT_UMP;
end;


{$ENDIF read_implementation}
