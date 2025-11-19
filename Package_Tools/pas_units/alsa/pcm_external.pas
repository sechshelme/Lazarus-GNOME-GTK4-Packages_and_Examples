unit pcm_external libasound;

interface

uses
  fp_asound;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file include/pcm_external.h
 * \brief External PCM plugin SDK
 * \author Takashi Iwai <tiwai@suse.de>
 * \date 2005
 *
 * Extern PCM plugin SDK.
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
{$ifndef __ALSA_PCM_EXTERNAL_H}
{$define __ALSA_PCM_EXTERNAL_H}
{$include "pcm.h"}
{ C++ extern C conditionnal removed }
{*
 *  \defgroup Plugin_SDK External PCM plugin SDK
 *  \
  }
{*
 * Define the object entry for external PCM plugins
  }
{xxxxxxxxxx #define SND_PCM_PLUGIN_SYMBOL(name) SND_DLSYM_BUILD_VERSION(SND_PCM_PLUGIN_ENTRY(name), SND_PCM_DLSYM_VERSION); }
{*
 * Define the plugin
  }
{$include "pcm_ioplug.h"}
{$include "pcm_extplug.h"}

function snd_pcm_parse_control_id(conf:Psnd_config_t; ctl_id:Psnd_ctl_elem_id_t; cardp:Plongint; cchannelsp:Plongint; hwctlp:Plongint):longint;cdecl;external libasound;
{ __attribute__((deprecated)); }
{* \  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ __ALSA_PCM_EXTERNAL_H  }

// === Konventiert am: 19-11-25 16:12:06 ===


implementation



end.
