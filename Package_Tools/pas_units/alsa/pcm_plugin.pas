unit pcm_plugin;

interface

uses
  fp_asound;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file include/pcm_plugin.h
 * \brief Common PCM plugin code
 * \author Abramo Bagnara <abramo@alsa-project.org>
 * \author Jaroslav Kysela <perex@perex.cz>
 * \date 2000-2001
 *
 * Application interface library for the ALSA driver.
 * See the \ref pcm_plugins page for more details.
 *
 * \warning Using of contents of this header file might be dangerous
 *	    in the sense of compatibility reasons. The contents might be
 *	    freely changed in future.
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
{$ifndef __ALSA_PCM_PLUGIN_H}
{$define __ALSA_PCM_PLUGIN_H}
{*
 * \defgroup PCM_Plugins PCM Plugins
 * \ingroup PCM
 * See the \ref pcm_plugins page for more details.
 * \
  }
{*< minimal rate for the rate plugin  }

const
  SND_PCM_PLUGIN_RATE_MIN = 4000;  
{*< maximal rate for the rate plugin  }
  SND_PCM_PLUGIN_RATE_MAX = 768000;  
{ ROUTE_FLOAT should be set to 0 for machines without FP unit - like iPAQ  }
{$ifdef HAVE_SOFT_FLOAT}
{*< use integers for route plugin  }
  SND_PCM_PLUGIN_ROUTE_FLOAT = 0;  
{$else}
{*< use floats for route plugin  }

const
  SND_PCM_PLUGIN_ROUTE_FLOAT = 1;  
{$endif}
{*< integer resolution for route plugin  }

const
  SND_PCM_PLUGIN_ROUTE_RESOLUTION = 16;  
{$if SND_PCM_PLUGIN_ROUTE_FLOAT}
{* route ttable entry type  }
type
  Psnd_pcm_route_ttable_entry_t = ^Tsnd_pcm_route_ttable_entry_t;
  Tsnd_pcm_route_ttable_entry_t = single;
{*< half value  }

const
  SND_PCM_PLUGIN_ROUTE_HALF = 0.5;  
{*< full value  }
  SND_PCM_PLUGIN_ROUTE_FULL = 1.0;  
{$else}
{* route ttable entry type  }
type
  Psnd_pcm_route_ttable_entry_t = ^Tsnd_pcm_route_ttable_entry_t;
  Tsnd_pcm_route_ttable_entry_t = longint;
{*< half value  }

const
  SND_PCM_PLUGIN_ROUTE_HALF = SND_PCM_PLUGIN_ROUTE_RESOLUTION/2;  
{*< full value  }
  SND_PCM_PLUGIN_ROUTE_FULL = SND_PCM_PLUGIN_ROUTE_RESOLUTION;  
{$endif}
{
 *  Hardware plugin
  }

function snd_pcm_hw_open(pcmp:PPsnd_pcm_t; name:Pchar; card:longint; device:longint; subdevice:longint; 
           stream:Tsnd_pcm_stream_t; mode:longint; mmap_emulation:longint; sync_ptr_ioctl:longint):longint;cdecl;external libasound;
function _snd_pcm_hw_open(pcmp:PPsnd_pcm_t; name:Pchar; root:Psnd_config_t; conf:Psnd_config_t; stream:Tsnd_pcm_stream_t; 
           mode:longint):longint;cdecl;external libasound;
{
 *  Copy plugin
  }
function snd_pcm_copy_open(pcmp:PPsnd_pcm_t; name:Pchar; slave:Psnd_pcm_t; close_slave:longint):longint;cdecl;external libasound;
function _snd_pcm_copy_open(pcmp:PPsnd_pcm_t; name:Pchar; root:Psnd_config_t; conf:Psnd_config_t; stream:Tsnd_pcm_stream_t; 
           mode:longint):longint;cdecl;external libasound;
{
 *  Linear conversion plugin
  }
function snd_pcm_linear_open(pcmp:PPsnd_pcm_t; name:Pchar; sformat:Tsnd_pcm_format_t; slave:Psnd_pcm_t; close_slave:longint):longint;cdecl;external libasound;
function _snd_pcm_linear_open(pcmp:PPsnd_pcm_t; name:Pchar; root:Psnd_config_t; conf:Psnd_config_t; stream:Tsnd_pcm_stream_t; 
           mode:longint):longint;cdecl;external libasound;
{
 *  Linear<->Float conversion plugin
  }
function snd_pcm_lfloat_open(pcmp:PPsnd_pcm_t; name:Pchar; sformat:Tsnd_pcm_format_t; slave:Psnd_pcm_t; close_slave:longint):longint;cdecl;external libasound;
function _snd_pcm_lfloat_open(pcmp:PPsnd_pcm_t; name:Pchar; root:Psnd_config_t; conf:Psnd_config_t; stream:Tsnd_pcm_stream_t; 
           mode:longint):longint;cdecl;external libasound;
{
 *  Linear<->mu-Law conversion plugin
  }
