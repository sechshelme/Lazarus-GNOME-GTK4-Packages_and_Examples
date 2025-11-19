
unit output;
interface

{
  Automatically converted by H2Pas 1.0.0 from output.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    output.h
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
PFILE  = ^FILE;
Psnd_output_t  = ^snd_output_t;
Psnd_output_type  = ^snd_output_type;
Psnd_output_type_t  = ^snd_output_type_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file include/output.h
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
{$ifndef __ALSA_OUTPUT_H}
{$define __ALSA_OUTPUT_H}
{$include <stdarg.h>}
{ C++ extern C conditionnal removed }
{*
 *  \defgroup Output Output Interface
 *
 *  The output functions present an interface similar to the stdio functions
 *  on top of different underlying output destinations.
 *
 *  Many PCM debugging functions (\c snd_pcm_xxx_dump_xxx) use such an output
 *  handle to be able to write not only to the screen but also to other
 *  destinations, e.g. to files or to memory buffers.
 *
 *  \
  }
{*
 * \brief Internal structure for an output object.
 *
 * The ALSA library uses a pointer to this structure as a handle to an
 * output object. Applications don't access its contents directly.
  }
type
  Tsnd_output = Tsnd_output_t;
{* Output type.  }
{* Output to a stdio stream.  }
{* Output to a memory buffer.  }

  Psnd_output_type = ^Tsnd_output_type;
  Tsnd_output_type =  Longint;
  Const
    SND_OUTPUT_STDIO = 0;
    SND_OUTPUT_BUFFER = 1;
;
  Tsnd_output_type_t = Tsnd_output_type;
  Psnd_output_type_t = ^Tsnd_output_type_t;
(* Const before type ignored *)
(* Const before type ignored *)

function snd_output_stdio_open(outputp:PPsnd_output_t; file:Pchar; mode:Pchar):longint;cdecl;external;
function snd_output_stdio_attach(outputp:PPsnd_output_t; fp:PFILE; _close:longint):longint;cdecl;external;
function snd_output_buffer_open(outputp:PPsnd_output_t):longint;cdecl;external;
function snd_output_buffer_string(output:Psnd_output_t; buf:PPchar):Tsize_t;cdecl;external;
function snd_output_buffer_steal(output:Psnd_output_t; buf:PPchar):Tsize_t;cdecl;external;
function snd_output_close(output:Psnd_output_t):longint;cdecl;external;
(* Const before type ignored *)
function snd_output_printf(output:Psnd_output_t; format:Pchar; args:array of const):longint;cdecl;external;
function snd_output_printf(output:Psnd_output_t; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function snd_output_vprintf(output:Psnd_output_t; format:Pchar; args:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
function snd_output_puts(output:Psnd_output_t; str:Pchar):longint;cdecl;external;
function snd_output_putc(output:Psnd_output_t; c:longint):longint;cdecl;external;
function snd_output_flush(output:Psnd_output_t):longint;cdecl;external;
{* \  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ __ALSA_OUTPUT_H  }

implementation


end.
