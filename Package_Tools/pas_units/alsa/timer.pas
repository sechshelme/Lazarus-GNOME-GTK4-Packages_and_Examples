unit timer;

interface

uses
  fp_asound;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file include/timer.h
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
{$ifndef __ALSA_TIMER_H}
{$define __ALSA_TIMER_H}
{ C++ extern C conditionnal removed }
{*
 *  \defgroup Timer Timer Interface
 *  Timer Interface. See \ref timer page for more details.
 *  \
  }
{* dlsym version for interface entry callback  }

const
  SND_TIMER_DLSYM_VERSION = _dlsym_timer_001;  
{* dlsym version for interface entry callback  }
  SND_TIMER_QUERY_DLSYM_VERSION = _dlsym_timer_query_001;  
{* timer identification structure  }
type
  Tsnd_timer_id = Tsnd_timer_id_t;
{* timer global info structure  }
  Tsnd_timer_ginfo = Tsnd_timer_ginfo_t;
{* timer global params structure  }
  Tsnd_timer_gparams = Tsnd_timer_gparams_t;
{* timer global status structure  }
  Tsnd_timer_gstatus = Tsnd_timer_gstatus_t;
{* timer info structure  }
  Tsnd_timer_info = Tsnd_timer_info_t;
{* timer params structure  }
  Tsnd_timer_params = Tsnd_timer_params_t;
{* timer status structure  }
  Tsnd_timer_status = Tsnd_timer_status_t;
{* timer master class  }
{*< invalid  }
{*< slave timer  }
{*< global timer  }
{*< card timer  }
{*< PCM timer  }
{*< last timer  }

  Psnd_timer_class = ^Tsnd_timer_class;
  Tsnd_timer_class =  Longint;
  Const
    SND_TIMER_CLASS_NONE = -(1);
    SND_TIMER_CLASS_SLAVE = 0;
    SND_TIMER_CLASS_GLOBAL = 1;
    SND_TIMER_CLASS_CARD = 2;
    SND_TIMER_CLASS_PCM = 3;
    SND_TIMER_CLASS_LAST = SND_TIMER_CLASS_PCM;
;
  Tsnd_timer_class_t = Tsnd_timer_class;
  Psnd_timer_class_t = ^Tsnd_timer_class_t;
{* timer slave class  }
{*< none  }
{*< for internal use  }
{*< sequencer timer  }
{*< OSS sequencer timer  }
{*< last slave timer  }
type
  Psnd_timer_slave_class = ^Tsnd_timer_slave_class;
  Tsnd_timer_slave_class =  Longint;
  Const
    SND_TIMER_SCLASS_NONE = 0;
    SND_TIMER_SCLASS_APPLICATION = 1;
    SND_TIMER_SCLASS_SEQUENCER = 2;
    SND_TIMER_SCLASS_OSS_SEQUENCER = 3;
    SND_TIMER_SCLASS_LAST = SND_TIMER_SCLASS_OSS_SEQUENCER;
;
  Tsnd_timer_slave_class_t = Tsnd_timer_slave_class;
  Psnd_timer_slave_class_t = ^Tsnd_timer_slave_class_t;
{* timer read event identification  }
{ val = resolution in ns  }
{ val = ticks  }
{ val = resolution in ns  }
{ val = 0  }
{ val = resolution in ns  }
{ val = 0  }
{ val = 0  }
{ val = 0  }
{ val = resolution in ns  }
{ master timer events for slave timer instances  }
type
  Psnd_timer_event = ^Tsnd_timer_event;
  Tsnd_timer_event =  Longint;
  Const
    SND_TIMER_EVENT_RESOLUTION = 0;
    SND_TIMER_EVENT_TICK = 1;
    SND_TIMER_EVENT_START = 2;
    SND_TIMER_EVENT_STOP = 3;
    SND_TIMER_EVENT_CONTINUE = 4;
    SND_TIMER_EVENT_PAUSE = 5;
    SND_TIMER_EVENT_EARLY = 6;
    SND_TIMER_EVENT_SUSPEND = 7;
    SND_TIMER_EVENT_RESUME = 8;
    SND_TIMER_EVENT_MSTART = SND_TIMER_EVENT_START+10;
    SND_TIMER_EVENT_MSTOP = SND_TIMER_EVENT_STOP+10;
    SND_TIMER_EVENT_MCONTINUE = SND_TIMER_EVENT_CONTINUE+10;
    SND_TIMER_EVENT_MPAUSE = SND_TIMER_EVENT_PAUSE+10;
    SND_TIMER_EVENT_MSUSPEND = SND_TIMER_EVENT_SUSPEND+10;
    SND_TIMER_EVENT_MRESUME = SND_TIMER_EVENT_RESUME+10;
