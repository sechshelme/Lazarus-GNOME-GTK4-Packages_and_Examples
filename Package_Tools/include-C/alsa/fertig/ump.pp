
unit ump;
interface

{
  Automatically converted by H2Pas 1.0.0 from ump.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ump.h
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
Ppollfd  = ^pollfd;
Psnd_rawmidi_info_t  = ^snd_rawmidi_info_t;
Psnd_rawmidi_params_t  = ^snd_rawmidi_params_t;
Psnd_rawmidi_status_t  = ^snd_rawmidi_status_t;
Psnd_rawmidi_t  = ^snd_rawmidi_t;
Psnd_ump_block_info_t  = ^snd_ump_block_info_t;
Psnd_ump_block_ui_hint  = ^snd_ump_block_ui_hint;
Psnd_ump_direction  = ^snd_ump_direction;
Psnd_ump_endpoint_info_t  = ^snd_ump_endpoint_info_t;
Psnd_ump_t  = ^snd_ump_t;
Ptimespec  = ^timespec;
Pword  = ^word;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1+  }
{*
 * \file include/ump.h
 * \brief API library for ALSA rawmidi/UMP interface
 *
 * API library for ALSA rawmidi/UMP interface
  }
{$ifndef __ALSA_UMP_H}
{$define __ALSA_UMP_H}
{ C++ extern C conditionnal removed }
{* UMP (Endpoint) RawMIDI device  }
type
  Tsnd_ump = Tsnd_ump_t;
{* UMP Endpoint information container  }
  Tsnd_ump_endpoint_info = Tsnd_ump_endpoint_info_t;
{* UMP Block information container  }
  Tsnd_ump_block_info = Tsnd_ump_block_info_t;
(* Const before type ignored *)

