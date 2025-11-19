
unit seq;
interface

{
  Automatically converted by H2Pas 1.0.0 from seq.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    seq.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pbyte  = ^byte;
Pchar  = ^char;
Pdword  = ^dword;
Ppollfd  = ^pollfd;
Psnd_config_t  = ^snd_config_t;
Psnd_seq_addr_t  = ^snd_seq_addr_t;
Psnd_seq_client_info_t  = ^snd_seq_client_info_t;
Psnd_seq_client_pool_t  = ^snd_seq_client_pool_t;
Psnd_seq_client_type  = ^snd_seq_client_type;
Psnd_seq_client_type_t  = ^snd_seq_client_type_t;
Psnd_seq_event_t  = ^snd_seq_event_t;
Psnd_seq_port_info_t  = ^snd_seq_port_info_t;
Psnd_seq_port_subscribe_t  = ^snd_seq_port_subscribe_t;
Psnd_seq_query_subs_type_t  = ^snd_seq_query_subs_type_t;
Psnd_seq_query_subscribe_t  = ^snd_seq_query_subscribe_t;
Psnd_seq_queue_info_t  = ^snd_seq_queue_info_t;
Psnd_seq_queue_status_t  = ^snd_seq_queue_status_t;
Psnd_seq_queue_tempo_t  = ^snd_seq_queue_tempo_t;
Psnd_seq_queue_timer_t  = ^snd_seq_queue_timer_t;
Psnd_seq_queue_timer_type_t  = ^snd_seq_queue_timer_type_t;
Psnd_seq_real_time_t  = ^snd_seq_real_time_t;
Psnd_seq_remove_events_t  = ^snd_seq_remove_events_t;
Psnd_seq_system_info_t  = ^snd_seq_system_info_t;
Psnd_seq_t  = ^snd_seq_t;
Psnd_seq_timestamp_t  = ^snd_seq_timestamp_t;
Psnd_seq_type  = ^snd_seq_type;
Psnd_seq_type_t  = ^snd_seq_type_t;
Psnd_seq_ump_event_t  = ^snd_seq_ump_event_t;
Psnd_timer_id_t  = ^snd_timer_id_t;
Pword  = ^word;
Pxxxx  = ^xxxx;
Pxxxxxxx  = ^xxxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file include/seq.h
 * \brief Application interface library for the ALSA driver
 * \author Jaroslav Kysela <perex@perex.cz>
 * \author Abramo Bagnara <abramo@alsa-project.org>
 * \author Takashi Iwai <tiwai@suse.de>
 * \date 1998-2001
  }
{
 * Application interface library for the ALSA driver
 *
 *
 *   This library is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Lesser General Public License as
 *   published by the Free Software Foundation; either version 2.1 of
 *   the License, or (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU Lesser General Public License for more details.
 *
 *   You should have received a copy of the GNU Lesser General Public
 *   License along with this library; if not, write to the Free Software
 *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
  }
{$ifndef __ALSA_SEQ_H}
{$define __ALSA_SEQ_H}
{ C++ extern C conditionnal removed }
{*
 *  \defgroup Sequencer MIDI Sequencer
 *  MIDI Sequencer Interface.
 *  See \ref seq page for more details.
 *  \
  }
{* dlsym version for interface entry callback  }

const
  SND_SEQ_DLSYM_VERSION = _dlsym_seq_001;  
{* Sequencer handle  }
type
  Tsnd_seq = Tsnd_seq_t;
{*
 * sequencer opening stream types
  }
{*< open for output (write)  }

const
  SND_SEQ_OPEN_OUTPUT = 1;  
{*< open for input (read)  }
  SND_SEQ_OPEN_INPUT = 2;  
{*< open for both input and output (read/write)  }
  SND_SEQ_OPEN_DUPLEX = SND_SEQ_OPEN_OUTPUT or SND_SEQ_OPEN_INPUT;  
{*
 * sequencer opening mode
  }
{*< non-blocking mode (flag to open mode)  }
  SND_SEQ_NONBLOCK = $0001;  
{* sequencer handle type  }
{*< hardware  }
{*< shared memory (NYI)  }
{*< network (NYI)  }
type
  Psnd_seq_type = ^Tsnd_seq_type;
  Tsnd_seq_type =  Longint;
  Const
    SND_SEQ_TYPE_HW = 0;
    SND_SEQ_TYPE_SHM = 1;
    SND_SEQ_TYPE_INET = 2;
;
  Tsnd_seq_type_t = Tsnd_seq_type;
  Psnd_seq_type_t = ^Tsnd_seq_type_t;
{* special client (port) ids  }
{*< unknown source  }
  SND_SEQ_ADDRESS_UNKNOWN = 253;  
{*< send event to all subscribed ports  }
  SND_SEQ_ADDRESS_SUBSCRIBERS = 254;  
{*< send event to all queues/clients/ports/channels  }
  SND_SEQ_ADDRESS_BROADCAST = 255;  
{* known client numbers  }
{*< system client  }
  SND_SEQ_CLIENT_SYSTEM = 0;  
{
  }
(* Const before type ignored *)

function snd_seq_open(handle:PPsnd_seq_t; name:Pchar; streams:longint; mode:longint):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_open_lconf(handle:PPsnd_seq_t; name:Pchar; streams:longint; mode:longint; lconf:Psnd_config_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_name(seq:Psnd_seq_t):Pchar;cdecl;external;
function snd_seq_type(seq:Psnd_seq_t):Tsnd_seq_type_t;cdecl;external;
function snd_seq_close(handle:Psnd_seq_t):longint;cdecl;external;
function snd_seq_poll_descriptors_count(handle:Psnd_seq_t; events:smallint):longint;cdecl;external;
function snd_seq_poll_descriptors(handle:Psnd_seq_t; pfds:Ppollfd; space:dword; events:smallint):longint;cdecl;external;
function snd_seq_poll_descriptors_revents(seq:Psnd_seq_t; pfds:Ppollfd; nfds:dword; revents:Pword):longint;cdecl;external;
function snd_seq_nonblock(handle:Psnd_seq_t; nonblock:longint):longint;cdecl;external;
function snd_seq_client_id(handle:Psnd_seq_t):longint;cdecl;external;
function snd_seq_get_output_buffer_size(handle:Psnd_seq_t):Tsize_t;cdecl;external;
function snd_seq_get_input_buffer_size(handle:Psnd_seq_t):Tsize_t;cdecl;external;
function snd_seq_set_output_buffer_size(handle:Psnd_seq_t; size:Tsize_t):longint;cdecl;external;
function snd_seq_set_input_buffer_size(handle:Psnd_seq_t; size:Tsize_t):longint;cdecl;external;
{* system information container  }
type
  Tsnd_seq_system_info = Tsnd_seq_system_info_t;

function snd_seq_system_info_sizeof:Tsize_t;cdecl;external;
{* allocate a #snd_seq_system_info_t container on stack  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_system_info_alloca(ptr : longint) : longint;

function snd_seq_system_info_malloc(ptr:PPsnd_seq_system_info_t):longint;cdecl;external;
procedure snd_seq_system_info_free(ptr:Psnd_seq_system_info_t);cdecl;external;
(* Const before type ignored *)
procedure snd_seq_system_info_copy(dst:Psnd_seq_system_info_t; src:Psnd_seq_system_info_t);cdecl;external;
(* Const before type ignored *)
function snd_seq_system_info_get_queues(info:Psnd_seq_system_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_system_info_get_clients(info:Psnd_seq_system_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_system_info_get_ports(info:Psnd_seq_system_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_system_info_get_channels(info:Psnd_seq_system_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_system_info_get_cur_clients(info:Psnd_seq_system_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_system_info_get_cur_queues(info:Psnd_seq_system_info_t):longint;cdecl;external;
function snd_seq_system_info(handle:Psnd_seq_t; info:Psnd_seq_system_info_t):longint;cdecl;external;
{* \  }
{*
 *  \defgroup SeqClient Sequencer Client Interface
 *  Sequencer Client Interface
 *  \ingroup Sequencer
 *  \
  }
{* client information container  }
type
  Tsnd_seq_client_info = Tsnd_seq_client_info_t;
{* client types  }
{*< user client  }
{*< kernel client  }

  Psnd_seq_client_type = ^Tsnd_seq_client_type;
  Tsnd_seq_client_type =  Longint;
  Const
    SND_SEQ_USER_CLIENT = 1;
    SND_SEQ_KERNEL_CLIENT = 2;
;
  Tsnd_seq_client_type_t = Tsnd_seq_client_type;
  Psnd_seq_client_type_t = ^Tsnd_seq_client_type_t;
{* client MIDI version  }
{*< Legacy client  }
{*< UMP MIDI 1.0  }
{*< UMP MIDI 2.0  }
type
  Txxxxxxx =  Longint;
  Const
    SND_SEQ_CLIENT_LEGACY_MIDI = 0;
    SND_SEQ_CLIENT_UMP_MIDI_1_0 = 1;
    SND_SEQ_CLIENT_UMP_MIDI_2_0 = 2;


function snd_seq_client_info_sizeof:Tsize_t;cdecl;external;
{* allocate a #snd_seq_client_info_t container on stack  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_client_info_alloca(ptr : longint) : longint;

function snd_seq_client_info_malloc(ptr:PPsnd_seq_client_info_t):longint;cdecl;external;
procedure snd_seq_client_info_free(ptr:Psnd_seq_client_info_t);cdecl;external;
(* Const before type ignored *)
procedure snd_seq_client_info_copy(dst:Psnd_seq_client_info_t; src:Psnd_seq_client_info_t);cdecl;external;
(* Const before type ignored *)
function snd_seq_client_info_get_client(info:Psnd_seq_client_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_client_info_get_type(info:Psnd_seq_client_info_t):Tsnd_seq_client_type_t;cdecl;external;
(* Const before type ignored *)
function snd_seq_client_info_get_name(info:Psnd_seq_client_info_t):Pchar;cdecl;external;
(* Const before type ignored *)
function snd_seq_client_info_get_broadcast_filter(info:Psnd_seq_client_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_client_info_get_error_bounce(info:Psnd_seq_client_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_client_info_get_card(info:Psnd_seq_client_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_client_info_get_pid(info:Psnd_seq_client_info_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_seq_client_info_get_event_filter(info:Psnd_seq_client_info_t):Pbyte;cdecl;external;
(* Const before type ignored *)
function snd_seq_client_info_get_num_ports(info:Psnd_seq_client_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_client_info_get_event_lost(info:Psnd_seq_client_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_client_info_get_midi_version(info:Psnd_seq_client_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_client_info_get_ump_group_enabled(info:Psnd_seq_client_info_t; group:longint):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_client_info_get_ump_groupless_enabled(info:Psnd_seq_client_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_client_info_get_ump_conversion(info:Psnd_seq_client_info_t):longint;cdecl;external;
procedure snd_seq_client_info_set_client(info:Psnd_seq_client_info_t; client:longint);cdecl;external;
(* Const before type ignored *)
procedure snd_seq_client_info_set_name(info:Psnd_seq_client_info_t; name:Pchar);cdecl;external;
procedure snd_seq_client_info_set_broadcast_filter(info:Psnd_seq_client_info_t; val:longint);cdecl;external;
procedure snd_seq_client_info_set_error_bounce(info:Psnd_seq_client_info_t; val:longint);cdecl;external;
procedure snd_seq_client_info_set_event_filter(info:Psnd_seq_client_info_t; filter:Pbyte);cdecl;external;
procedure snd_seq_client_info_set_midi_version(info:Psnd_seq_client_info_t; midi_version:longint);cdecl;external;
procedure snd_seq_client_info_set_ump_group_enabled(info:Psnd_seq_client_info_t; group:longint; enable:longint);cdecl;external;
procedure snd_seq_client_info_set_ump_groupless_enabled(info:Psnd_seq_client_info_t; enable:longint);cdecl;external;
procedure snd_seq_client_info_set_ump_conversion(info:Psnd_seq_client_info_t; enable:longint);cdecl;external;
procedure snd_seq_client_info_event_filter_clear(info:Psnd_seq_client_info_t);cdecl;external;
procedure snd_seq_client_info_event_filter_add(info:Psnd_seq_client_info_t; event_type:longint);cdecl;external;
procedure snd_seq_client_info_event_filter_del(info:Psnd_seq_client_info_t; event_type:longint);cdecl;external;
function snd_seq_client_info_event_filter_check(info:Psnd_seq_client_info_t; event_type:longint):longint;cdecl;external;
function snd_seq_get_client_info(handle:Psnd_seq_t; info:Psnd_seq_client_info_t):longint;cdecl;external;
function snd_seq_get_any_client_info(handle:Psnd_seq_t; client:longint; info:Psnd_seq_client_info_t):longint;cdecl;external;
function snd_seq_set_client_info(handle:Psnd_seq_t; info:Psnd_seq_client_info_t):longint;cdecl;external;
function snd_seq_query_next_client(handle:Psnd_seq_t; info:Psnd_seq_client_info_t):longint;cdecl;external;
function snd_seq_get_ump_endpoint_info(seq:Psnd_seq_t; client:longint; info:pointer):longint;cdecl;external;
function snd_seq_get_ump_block_info(seq:Psnd_seq_t; client:longint; blk:longint; info:pointer):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_set_ump_endpoint_info(seq:Psnd_seq_t; info:pointer):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_set_ump_block_info(seq:Psnd_seq_t; blk:longint; info:pointer):longint;cdecl;external;
{
  }
{* client pool information container  }
type
  Tsnd_seq_client_pool = Tsnd_seq_client_pool_t;

function snd_seq_client_pool_sizeof:Tsize_t;cdecl;external;
{* allocate a #snd_seq_client_pool_t container on stack  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_client_pool_alloca(ptr : longint) : longint;

function snd_seq_client_pool_malloc(ptr:PPsnd_seq_client_pool_t):longint;cdecl;external;
procedure snd_seq_client_pool_free(ptr:Psnd_seq_client_pool_t);cdecl;external;
(* Const before type ignored *)
procedure snd_seq_client_pool_copy(dst:Psnd_seq_client_pool_t; src:Psnd_seq_client_pool_t);cdecl;external;
(* Const before type ignored *)
function snd_seq_client_pool_get_client(info:Psnd_seq_client_pool_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_client_pool_get_output_pool(info:Psnd_seq_client_pool_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
function snd_seq_client_pool_get_input_pool(info:Psnd_seq_client_pool_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
function snd_seq_client_pool_get_output_room(info:Psnd_seq_client_pool_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
function snd_seq_client_pool_get_output_free(info:Psnd_seq_client_pool_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
function snd_seq_client_pool_get_input_free(info:Psnd_seq_client_pool_t):Tsize_t;cdecl;external;
procedure snd_seq_client_pool_set_output_pool(info:Psnd_seq_client_pool_t; size:Tsize_t);cdecl;external;
procedure snd_seq_client_pool_set_input_pool(info:Psnd_seq_client_pool_t; size:Tsize_t);cdecl;external;
procedure snd_seq_client_pool_set_output_room(info:Psnd_seq_client_pool_t; size:Tsize_t);cdecl;external;
function snd_seq_get_client_pool(handle:Psnd_seq_t; info:Psnd_seq_client_pool_t):longint;cdecl;external;
function snd_seq_set_client_pool(handle:Psnd_seq_t; info:Psnd_seq_client_pool_t):longint;cdecl;external;
{* \  }
{*
 *  \defgroup SeqPort Sequencer Port Interface
 *  Sequencer Port Interface
 *  \ingroup Sequencer
 *  \
  }
{* port information container  }
type
  Tsnd_seq_port_info = Tsnd_seq_port_info_t;
{* known port numbers  }
{*< system timer port  }

const
  SND_SEQ_PORT_SYSTEM_TIMER = 0;  
{*< system announce port  }
  SND_SEQ_PORT_SYSTEM_ANNOUNCE = 1;  
{* port capabilities (32 bits)  }
{*< readable from this port  }
  SND_SEQ_PORT_CAP_READ = 1 shl 0;  
{*< writable to this port  }
  SND_SEQ_PORT_CAP_WRITE = 1 shl 1;  
{*< allow read subscriptions  }
  SND_SEQ_PORT_CAP_SYNC_READ = 1 shl 2;  
{*< allow write subscriptions  }
  SND_SEQ_PORT_CAP_SYNC_WRITE = 1 shl 3;  
{*< allow read/write duplex  }
  SND_SEQ_PORT_CAP_DUPLEX = 1 shl 4;  
{*< allow read subscription  }
  SND_SEQ_PORT_CAP_SUBS_READ = 1 shl 5;  
{*< allow write subscription  }
  SND_SEQ_PORT_CAP_SUBS_WRITE = 1 shl 6;  
{*< routing not allowed  }
  SND_SEQ_PORT_CAP_NO_EXPORT = 1 shl 7;  
{*< inactive port  }
  SND_SEQ_PORT_CAP_INACTIVE = 1 shl 8;  
{*< UMP Endpoint port  }
  SND_SEQ_PORT_CAP_UMP_ENDPOINT = 1 shl 9;  
{* port direction  }
{*< Unknown  }
  SND_SEQ_PORT_DIR_UNKNOWN = 0;  
{*< Input only  }
  SND_SEQ_PORT_DIR_INPUT = 1;  
{*< Output only  }
  SND_SEQ_PORT_DIR_OUTPUT = 2;  
{*< Input/output bidirectional  }
  SND_SEQ_PORT_DIR_BIDIRECTION = 3;  
{ port type  }
{* Messages sent from/to this port have device-specific semantics.  }
  SND_SEQ_PORT_TYPE_SPECIFIC = 1 shl 0;  
{* This port understands MIDI messages.  }
  SND_SEQ_PORT_TYPE_MIDI_GENERIC = 1 shl 1;  
{* This port is compatible with the General MIDI specification.  }
  SND_SEQ_PORT_TYPE_MIDI_GM = 1 shl 2;  
{* This port is compatible with the Roland GS standard.  }
  SND_SEQ_PORT_TYPE_MIDI_GS = 1 shl 3;  
{* This port is compatible with the Yamaha XG specification.  }
  SND_SEQ_PORT_TYPE_MIDI_XG = 1 shl 4;  
{* This port is compatible with the Roland MT-32.  }
  SND_SEQ_PORT_TYPE_MIDI_MT32 = 1 shl 5;  
{* This port is compatible with the General MIDI 2 specification.  }
  SND_SEQ_PORT_TYPE_MIDI_GM2 = 1 shl 6;  
{* This port is a UMP port.  }
  SND_SEQ_PORT_TYPE_MIDI_UMP = 1 shl 7;  
{* This port understands SND_SEQ_EVENT_SAMPLE_xxx messages
    (these are not MIDI messages).  }
  SND_SEQ_PORT_TYPE_SYNTH = 1 shl 10;  
{* Instruments can be downloaded to this port
    (with SND_SEQ_EVENT_INSTR_xxx messages sent directly).  }
  SND_SEQ_PORT_TYPE_DIRECT_SAMPLE = 1 shl 11;  
{* Instruments can be downloaded to this port
    (with SND_SEQ_EVENT_INSTR_xxx messages sent directly or through a queue).  }
  SND_SEQ_PORT_TYPE_SAMPLE = 1 shl 12;  
{* This port is implemented in hardware.  }
  SND_SEQ_PORT_TYPE_HARDWARE = 1 shl 16;  
{* This port is implemented in software.  }
  SND_SEQ_PORT_TYPE_SOFTWARE = 1 shl 17;  
{* Messages sent to this port will generate sounds.  }
  SND_SEQ_PORT_TYPE_SYNTHESIZER = 1 shl 18;  
{* This port may connect to other devices
    (whose characteristics are not known).  }
  SND_SEQ_PORT_TYPE_PORT = 1 shl 19;  
{* This port belongs to an application, such as a sequencer or editor.  }
  SND_SEQ_PORT_TYPE_APPLICATION = 1 shl 20;  

function snd_seq_port_info_sizeof:Tsize_t;cdecl;external;
{* allocate a #snd_seq_port_info_t container on stack  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_port_info_alloca(ptr : longint) : longint;

function snd_seq_port_info_malloc(ptr:PPsnd_seq_port_info_t):longint;cdecl;external;
procedure snd_seq_port_info_free(ptr:Psnd_seq_port_info_t);cdecl;external;
(* Const before type ignored *)
procedure snd_seq_port_info_copy(dst:Psnd_seq_port_info_t; src:Psnd_seq_port_info_t);cdecl;external;
(* Const before type ignored *)
function snd_seq_port_info_get_client(info:Psnd_seq_port_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_port_info_get_port(info:Psnd_seq_port_info_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_seq_port_info_get_addr(info:Psnd_seq_port_info_t):Psnd_seq_addr_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_seq_port_info_get_name(info:Psnd_seq_port_info_t):Pchar;cdecl;external;
(* Const before type ignored *)
function snd_seq_port_info_get_capability(info:Psnd_seq_port_info_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_seq_port_info_get_type(info:Psnd_seq_port_info_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_seq_port_info_get_midi_channels(info:Psnd_seq_port_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_port_info_get_midi_voices(info:Psnd_seq_port_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_port_info_get_synth_voices(info:Psnd_seq_port_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_port_info_get_read_use(info:Psnd_seq_port_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_port_info_get_write_use(info:Psnd_seq_port_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_port_info_get_port_specified(info:Psnd_seq_port_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_port_info_get_timestamping(info:Psnd_seq_port_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_port_info_get_timestamp_real(info:Psnd_seq_port_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_port_info_get_timestamp_queue(info:Psnd_seq_port_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_port_info_get_direction(info:Psnd_seq_port_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_port_info_get_ump_group(info:Psnd_seq_port_info_t):longint;cdecl;external;
procedure snd_seq_port_info_set_client(info:Psnd_seq_port_info_t; client:longint);cdecl;external;
procedure snd_seq_port_info_set_port(info:Psnd_seq_port_info_t; port:longint);cdecl;external;
(* Const before type ignored *)
procedure snd_seq_port_info_set_addr(info:Psnd_seq_port_info_t; addr:Psnd_seq_addr_t);cdecl;external;
(* Const before type ignored *)
procedure snd_seq_port_info_set_name(info:Psnd_seq_port_info_t; name:Pchar);cdecl;external;
procedure snd_seq_port_info_set_capability(info:Psnd_seq_port_info_t; capability:dword);cdecl;external;
procedure snd_seq_port_info_set_type(info:Psnd_seq_port_info_t; _type:dword);cdecl;external;
procedure snd_seq_port_info_set_midi_channels(info:Psnd_seq_port_info_t; channels:longint);cdecl;external;
procedure snd_seq_port_info_set_midi_voices(info:Psnd_seq_port_info_t; voices:longint);cdecl;external;
procedure snd_seq_port_info_set_synth_voices(info:Psnd_seq_port_info_t; voices:longint);cdecl;external;
procedure snd_seq_port_info_set_port_specified(info:Psnd_seq_port_info_t; val:longint);cdecl;external;
procedure snd_seq_port_info_set_timestamping(info:Psnd_seq_port_info_t; enable:longint);cdecl;external;
procedure snd_seq_port_info_set_timestamp_real(info:Psnd_seq_port_info_t; realtime:longint);cdecl;external;
procedure snd_seq_port_info_set_timestamp_queue(info:Psnd_seq_port_info_t; queue:longint);cdecl;external;
procedure snd_seq_port_info_set_direction(info:Psnd_seq_port_info_t; direction:longint);cdecl;external;
procedure snd_seq_port_info_set_ump_group(info:Psnd_seq_port_info_t; ump_group:longint);cdecl;external;
function snd_seq_create_port(handle:Psnd_seq_t; info:Psnd_seq_port_info_t):longint;cdecl;external;
function snd_seq_delete_port(handle:Psnd_seq_t; port:longint):longint;cdecl;external;
function snd_seq_get_port_info(handle:Psnd_seq_t; port:longint; info:Psnd_seq_port_info_t):longint;cdecl;external;
function snd_seq_get_any_port_info(handle:Psnd_seq_t; client:longint; port:longint; info:Psnd_seq_port_info_t):longint;cdecl;external;
function snd_seq_set_port_info(handle:Psnd_seq_t; port:longint; info:Psnd_seq_port_info_t):longint;cdecl;external;
function snd_seq_query_next_port(handle:Psnd_seq_t; info:Psnd_seq_port_info_t):longint;cdecl;external;
{* \  }
{*
 *  \defgroup SeqSubscribe Sequencer Port Subscription
 *  Sequencer Port Subscription
 *  \ingroup Sequencer
 *  \
  }
{* port subscription container  }
type
  Tsnd_seq_port_subscribe = Tsnd_seq_port_subscribe_t;

function snd_seq_port_subscribe_sizeof:Tsize_t;cdecl;external;
{* allocate a #snd_seq_port_subscribe_t container on stack  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_port_subscribe_alloca(ptr : longint) : longint;

function snd_seq_port_subscribe_malloc(ptr:PPsnd_seq_port_subscribe_t):longint;cdecl;external;
procedure snd_seq_port_subscribe_free(ptr:Psnd_seq_port_subscribe_t);cdecl;external;
(* Const before type ignored *)
procedure snd_seq_port_subscribe_copy(dst:Psnd_seq_port_subscribe_t; src:Psnd_seq_port_subscribe_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_seq_port_subscribe_get_sender(info:Psnd_seq_port_subscribe_t):Psnd_seq_addr_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_seq_port_subscribe_get_dest(info:Psnd_seq_port_subscribe_t):Psnd_seq_addr_t;cdecl;external;
(* Const before type ignored *)
function snd_seq_port_subscribe_get_queue(info:Psnd_seq_port_subscribe_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_port_subscribe_get_exclusive(info:Psnd_seq_port_subscribe_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_port_subscribe_get_time_update(info:Psnd_seq_port_subscribe_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_port_subscribe_get_time_real(info:Psnd_seq_port_subscribe_t):longint;cdecl;external;
(* Const before type ignored *)
procedure snd_seq_port_subscribe_set_sender(info:Psnd_seq_port_subscribe_t; addr:Psnd_seq_addr_t);cdecl;external;
(* Const before type ignored *)
procedure snd_seq_port_subscribe_set_dest(info:Psnd_seq_port_subscribe_t; addr:Psnd_seq_addr_t);cdecl;external;
procedure snd_seq_port_subscribe_set_queue(info:Psnd_seq_port_subscribe_t; q:longint);cdecl;external;
procedure snd_seq_port_subscribe_set_exclusive(info:Psnd_seq_port_subscribe_t; val:longint);cdecl;external;
procedure snd_seq_port_subscribe_set_time_update(info:Psnd_seq_port_subscribe_t; val:longint);cdecl;external;
procedure snd_seq_port_subscribe_set_time_real(info:Psnd_seq_port_subscribe_t; val:longint);cdecl;external;
function snd_seq_get_port_subscription(handle:Psnd_seq_t; sub:Psnd_seq_port_subscribe_t):longint;cdecl;external;
function snd_seq_subscribe_port(handle:Psnd_seq_t; sub:Psnd_seq_port_subscribe_t):longint;cdecl;external;
function snd_seq_unsubscribe_port(handle:Psnd_seq_t; sub:Psnd_seq_port_subscribe_t):longint;cdecl;external;
{
  }
{* subscription query container  }
type
  Tsnd_seq_query_subscribe = Tsnd_seq_query_subscribe_t;
{* type of query subscription  }
{*< query read subscriptions  }
{*< query write subscriptions  }

  Psnd_seq_query_subs_type_t = ^Tsnd_seq_query_subs_type_t;
  Tsnd_seq_query_subs_type_t =  Longint;
  Const
    SND_SEQ_QUERY_SUBS_READ = 0;
    SND_SEQ_QUERY_SUBS_WRITE = 1;
;

function snd_seq_query_subscribe_sizeof:Tsize_t;cdecl;external;
{* allocate a #snd_seq_query_subscribe_t container on stack  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_query_subscribe_alloca(ptr : longint) : longint;

function snd_seq_query_subscribe_malloc(ptr:PPsnd_seq_query_subscribe_t):longint;cdecl;external;
procedure snd_seq_query_subscribe_free(ptr:Psnd_seq_query_subscribe_t);cdecl;external;
(* Const before type ignored *)
procedure snd_seq_query_subscribe_copy(dst:Psnd_seq_query_subscribe_t; src:Psnd_seq_query_subscribe_t);cdecl;external;
(* Const before type ignored *)
function snd_seq_query_subscribe_get_client(info:Psnd_seq_query_subscribe_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_query_subscribe_get_port(info:Psnd_seq_query_subscribe_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_seq_query_subscribe_get_root(info:Psnd_seq_query_subscribe_t):Psnd_seq_addr_t;cdecl;external;
(* Const before type ignored *)
function snd_seq_query_subscribe_get_type(info:Psnd_seq_query_subscribe_t):Tsnd_seq_query_subs_type_t;cdecl;external;
(* Const before type ignored *)
function snd_seq_query_subscribe_get_index(info:Psnd_seq_query_subscribe_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_query_subscribe_get_num_subs(info:Psnd_seq_query_subscribe_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_seq_query_subscribe_get_addr(info:Psnd_seq_query_subscribe_t):Psnd_seq_addr_t;cdecl;external;
(* Const before type ignored *)
function snd_seq_query_subscribe_get_queue(info:Psnd_seq_query_subscribe_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_query_subscribe_get_exclusive(info:Psnd_seq_query_subscribe_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_query_subscribe_get_time_update(info:Psnd_seq_query_subscribe_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_query_subscribe_get_time_real(info:Psnd_seq_query_subscribe_t):longint;cdecl;external;
procedure snd_seq_query_subscribe_set_client(info:Psnd_seq_query_subscribe_t; client:longint);cdecl;external;
procedure snd_seq_query_subscribe_set_port(info:Psnd_seq_query_subscribe_t; port:longint);cdecl;external;
(* Const before type ignored *)
procedure snd_seq_query_subscribe_set_root(info:Psnd_seq_query_subscribe_t; addr:Psnd_seq_addr_t);cdecl;external;
procedure snd_seq_query_subscribe_set_type(info:Psnd_seq_query_subscribe_t; _type:Tsnd_seq_query_subs_type_t);cdecl;external;
procedure snd_seq_query_subscribe_set_index(info:Psnd_seq_query_subscribe_t; _index:longint);cdecl;external;
function snd_seq_query_port_subscribers(seq:Psnd_seq_t; subs:Psnd_seq_query_subscribe_t):longint;cdecl;external;
{* \  }
{*
 *  \defgroup SeqQueue Sequencer Queue Interface
 *  Sequencer Queue Interface
 *  \ingroup Sequencer
 *  \
  }
{* queue information container  }
type
  Tsnd_seq_queue_info = Tsnd_seq_queue_info_t;
{* queue status container  }
  Tsnd_seq_queue_status = Tsnd_seq_queue_status_t;
{* queue tempo container  }
  Tsnd_seq_queue_tempo = Tsnd_seq_queue_tempo_t;
{* queue timer information container  }
  Tsnd_seq_queue_timer = Tsnd_seq_queue_timer_t;
{* special queue ids  }
{*< direct dispatch  }

const
  SND_SEQ_QUEUE_DIRECT = 253;  

function snd_seq_queue_info_sizeof:Tsize_t;cdecl;external;
{* allocate a #snd_seq_queue_info_t container on stack  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_queue_info_alloca(ptr : longint) : longint;

function snd_seq_queue_info_malloc(ptr:PPsnd_seq_queue_info_t):longint;cdecl;external;
procedure snd_seq_queue_info_free(ptr:Psnd_seq_queue_info_t);cdecl;external;
(* Const before type ignored *)
procedure snd_seq_queue_info_copy(dst:Psnd_seq_queue_info_t; src:Psnd_seq_queue_info_t);cdecl;external;
(* Const before type ignored *)
function snd_seq_queue_info_get_queue(info:Psnd_seq_queue_info_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_seq_queue_info_get_name(info:Psnd_seq_queue_info_t):Pchar;cdecl;external;
(* Const before type ignored *)
function snd_seq_queue_info_get_owner(info:Psnd_seq_queue_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_queue_info_get_locked(info:Psnd_seq_queue_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_queue_info_get_flags(info:Psnd_seq_queue_info_t):dword;cdecl;external;
(* Const before type ignored *)
procedure snd_seq_queue_info_set_name(info:Psnd_seq_queue_info_t; name:Pchar);cdecl;external;
procedure snd_seq_queue_info_set_owner(info:Psnd_seq_queue_info_t; owner:longint);cdecl;external;
procedure snd_seq_queue_info_set_locked(info:Psnd_seq_queue_info_t; locked:longint);cdecl;external;
procedure snd_seq_queue_info_set_flags(info:Psnd_seq_queue_info_t; flags:dword);cdecl;external;
function snd_seq_create_queue(seq:Psnd_seq_t; info:Psnd_seq_queue_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_alloc_named_queue(seq:Psnd_seq_t; name:Pchar):longint;cdecl;external;
function snd_seq_alloc_queue(handle:Psnd_seq_t):longint;cdecl;external;
function snd_seq_free_queue(handle:Psnd_seq_t; q:longint):longint;cdecl;external;
function snd_seq_get_queue_info(seq:Psnd_seq_t; q:longint; info:Psnd_seq_queue_info_t):longint;cdecl;external;
function snd_seq_set_queue_info(seq:Psnd_seq_t; q:longint; info:Psnd_seq_queue_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_query_named_queue(seq:Psnd_seq_t; name:Pchar):longint;cdecl;external;
function snd_seq_get_queue_usage(handle:Psnd_seq_t; q:longint):longint;cdecl;external;
function snd_seq_set_queue_usage(handle:Psnd_seq_t; q:longint; used:longint):longint;cdecl;external;
{
  }
function snd_seq_queue_status_sizeof:Tsize_t;cdecl;external;
{* allocate a #snd_seq_queue_status_t container on stack  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_queue_status_alloca(ptr : longint) : longint;

function snd_seq_queue_status_malloc(ptr:PPsnd_seq_queue_status_t):longint;cdecl;external;
procedure snd_seq_queue_status_free(ptr:Psnd_seq_queue_status_t);cdecl;external;
(* Const before type ignored *)
procedure snd_seq_queue_status_copy(dst:Psnd_seq_queue_status_t; src:Psnd_seq_queue_status_t);cdecl;external;
(* Const before type ignored *)
function snd_seq_queue_status_get_queue(info:Psnd_seq_queue_status_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_queue_status_get_events(info:Psnd_seq_queue_status_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_queue_status_get_tick_time(info:Psnd_seq_queue_status_t):Tsnd_seq_tick_time_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_seq_queue_status_get_real_time(info:Psnd_seq_queue_status_t):Psnd_seq_real_time_t;cdecl;external;
(* Const before type ignored *)
function snd_seq_queue_status_get_status(info:Psnd_seq_queue_status_t):dword;cdecl;external;
function snd_seq_get_queue_status(handle:Psnd_seq_t; q:longint; status:Psnd_seq_queue_status_t):longint;cdecl;external;
{
  }
function snd_seq_queue_tempo_sizeof:Tsize_t;cdecl;external;
{* allocate a #snd_seq_queue_tempo_t container on stack  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_queue_tempo_alloca(ptr : longint) : longint;

function snd_seq_queue_tempo_malloc(ptr:PPsnd_seq_queue_tempo_t):longint;cdecl;external;
procedure snd_seq_queue_tempo_free(ptr:Psnd_seq_queue_tempo_t);cdecl;external;
(* Const before type ignored *)
procedure snd_seq_queue_tempo_copy(dst:Psnd_seq_queue_tempo_t; src:Psnd_seq_queue_tempo_t);cdecl;external;
(* Const before type ignored *)
function snd_seq_queue_tempo_get_queue(info:Psnd_seq_queue_tempo_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_queue_tempo_get_tempo(info:Psnd_seq_queue_tempo_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_seq_queue_tempo_get_ppq(info:Psnd_seq_queue_tempo_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_queue_tempo_get_skew(info:Psnd_seq_queue_tempo_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_seq_queue_tempo_get_skew_base(info:Psnd_seq_queue_tempo_t):dword;cdecl;external;
procedure snd_seq_queue_tempo_set_tempo(info:Psnd_seq_queue_tempo_t; tempo:dword);cdecl;external;
procedure snd_seq_queue_tempo_set_ppq(info:Psnd_seq_queue_tempo_t; ppq:longint);cdecl;external;
procedure snd_seq_queue_tempo_set_skew(info:Psnd_seq_queue_tempo_t; skew:dword);cdecl;external;
procedure snd_seq_queue_tempo_set_skew_base(info:Psnd_seq_queue_tempo_t; base:dword);cdecl;external;
function snd_seq_get_queue_tempo(handle:Psnd_seq_t; q:longint; tempo:Psnd_seq_queue_tempo_t):longint;cdecl;external;
function snd_seq_set_queue_tempo(handle:Psnd_seq_t; q:longint; tempo:Psnd_seq_queue_tempo_t):longint;cdecl;external;
{
  }
{* sequencer timer sources  }
{ ALSA timer  }
{ Midi Clock (CLOCK event)  }
{ Midi Timer Tick (TICK event  }
type
  Psnd_seq_queue_timer_type_t = ^Tsnd_seq_queue_timer_type_t;
  Tsnd_seq_queue_timer_type_t =  Longint;
  Const
    SND_SEQ_TIMER_ALSA = 0;
    SND_SEQ_TIMER_MIDI_CLOCK = 1;
    SND_SEQ_TIMER_MIDI_TICK = 2;
;

function snd_seq_queue_timer_sizeof:Tsize_t;cdecl;external;
{* allocate a #snd_seq_queue_timer_t container on stack  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_queue_timer_alloca(ptr : longint) : longint;

function snd_seq_queue_timer_malloc(ptr:PPsnd_seq_queue_timer_t):longint;cdecl;external;
procedure snd_seq_queue_timer_free(ptr:Psnd_seq_queue_timer_t);cdecl;external;
(* Const before type ignored *)
procedure snd_seq_queue_timer_copy(dst:Psnd_seq_queue_timer_t; src:Psnd_seq_queue_timer_t);cdecl;external;
(* Const before type ignored *)
function snd_seq_queue_timer_get_queue(info:Psnd_seq_queue_timer_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_queue_timer_get_type(info:Psnd_seq_queue_timer_t):Tsnd_seq_queue_timer_type_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_seq_queue_timer_get_id(info:Psnd_seq_queue_timer_t):Psnd_timer_id_t;cdecl;external;
(* Const before type ignored *)
function snd_seq_queue_timer_get_resolution(info:Psnd_seq_queue_timer_t):dword;cdecl;external;
procedure snd_seq_queue_timer_set_type(info:Psnd_seq_queue_timer_t; _type:Tsnd_seq_queue_timer_type_t);cdecl;external;
(* Const before type ignored *)
procedure snd_seq_queue_timer_set_id(info:Psnd_seq_queue_timer_t; id:Psnd_timer_id_t);cdecl;external;
procedure snd_seq_queue_timer_set_resolution(info:Psnd_seq_queue_timer_t; resolution:dword);cdecl;external;
function snd_seq_get_queue_timer(handle:Psnd_seq_t; q:longint; timer:Psnd_seq_queue_timer_t):longint;cdecl;external;
function snd_seq_set_queue_timer(handle:Psnd_seq_t; q:longint; timer:Psnd_seq_queue_timer_t):longint;cdecl;external;
{* \  }
{*
 *  \defgroup SeqEvent Sequencer Event API
 *  Sequencer Event API
 *  \ingroup Sequencer
 *  \
  }
function snd_seq_free_event(ev:Psnd_seq_event_t):longint;cdecl;external;
function snd_seq_event_length(ev:Psnd_seq_event_t):Tssize_t;cdecl;external;
function snd_seq_event_output(handle:Psnd_seq_t; ev:Psnd_seq_event_t):longint;cdecl;external;
function snd_seq_event_output_buffer(handle:Psnd_seq_t; ev:Psnd_seq_event_t):longint;cdecl;external;
function snd_seq_event_output_direct(handle:Psnd_seq_t; ev:Psnd_seq_event_t):longint;cdecl;external;
function snd_seq_event_input(handle:Psnd_seq_t; ev:PPsnd_seq_event_t):longint;cdecl;external;
function snd_seq_event_input_pending(seq:Psnd_seq_t; fetch_sequencer:longint):longint;cdecl;external;
function snd_seq_drain_output(handle:Psnd_seq_t):longint;cdecl;external;
function snd_seq_event_output_pending(seq:Psnd_seq_t):longint;cdecl;external;
function snd_seq_extract_output(handle:Psnd_seq_t; ev:PPsnd_seq_event_t):longint;cdecl;external;
function snd_seq_drop_output(handle:Psnd_seq_t):longint;cdecl;external;
function snd_seq_drop_output_buffer(handle:Psnd_seq_t):longint;cdecl;external;
function snd_seq_drop_input(handle:Psnd_seq_t):longint;cdecl;external;
function snd_seq_drop_input_buffer(handle:Psnd_seq_t):longint;cdecl;external;
{* event removal conditionals  }
type
  Tsnd_seq_remove_events = Tsnd_seq_remove_events_t;
{* Remove conditional flags  }
{*< Flush input queues  }

const
  SND_SEQ_REMOVE_INPUT = 1 shl 0;  
{*< Flush output queues  }
  SND_SEQ_REMOVE_OUTPUT = 1 shl 1;  
{*< Restrict by destination q:client:port  }
  SND_SEQ_REMOVE_DEST = 1 shl 2;  
{*< Restrict by channel  }
  SND_SEQ_REMOVE_DEST_CHANNEL = 1 shl 3;  
{*< Restrict to before time  }
  SND_SEQ_REMOVE_TIME_BEFORE = 1 shl 4;  
{*< Restrict to time or after  }
  SND_SEQ_REMOVE_TIME_AFTER = 1 shl 5;  
{*< Time is in ticks  }
  SND_SEQ_REMOVE_TIME_TICK = 1 shl 6;  
{*< Restrict to event type  }
  SND_SEQ_REMOVE_EVENT_TYPE = 1 shl 7;  
{*< Do not flush off events  }
  SND_SEQ_REMOVE_IGNORE_OFF = 1 shl 8;  
{*< Restrict to events with given tag  }
  SND_SEQ_REMOVE_TAG_MATCH = 1 shl 9;  

function snd_seq_remove_events_sizeof:Tsize_t;cdecl;external;
{* allocate a #snd_seq_remove_events_t container on stack  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_remove_events_alloca(ptr : longint) : longint;

function snd_seq_remove_events_malloc(ptr:PPsnd_seq_remove_events_t):longint;cdecl;external;
procedure snd_seq_remove_events_free(ptr:Psnd_seq_remove_events_t);cdecl;external;
(* Const before type ignored *)
procedure snd_seq_remove_events_copy(dst:Psnd_seq_remove_events_t; src:Psnd_seq_remove_events_t);cdecl;external;
(* Const before type ignored *)
function snd_seq_remove_events_get_condition(info:Psnd_seq_remove_events_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_seq_remove_events_get_queue(info:Psnd_seq_remove_events_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_seq_remove_events_get_time(info:Psnd_seq_remove_events_t):Psnd_seq_timestamp_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_seq_remove_events_get_dest(info:Psnd_seq_remove_events_t):Psnd_seq_addr_t;cdecl;external;
(* Const before type ignored *)
function snd_seq_remove_events_get_channel(info:Psnd_seq_remove_events_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_remove_events_get_event_type(info:Psnd_seq_remove_events_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_seq_remove_events_get_tag(info:Psnd_seq_remove_events_t):longint;cdecl;external;
procedure snd_seq_remove_events_set_condition(info:Psnd_seq_remove_events_t; flags:dword);cdecl;external;
procedure snd_seq_remove_events_set_queue(info:Psnd_seq_remove_events_t; queue:longint);cdecl;external;
(* Const before type ignored *)
procedure snd_seq_remove_events_set_time(info:Psnd_seq_remove_events_t; time:Psnd_seq_timestamp_t);cdecl;external;
(* Const before type ignored *)
procedure snd_seq_remove_events_set_dest(info:Psnd_seq_remove_events_t; addr:Psnd_seq_addr_t);cdecl;external;
procedure snd_seq_remove_events_set_channel(info:Psnd_seq_remove_events_t; channel:longint);cdecl;external;
procedure snd_seq_remove_events_set_event_type(info:Psnd_seq_remove_events_t; _type:longint);cdecl;external;
procedure snd_seq_remove_events_set_tag(info:Psnd_seq_remove_events_t; tag:longint);cdecl;external;
function snd_seq_remove_events(handle:Psnd_seq_t; info:Psnd_seq_remove_events_t):longint;cdecl;external;
function snd_seq_ump_event_output(seq:Psnd_seq_t; ev:Psnd_seq_ump_event_t):longint;cdecl;external;
function snd_seq_ump_event_output_buffer(seq:Psnd_seq_t; ev:Psnd_seq_ump_event_t):longint;cdecl;external;
function snd_seq_ump_extract_output(seq:Psnd_seq_t; ev_res:PPsnd_seq_ump_event_t):longint;cdecl;external;
function snd_seq_ump_event_output_direct(seq:Psnd_seq_t; ev:Psnd_seq_ump_event_t):longint;cdecl;external;
function snd_seq_ump_event_input(seq:Psnd_seq_t; ev:PPsnd_seq_ump_event_t):longint;cdecl;external;
{* \  }
{*
 *  \defgroup SeqMisc Sequencer Miscellaneous
 *  Sequencer Miscellaneous
 *  \ingroup Sequencer
 *  \
  }
procedure snd_seq_set_bit(nr:longint; array:pointer);cdecl;external;
procedure snd_seq_unset_bit(nr:longint; array:pointer);cdecl;external;
function snd_seq_change_bit(nr:longint; array:pointer):longint;cdecl;external;
function snd_seq_get_bit(nr:longint; array:pointer):longint;cdecl;external;
{* \  }
{*
 *  \defgroup SeqEvType Sequencer Event Type Checks
 *  Sequencer Event Type Checks
 *  \ingroup Sequencer
 *  \
  }
{ event type macros  }
type
  Txxxx =  Longint;
  Const
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

type
  Txxxxxxx =  Longint;
  Const
    SND_SEQ_EVFLG_NOTE_ONEARG = 0;
    SND_SEQ_EVFLG_NOTE_TWOARG = 1;

type
  Txxxxxxx =  Longint;
  Const
    SND_SEQ_EVFLG_QUEUE_NOARG = 0;
    SND_SEQ_EVFLG_QUEUE_TICK = 1;
    SND_SEQ_EVFLG_QUEUE_TIME = 2;
    SND_SEQ_EVFLG_QUEUE_VALUE = 3;

{*
 * Exported event type table
 *
 * This table is referred by snd_seq_ev_is_xxx.
  }
(* Const before type ignored *)
  var
    snd_seq_event_types : Pdword;cvar;external;
{*< master type - 24bit  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function _SND_SEQ_TYPE(x : longint) : longint;

{*< optional type - 8bit  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _SND_SEQ_TYPE_OPT(x : longint) : longint;

{* check the event type  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_type_check(ev,x : longint) : longint;

{* event type check: result events  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_result_type(ev : longint) : longint;

{* event type check: note events  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_note_type(ev : longint) : longint;

{* event type check: control events  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_control_type(ev : longint) : longint;

{* event type check: channel specific events  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_channel_type(ev : longint) : longint;

{* event type check: queue control events  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_queue_type(ev : longint) : longint;

{* event type check: system status messages  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_message_type(ev : longint) : longint;

{* event type check: system status messages  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_subscribe_type(ev : longint) : longint;

{* event type check: sample messages  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_sample_type(ev : longint) : longint;

{* event type check: user-defined messages  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_user_type(ev : longint) : longint;

{* event type check: instrument layer events  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_instr_type(ev : longint) : longint;

{* event type check: fixed length events  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_fixed_type(ev : longint) : longint;

{* event type check: variable length events  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_variable_type(ev : longint) : longint;

{* event type check: user pointer events  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_varusr_type(ev : longint) : longint;

{* event type check: reserved for kernel  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_reserved(ev : longint) : longint;

{*
 * macros to check event flags
  }
{* prior events  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_prior(ev : longint) : longint;

{* get the data length type  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_length_type(ev : longint) : longint;

{* fixed length events  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_fixed(ev : longint) : longint;

{* variable length events  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_variable(ev : longint) : longint;

{* variable length on user-space  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_varusr(ev : longint) : longint;

{* time-stamp type  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_timestamp_type(ev : longint) : longint;

{* event is in tick time  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_tick(ev : longint) : longint;

{* event is in real-time  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_real(ev : longint) : longint;

{* time-mode type  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_timemode_type(ev : longint) : longint;

{* scheduled in absolute time  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_abstime(ev : longint) : longint;

{* scheduled in relative time  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_reltime(ev : longint) : longint;

{* direct dispatched events  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_direct(ev : longint) : longint;

{* UMP events  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_ump(ev : longint) : longint;

{* \  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ __ALSA_SEQ_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_system_info_alloca(ptr : longint) : longint;
begin
  snd_seq_system_info_alloca:=__snd_alloca(ptr,snd_seq_system_info);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_client_info_alloca(ptr : longint) : longint;
begin
  snd_seq_client_info_alloca:=__snd_alloca(ptr,snd_seq_client_info);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_client_pool_alloca(ptr : longint) : longint;
begin
  snd_seq_client_pool_alloca:=__snd_alloca(ptr,snd_seq_client_pool);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_port_info_alloca(ptr : longint) : longint;
begin
  snd_seq_port_info_alloca:=__snd_alloca(ptr,snd_seq_port_info);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_port_subscribe_alloca(ptr : longint) : longint;
begin
  snd_seq_port_subscribe_alloca:=__snd_alloca(ptr,snd_seq_port_subscribe);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_query_subscribe_alloca(ptr : longint) : longint;
begin
  snd_seq_query_subscribe_alloca:=__snd_alloca(ptr,snd_seq_query_subscribe);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_queue_info_alloca(ptr : longint) : longint;
begin
  snd_seq_queue_info_alloca:=__snd_alloca(ptr,snd_seq_queue_info);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_queue_status_alloca(ptr : longint) : longint;
begin
  snd_seq_queue_status_alloca:=__snd_alloca(ptr,snd_seq_queue_status);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_queue_tempo_alloca(ptr : longint) : longint;
begin
  snd_seq_queue_tempo_alloca:=__snd_alloca(ptr,snd_seq_queue_tempo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_queue_timer_alloca(ptr : longint) : longint;
begin
  snd_seq_queue_timer_alloca:=__snd_alloca(ptr,snd_seq_queue_timer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_remove_events_alloca(ptr : longint) : longint;
begin
  snd_seq_remove_events_alloca:=__snd_alloca(ptr,snd_seq_remove_events);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _SND_SEQ_TYPE(x : longint) : longint;
begin
  _SND_SEQ_TYPE:=1 shl x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _SND_SEQ_TYPE_OPT(x : longint) : longint;
begin
  _SND_SEQ_TYPE_OPT:=x shl 24;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_type_check(ev,x : longint) : longint;
begin
  snd_seq_type_check:=(snd_seq_event_types[ev^._type]) and (_SND_SEQ_TYPE(x));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_result_type(ev : longint) : longint;
begin
  snd_seq_ev_is_result_type:=snd_seq_type_check(ev,SND_SEQ_EVFLG_RESULT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_note_type(ev : longint) : longint;
begin
  snd_seq_ev_is_note_type:=snd_seq_type_check(ev,SND_SEQ_EVFLG_NOTE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_control_type(ev : longint) : longint;
begin
  snd_seq_ev_is_control_type:=snd_seq_type_check(ev,SND_SEQ_EVFLG_CONTROL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_channel_type(ev : longint) : longint;
begin
  snd_seq_ev_is_channel_type:=(snd_seq_event_types[ev^._type]) and ((_SND_SEQ_TYPE(SND_SEQ_EVFLG_NOTE)) or (_SND_SEQ_TYPE(SND_SEQ_EVFLG_CONTROL)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_queue_type(ev : longint) : longint;
begin
  snd_seq_ev_is_queue_type:=snd_seq_type_check(ev,SND_SEQ_EVFLG_QUEUE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_message_type(ev : longint) : longint;
begin
  snd_seq_ev_is_message_type:=snd_seq_type_check(ev,SND_SEQ_EVFLG_MESSAGE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_subscribe_type(ev : longint) : longint;
begin
  snd_seq_ev_is_subscribe_type:=snd_seq_type_check(ev,SND_SEQ_EVFLG_CONNECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_sample_type(ev : longint) : longint;
begin
  snd_seq_ev_is_sample_type:=snd_seq_type_check(ev,SND_SEQ_EVFLG_SAMPLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_user_type(ev : longint) : longint;
begin
  snd_seq_ev_is_user_type:=snd_seq_type_check(ev,SND_SEQ_EVFLG_USERS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_instr_type(ev : longint) : longint;
begin
  snd_seq_ev_is_instr_type:=snd_seq_type_check(ev,SND_SEQ_EVFLG_INSTR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_fixed_type(ev : longint) : longint;
begin
  snd_seq_ev_is_fixed_type:=snd_seq_type_check(ev,SND_SEQ_EVFLG_FIXED);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_variable_type(ev : longint) : longint;
begin
  snd_seq_ev_is_variable_type:=snd_seq_type_check(ev,SND_SEQ_EVFLG_VARIABLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_varusr_type(ev : longint) : longint;
begin
  snd_seq_ev_is_varusr_type:=snd_seq_type_check(ev,SND_SEQ_EVFLG_VARUSR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_reserved(ev : longint) : longint;
begin
  snd_seq_ev_is_reserved:= not (snd_seq_event_types[ev^._type]);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_prior(ev : longint) : longint;
begin
  snd_seq_ev_is_prior:=((ev^.flags) and SND_SEQ_PRIORITY_MASK)=SND_SEQ_PRIORITY_HIGH;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_length_type(ev : longint) : longint;
begin
  snd_seq_ev_length_type:=(ev^.flags) and SND_SEQ_EVENT_LENGTH_MASK;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_fixed(ev : longint) : longint;
begin
  snd_seq_ev_is_fixed:=(snd_seq_ev_length_type(ev))=SND_SEQ_EVENT_LENGTH_FIXED;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_variable(ev : longint) : longint;
begin
  snd_seq_ev_is_variable:=(snd_seq_ev_length_type(ev))=SND_SEQ_EVENT_LENGTH_VARIABLE;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_varusr(ev : longint) : longint;
begin
  snd_seq_ev_is_varusr:=(snd_seq_ev_length_type(ev))=SND_SEQ_EVENT_LENGTH_VARUSR;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_timestamp_type(ev : longint) : longint;
begin
  snd_seq_ev_timestamp_type:=(ev^.flags) and SND_SEQ_TIME_STAMP_MASK;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_tick(ev : longint) : longint;
begin
  snd_seq_ev_is_tick:=(snd_seq_ev_timestamp_type(ev))=SND_SEQ_TIME_STAMP_TICK;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_real(ev : longint) : longint;
begin
  snd_seq_ev_is_real:=(snd_seq_ev_timestamp_type(ev))=SND_SEQ_TIME_STAMP_REAL;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_timemode_type(ev : longint) : longint;
begin
  snd_seq_ev_timemode_type:=(ev^.flags) and SND_SEQ_TIME_MODE_MASK;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_abstime(ev : longint) : longint;
begin
  snd_seq_ev_is_abstime:=(snd_seq_ev_timemode_type(ev))=SND_SEQ_TIME_MODE_ABS;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_reltime(ev : longint) : longint;
begin
  snd_seq_ev_is_reltime:=(snd_seq_ev_timemode_type(ev))=SND_SEQ_TIME_MODE_REL;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_direct(ev : longint) : longint;
begin
  snd_seq_ev_is_direct:=(ev^.queue)=SND_SEQ_QUEUE_DIRECT;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_is_ump(ev : longint) : longint;
begin
  snd_seq_ev_is_ump:=(ev^.flags) and SND_SEQ_EVENT_UMP;
end;


end.