;
  Tsnd_timer_event_t = Tsnd_timer_event;
  Psnd_timer_event_t = ^Tsnd_timer_event_t;
{* timer read structure  }
{*< tick resolution in nanoseconds  }
{*< count of happened ticks  }
type
  Psnd_timer_read = ^Tsnd_timer_read;
  Tsnd_timer_read = record
      resolution : dword;
      ticks : dword;
    end;
  Tsnd_timer_read_t = Tsnd_timer_read;
  Psnd_timer_read_t = ^Tsnd_timer_read_t;
{* timer tstamp + event read structure  }
{*< Timer event  }
{*< Time stamp of each event  }
{*< Event value  }

  Psnd_timer_tread = ^Tsnd_timer_tread;
  Tsnd_timer_tread = record
      event : Tsnd_timer_event_t;
      tstamp : Tsnd_htimestamp_t;
      val : dword;
    end;
  Tsnd_timer_tread_t = Tsnd_timer_tread;
  Psnd_timer_tread_t = ^Tsnd_timer_tread_t;
{* global timer - system  }

const
  SND_TIMER_GLOBAL_SYSTEM = 0;  
{* global timer - RTC  }
{ Obsoleted, due to enough legacy.  }
  SND_TIMER_GLOBAL_RTC = 1;  
{* global timer - HPET  }
  SND_TIMER_GLOBAL_HPET = 2;  
{* global timer - HRTIMER  }
  SND_TIMER_GLOBAL_HRTIMER = 3;  
{* timer open mode flag - non-blocking behaviour  }
  SND_TIMER_OPEN_NONBLOCK = 1 shl 0;  
{* use timestamps and event notification - enhanced read  }
  SND_TIMER_OPEN_TREAD = 1 shl 1;  
{* timer handle type  }
{* Kernel level HwDep  }
{* Shared memory client timer (not yet implemented)  }
{* INET client timer (not yet implemented)  }
type
  Psnd_timer_type = ^Tsnd_timer_type;
  Tsnd_timer_type =  Longint;
  Const
    SND_TIMER_TYPE_HW = 0;
    SND_TIMER_TYPE_SHM = 1;
    SND_TIMER_TYPE_INET = 2;
;
  Tsnd_timer_type_t = Tsnd_timer_type;
  Psnd_timer_type_t = ^Tsnd_timer_type_t;
{* timer query handle  }
type
  Tsnd_timer_query = Tsnd_timer_query_t;
{* timer handle  }
  Tsnd_timer = Tsnd_timer_t;