function snd_ump_open(inputp:PPsnd_ump_t; outputp:PPsnd_ump_t; name:Pchar; mode:longint):longint;cdecl;external;
function snd_ump_close(ump:Psnd_ump_t):longint;cdecl;external;
function snd_ump_rawmidi(ump:Psnd_ump_t):Psnd_rawmidi_t;cdecl;external;
(* Const before type ignored *)
function snd_ump_name(ump:Psnd_ump_t):Pchar;cdecl;external;
function snd_ump_poll_descriptors_count(ump:Psnd_ump_t):longint;cdecl;external;
function snd_ump_poll_descriptors(ump:Psnd_ump_t; pfds:Ppollfd; space:dword):longint;cdecl;external;
function snd_ump_poll_descriptors_revents(ump:Psnd_ump_t; pfds:Ppollfd; nfds:dword; revents:Pword):longint;cdecl;external;
function snd_ump_nonblock(ump:Psnd_ump_t; nonblock:longint):longint;cdecl;external;
function snd_ump_rawmidi_info(ump:Psnd_ump_t; info:Psnd_rawmidi_info_t):longint;cdecl;external;
function snd_ump_rawmidi_params(ump:Psnd_ump_t; params:Psnd_rawmidi_params_t):longint;cdecl;external;
function snd_ump_rawmidi_params_current(ump:Psnd_ump_t; params:Psnd_rawmidi_params_t):longint;cdecl;external;
function snd_ump_rawmidi_status(ump:Psnd_ump_t; status:Psnd_rawmidi_status_t):longint;cdecl;external;
function snd_ump_drop(ump:Psnd_ump_t):longint;cdecl;external;
function snd_ump_drain(ump:Psnd_ump_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_ump_write(ump:Psnd_ump_t; buffer:pointer; size:Tsize_t):Tssize_t;cdecl;external;
function snd_ump_read(ump:Psnd_ump_t; buffer:pointer; size:Tsize_t):Tssize_t;cdecl;external;
function snd_ump_tread(ump:Psnd_ump_t; tstamp:Ptimespec; buffer:pointer; size:Tsize_t):Tssize_t;cdecl;external;
{* Max number of UMP Groups  }
const
  SND_UMP_MAX_GROUPS = 16;  
{* Max number of UMP Blocks  }
  SND_UMP_MAX_BLOCKS = 32;  
{* UMP direction  }
{* Input only  }
{* Output only  }
{* Bidirectional  }
type
  Tsnd_ump_direction =  Longint;
  Const
    SND_UMP_DIR_INPUT = $01;
    SND_UMP_DIR_OUTPUT = $02;
    SND_UMP_DIR_BIDIRECTION = $03;

{* UMP EP holds only static blocks  }
  SND_UMP_EP_INFO_STATIC_BLOCKS = $01;  
{* Bitmask for UMP EP MIDI protocols  }
  SND_UMP_EP_INFO_PROTO_MIDI_MASK = $0300;  
{* Bit flag for MIDI 1.0 protocol  }
  SND_UMP_EP_INFO_PROTO_MIDI1 = $0100;  
{* Bit flag for MIDI 2.0 protocol  }
  SND_UMP_EP_INFO_PROTO_MIDI2 = $0200;  
{* Bitmask for UMP Jitter-reduction timestamp  }
  SND_UMP_EP_INFO_PROTO_JRTS_MASK = $0003;  
{* Bit flag for JRTS in Transmit  }
  SND_UMP_EP_INFO_PROTO_JRTS_TX = $0001;  
{* Bit flag for JRTS in Receive  }
  SND_UMP_EP_INFO_PROTO_JRTS_RX = $0002;  

function snd_ump_endpoint_info_sizeof:Tsize_t;cdecl;external;
{* \hideinitializer
 * \brief allocate an invalid #snd_ump_endpoint_info_t using standard alloca
 * \param ptr returned pointer
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_ump_endpoint_info_alloca(ptr : longint) : longint;

function snd_ump_endpoint_info_malloc(info:PPsnd_ump_endpoint_info_t):longint;cdecl;external;
procedure snd_ump_endpoint_info_free(info:Psnd_ump_endpoint_info_t);cdecl;external;
(* Const before type ignored *)
procedure snd_ump_endpoint_info_copy(dst:Psnd_ump_endpoint_info_t; src:Psnd_ump_endpoint_info_t);cdecl;external;
(* Const before type ignored *)
function snd_ump_endpoint_info_get_card(info:Psnd_ump_endpoint_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_ump_endpoint_info_get_device(info:Psnd_ump_endpoint_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_ump_endpoint_info_get_flags(info:Psnd_ump_endpoint_info_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_ump_endpoint_info_get_protocol_caps(info:Psnd_ump_endpoint_info_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_ump_endpoint_info_get_protocol(info:Psnd_ump_endpoint_info_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_ump_endpoint_info_get_num_blocks(info:Psnd_ump_endpoint_info_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_ump_endpoint_info_get_version(info:Psnd_ump_endpoint_info_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_ump_endpoint_info_get_manufacturer_id(info:Psnd_ump_endpoint_info_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_ump_endpoint_info_get_family_id(info:Psnd_ump_endpoint_info_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_ump_endpoint_info_get_model_id(info:Psnd_ump_endpoint_info_t):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_ump_endpoint_info_get_sw_revision(info:Psnd_ump_endpoint_info_t):Pbyte;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_ump_endpoint_info_get_name(info:Psnd_ump_endpoint_info_t):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_ump_endpoint_info_get_product_id(info:Psnd_ump_endpoint_info_t):Pchar;cdecl;external;
function snd_ump_endpoint_info(ump:Psnd_ump_t; info:Psnd_ump_endpoint_info_t):longint;cdecl;external;
{* Bit flag for MIDI 1.0 port w/o restrict in UMP Block info flags  }
const
  SND_UMP_BLOCK_IS_MIDI1 = 1 shl 0;  
{* Bit flag for 31.25Kbps B/W MIDI1 port in UMP Block info flags  }
  SND_UMP_BLOCK_IS_LOWSPEED = 1 shl 1;  
{* UMP block user-interface hint  }
{* Unknown or undeclared  }
{* Primarily a receiver or a destination for MIDI messages  }
{* Primarily a sender or a source of MIDI messages  }
{* Both a sender and receiver of MIDI messages  }
type
  Tsnd_ump_block_ui_hint =  Longint;
  Const
    SND_UMP_BLOCK_UI_HINT_UNKNOWN = $00;
    SND_UMP_BLOCK_UI_HINT_RECEIVER = $01;
    SND_UMP_BLOCK_UI_HINT_SENDER = $02;
    SND_UMP_BLOCK_UI_HINT_BOTH = $03;


function snd_ump_block_info_sizeof:Tsize_t;cdecl;external;
{* \hideinitializer
 * \brief allocate an invalid #snd_ump_block_info_t using standard alloca
 * \param ptr returned pointer
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_ump_block_info_alloca(ptr : longint) : longint;

function snd_ump_block_info_malloc(info:PPsnd_ump_block_info_t):longint;cdecl;external;
procedure snd_ump_block_info_free(info:Psnd_ump_block_info_t);cdecl;external;
(* Const before type ignored *)
procedure snd_ump_block_info_copy(dst:Psnd_ump_block_info_t; src:Psnd_ump_block_info_t);cdecl;external;
(* Const before type ignored *)
function snd_ump_block_info_get_card(info:Psnd_ump_block_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_ump_block_info_get_device(info:Psnd_ump_block_info_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_ump_block_info_get_block_id(info:Psnd_ump_block_info_t):dword;cdecl;external;
procedure snd_ump_block_info_set_block_id(info:Psnd_ump_block_info_t; id:dword);cdecl;external;
(* Const before type ignored *)
function snd_ump_block_info_get_active(info:Psnd_ump_block_info_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_ump_block_info_get_flags(info:Psnd_ump_block_info_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_ump_block_info_get_direction(info:Psnd_ump_block_info_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_ump_block_info_get_first_group(info:Psnd_ump_block_info_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_ump_block_info_get_num_groups(info:Psnd_ump_block_info_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_ump_block_info_get_midi_ci_version(info:Psnd_ump_block_info_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_ump_block_info_get_sysex8_streams(info:Psnd_ump_block_info_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_ump_block_info_get_ui_hint(info:Psnd_ump_block_info_t):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_ump_block_info_get_name(info:Psnd_ump_block_info_t):Pchar;cdecl;external;
function snd_ump_block_info(ump:Psnd_ump_t; info:Psnd_ump_block_info_t):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ __ALSA_UMP_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_ump_endpoint_info_alloca(ptr : longint) : longint;
begin
  snd_ump_endpoint_info_alloca:=__snd_alloca(ptr,snd_ump_endpoint_info);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_ump_block_info_alloca(ptr : longint) : longint;
begin
  snd_ump_block_info_alloca:=__snd_alloca(ptr,snd_ump_block_info);
end;


end.
