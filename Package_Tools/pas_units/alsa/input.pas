unit input;

interface

uses
  fp_asound;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file include/input.h
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
{$ifndef __ALSA_INPUT_H}
{$define __ALSA_INPUT_H}
{$include <stdarg.h>}
{ C++ extern C conditionnal removed }
{*
 *  \defgroup Input Input Interface
 *
 *  The input functions present an interface similar to the stdio functions
 *  on top of different underlying input sources.
 *
 *  The #snd_config_load function uses such an input handle to be able to
 *  load configurations not only from standard files but also from other
 *  sources, e.g. from memory buffers.
 *
 *  \
  }
{*
 * \brief Internal structure for an input object.
 *
 * The ALSA library uses a pointer to this structure as a handle to an
 * input object. Applications don't access its contents directly.
  }
type
  Tsnd_input = Tsnd_input_t;
{* Input type.  }
{* Input from a stdio stream.  }
{* Input from a memory buffer.  }

  Psnd_input_type = ^Tsnd_input_type;
  Tsnd_input_type =  Longint;
  Const
    SND_INPUT_STDIO = 0;
    SND_INPUT_BUFFER = 1;
;
  Tsnd_input_type_t = Tsnd_input_type;
  Psnd_input_type_t = ^Tsnd_input_type_t;

function snd_input_stdio_open(inputp:PPsnd_input_t; file:Pchar; mode:Pchar):longint;cdecl;external libasound;
function snd_input_stdio_attach(inputp:PPsnd_input_t; fp:PFILE; _close:longint):longint;cdecl;external libasound;
function snd_input_buffer_open(inputp:PPsnd_input_t; buffer:Pchar; size:Tssize_t):longint;cdecl;external libasound;
function snd_input_close(input:Psnd_input_t):longint;cdecl;external libasound;
function snd_input_scanf(input:Psnd_input_t; format:Pchar; args:array of const):longint;cdecl;external libasound;
function snd_input_scanf(input:Psnd_input_t; format:Pchar):longint;cdecl;external libasound;
function snd_input_gets(input:Psnd_input_t; str:Pchar; size:Tsize_t):Pchar;cdecl;external libasound;
function snd_input_getc(input:Psnd_input_t):longint;cdecl;external libasound;
function snd_input_ungetc(input:Psnd_input_t; c:longint):longint;cdecl;external libasound;
{* \  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ __ALSA_INPUT_H  }

// === Konventiert am: 19-11-25 16:12:20 ===


implementation



end.