function snd_timer_query_open(handle:PPsnd_timer_query_t; name:Pchar; mode:longint):longint;cdecl;external libasound;
function snd_timer_query_open_lconf(handle:PPsnd_timer_query_t; name:Pchar; mode:longint; lconf:Psnd_config_t):longint;cdecl;external libasound;
function snd_timer_query_close(handle:Psnd_timer_query_t):longint;cdecl;external libasound;
function snd_timer_query_next_device(handle:Psnd_timer_query_t; tid:Psnd_timer_id_t):longint;cdecl;external libasound;
function snd_timer_query_info(handle:Psnd_timer_query_t; info:Psnd_timer_ginfo_t):longint;cdecl;external libasound;
function snd_timer_query_params(handle:Psnd_timer_query_t; params:Psnd_timer_gparams_t):longint;cdecl;external libasound;
function snd_timer_query_status(handle:Psnd_timer_query_t; status:Psnd_timer_gstatus_t):longint;cdecl;external libasound;
function snd_timer_open(handle:PPsnd_timer_t; name:Pchar; mode:longint):longint;cdecl;external libasound;
function snd_timer_open_lconf(handle:PPsnd_timer_t; name:Pchar; mode:longint; lconf:Psnd_config_t):longint;cdecl;external libasound;
function snd_timer_close(handle:Psnd_timer_t):longint;cdecl;external libasound;
function snd_async_add_timer_handler(handler:PPsnd_async_handler_t; timer:Psnd_timer_t; callback:Tsnd_async_callback_t; private_data:pointer):longint;cdecl;external libasound;
function snd_async_handler_get_timer(handler:Psnd_async_handler_t):Psnd_timer_t;cdecl;external libasound;
function snd_timer_poll_descriptors_count(handle:Psnd_timer_t):longint;cdecl;external libasound;
function snd_timer_poll_descriptors(handle:Psnd_timer_t; pfds:Ppollfd; space:dword):longint;cdecl;external libasound;
function snd_timer_poll_descriptors_revents(timer:Psnd_timer_t; pfds:Ppollfd; nfds:dword; revents:Pword):longint;cdecl;external libasound;
function snd_timer_info(handle:Psnd_timer_t; timer:Psnd_timer_info_t):longint;cdecl;external libasound;
function snd_timer_params(handle:Psnd_timer_t; params:Psnd_timer_params_t):longint;cdecl;external libasound;
function snd_timer_status(handle:Psnd_timer_t; status:Psnd_timer_status_t):longint;cdecl;external libasound;
function snd_timer_start(handle:Psnd_timer_t):longint;cdecl;external libasound;
function snd_timer_stop(handle:Psnd_timer_t):longint;cdecl;external libasound;
function snd_timer_continue(handle:Psnd_timer_t):longint;cdecl;external libasound;
function snd_timer_read(handle:Psnd_timer_t; buffer:pointer; size:Tsize_t):Tssize_t;cdecl;external libasound;
function snd_timer_id_sizeof:Tsize_t;cdecl;external libasound;
{* allocate #snd_timer_id_t container on stack  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_timer_id_alloca(ptr : longint) : longint;

function snd_timer_id_malloc(ptr:PPsnd_timer_id_t):longint;cdecl;external libasound;
procedure snd_timer_id_free(obj:Psnd_timer_id_t);cdecl;external libasound;
procedure snd_timer_id_copy(dst:Psnd_timer_id_t; src:Psnd_timer_id_t);cdecl;external libasound;
procedure snd_timer_id_set_class(id:Psnd_timer_id_t; dev_class:longint);cdecl;external libasound;
function snd_timer_id_get_class(id:Psnd_timer_id_t):longint;cdecl;external libasound;
procedure snd_timer_id_set_sclass(id:Psnd_timer_id_t; dev_sclass:longint);cdecl;external libasound;
function snd_timer_id_get_sclass(id:Psnd_timer_id_t):longint;cdecl;external libasound;
procedure snd_timer_id_set_card(id:Psnd_timer_id_t; card:longint);cdecl;external libasound;
function snd_timer_id_get_card(id:Psnd_timer_id_t):longint;cdecl;external libasound;
procedure snd_timer_id_set_device(id:Psnd_timer_id_t; device:longint);cdecl;external libasound;
function snd_timer_id_get_device(id:Psnd_timer_id_t):longint;cdecl;external libasound;
procedure snd_timer_id_set_subdevice(id:Psnd_timer_id_t; subdevice:longint);cdecl;external libasound;
function snd_timer_id_get_subdevice(id:Psnd_timer_id_t):longint;cdecl;external libasound;
function snd_timer_ginfo_sizeof:Tsize_t;cdecl;external libasound;
{* allocate #snd_timer_ginfo_t container on stack  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_timer_ginfo_alloca(ptr : longint) : longint;

function snd_timer_ginfo_malloc(ptr:PPsnd_timer_ginfo_t):longint;cdecl;external libasound;
procedure snd_timer_ginfo_free(obj:Psnd_timer_ginfo_t);cdecl;external libasound;
procedure snd_timer_ginfo_copy(dst:Psnd_timer_ginfo_t; src:Psnd_timer_ginfo_t);cdecl;external libasound;
function snd_timer_ginfo_set_tid(obj:Psnd_timer_ginfo_t; tid:Psnd_timer_id_t):longint;cdecl;external libasound;
function snd_timer_ginfo_get_tid(obj:Psnd_timer_ginfo_t):Psnd_timer_id_t;cdecl;external libasound;
function snd_timer_ginfo_get_flags(obj:Psnd_timer_ginfo_t):dword;cdecl;external libasound;
function snd_timer_ginfo_get_card(obj:Psnd_timer_ginfo_t):longint;cdecl;external libasound;
function snd_timer_ginfo_get_id(obj:Psnd_timer_ginfo_t):Pchar;cdecl;external libasound;
function snd_timer_ginfo_get_name(obj:Psnd_timer_ginfo_t):Pchar;cdecl;external libasound;
function snd_timer_ginfo_get_resolution(obj:Psnd_timer_ginfo_t):dword;cdecl;external libasound;
function snd_timer_ginfo_get_resolution_min(obj:Psnd_timer_ginfo_t):dword;cdecl;external libasound;
function snd_timer_ginfo_get_resolution_max(obj:Psnd_timer_ginfo_t):dword;cdecl;external libasound;
function snd_timer_ginfo_get_clients(obj:Psnd_timer_ginfo_t):dword;cdecl;external libasound;
function snd_timer_info_sizeof:Tsize_t;cdecl;external libasound;
{* allocate #snd_timer_info_t container on stack  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_timer_info_alloca(ptr : longint) : longint;

function snd_timer_info_malloc(ptr:PPsnd_timer_info_t):longint;cdecl;external libasound;
procedure snd_timer_info_free(obj:Psnd_timer_info_t);cdecl;external libasound;
procedure snd_timer_info_copy(dst:Psnd_timer_info_t; src:Psnd_timer_info_t);cdecl;external libasound;
function snd_timer_info_is_slave(info:Psnd_timer_info_t):longint;cdecl;external libasound;
function snd_timer_info_get_card(info:Psnd_timer_info_t):longint;cdecl;external libasound;
function snd_timer_info_get_id(info:Psnd_timer_info_t):Pchar;cdecl;external libasound;
function snd_timer_info_get_name(info:Psnd_timer_info_t):Pchar;cdecl;external libasound;
function snd_timer_info_get_resolution(info:Psnd_timer_info_t):longint;cdecl;external libasound;
function snd_timer_params_sizeof:Tsize_t;cdecl;external libasound;
{* allocate #snd_timer_params_t container on stack  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_timer_params_alloca(ptr : longint) : longint;

function snd_timer_params_malloc(ptr:PPsnd_timer_params_t):longint;cdecl;external libasound;
procedure snd_timer_params_free(obj:Psnd_timer_params_t);cdecl;external libasound;
procedure snd_timer_params_copy(dst:Psnd_timer_params_t; src:Psnd_timer_params_t);cdecl;external libasound;
function snd_timer_params_set_auto_start(params:Psnd_timer_params_t; auto_start:longint):longint;cdecl;external libasound;
function snd_timer_params_get_auto_start(params:Psnd_timer_params_t):longint;cdecl;external libasound;
function snd_timer_params_set_exclusive(params:Psnd_timer_params_t; exclusive:longint):longint;cdecl;external libasound;
function snd_timer_params_get_exclusive(params:Psnd_timer_params_t):longint;cdecl;external libasound;
function snd_timer_params_set_early_event(params:Psnd_timer_params_t; early_event:longint):longint;cdecl;external libasound;
function snd_timer_params_get_early_event(params:Psnd_timer_params_t):longint;cdecl;external libasound;
procedure snd_timer_params_set_ticks(params:Psnd_timer_params_t; ticks:longint);cdecl;external libasound;
function snd_timer_params_get_ticks(params:Psnd_timer_params_t):longint;cdecl;external libasound;
procedure snd_timer_params_set_queue_size(params:Psnd_timer_params_t; queue_size:longint);cdecl;external libasound;
function snd_timer_params_get_queue_size(params:Psnd_timer_params_t):longint;cdecl;external libasound;
procedure snd_timer_params_set_filter(params:Psnd_timer_params_t; filter:dword);cdecl;external libasound;
function snd_timer_params_get_filter(params:Psnd_timer_params_t):dword;cdecl;external libasound;
function snd_timer_status_sizeof:Tsize_t;cdecl;external libasound;
{* allocate #snd_timer_status_t container on stack  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_timer_status_alloca(ptr : longint) : longint;

function snd_timer_status_malloc(ptr:PPsnd_timer_status_t):longint;cdecl;external libasound;
procedure snd_timer_status_free(obj:Psnd_timer_status_t);cdecl;external libasound;
procedure snd_timer_status_copy(dst:Psnd_timer_status_t; src:Psnd_timer_status_t);cdecl;external libasound;
function snd_timer_status_get_timestamp(status:Psnd_timer_status_t):Tsnd_htimestamp_t;cdecl;external libasound;
function snd_timer_status_get_resolution(status:Psnd_timer_status_t):longint;cdecl;external libasound;
function snd_timer_status_get_lost(status:Psnd_timer_status_t):longint;cdecl;external libasound;
function snd_timer_status_get_overrun(status:Psnd_timer_status_t):longint;cdecl;external libasound;
function snd_timer_status_get_queue(status:Psnd_timer_status_t):longint;cdecl;external libasound;
{ deprecated functions, for compatibility  }
function snd_timer_info_get_ticks(info:Psnd_timer_info_t):longint;cdecl;external libasound;
{* \  }
{ C++ end of extern C conditionnal removed }
{$endif}
{* __ALSA_TIMER_H  }

// === Konventiert am: 19-11-25 16:11:35 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_timer_id_alloca(ptr : longint) : longint;
begin
  snd_timer_id_alloca:=__snd_alloca(ptr,snd_timer_id);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_timer_ginfo_alloca(ptr : longint) : longint;
begin
  snd_timer_ginfo_alloca:=__snd_alloca(ptr,snd_timer_ginfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_timer_info_alloca(ptr : longint) : longint;
begin
  snd_timer_info_alloca:=__snd_alloca(ptr,snd_timer_info);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_timer_params_alloca(ptr : longint) : longint;
begin
  snd_timer_params_alloca:=__snd_alloca(ptr,snd_timer_params);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_timer_status_alloca(ptr : longint) : longint;
begin
  snd_timer_status_alloca:=__snd_alloca(ptr,snd_timer_status);
end;


end.
