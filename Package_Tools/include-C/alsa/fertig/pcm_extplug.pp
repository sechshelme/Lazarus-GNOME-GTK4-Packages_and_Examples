
unit pcm_extplug;
interface

{
  Automatically converted by H2Pas 1.0.0 from pcm_extplug.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pcm_extplug.h
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
Pdword  = ^dword;
Psnd_config_t  = ^snd_config_t;
Psnd_output_t  = ^snd_output_t;
Psnd_pcm_channel_area_t  = ^snd_pcm_channel_area_t;
Psnd_pcm_chmap_query_t  = ^snd_pcm_chmap_query_t;
Psnd_pcm_chmap_t  = ^snd_pcm_chmap_t;
Psnd_pcm_extplug  = ^snd_pcm_extplug;
Psnd_pcm_extplug_callback  = ^snd_pcm_extplug_callback;
Psnd_pcm_extplug_callback_t  = ^snd_pcm_extplug_callback_t;
Psnd_pcm_extplug_t  = ^snd_pcm_extplug_t;
Psnd_pcm_hw_params_t  = ^snd_pcm_hw_params_t;
Psnd_pcm_t  = ^snd_pcm_t;
Pxxxxxx  = ^xxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file include/pcm_extplug.h
 * \brief External Filter-Plugin SDK
 * \author Takashi Iwai <tiwai@suse.de>
 * \date 2005
 *
 * External Filter-Plugin SDK
  }
{
 * ALSA external PCM plugin SDK (draft version)
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
{$ifndef __ALSA_PCM_EXTPLUG_H}
{$define __ALSA_PCM_EXTPLUG_H}
{*
 * \defgroup PCM_ExtPlug External Filter plugin SDK
 * \ingroup Plugin_SDK
 * See the \ref pcm page for more details.
 * \
  }
{* hw constraints for extplug  }
{*< format  }
{*< channels  }
{*< max number of hw constraints  }
type
  Txxxxxx =  Longint;
  Const
    SND_PCM_EXTPLUG_HW_FORMAT = 0;
    SND_PCM_EXTPLUG_HW_CHANNELS = 1;
    SND_PCM_EXTPLUG_HW_PARAMS = 2;

{* Handle of external filter plugin  }
type
  Tsnd_pcm_extplug = Tsnd_pcm_extplug_t;
{* Callback table of extplug  }
  Tsnd_pcm_extplug_callback = Tsnd_pcm_extplug_callback_t;
{$ifdef DOC_HIDDEN}
{ redefine typedefs for stupid doxygen  }

  Psnd_pcm_extplug_t = ^Tsnd_pcm_extplug_t;
  Tsnd_pcm_extplug_t = Tsnd_pcm_extplug;

  Psnd_pcm_extplug_callback_t = ^Tsnd_pcm_extplug_callback_t;
  Tsnd_pcm_extplug_callback_t = Tsnd_pcm_extplug_callback;
{$endif}
{
 * Protocol version
  }
{*< Protocol major version  }

const
  SND_PCM_EXTPLUG_VERSION_MAJOR = 1;  
{*< Protocol minor version  }
  SND_PCM_EXTPLUG_VERSION_MINOR = 0;  
{*< Protocol tiny version  }
  SND_PCM_EXTPLUG_VERSION_TINY = 2;  
{*
 * Filter-plugin protocol version
  }
  SND_PCM_EXTPLUG_VERSION = ((SND_PCM_EXTPLUG_VERSION_MAJOR shl 16) or (SND_PCM_EXTPLUG_VERSION_MINOR shl 8)) or SND_PCM_EXTPLUG_VERSION_TINY;  
{* Handle of extplug  }
{*
	 * protocol version; #SND_PCM_EXTPLUG_VERSION must be filled here
	 * before calling #snd_pcm_extplug_create()
	  }
{*
	 * name of this plugin; must be filled before calling #snd_pcm_extplug_create()
	  }
(* Const before type ignored *)
{*
	 * callbacks of this plugin; must be filled before calling #snd_pcm_extplug_create()
	  }
(* Const before type ignored *)
{*
	 * private data, which can be used freely in the driver callbacks
	  }
{*
	 * PCM handle filled by #snd_pcm_extplug_create()
	  }
{*
	 * stream direction; read-only status
	  }
{*
	 * format hw parameter; filled after hw_params is caled
	  }
{*
	 * subformat hw parameter; filled after hw_params is caled
	  }
{*
	 * channels hw parameter; filled after hw_params is caled
	  }
{*
	 * rate hw parameter; filled after hw_params is caled
	  }
{*
	 * slave_format hw parameter; filled after hw_params is caled
	  }
{*
	 * slave_subformat hw parameter; filled after hw_params is caled
	  }
{*
	 * slave_channels hw parameter; filled after hw_params is caled
	  }
type
  Psnd_pcm_extplug = ^Tsnd_pcm_extplug;
  Tsnd_pcm_extplug = record
      version : dword;
      name : Pchar;
      callback : Psnd_pcm_extplug_callback_t;
      private_data : pointer;
      pcm : Psnd_pcm_t;
      stream : Tsnd_pcm_stream_t;
      format : Tsnd_pcm_format_t;
      subformat : Tsnd_pcm_subformat_t;
      channels : dword;
      rate : dword;
      slave_format : Tsnd_pcm_format_t;
      slave_subformat : Tsnd_pcm_subformat_t;
      slave_channels : dword;
    end;

{* Callback table of extplug  }
{*
	 * transfer between source and destination; this is a required callback
	  }
(* Const before type ignored *)
(* Const before type ignored *)
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
	 * dump; optional
	  }
{*
	 * init; optional initialization called at prepare or reset
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
(* Const before type ignored *)
  Psnd_pcm_extplug_callback = ^Tsnd_pcm_extplug_callback;
  Tsnd_pcm_extplug_callback = record
      transfer : function (ext:Psnd_pcm_extplug_t; dst_areas:Psnd_pcm_channel_area_t; dst_offset:Tsnd_pcm_uframes_t; src_areas:Psnd_pcm_channel_area_t; src_offset:Tsnd_pcm_uframes_t; 
                   size:Tsnd_pcm_uframes_t):Tsnd_pcm_sframes_t;cdecl;
      close : function (ext:Psnd_pcm_extplug_t):longint;cdecl;
      hw_params : function (ext:Psnd_pcm_extplug_t; params:Psnd_pcm_hw_params_t):longint;cdecl;
      hw_free : function (ext:Psnd_pcm_extplug_t):longint;cdecl;
      dump : procedure (ext:Psnd_pcm_extplug_t; out:Psnd_output_t);cdecl;
      init : function (ext:Psnd_pcm_extplug_t):longint;cdecl;
      query_chmaps : function (ext:Psnd_pcm_extplug_t):PPsnd_pcm_chmap_query_t;cdecl;
      get_chmap : function (ext:Psnd_pcm_extplug_t):Psnd_pcm_chmap_t;cdecl;
      set_chmap : function (ext:Psnd_pcm_extplug_t; map:Psnd_pcm_chmap_t):longint;cdecl;
    end;

(* Const before type ignored *)

function snd_pcm_extplug_create(ext:Psnd_pcm_extplug_t; name:Pchar; root:Psnd_config_t; slave_conf:Psnd_config_t; stream:Tsnd_pcm_stream_t; 
           mode:longint):longint;cdecl;external;
function snd_pcm_extplug_delete(ext:Psnd_pcm_extplug_t):longint;cdecl;external;
{ clear hw_parameter setting  }
procedure snd_pcm_extplug_params_reset(ext:Psnd_pcm_extplug_t);cdecl;external;
{ hw_parameter setting  }
(* Const before type ignored *)
function snd_pcm_extplug_set_param_list(extplug:Psnd_pcm_extplug_t; _type:longint; num_list:dword; list:Pdword):longint;cdecl;external;
function snd_pcm_extplug_set_param_minmax(extplug:Psnd_pcm_extplug_t; _type:longint; min:dword; max:dword):longint;cdecl;external;
(* Const before type ignored *)
function snd_pcm_extplug_set_slave_param_list(extplug:Psnd_pcm_extplug_t; _type:longint; num_list:dword; list:Pdword):longint;cdecl;external;
function snd_pcm_extplug_set_slave_param_minmax(extplug:Psnd_pcm_extplug_t; _type:longint; min:dword; max:dword):longint;cdecl;external;
function snd_pcm_extplug_set_param_link(extplug:Psnd_pcm_extplug_t; _type:longint; keep_link:longint):longint;cdecl;external;
{*
 * set the parameter constraint with a single value
  }
{xxxxxxxxxxx
static __inline__ int snd_pcm_extplug_set_param(snd_pcm_extplug_t *extplug, int type, unsigned int val)

	return snd_pcm_extplug_set_param_list(extplug, type, 1, &val);


static __inline__ int snd_pcm_extplug_set_slave_param(snd_pcm_extplug_t *extplug, int type, unsigned int val)

	return snd_pcm_extplug_set_slave_param_list(extplug, type, 1, &val);

 }
{* \  }
{$endif}
{ __ALSA_PCM_EXTPLUG_H  }

implementation


end.
