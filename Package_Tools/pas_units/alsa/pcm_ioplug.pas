unit pcm_ioplug;

interface

uses
  fp_asound;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file include/pcm_ioplug.h
 * \brief External I/O-Plugin SDK
 * \author Takashi Iwai <tiwai@suse.de>
 * \date 2005
 *
 * External I/O-Plugin SDK
  }
{
 * ALSA external PCM plugin SDK
 *
 * Copyright (c) 2005 Takashi Iwai <tiwai@suse.de>
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
{$ifndef __ALSA_PCM_IOPLUG_H}
{$define __ALSA_PCM_IOPLUG_H}
{*
 * \defgroup PCM_IOPlug External I/O plugin SDK
 * \ingroup Plugin_SDK
 * See the \ref pcm page for more details.
 * \
  }
{* hw constraints for ioplug  }
{*< access type  }
{*< format  }
{*< channels  }
{*< rate  }
{*< period bytes  }
{*< buffer bytes  }
{*< number of periods  }
{*< max number of hw constraints  }
type
  Txxxxxxx =  Longint;
  Const
    SND_PCM_IOPLUG_HW_ACCESS = 0;
    SND_PCM_IOPLUG_HW_FORMAT = 1;
    SND_PCM_IOPLUG_HW_CHANNELS = 2;
    SND_PCM_IOPLUG_HW_RATE = 3;
    SND_PCM_IOPLUG_HW_PERIOD_BYTES = 4;
    SND_PCM_IOPLUG_HW_BUFFER_BYTES = 5;
    SND_PCM_IOPLUG_HW_PERIODS = 6;
    SND_PCM_IOPLUG_HW_PARAMS = 7;

{* I/O plugin handle  }
type
  Tsnd_pcm_ioplug = Tsnd_pcm_ioplug_t;
{* Callback table of ioplug  }
  Tsnd_pcm_ioplug_callback = Tsnd_pcm_ioplug_callback_t;
{$ifdef DOC_HIDDEN}
{ redefine typedefs for stupid doxygen  }

  Psnd_pcm_ioplug_t = ^Tsnd_pcm_ioplug_t;
  Tsnd_pcm_ioplug_t = Tsnd_pcm_ioplug;

  Psnd_pcm_ioplug_callback_t = ^Tsnd_pcm_ioplug_callback_t;
  Tsnd_pcm_ioplug_callback_t = Tsnd_pcm_ioplug_callback;
{$endif}
{
 * bit flags for additional conditions
  }
{*< list up this PCM  }

const
  SND_PCM_IOPLUG_FLAG_LISTED = 1 shl 0;  
{*< monotonic timestamps  }
  SND_PCM_IOPLUG_FLAG_MONOTONIC = 1 shl 1;  
{* hw pointer wrap around at boundary instead of buffer_size  }
  SND_PCM_IOPLUG_FLAG_BOUNDARY_WA = 1 shl 2;  
{
 * Protocol version
  }
{*< Protocol major version  }
  SND_PCM_IOPLUG_VERSION_MAJOR = 1;  
{*< Protocol minor version  }
  SND_PCM_IOPLUG_VERSION_MINOR = 0;  
{*< Protocol tiny version  }
  SND_PCM_IOPLUG_VERSION_TINY = 2;  
{*
 * IO-plugin protocol version
  }
  SND_PCM_IOPLUG_VERSION = ((SND_PCM_IOPLUG_VERSION_MAJOR shl 16) or (SND_PCM_IOPLUG_VERSION_MINOR shl 8)) or SND_PCM_IOPLUG_VERSION_TINY;  
{* Handle of ioplug  }
{*
	 * protocol version; #SND_PCM_IOPLUG_VERSION must be filled here
	 * before calling #snd_pcm_ioplug_create()
	  }
{*
	 * name of this plugin; must be filled before calling #snd_pcm_ioplug_create()
	  }
{*< SND_PCM_IOPLUG_FLAG_XXX  }
{*< poll file descriptor  }
{*< poll events  }
{*< pseudo mmap mode  }
{*
	 * callbacks of this plugin; must be filled before calling #snd_pcm_ioplug_create()
	  }
{*
	 * private data, which can be used freely in the driver callbacks
	  }
{*
	 * PCM handle filled by #snd_pcm_ioplug_create()
	  }
{*< stream direcion; read-only  }{*< current PCM state; read-only  }
{*< application pointer; read-only  }
{*< hw pointer; read-only  }
{*< non-block mode; read-only  }
{*< access type; filled after hw_params is called  }
{*< PCM format; filled after hw_params is called  }
{*< number of channels; filled after hw_params is called  }
{*< rate; filled after hw_params is called  }
{*< period size; filled after hw_params is called  }
{*< buffer size; filled after hw_params is called  }
type
  Psnd_pcm_ioplug = ^Tsnd_pcm_ioplug;
  Tsnd_pcm_ioplug = record
      version : dword;
      name : Pchar;
      flags : dword;
      poll_fd : longint;
      poll_events : dword;
      mmap_rw : dword;
      callback : Psnd_pcm_ioplug_callback_t;
      private_data : pointer;
      pcm : Psnd_pcm_t;
      stream : Tsnd_pcm_stream_t;
      state : Tsnd_pcm_state_t;
      appl_ptr : Tsnd_pcm_uframes_t;
      hw_ptr : Tsnd_pcm_uframes_t;
      nonblock : longint;
      access : Tsnd_pcm_access_t;
      format : Tsnd_pcm_format_t;
      channels : dword;
      rate : dword;
      period_size : Tsnd_pcm_uframes_t;
      buffer_size : Tsnd_pcm_uframes_t;
    end;

{* Callback table of ioplug  }
{*
	 * start the PCM; required, called inside mutex lock
	  }
{*
	 * stop the PCM; required, called inside mutex lock
	  }
{*
	 * get the current DMA position; required, called inside mutex lock
	 * \return buffer position up to buffer_size or
	 * when #SND_PCM_IOPLUG_FLAG_BOUNDARY_WA flag is set up to boundary or
	 * a negative error code for Xrun
	  }
{*
	 * transfer the data; optional, called inside mutex lock
	  }
{*
	 * close the PCM; optional
	  }
{*
	 * hw_params; optional
	  }
{*
	 * hw_free; optional
	  }
{*
	 * sw_params; optional
	  }
{*
	 * prepare; optional
	  }
{*
	 * drain; optional
	  }
{*
	 * toggle pause; optional, called inside mutex lock
	  }
{*
	 * resume; optional
	  }
{*
	 * poll descriptors count; optional
	  }
{*
	 * poll descriptors; optional
	  }
{*
	 * mangle poll events; optional
	  }
{*
	 * dump; optional
	  }
{*
	 * get the delay for the running PCM; optional; since v1.0.1
	  }
{*
	 * query the channel maps; optional; since v1.0.2
	  }
{*
	 * get the channel map; optional; since v1.0.2
	  }
{*
	 * set the channel map; optional; since v1.0.2
	  }
  Psnd_pcm_ioplug_callback = ^Tsnd_pcm_ioplug_callback;
  Tsnd_pcm_ioplug_callback = record
      start : function (io:Psnd_pcm_ioplug_t):longint;cdecl;
      stop : function (io:Psnd_pcm_ioplug_t):longint;cdecl;
      pointer : function (io:Psnd_pcm_ioplug_t):Tsnd_pcm_sframes_t;cdecl;
      transfer : function (io:Psnd_pcm_ioplug_t; areas:Psnd_pcm_channel_area_t; offset:Tsnd_pcm_uframes_t; size:Tsnd_pcm_uframes_t):Tsnd_pcm_sframes_t;cdecl;
      close : function (io:Psnd_pcm_ioplug_t):longint;cdecl;
      hw_params : function (io:Psnd_pcm_ioplug_t; params:Psnd_pcm_hw_params_t):longint;cdecl;
      hw_free : function (io:Psnd_pcm_ioplug_t):longint;cdecl;
      sw_params : function (io:Psnd_pcm_ioplug_t; params:Psnd_pcm_sw_params_t):longint;cdecl;
      prepare : function (io:Psnd_pcm_ioplug_t):longint;cdecl;
      drain : function (io:Psnd_pcm_ioplug_t):longint;cdecl;
      pause : function (io:Psnd_pcm_ioplug_t; enable:longint):longint;cdecl;
      resume : function (io:Psnd_pcm_ioplug_t):longint;cdecl;
      poll_descriptors_count : function (io:Psnd_pcm_ioplug_t):longint;cdecl;
      poll_descriptors : function (io:Psnd_pcm_ioplug_t; pfd:Ppollfd; space:dword):longint;cdecl;
      poll_revents : function (io:Psnd_pcm_ioplug_t; pfd:Ppollfd; nfds:dword; revents:Pword):longint;cdecl;
      dump : procedure (io:Psnd_pcm_ioplug_t; out:Psnd_output_t);cdecl;
      delay : function (io:Psnd_pcm_ioplug_t; delayp:Psnd_pcm_sframes_t):longint;cdecl;
      query_chmaps : function (io:Psnd_pcm_ioplug_t):PPsnd_pcm_chmap_query_t;cdecl;
      get_chmap : function (io:Psnd_pcm_ioplug_t):Psnd_pcm_chmap_t;cdecl;
      set_chmap : function (io:Psnd_pcm_ioplug_t; map:Psnd_pcm_chmap_t):longint;cdecl;
    end;


function snd_pcm_ioplug_create(io:Psnd_pcm_ioplug_t; name:Pchar; stream:Tsnd_pcm_stream_t; mode:longint):longint;cdecl;external libasound;
function snd_pcm_ioplug_delete(io:Psnd_pcm_ioplug_t):longint;cdecl;external libasound;
{ update poll_fd and mmap_rw  }
function snd_pcm_ioplug_reinit_status(ioplug:Psnd_pcm_ioplug_t):longint;cdecl;external libasound;
{ get a mmap area (for mmap_rw only)  }
function snd_pcm_ioplug_mmap_areas(ioplug:Psnd_pcm_ioplug_t):Psnd_pcm_channel_area_t;cdecl;external libasound;
{ clear hw_parameter setting  }
procedure snd_pcm_ioplug_params_reset(io:Psnd_pcm_ioplug_t);cdecl;external libasound;
{ hw_parameter setting  }
function snd_pcm_ioplug_set_param_minmax(io:Psnd_pcm_ioplug_t; _type:longint; min:dword; max:dword):longint;cdecl;external libasound;
function snd_pcm_ioplug_set_param_list(io:Psnd_pcm_ioplug_t; _type:longint; num_list:dword; list:Pdword):longint;cdecl;external libasound;
{ change PCM status  }
function snd_pcm_ioplug_set_state(ioplug:Psnd_pcm_ioplug_t; state:Tsnd_pcm_state_t):longint;cdecl;external libasound;
{ calucalte the available frames  }
function snd_pcm_ioplug_avail(ioplug:Psnd_pcm_ioplug_t; hw_ptr:Tsnd_pcm_uframes_t; appl_ptr:Tsnd_pcm_uframes_t):Tsnd_pcm_uframes_t;cdecl;external libasound;
function snd_pcm_ioplug_hw_avail(ioplug:Psnd_pcm_ioplug_t; hw_ptr:Tsnd_pcm_uframes_t; appl_ptr:Tsnd_pcm_uframes_t):Tsnd_pcm_uframes_t;cdecl;external libasound;
{* \  }
{$endif}
{ __ALSA_PCM_IOPLUG_H  }

// === Konventiert am: 19-11-25 16:11:59 ===


implementation



end.
