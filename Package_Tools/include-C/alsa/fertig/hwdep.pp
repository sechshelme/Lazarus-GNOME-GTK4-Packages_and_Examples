
unit hwdep;
interface

{
  Automatically converted by H2Pas 1.0.0 from hwdep.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hwdep.h
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
Pchar  = ^char;
Ppollfd  = ^pollfd;
Psnd_hwdep_dsp_image_t  = ^snd_hwdep_dsp_image_t;
Psnd_hwdep_dsp_status_t  = ^snd_hwdep_dsp_status_t;
Psnd_hwdep_iface  = ^snd_hwdep_iface;
Psnd_hwdep_iface_t  = ^snd_hwdep_iface_t;
Psnd_hwdep_info_t  = ^snd_hwdep_info_t;
Psnd_hwdep_t  = ^snd_hwdep_t;
Psnd_hwdep_type  = ^snd_hwdep_type;
Psnd_hwdep_type_t  = ^snd_hwdep_type_t;
Pword  = ^word;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file include/hwdep.h
 * \brief Application interface library for the ALSA driver
 * \author Jaroslav Kysela <perex@perex.cz>
 * \author Abramo Bagnara <abramo@alsa-project.org>
 * \author Takashi Iwai <tiwai@suse.de>
 * \date 1998-2001
 *
 * Application interface library for the ALSA driver
  }
{
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
{$ifndef __ALSA_HWDEP_H}
{$define __ALSA_HWDEP_H}
{ C++ extern C conditionnal removed }
{*
 *  \defgroup HwDep Hardware Dependant Interface
 *  The Hardware Dependant Interface.
 *  \
  }
{* dlsym version for interface entry callback  }

const
  SND_HWDEP_DLSYM_VERSION = _dlsym_hwdep_001;  
{* HwDep information container  }
type
  Tsnd_hwdep_info = Tsnd_hwdep_info_t;
{* HwDep DSP status container  }
  Tsnd_hwdep_dsp_status = Tsnd_hwdep_dsp_status_t;
{* HwDep DSP image container  }
  Tsnd_hwdep_dsp_image = Tsnd_hwdep_dsp_image_t;
{* HwDep interface  }
{*< OPL2 raw driver  }
{*< OPL3 raw driver  }
{*< OPL4 raw driver  }
{*< SB16CSP driver  }
{*< EMU10K1 driver  }
{*< YSS225 driver  }
{*< ICS2115 driver  }
{*< Ensoniq SoundScape ISA card (MC68EC000)  }
{*< Digigram VX cards  }
{*< Digigram miXart cards  }
{*< Tascam US122, US224 & US428 usb  }
{*< EmuX wavetable  }
{*< Bluetooth audio  }
{*< Tascam US122, US224 & US428 raw USB PCM  }
{*< Digigram PCXHR  }
{*< SB Extigy/Audigy2NX remote control  }
{*< HD-audio  }
{*< direct access to usb stream  }
{*< TC DICE FireWire device  }
{*< Echo Audio Fireworks based device  }
{*< BridgeCo BeBoB based device  }
{*< Oxford OXFW970/971 based device  }
{ Digidesign Digi 002/003 family  }
{ TASCAM FireWire series  }
{ Line6 USB processors  }
{ MOTU FireWire series  }
{ RME Fireface series  }
{*< last known hwdep interface  }

  Psnd_hwdep_iface = ^Tsnd_hwdep_iface;
  Tsnd_hwdep_iface =  Longint;
  Const
    SND_HWDEP_IFACE_OPL2 = 0;
    SND_HWDEP_IFACE_OPL3 = 1;
    SND_HWDEP_IFACE_OPL4 = 2;
    SND_HWDEP_IFACE_SB16CSP = 3;
    SND_HWDEP_IFACE_EMU10K1 = 4;
    SND_HWDEP_IFACE_YSS225 = 5;
    SND_HWDEP_IFACE_ICS2115 = 6;
    SND_HWDEP_IFACE_SSCAPE = 7;
    SND_HWDEP_IFACE_VX = 8;
    SND_HWDEP_IFACE_MIXART = 9;
    SND_HWDEP_IFACE_USX2Y = 10;
    SND_HWDEP_IFACE_EMUX_WAVETABLE = 11;
    SND_HWDEP_IFACE_BLUETOOTH = 12;
    SND_HWDEP_IFACE_USX2Y_PCM = 13;
    SND_HWDEP_IFACE_PCXHR = 14;
    SND_HWDEP_IFACE_SB_RC = 15;
    SND_HWDEP_IFACE_HDA = 16;
    SND_HWDEP_IFACE_USB_STREAM = 17;
    SND_HWDEP_IFACE_FW_DICE = 18;
    SND_HWDEP_IFACE_FW_FIREWORKS = 19;
    SND_HWDEP_IFACE_FW_BEBOB = 20;
    SND_HWDEP_IFACE_FW_OXFW = 21;
    SND_HWDEP_IFACE_FW_DIGI00X = 22;
    SND_HWDEP_IFACE_FW_TASCAM = 23;
    SND_HWDEP_IFACE_LINE6 = 24;
    SND_HWDEP_IFACE_FW_MOTU = 25;
    SND_HWDEP_IFACE_FW_FIREFACE = 26;
    SND_HWDEP_IFACE_LAST = SND_HWDEP_IFACE_FW_FIREFACE;
;
  Tsnd_hwdep_iface_t = Tsnd_hwdep_iface;
  Psnd_hwdep_iface_t = ^Tsnd_hwdep_iface_t;
{* open for reading  }
  SND_HWDEP_OPEN_READ = O_RDONLY;  
{* open for writing  }
  SND_HWDEP_OPEN_WRITE = O_WRONLY;  
{* open for reading and writing  }
  SND_HWDEP_OPEN_DUPLEX = O_RDWR;  
{* open mode flag: open in nonblock mode  }
  SND_HWDEP_OPEN_NONBLOCK = O_NONBLOCK;  
{* HwDep handle type  }
{* Kernel level HwDep  }
{* Shared memory client HwDep (not yet implemented)  }
{* INET client HwDep (not yet implemented)  }
type
  Psnd_hwdep_type = ^Tsnd_hwdep_type;
  Tsnd_hwdep_type =  Longint;
  Const
    SND_HWDEP_TYPE_HW = 0;
    SND_HWDEP_TYPE_SHM = 1;
    SND_HWDEP_TYPE_INET = 2;
;
  Tsnd_hwdep_type_t = Tsnd_hwdep_type;
  Psnd_hwdep_type_t = ^Tsnd_hwdep_type_t;
{* HwDep handle  }
type
  Tsnd_hwdep = Tsnd_hwdep_t;
(* Const before type ignored *)

function snd_hwdep_open(hwdep:PPsnd_hwdep_t; name:Pchar; mode:longint):longint;cdecl;external;
function snd_hwdep_close(hwdep:Psnd_hwdep_t):longint;cdecl;external;
function snd_hwdep_poll_descriptors(hwdep:Psnd_hwdep_t; pfds:Ppollfd; space:dword):longint;cdecl;external;
function snd_hwdep_poll_descriptors_count(hwdep:Psnd_hwdep_t):longint;cdecl;external;
function snd_hwdep_poll_descriptors_revents(hwdep:Psnd_hwdep_t; pfds:Ppollfd; nfds:dword; revents:Pword):longint;cdecl;external;
function snd_hwdep_nonblock(hwdep:Psnd_hwdep_t; nonblock:longint):longint;cdecl;external;
function snd_hwdep_info(hwdep:Psnd_hwdep_t; info:Psnd_hwdep_info_t):longint;cdecl;external;
function snd_hwdep_dsp_status(hwdep:Psnd_hwdep_t; status:Psnd_hwdep_dsp_status_t):longint;cdecl;external;
function snd_hwdep_dsp_load(hwdep:Psnd_hwdep_t; block:Psnd_hwdep_dsp_image_t):longint;cdecl;external;
function snd_hwdep_ioctl(hwdep:Psnd_hwdep_t; request:dword; arg:pointer):longint;cdecl;external;
(* Const before type ignored *)
function snd_hwdep_write(hwdep:Psnd_hwdep_t; buffer:pointer; size:Tsize_t):Tssize_t;cdecl;external;
function snd_hwdep_read(hwdep:Psnd_hwdep_t; buffer:pointer; size:Tsize_t):Tssize_t;cdecl;external;
function snd_hwdep_info_sizeof:Tsize_t;cdecl;external;
{* allocate #snd_hwdep_info_t container on stack  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_hwdep_info_alloca(ptr : longint) : longint;

function snd_hwdep_info_malloc(ptr:PPsnd_hwdep_info_t):longint;cdecl;external;
procedure snd_hwdep_info_free(obj:Psnd_hwdep_info_t);cdecl;external;
(* Const before type ignored *)
procedure snd_hwdep_info_copy(dst:Psnd_hwdep_info_t; src:Psnd_hwdep_info_t);cdecl;external;
(* Const before type ignored *)
function snd_hwdep_info_get_device(obj:Psnd_hwdep_info_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_hwdep_info_get_card(obj:Psnd_hwdep_info_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_hwdep_info_get_id(obj:Psnd_hwdep_info_t):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_hwdep_info_get_name(obj:Psnd_hwdep_info_t):Pchar;cdecl;external;
(* Const before type ignored *)
function snd_hwdep_info_get_iface(obj:Psnd_hwdep_info_t):Tsnd_hwdep_iface_t;cdecl;external;
procedure snd_hwdep_info_set_device(obj:Psnd_hwdep_info_t; val:dword);cdecl;external;
function snd_hwdep_dsp_status_sizeof:Tsize_t;cdecl;external;
{* allocate #snd_hwdep_dsp_status_t container on stack  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_hwdep_dsp_status_alloca(ptr : longint) : longint;

function snd_hwdep_dsp_status_malloc(ptr:PPsnd_hwdep_dsp_status_t):longint;cdecl;external;
procedure snd_hwdep_dsp_status_free(obj:Psnd_hwdep_dsp_status_t);cdecl;external;
(* Const before type ignored *)
procedure snd_hwdep_dsp_status_copy(dst:Psnd_hwdep_dsp_status_t; src:Psnd_hwdep_dsp_status_t);cdecl;external;
(* Const before type ignored *)
function snd_hwdep_dsp_status_get_version(obj:Psnd_hwdep_dsp_status_t):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_hwdep_dsp_status_get_id(obj:Psnd_hwdep_dsp_status_t):Pchar;cdecl;external;
(* Const before type ignored *)
function snd_hwdep_dsp_status_get_num_dsps(obj:Psnd_hwdep_dsp_status_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_hwdep_dsp_status_get_dsp_loaded(obj:Psnd_hwdep_dsp_status_t):dword;cdecl;external;
(* Const before type ignored *)
function snd_hwdep_dsp_status_get_chip_ready(obj:Psnd_hwdep_dsp_status_t):dword;cdecl;external;
function snd_hwdep_dsp_image_sizeof:Tsize_t;cdecl;external;
{* allocate #snd_hwdep_dsp_image_t container on stack  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_hwdep_dsp_image_alloca(ptr : longint) : longint;

function snd_hwdep_dsp_image_malloc(ptr:PPsnd_hwdep_dsp_image_t):longint;cdecl;external;
procedure snd_hwdep_dsp_image_free(obj:Psnd_hwdep_dsp_image_t);cdecl;external;
(* Const before type ignored *)
procedure snd_hwdep_dsp_image_copy(dst:Psnd_hwdep_dsp_image_t; src:Psnd_hwdep_dsp_image_t);cdecl;external;
(* Const before type ignored *)
function snd_hwdep_dsp_image_get_index(obj:Psnd_hwdep_dsp_image_t):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_hwdep_dsp_image_get_name(obj:Psnd_hwdep_dsp_image_t):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_hwdep_dsp_image_get_image(obj:Psnd_hwdep_dsp_image_t):pointer;cdecl;external;
(* Const before type ignored *)
function snd_hwdep_dsp_image_get_length(obj:Psnd_hwdep_dsp_image_t):Tsize_t;cdecl;external;
procedure snd_hwdep_dsp_image_set_index(obj:Psnd_hwdep_dsp_image_t; _index:dword);cdecl;external;
(* Const before type ignored *)
procedure snd_hwdep_dsp_image_set_name(obj:Psnd_hwdep_dsp_image_t; name:Pchar);cdecl;external;
procedure snd_hwdep_dsp_image_set_image(obj:Psnd_hwdep_dsp_image_t; buffer:pointer);cdecl;external;
procedure snd_hwdep_dsp_image_set_length(obj:Psnd_hwdep_dsp_image_t; length:Tsize_t);cdecl;external;
{* \  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ __ALSA_HWDEP_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_hwdep_info_alloca(ptr : longint) : longint;
begin
  snd_hwdep_info_alloca:=__snd_alloca(ptr,snd_hwdep_info);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_hwdep_dsp_status_alloca(ptr : longint) : longint;
begin
  snd_hwdep_dsp_status_alloca:=__snd_alloca(ptr,snd_hwdep_dsp_status);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_hwdep_dsp_image_alloca(ptr : longint) : longint;
begin
  snd_hwdep_dsp_image_alloca:=__snd_alloca(ptr,snd_hwdep_dsp_image);
end;


end.
