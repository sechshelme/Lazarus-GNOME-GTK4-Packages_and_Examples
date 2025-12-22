
unit avc1394_vcr;
interface

{
  Automatically converted by H2Pas 1.0.0 from avc1394_vcr.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    avc1394_vcr.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libavc1394 - GNU/Linux IEEE 1394 AV/C Library
 *
 * Originally written by Andreas Micklei <andreas.micklei@ivistar.de>
 * Currently maintained by Dan Dennedy <dan@dennedy.org>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  }
{$ifndef AVC1394_VCR_H}

const
  AVC1394_VCR_H = 1;  
{$include <libraw1394/raw1394.h>}
{ C++ extern C conditionnal removed }
{ ##### Check to see if device is playing #####  }

function avc1394_vcr_is_playing(handle:Traw1394handle_t; node:Tnodeid_t):longint;cdecl;external;
{ ##### Check to see if the device is recording #####  }
function avc1394_vcr_is_recording(handle:Traw1394handle_t; node:Tnodeid_t):longint;cdecl;external;
{ ##### Tell the device to PLAY FORWARD #####  }
{ issue twice in a row to play forward at the slowest rate  }
procedure avc1394_vcr_play(handle:Traw1394handle_t; node:Tnodeid_t);cdecl;external;
{ ##### Tell the device to PLAY in REVERSE #####  }
{ issue twice in a row to play in reverse at the slowest rate  }
procedure avc1394_vcr_reverse(handle:Traw1394handle_t; node:Tnodeid_t);cdecl;external;
{ ##### exercise the trick play modes! #####  }
{ speed is a signed percentage value from -14 to +14  }
procedure avc1394_vcr_trick_play(handle:Traw1394handle_t; node:Tnodeid_t; speed:longint);cdecl;external;
{ ##### Tell the device to STOP #####  }
procedure avc1394_vcr_stop(handle:Traw1394handle_t; node:Tnodeid_t);cdecl;external;
{ ##### Tell the device to REWIND #####  }
procedure avc1394_vcr_rewind(handle:Traw1394handle_t; node:Tnodeid_t);cdecl;external;
{ ##### Tell the device to PAUSE #####  }
procedure avc1394_vcr_pause(handle:Traw1394handle_t; node:Tnodeid_t);cdecl;external;
{ ##### Tell the device to FAST FORWARD #####  }
procedure avc1394_vcr_forward(handle:Traw1394handle_t; node:Tnodeid_t);cdecl;external;
{ ##### Tell the device goto NEXT frame #####  }
procedure avc1394_vcr_next(handle:Traw1394handle_t; node:Tnodeid_t);cdecl;external;
{ ##### Tell the device goto NEXT index point #####  }
procedure avc1394_vcr_next_index(handle:Traw1394handle_t; node:Tnodeid_t);cdecl;external;
{ ##### Tell the device goto PREVIOUS frame #####  }
procedure avc1394_vcr_previous(handle:Traw1394handle_t; node:Tnodeid_t);cdecl;external;
{ ##### Tell the device goto PREVIOUS index point #####  }
procedure avc1394_vcr_previous_index(handle:Traw1394handle_t; node:Tnodeid_t);cdecl;external;
{ ##### Tell the device to EJECT (usually not supported) #####  }
procedure avc1394_vcr_eject(handle:Traw1394handle_t; node:Tnodeid_t);cdecl;external;
{ ##### Tell the device to RECORD #####  }
procedure avc1394_vcr_record(handle:Traw1394handle_t; node:Tnodeid_t);cdecl;external;
{ ##### Ask the device for the status #####  }
function avc1394_vcr_status(handle:Traw1394handle_t; node:Tnodeid_t):Tquadlet_t;cdecl;external;
{ Get a textual description of the status  }
function avc1394_vcr_decode_status(response:Tquadlet_t):Pchar;cdecl;external;
{ Get the time code on tape in format HH:MM:SS:FF  }
{ This version allocates memory for the string, and 
   the caller is required to free it.  }
function avc1394_vcr_get_timecode(handle:Traw1394handle_t; node:Tnodeid_t):Pchar;cdecl;external;
{ This version requires a pre-allocated output string of at least 12 
   characters.  }
function avc1394_vcr_get_timecode2(handle:Traw1394handle_t; node:Tnodeid_t; output:Pchar):longint;cdecl;external;
{ Go to the time code on tape in format HH:MM:SS:FF  }
procedure avc1394_vcr_seek_timecode(handle:Traw1394handle_t; node:Tnodeid_t; timecode:Pchar);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
