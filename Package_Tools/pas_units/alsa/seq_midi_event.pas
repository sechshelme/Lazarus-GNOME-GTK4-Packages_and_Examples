unit seq_midi_event;

interface

uses
  fp_asound;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file include/seq_midi_event.h
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
{$ifndef __ALSA_SEQ_MIDI_EVENT_H}
{$define __ALSA_SEQ_MIDI_EVENT_H}
{ C++ extern C conditionnal removed }
{*
 *  \defgroup MIDI_Event Sequencer event <-> MIDI byte stream coder
 *  \ingroup Sequencer
 *  Sequencer event <-> MIDI byte stream coder
 *  \
  }
{* container for sequencer midi event parsers  }
type
  Tsnd_midi_event = Tsnd_midi_event_t;

function snd_midi_event_new(bufsize:Tsize_t; rdev:PPsnd_midi_event_t):longint;cdecl;external libasound;
function snd_midi_event_resize_buffer(dev:Psnd_midi_event_t; bufsize:Tsize_t):longint;cdecl;external libasound;
procedure snd_midi_event_free(dev:Psnd_midi_event_t);cdecl;external libasound;
procedure snd_midi_event_init(dev:Psnd_midi_event_t);cdecl;external libasound;
procedure snd_midi_event_reset_encode(dev:Psnd_midi_event_t);cdecl;external libasound;
procedure snd_midi_event_reset_decode(dev:Psnd_midi_event_t);cdecl;external libasound;
procedure snd_midi_event_no_status(dev:Psnd_midi_event_t; on:longint);cdecl;external libasound;
{ encode from byte stream - return number of written bytes if success  }
function snd_midi_event_encode(dev:Psnd_midi_event_t; buf:Pbyte; count:longint; ev:Psnd_seq_event_t):longint;cdecl;external libasound;
function snd_midi_event_encode_byte(dev:Psnd_midi_event_t; c:longint; ev:Psnd_seq_event_t):longint;cdecl;external libasound;
{ decode from event to bytes - return number of written bytes if success  }
function snd_midi_event_decode(dev:Psnd_midi_event_t; buf:Pbyte; count:longint; ev:Psnd_seq_event_t):longint;cdecl;external libasound;
{* \  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ __ALSA_SEQ_MIDI_EVENT_H  }

// === Konventiert am: 19-11-25 16:11:38 ===


implementation



end.