function snd_pcm_mulaw_open(pcmp:PPsnd_pcm_t; name:Pchar; sformat:Tsnd_pcm_format_t; slave:Psnd_pcm_t; close_slave:longint):longint;cdecl;external libasound;
function _snd_pcm_mulaw_open(pcmp:PPsnd_pcm_t; name:Pchar; root:Psnd_config_t; conf:Psnd_config_t; stream:Tsnd_pcm_stream_t; 
           mode:longint):longint;cdecl;external libasound;
{
 *  Linear<->a-Law conversion plugin
  }
function snd_pcm_alaw_open(pcmp:PPsnd_pcm_t; name:Pchar; sformat:Tsnd_pcm_format_t; slave:Psnd_pcm_t; close_slave:longint):longint;cdecl;external libasound;
function _snd_pcm_alaw_open(pcmp:PPsnd_pcm_t; name:Pchar; root:Psnd_config_t; conf:Psnd_config_t; stream:Tsnd_pcm_stream_t; 
           mode:longint):longint;cdecl;external libasound;
{
 *  Linear<->Ima-ADPCM conversion plugin
  }
function snd_pcm_adpcm_open(pcmp:PPsnd_pcm_t; name:Pchar; sformat:Tsnd_pcm_format_t; slave:Psnd_pcm_t; close_slave:longint):longint;cdecl;external libasound;
function _snd_pcm_adpcm_open(pcmp:PPsnd_pcm_t; name:Pchar; root:Psnd_config_t; conf:Psnd_config_t; stream:Tsnd_pcm_stream_t; 
           mode:longint):longint;cdecl;external libasound;
{
 *  Route plugin for linear formats
  }
function snd_pcm_route_load_ttable(tt:Psnd_config_t; ttable:Psnd_pcm_route_ttable_entry_t; tt_csize:dword; tt_ssize:dword; tt_cused:Pdword; 
           tt_sused:Pdword; schannels:longint):longint;cdecl;external libasound;
function snd_pcm_route_determine_ttable(tt:Psnd_config_t; tt_csize:Pdword; tt_ssize:Pdword):longint;cdecl;external libasound;
function snd_pcm_route_open(pcmp:PPsnd_pcm_t; name:Pchar; sformat:Tsnd_pcm_format_t; schannels:longint; ttable:Psnd_pcm_route_ttable_entry_t; 
           tt_ssize:dword; tt_cused:dword; tt_sused:dword; slave:Psnd_pcm_t; close_slave:longint):longint;cdecl;external libasound;
function _snd_pcm_route_open(pcmp:PPsnd_pcm_t; name:Pchar; root:Psnd_config_t; conf:Psnd_config_t; stream:Tsnd_pcm_stream_t; 
           mode:longint):longint;cdecl;external libasound;
{
 *  Rate plugin for linear formats
  }
function snd_pcm_rate_open(pcmp:PPsnd_pcm_t; name:Pchar; sformat:Tsnd_pcm_format_t; srate:dword; converter:Psnd_config_t; 
           slave:Psnd_pcm_t; close_slave:longint):longint;cdecl;external libasound;
function _snd_pcm_rate_open(pcmp:PPsnd_pcm_t; name:Pchar; root:Psnd_config_t; conf:Psnd_config_t; stream:Tsnd_pcm_stream_t; 
           mode:longint):longint;cdecl;external libasound;
{
 *  Hooks plugin
  }
function snd_pcm_hooks_open(pcmp:PPsnd_pcm_t; name:Pchar; slave:Psnd_pcm_t; close_slave:longint):longint;cdecl;external libasound;
function _snd_pcm_hooks_open(pcmp:PPsnd_pcm_t; name:Pchar; root:Psnd_config_t; conf:Psnd_config_t; stream:Tsnd_pcm_stream_t; 
           mode:longint):longint;cdecl;external libasound;
{
 *  LADSPA plugin
  }
function snd_pcm_ladspa_open(pcmp:PPsnd_pcm_t; name:Pchar; ladspa_path:Pchar; channels:dword; ladspa_pplugins:Psnd_config_t; 
           ladspa_cplugins:Psnd_config_t; slave:Psnd_pcm_t; close_slave:longint):longint;cdecl;external libasound;
function _snd_pcm_ladspa_open(pcmp:PPsnd_pcm_t; name:Pchar; root:Psnd_config_t; conf:Psnd_config_t; stream:Tsnd_pcm_stream_t; 
           mode:longint):longint;cdecl;external libasound;
{
 *  Jack plugin
  }
function snd_pcm_jack_open(pcmp:PPsnd_pcm_t; name:Pchar; playback_conf:Psnd_config_t; capture_conf:Psnd_config_t; stream:Tsnd_pcm_stream_t; 
           mode:longint):longint;cdecl;external libasound;
function _snd_pcm_jack_open(pcmp:PPsnd_pcm_t; name:Pchar; root:Psnd_config_t; conf:Psnd_config_t; stream:Tsnd_pcm_stream_t; 
           mode:longint):longint;cdecl;external libasound;
{* \  }
{$endif}
{ __ALSA_PCM_PLUGIN_H  }

// === Konventiert am: 19-11-25 16:11:56 ===


implementation



end.
