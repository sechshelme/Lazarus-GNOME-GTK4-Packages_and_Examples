
unit pcm_rate;
interface

{
  Automatically converted by H2Pas 1.0.0 from pcm_rate.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pcm_rate.h
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
Pdword  = ^dword;
Pint16_t  = ^int16_t;
Psnd_config_t  = ^snd_config_t;
Psnd_output_t  = ^snd_output_t;
Psnd_pcm_channel_area_t  = ^snd_pcm_channel_area_t;
Psnd_pcm_rate_info  = ^snd_pcm_rate_info;
Psnd_pcm_rate_info_t  = ^snd_pcm_rate_info_t;
Psnd_pcm_rate_old_ops  = ^snd_pcm_rate_old_ops;
Psnd_pcm_rate_old_ops_t  = ^snd_pcm_rate_old_ops_t;
Psnd_pcm_rate_ops  = ^snd_pcm_rate_ops;
Psnd_pcm_rate_ops_t  = ^snd_pcm_rate_ops_t;
Psnd_pcm_rate_side_info  = ^snd_pcm_rate_side_info;
Psnd_pcm_rate_side_info_t  = ^snd_pcm_rate_side_info_t;
Psnd_pcm_rate_v2_ops  = ^snd_pcm_rate_v2_ops;
Psnd_pcm_rate_v2_ops_t  = ^snd_pcm_rate_v2_ops_t;
Puint64_t  = ^uint64_t;
Pxxxxxxxxx  = ^xxxxxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file include/pcm_rate.h
 * \brief External Rate-Converter-Plugin SDK
 * \author Takashi Iwai <tiwai@suse.de>
 * \date 2006
 *
 * External Rate-Converter-Plugin SDK
  }
{
 * ALSA external PCM rate-converter plugin SDK (draft version)
 *
 * Copyright (c) 2006 Takashi Iwai <tiwai@suse.de>
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
{$ifndef __ALSA_PCM_RATE_H}
{$define __ALSA_PCM_RATE_H}
{ C++ extern C conditionnal removed }
{*
 * Protocol version
  }

const
  SND_PCM_RATE_PLUGIN_VERSION = $010003;  
{* hw_params information for a single side  }
type
  Psnd_pcm_rate_side_info = ^Tsnd_pcm_rate_side_info;
  Tsnd_pcm_rate_side_info = record
      format : Tsnd_pcm_format_t;
      rate : dword;
      buffer_size : Tsnd_pcm_uframes_t;
      period_size : Tsnd_pcm_uframes_t;
    end;
  Tsnd_pcm_rate_side_info_t = Tsnd_pcm_rate_side_info;
  Psnd_pcm_rate_side_info_t = ^Tsnd_pcm_rate_side_info_t;
{* hw_params information  }

  Psnd_pcm_rate_info = ^Tsnd_pcm_rate_info;
  Tsnd_pcm_rate_info = record
      in : Tsnd_pcm_rate_side_info;
      out : Tsnd_pcm_rate_side_info;
      channels : dword;
    end;
  Tsnd_pcm_rate_info_t = Tsnd_pcm_rate_info;
  Psnd_pcm_rate_info_t = ^Tsnd_pcm_rate_info_t;
{* only interleaved format  }
{* both input and output formats have to be identical  }
  Txxxxxxxxx =  Longint;
  Const
    SND_PCM_RATE_FLAG_INTERLEAVED = 1 shl 0;
    SND_PCM_RATE_FLAG_SYNC_FORMATS = 1 shl 1;

{* Callback table of rate-converter  }
{*
	 * close the converter; optional
	  }
{*
	 * initialize the converter, called at hw_params
	  }
{*
	 * free the converter; optional
	  }
{*
	 * reset the converter, called at prepare; optional
	  }
{*
	 * adjust the pitch, called at sw_params; optional
	  }
{*
	 * convert the data
	  }
(* Const before type ignored *)
(* Const before type ignored *)
{*
	 * convert an s16 interleaved-data array; exclusive with convert
	  }
(* Const before type ignored *)
{*
	 * compute the frame size for input
	  }
{*
	 * compute the frame size for output
	  }
{*
	 * the protocol version the plugin supports;
	 * new field since version 0x010002
	  }
{*
	 * return the supported min / max sample rates;
	 * new ops since version 0x010002
	  }
{*
	 * show some status messages for verbose mode;
	 * new ops since version 0x010002
	  }
{*
	 * get the supported input and output formats (optional);
	 * new ops since version 0x010003
	  }
type
  Psnd_pcm_rate_ops = ^Tsnd_pcm_rate_ops;
  Tsnd_pcm_rate_ops = record
      close : procedure (obj:pointer);cdecl;
      init : function (obj:pointer; info:Psnd_pcm_rate_info_t):longint;cdecl;
      free : procedure (obj:pointer);cdecl;
      reset : procedure (obj:pointer);cdecl;
      adjust_pitch : function (obj:pointer; info:Psnd_pcm_rate_info_t):longint;cdecl;
      convert : procedure (obj:pointer; dst_areas:Psnd_pcm_channel_area_t; dst_offset:Tsnd_pcm_uframes_t; dst_frames:dword; src_areas:Psnd_pcm_channel_area_t; 
                    src_offset:Tsnd_pcm_uframes_t; src_frames:dword);cdecl;
      convert_s16 : procedure (obj:pointer; dst:Pint16_t; dst_frames:dword; src:Pint16_t; src_frames:dword);cdecl;
      input_frames : function (obj:pointer; frames:Tsnd_pcm_uframes_t):Tsnd_pcm_uframes_t;cdecl;
      output_frames : function (obj:pointer; frames:Tsnd_pcm_uframes_t):Tsnd_pcm_uframes_t;cdecl;
      version : dword;
      get_supported_rates : function (obj:pointer; rate_min:Pdword; rate_max:Pdword):longint;cdecl;
      dump : procedure (obj:pointer; out:Psnd_output_t);cdecl;
      get_supported_formats : function (obj:pointer; in_formats:Puint64_t; out_formats:Puint64_t; flags:Pdword):longint;cdecl;
    end;
  Tsnd_pcm_rate_ops_t = Tsnd_pcm_rate_ops;
  Psnd_pcm_rate_ops_t = ^Tsnd_pcm_rate_ops_t;
{* open function type  }

  Tsnd_pcm_rate_open_func_t = function (version:dword; objp:Ppointer; opsp:Psnd_pcm_rate_ops_t):longint;cdecl;
(* Const before type ignored *)

  Tsnd_pcm_rate_open_conf_func_t = function (version:dword; objp:Ppointer; opsp:Psnd_pcm_rate_ops_t; conf:Psnd_config_t):longint;cdecl;
{*
 * Define the object entry for external PCM rate-converter plugins
  }
{$ifndef DOC_HIDDEN}
{ old rate_ops for protocol version 0x010001  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type
  Psnd_pcm_rate_old_ops = ^Tsnd_pcm_rate_old_ops;
  Tsnd_pcm_rate_old_ops = record
      close : procedure (obj:pointer);cdecl;
      init : function (obj:pointer; info:Psnd_pcm_rate_info_t):longint;cdecl;
      free : procedure (obj:pointer);cdecl;
      reset : procedure (obj:pointer);cdecl;
      adjust_pitch : function (obj:pointer; info:Psnd_pcm_rate_info_t):longint;cdecl;
      convert : procedure (obj:pointer; dst_areas:Psnd_pcm_channel_area_t; dst_offset:Tsnd_pcm_uframes_t; dst_frames:dword; src_areas:Psnd_pcm_channel_area_t; 
                    src_offset:Tsnd_pcm_uframes_t; src_frames:dword);cdecl;
      convert_s16 : procedure (obj:pointer; dst:Pint16_t; dst_frames:dword; src:Pint16_t; src_frames:dword);cdecl;
      input_frames : function (obj:pointer; frames:Tsnd_pcm_uframes_t):Tsnd_pcm_uframes_t;cdecl;
      output_frames : function (obj:pointer; frames:Tsnd_pcm_uframes_t):Tsnd_pcm_uframes_t;cdecl;
    end;
  Tsnd_pcm_rate_old_ops_t = Tsnd_pcm_rate_old_ops;
  Psnd_pcm_rate_old_ops_t = ^Tsnd_pcm_rate_old_ops_t;
{ old rate_ops for protocol version 0x010002  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  Psnd_pcm_rate_v2_ops = ^Tsnd_pcm_rate_v2_ops;
  Tsnd_pcm_rate_v2_ops = record
      close : procedure (obj:pointer);cdecl;
      init : function (obj:pointer; info:Psnd_pcm_rate_info_t):longint;cdecl;
      free : procedure (obj:pointer);cdecl;
      reset : procedure (obj:pointer);cdecl;
      adjust_pitch : function (obj:pointer; info:Psnd_pcm_rate_info_t):longint;cdecl;
      convert : procedure (obj:pointer; dst_areas:Psnd_pcm_channel_area_t; dst_offset:Tsnd_pcm_uframes_t; dst_frames:dword; src_areas:Psnd_pcm_channel_area_t; 
                    src_offset:Tsnd_pcm_uframes_t; src_frames:dword);cdecl;
      convert_s16 : procedure (obj:pointer; dst:Pint16_t; dst_frames:dword; src:Pint16_t; src_frames:dword);cdecl;
      input_frames : function (obj:pointer; frames:Tsnd_pcm_uframes_t):Tsnd_pcm_uframes_t;cdecl;
      output_frames : function (obj:pointer; frames:Tsnd_pcm_uframes_t):Tsnd_pcm_uframes_t;cdecl;
      version : dword;
      get_supported_rates : function (obj:pointer; rate_min:Pdword; rate_max:Pdword):longint;cdecl;
      dump : procedure (obj:pointer; out:Psnd_output_t);cdecl;
    end;
  Tsnd_pcm_rate_v2_ops_t = Tsnd_pcm_rate_v2_ops;
  Psnd_pcm_rate_v2_ops_t = ^Tsnd_pcm_rate_v2_ops_t;
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}
{ __ALSA_PCM_RATE_H  }

implementation


end.
