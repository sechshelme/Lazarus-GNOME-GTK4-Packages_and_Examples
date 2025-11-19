
unit ump_msg;
interface

{
  Automatically converted by H2Pas 1.0.0 from ump_msg.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ump_msg.h
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
Psize_t  = ^size_t;
Psnd_ump_msg_hdr  = ^snd_ump_msg_hdr;
Psnd_ump_msg_hdr_t  = ^snd_ump_msg_hdr_t;
Psnd_ump_msg_midi1  = ^snd_ump_msg_midi1;
Psnd_ump_msg_midi1_caf  = ^snd_ump_msg_midi1_caf;
Psnd_ump_msg_midi1_caf_t  = ^snd_ump_msg_midi1_caf_t;
Psnd_ump_msg_midi1_cc  = ^snd_ump_msg_midi1_cc;
Psnd_ump_msg_midi1_cc_t  = ^snd_ump_msg_midi1_cc_t;
Psnd_ump_msg_midi1_note  = ^snd_ump_msg_midi1_note;
Psnd_ump_msg_midi1_note_t  = ^snd_ump_msg_midi1_note_t;
Psnd_ump_msg_midi1_paf  = ^snd_ump_msg_midi1_paf;
Psnd_ump_msg_midi1_paf_t  = ^snd_ump_msg_midi1_paf_t;
Psnd_ump_msg_midi1_pitchbend  = ^snd_ump_msg_midi1_pitchbend;
Psnd_ump_msg_midi1_pitchbend_t  = ^snd_ump_msg_midi1_pitchbend_t;
Psnd_ump_msg_midi1_program  = ^snd_ump_msg_midi1_program;
Psnd_ump_msg_midi1_program_t  = ^snd_ump_msg_midi1_program_t;
Psnd_ump_msg_midi1_t  = ^snd_ump_msg_midi1_t;
Psnd_ump_msg_midi2  = ^snd_ump_msg_midi2;
Psnd_ump_msg_midi2_caf  = ^snd_ump_msg_midi2_caf;
Psnd_ump_msg_midi2_caf_t  = ^snd_ump_msg_midi2_caf_t;
Psnd_ump_msg_midi2_cc  = ^snd_ump_msg_midi2_cc;
Psnd_ump_msg_midi2_cc_t  = ^snd_ump_msg_midi2_cc_t;
Psnd_ump_msg_midi2_note  = ^snd_ump_msg_midi2_note;
Psnd_ump_msg_midi2_note_t  = ^snd_ump_msg_midi2_note_t;
Psnd_ump_msg_midi2_paf  = ^snd_ump_msg_midi2_paf;
Psnd_ump_msg_midi2_paf_t  = ^snd_ump_msg_midi2_paf_t;
Psnd_ump_msg_midi2_per_note_cc  = ^snd_ump_msg_midi2_per_note_cc;
Psnd_ump_msg_midi2_per_note_cc_t  = ^snd_ump_msg_midi2_per_note_cc_t;
Psnd_ump_msg_midi2_per_note_mgmt  = ^snd_ump_msg_midi2_per_note_mgmt;
Psnd_ump_msg_midi2_per_note_mgmt_t  = ^snd_ump_msg_midi2_per_note_mgmt_t;
Psnd_ump_msg_midi2_per_note_pitchbend  = ^snd_ump_msg_midi2_per_note_pitchbend;
Psnd_ump_msg_midi2_per_note_pitchbend_t  = ^snd_ump_msg_midi2_per_note_pitchbend_t;
Psnd_ump_msg_midi2_pitchbend  = ^snd_ump_msg_midi2_pitchbend;
Psnd_ump_msg_midi2_pitchbend_t  = ^snd_ump_msg_midi2_pitchbend_t;
Psnd_ump_msg_midi2_program  = ^snd_ump_msg_midi2_program;
Psnd_ump_msg_midi2_program_t  = ^snd_ump_msg_midi2_program_t;
Psnd_ump_msg_midi2_rpn  = ^snd_ump_msg_midi2_rpn;
Psnd_ump_msg_midi2_rpn_t  = ^snd_ump_msg_midi2_rpn_t;
Psnd_ump_msg_midi2_t  = ^snd_ump_msg_midi2_t;
Psnd_ump_msg_system  = ^snd_ump_msg_system;
Psnd_ump_msg_system_t  = ^snd_ump_msg_system_t;
Puint32_t  = ^uint32_t;
Puint8_t  = ^uint8_t;
Pxxxxxxxxxx  = ^xxxxxxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1+  }
{*
 * \file include/ump_msg.h
 * \brief API library for ALSA rawmidi/UMP interface
 *
 * API library for ALSA rawmidi/UMP interface
  }
{$ifndef __ALSA_UMP_MSG_H}
{$define __ALSA_UMP_MSG_H}
{$include <stdint.h>}
{ C++ extern C conditionnal removed }
{* general UMP packet header in 32bit word  }
{$ifdef SNDRV_BIG_ENDIAN_BITFIELD}
{$else}
{*< Second data byte  }
{*< First data byte  }
{*< Channel  }
{*< Status  }
{*< UMP Group  }
{*< UMP packet type  }
{$endif}
type
  Psnd_ump_msg_hdr = ^Tsnd_ump_msg_hdr;
  Tsnd_ump_msg_hdr = record
      byte2 : Tuint8_t;
      byte1 : Tuint8_t;
      flag0 : word;
    end;
  Tsnd_ump_msg_hdr_t = Tsnd_ump_msg_hdr;
  Psnd_ump_msg_hdr_t = ^Tsnd_ump_msg_hdr_t;

const
  bm__snd_ump_msg_hdr_channel = $F;
  bp__snd_ump_msg_hdr_channel = 0;
  bm__snd_ump_msg_hdr_status = $F0;
  bp__snd_ump_msg_hdr_status = 4;
  bm__snd_ump_msg_hdr_group = $F00;
  bp__snd_ump_msg_hdr_group = 8;
  bm__snd_ump_msg_hdr_type = $F000;
  bp__snd_ump_msg_hdr_type = 12;

function channel(var a : _snd_ump_msg_hdr) : Tuint8_t;
procedure set_channel(var a : _snd_ump_msg_hdr; __channel : Tuint8_t);
function status(var a : _snd_ump_msg_hdr) : Tuint8_t;
procedure set_status(var a : _snd_ump_msg_hdr; __status : Tuint8_t);
function group(var a : _snd_ump_msg_hdr) : Tuint8_t;
procedure set_group(var a : _snd_ump_msg_hdr; __group : Tuint8_t);
function type(var a : _snd_ump_msg_hdr) : Tuint8_t;
procedure set_type(var a : _snd_ump_msg_hdr; __type : Tuint8_t);
{* MIDI 1.0 Note Off / Note On (32bit)  }
{$ifdef SNDRV_BIG_ENDIAN_BITFIELD}
{$else}
{*< Velocity (7bit)  }
{*< Note (7bit)  }
{*< Channel  }
{*< Status  }
{*< UMP Group  }
{*< UMP packet type  }
{$endif}
type
  Psnd_ump_msg_midi1_note = ^Tsnd_ump_msg_midi1_note;
  Tsnd_ump_msg_midi1_note = record
      velocity : Tuint8_t;
      note : Tuint8_t;
      flag0 : word;
    end;
  Tsnd_ump_msg_midi1_note_t = Tsnd_ump_msg_midi1_note;
  Psnd_ump_msg_midi1_note_t = ^Tsnd_ump_msg_midi1_note_t;

const
  bm__snd_ump_msg_midi1_note_channel = $F;
  bp__snd_ump_msg_midi1_note_channel = 0;
  bm__snd_ump_msg_midi1_note_status = $F0;
  bp__snd_ump_msg_midi1_note_status = 4;
  bm__snd_ump_msg_midi1_note_group = $F00;
  bp__snd_ump_msg_midi1_note_group = 8;
  bm__snd_ump_msg_midi1_note_type = $F000;
  bp__snd_ump_msg_midi1_note_type = 12;

function channel(var a : _snd_ump_msg_midi1_note) : Tuint8_t;
procedure set_channel(var a : _snd_ump_msg_midi1_note; __channel : Tuint8_t);
function status(var a : _snd_ump_msg_midi1_note) : Tuint8_t;
procedure set_status(var a : _snd_ump_msg_midi1_note; __status : Tuint8_t);
function group(var a : _snd_ump_msg_midi1_note) : Tuint8_t;
procedure set_group(var a : _snd_ump_msg_midi1_note; __group : Tuint8_t);
function type(var a : _snd_ump_msg_midi1_note) : Tuint8_t;
procedure set_type(var a : _snd_ump_msg_midi1_note; __type : Tuint8_t);
{* MIDI 1.0 Poly Pressure (32bit)  }
{$ifdef SNDRV_BIG_ENDIAN_BITFIELD}
{$else}
{* Pressure (7bit)  }
{* Note (7bit)  }
{*< Channel  }
{*< Status  }
{*< UMP Group  }
{*< UMP packet type  }
{$endif}
type
  Psnd_ump_msg_midi1_paf = ^Tsnd_ump_msg_midi1_paf;
  Tsnd_ump_msg_midi1_paf = record
      data : Tuint8_t;
      note : Tuint8_t;
      flag0 : word;
    end;
  Tsnd_ump_msg_midi1_paf_t = Tsnd_ump_msg_midi1_paf;
  Psnd_ump_msg_midi1_paf_t = ^Tsnd_ump_msg_midi1_paf_t;

const
  bm__snd_ump_msg_midi1_paf_channel = $F;
  bp__snd_ump_msg_midi1_paf_channel = 0;
  bm__snd_ump_msg_midi1_paf_status = $F0;
  bp__snd_ump_msg_midi1_paf_status = 4;
  bm__snd_ump_msg_midi1_paf_group = $F00;
  bp__snd_ump_msg_midi1_paf_group = 8;
  bm__snd_ump_msg_midi1_paf_type = $F000;
  bp__snd_ump_msg_midi1_paf_type = 12;

function channel(var a : _snd_ump_msg_midi1_paf) : Tuint8_t;
procedure set_channel(var a : _snd_ump_msg_midi1_paf; __channel : Tuint8_t);
function status(var a : _snd_ump_msg_midi1_paf) : Tuint8_t;
procedure set_status(var a : _snd_ump_msg_midi1_paf; __status : Tuint8_t);
function group(var a : _snd_ump_msg_midi1_paf) : Tuint8_t;
procedure set_group(var a : _snd_ump_msg_midi1_paf; __group : Tuint8_t);
function type(var a : _snd_ump_msg_midi1_paf) : Tuint8_t;
procedure set_type(var a : _snd_ump_msg_midi1_paf; __type : Tuint8_t);
{* MIDI 1.0 Control Change (32bit)  }
{$ifdef SNDRV_BIG_ENDIAN_BITFIELD}
{$else}
{* Control data (7bit)  }
{* Control index (7bit)  }
{*< Channel  }
{*< Status  }
{*< UMP Group  }
{*< UMP packet type  }
{$endif}
type
  Psnd_ump_msg_midi1_cc = ^Tsnd_ump_msg_midi1_cc;
  Tsnd_ump_msg_midi1_cc = record
      data : Tuint8_t;
      index : Tuint8_t;
      flag0 : word;
    end;
  Tsnd_ump_msg_midi1_cc_t = Tsnd_ump_msg_midi1_cc;
  Psnd_ump_msg_midi1_cc_t = ^Tsnd_ump_msg_midi1_cc_t;

const
  bm__snd_ump_msg_midi1_cc_channel = $F;
  bp__snd_ump_msg_midi1_cc_channel = 0;
  bm__snd_ump_msg_midi1_cc_status = $F0;
  bp__snd_ump_msg_midi1_cc_status = 4;
  bm__snd_ump_msg_midi1_cc_group = $F00;
  bp__snd_ump_msg_midi1_cc_group = 8;
  bm__snd_ump_msg_midi1_cc_type = $F000;
  bp__snd_ump_msg_midi1_cc_type = 12;

function channel(var a : _snd_ump_msg_midi1_cc) : Tuint8_t;
procedure set_channel(var a : _snd_ump_msg_midi1_cc; __channel : Tuint8_t);
function status(var a : _snd_ump_msg_midi1_cc) : Tuint8_t;
procedure set_status(var a : _snd_ump_msg_midi1_cc; __status : Tuint8_t);
function group(var a : _snd_ump_msg_midi1_cc) : Tuint8_t;
procedure set_group(var a : _snd_ump_msg_midi1_cc; __group : Tuint8_t);
function type(var a : _snd_ump_msg_midi1_cc) : Tuint8_t;
procedure set_type(var a : _snd_ump_msg_midi1_cc; __type : Tuint8_t);
{* MIDI 1.0 Program Change (32bit)  }
{$ifdef SNDRV_BIG_ENDIAN_BITFIELD}
{$else}
{*< Unused  }
{*< Program number (7bit)  }
{*< Channel  }
{*< Status  }
{*< UMP Group  }
{*< UMP packet type  }
{$endif}
type
  Psnd_ump_msg_midi1_program = ^Tsnd_ump_msg_midi1_program;
  Tsnd_ump_msg_midi1_program = record
      reserved : Tuint8_t;
      program : Tuint8_t;
      flag0 : word;
    end;
  Tsnd_ump_msg_midi1_program_t = Tsnd_ump_msg_midi1_program;
  Psnd_ump_msg_midi1_program_t = ^Tsnd_ump_msg_midi1_program_t;

const
  bm__snd_ump_msg_midi1_program_channel = $F;
  bp__snd_ump_msg_midi1_program_channel = 0;
  bm__snd_ump_msg_midi1_program_status = $F0;
  bp__snd_ump_msg_midi1_program_status = 4;
  bm__snd_ump_msg_midi1_program_group = $F00;
  bp__snd_ump_msg_midi1_program_group = 8;
  bm__snd_ump_msg_midi1_program_type = $F000;
  bp__snd_ump_msg_midi1_program_type = 12;

function channel(var a : _snd_ump_msg_midi1_program) : Tuint8_t;
procedure set_channel(var a : _snd_ump_msg_midi1_program; __channel : Tuint8_t);
function status(var a : _snd_ump_msg_midi1_program) : Tuint8_t;
procedure set_status(var a : _snd_ump_msg_midi1_program; __status : Tuint8_t);
function group(var a : _snd_ump_msg_midi1_program) : Tuint8_t;
procedure set_group(var a : _snd_ump_msg_midi1_program; __group : Tuint8_t);
function type(var a : _snd_ump_msg_midi1_program) : Tuint8_t;
procedure set_type(var a : _snd_ump_msg_midi1_program; __type : Tuint8_t);
{* MIDI 1.0 Channel Pressure (32bit)  }
{$ifdef SNDRV_BIG_ENDIAN_BITFIELD}
{$else}
{*< Unused  }
{*< Pressure (7bit)  }
{*< Channel  }
{*< Status  }
{*< UMP Group  }
{*< UMP packet type  }
{$endif}
type
  Psnd_ump_msg_midi1_caf = ^Tsnd_ump_msg_midi1_caf;
  Tsnd_ump_msg_midi1_caf = record
      reserved : Tuint8_t;
      data : Tuint8_t;
      flag0 : word;
    end;
  Tsnd_ump_msg_midi1_caf_t = Tsnd_ump_msg_midi1_caf;
  Psnd_ump_msg_midi1_caf_t = ^Tsnd_ump_msg_midi1_caf_t;

const
  bm__snd_ump_msg_midi1_caf_channel = $F;
  bp__snd_ump_msg_midi1_caf_channel = 0;
  bm__snd_ump_msg_midi1_caf_status = $F0;
  bp__snd_ump_msg_midi1_caf_status = 4;
  bm__snd_ump_msg_midi1_caf_group = $F00;
  bp__snd_ump_msg_midi1_caf_group = 8;
  bm__snd_ump_msg_midi1_caf_type = $F000;
  bp__snd_ump_msg_midi1_caf_type = 12;

function channel(var a : _snd_ump_msg_midi1_caf) : Tuint8_t;
procedure set_channel(var a : _snd_ump_msg_midi1_caf; __channel : Tuint8_t);
function status(var a : _snd_ump_msg_midi1_caf) : Tuint8_t;
procedure set_status(var a : _snd_ump_msg_midi1_caf; __status : Tuint8_t);
function group(var a : _snd_ump_msg_midi1_caf) : Tuint8_t;
procedure set_group(var a : _snd_ump_msg_midi1_caf; __group : Tuint8_t);
function type(var a : _snd_ump_msg_midi1_caf) : Tuint8_t;
procedure set_type(var a : _snd_ump_msg_midi1_caf; __type : Tuint8_t);
{* MIDI 1.0 Pitch Bend (32bit)  }
{$ifdef SNDRV_BIG_ENDIAN_BITFIELD}
{$else}
{*< MSB of pitchbend (7bit)  }
{*< LSB of pitchbend (7bit)  }
{*< Channel  }
{*< Status  }
{*< UMP Group  }
{*< UMP packet type  }
{$endif}
type
  Psnd_ump_msg_midi1_pitchbend = ^Tsnd_ump_msg_midi1_pitchbend;
  Tsnd_ump_msg_midi1_pitchbend = record
      data_msb : Tuint8_t;
      data_lsb : Tuint8_t;
      flag0 : word;
    end;
  Tsnd_ump_msg_midi1_pitchbend_t = Tsnd_ump_msg_midi1_pitchbend;
  Psnd_ump_msg_midi1_pitchbend_t = ^Tsnd_ump_msg_midi1_pitchbend_t;

const
  bm__snd_ump_msg_midi1_pitchbend_channel = $F;
  bp__snd_ump_msg_midi1_pitchbend_channel = 0;
  bm__snd_ump_msg_midi1_pitchbend_status = $F0;
  bp__snd_ump_msg_midi1_pitchbend_status = 4;
  bm__snd_ump_msg_midi1_pitchbend_group = $F00;
  bp__snd_ump_msg_midi1_pitchbend_group = 8;
  bm__snd_ump_msg_midi1_pitchbend_type = $F000;
  bp__snd_ump_msg_midi1_pitchbend_type = 12;

function channel(var a : _snd_ump_msg_midi1_pitchbend) : Tuint8_t;
procedure set_channel(var a : _snd_ump_msg_midi1_pitchbend; __channel : Tuint8_t);
function status(var a : _snd_ump_msg_midi1_pitchbend) : Tuint8_t;
procedure set_status(var a : _snd_ump_msg_midi1_pitchbend; __status : Tuint8_t);
function group(var a : _snd_ump_msg_midi1_pitchbend) : Tuint8_t;
procedure set_group(var a : _snd_ump_msg_midi1_pitchbend; __group : Tuint8_t);
function type(var a : _snd_ump_msg_midi1_pitchbend) : Tuint8_t;
procedure set_type(var a : _snd_ump_msg_midi1_pitchbend; __type : Tuint8_t);
{* System Common and Real Time messages (32bit); no channel field  }
{$ifdef SNDRV_BIG_ENDIAN_BITFIELD}
{$else}
{*< First parameter  }
{*< Second parameter  }
{*< Status  }
{*< UMP Group  }
{*< UMP packet type  }
{$endif}
type
  Psnd_ump_msg_system = ^Tsnd_ump_msg_system;
  Tsnd_ump_msg_system = record
      parm1 : Tuint8_t;
      parm2 : Tuint8_t;
      status : Tuint8_t;
      flag0 : word;
    end;
  Tsnd_ump_msg_system_t = Tsnd_ump_msg_system;
  Psnd_ump_msg_system_t = ^Tsnd_ump_msg_system_t;

const
  bm_snd_ump_msg_system_group = $F;
  bp_snd_ump_msg_system_group = 0;
  bm_snd_ump_msg_system_type = $F0;
  bp_snd_ump_msg_system_type = 4;

function group(var a : snd_ump_msg_system) : Tuint8_t;
procedure set_group(var a : snd_ump_msg_system; __group : Tuint8_t);
function type(var a : snd_ump_msg_system) : Tuint8_t;
procedure set_type(var a : snd_ump_msg_system; __type : Tuint8_t);
{* MIDI 1.0 UMP CVM (32bit)  }
type
  Psnd_ump_msg_midi1 = ^Tsnd_ump_msg_midi1;
  Tsnd_ump_msg_midi1 = record
      case longint of
        0 : ( note_on : Tsnd_ump_msg_midi1_note_t );
        1 : ( note_off : Tsnd_ump_msg_midi1_note_t );
        2 : ( poly_pressure : Tsnd_ump_msg_midi1_paf_t );
        3 : ( control_change : Tsnd_ump_msg_midi1_cc_t );
        4 : ( program_change : Tsnd_ump_msg_midi1_program_t );
        5 : ( channel_pressure : Tsnd_ump_msg_midi1_caf_t );
        6 : ( pitchbend : Tsnd_ump_msg_midi1_pitchbend_t );
        7 : ( system : Tsnd_ump_msg_system_t );
        8 : ( hdr : Tsnd_ump_msg_hdr_t );
        9 : ( raw : Tuint32_t );
      end;
  Tsnd_ump_msg_midi1_t = Tsnd_ump_msg_midi1;
  Psnd_ump_msg_midi1_t = ^Tsnd_ump_msg_midi1_t;
{* MIDI 2.0 Note-on/off attribute type  }
{*< No attribute data  }
{*< Manufacturer specific  }
{*< Profile specific  }
{*< Pitch 7.9  }
  Txxxxxxxxxx =  Longint;
  Const
    SND_UMP_MIDI2_NOTE_ATTR_NO_DATA = $00;
    SND_UMP_MIDI2_NOTE_ATTR_MANUFACTURER = $01;
    SND_UMP_MIDI2_NOTE_ATTR_PROFILE = $02;
    SND_UMP_MIDI2_NOTE_ATTR_PITCH79 = $03;

{ MIDI 2.0 Note Off / Note On (64bit)  }
{$ifdef SNDRV_BIG_ENDIAN_BITFIELD}
{$else}
{*< Attribute type  }
{*< Note (7bit)  }
{*< Channel  }
{*< Status  }
{*< UMP Group  }
{*< UMP packet type  }
{*< Attribute data (16bit)  }
{*< Velocity (16bit)  }
{$endif}
type
  Psnd_ump_msg_midi2_note = ^Tsnd_ump_msg_midi2_note;
  Tsnd_ump_msg_midi2_note = record
      attr_type : Tuint8_t;
      note : Tuint8_t;
      flag0 : word;
      attr_data : Tuint16_t;
      velocity : Tuint16_t;
    end;
  Tsnd_ump_msg_midi2_note_t = Tsnd_ump_msg_midi2_note;
  Psnd_ump_msg_midi2_note_t = ^Tsnd_ump_msg_midi2_note_t;

const
  bm__snd_ump_msg_midi2_note_channel = $F;
  bp__snd_ump_msg_midi2_note_channel = 0;
  bm__snd_ump_msg_midi2_note_status = $F0;
  bp__snd_ump_msg_midi2_note_status = 4;
  bm__snd_ump_msg_midi2_note_group = $F00;
  bp__snd_ump_msg_midi2_note_group = 8;
  bm__snd_ump_msg_midi2_note_type = $F000;
  bp__snd_ump_msg_midi2_note_type = 12;

function channel(var a : _snd_ump_msg_midi2_note) : Tuint8_t;
procedure set_channel(var a : _snd_ump_msg_midi2_note; __channel : Tuint8_t);
function status(var a : _snd_ump_msg_midi2_note) : Tuint8_t;
procedure set_status(var a : _snd_ump_msg_midi2_note; __status : Tuint8_t);
function group(var a : _snd_ump_msg_midi2_note) : Tuint8_t;
procedure set_group(var a : _snd_ump_msg_midi2_note; __group : Tuint8_t);
function type(var a : _snd_ump_msg_midi2_note) : Tuint8_t;
procedure set_type(var a : _snd_ump_msg_midi2_note; __type : Tuint8_t);
{* MIDI 2.0 Poly Pressure (64bit)  }
{$ifdef SNDRV_BIG_ENDIAN_BITFIELD}
{$else}
{*< Unused  }
{*< Note (7bit)  }
{*< Channel  }
{*< Status  }
{*< UMP Group  }
{*< UMP packet type  }
{*< Pressure (32bit)  }
{$endif}
type
  Psnd_ump_msg_midi2_paf = ^Tsnd_ump_msg_midi2_paf;
  Tsnd_ump_msg_midi2_paf = record
      reserved : Tuint8_t;
      note : Tuint8_t;
      flag0 : word;
      data : Tuint32_t;
    end;
  Tsnd_ump_msg_midi2_paf_t = Tsnd_ump_msg_midi2_paf;
  Psnd_ump_msg_midi2_paf_t = ^Tsnd_ump_msg_midi2_paf_t;

const
  bm__snd_ump_msg_midi2_paf_channel = $F;
  bp__snd_ump_msg_midi2_paf_channel = 0;
  bm__snd_ump_msg_midi2_paf_status = $F0;
  bp__snd_ump_msg_midi2_paf_status = 4;
  bm__snd_ump_msg_midi2_paf_group = $F00;
  bp__snd_ump_msg_midi2_paf_group = 8;
  bm__snd_ump_msg_midi2_paf_type = $F000;
  bp__snd_ump_msg_midi2_paf_type = 12;

function channel(var a : _snd_ump_msg_midi2_paf) : Tuint8_t;
procedure set_channel(var a : _snd_ump_msg_midi2_paf; __channel : Tuint8_t);
function status(var a : _snd_ump_msg_midi2_paf) : Tuint8_t;
procedure set_status(var a : _snd_ump_msg_midi2_paf; __status : Tuint8_t);
function group(var a : _snd_ump_msg_midi2_paf) : Tuint8_t;
procedure set_group(var a : _snd_ump_msg_midi2_paf; __group : Tuint8_t);
function type(var a : _snd_ump_msg_midi2_paf) : Tuint8_t;
procedure set_type(var a : _snd_ump_msg_midi2_paf; __type : Tuint8_t);
{* MIDI 2.0 Per-Note Controller (64bit)  }
{$ifdef SNDRV_BIG_ENDIAN_BITFIELD}
{$else}
{*< Control index (8bit)  }
{*< Note (7bit)  }
{*< Channel  }
{*< Status  }
{*< UMP Group  }
{*< UMP packet type  }
{*< Data (32bit)  }
{$endif}
type
  Psnd_ump_msg_midi2_per_note_cc = ^Tsnd_ump_msg_midi2_per_note_cc;
  Tsnd_ump_msg_midi2_per_note_cc = record
      index : Tuint8_t;
      note : Tuint8_t;
      flag0 : word;
      data : Tuint32_t;
    end;
  Tsnd_ump_msg_midi2_per_note_cc_t = Tsnd_ump_msg_midi2_per_note_cc;
  Psnd_ump_msg_midi2_per_note_cc_t = ^Tsnd_ump_msg_midi2_per_note_cc_t;

const
  bm__snd_ump_msg_midi2_per_note_cc_channel = $F;
  bp__snd_ump_msg_midi2_per_note_cc_channel = 0;
  bm__snd_ump_msg_midi2_per_note_cc_status = $F0;
  bp__snd_ump_msg_midi2_per_note_cc_status = 4;
  bm__snd_ump_msg_midi2_per_note_cc_group = $F00;
  bp__snd_ump_msg_midi2_per_note_cc_group = 8;
  bm__snd_ump_msg_midi2_per_note_cc_type = $F000;
  bp__snd_ump_msg_midi2_per_note_cc_type = 12;

function channel(var a : _snd_ump_msg_midi2_per_note_cc) : Tuint8_t;
procedure set_channel(var a : _snd_ump_msg_midi2_per_note_cc; __channel : Tuint8_t);
function status(var a : _snd_ump_msg_midi2_per_note_cc) : Tuint8_t;
procedure set_status(var a : _snd_ump_msg_midi2_per_note_cc; __status : Tuint8_t);
function group(var a : _snd_ump_msg_midi2_per_note_cc) : Tuint8_t;
procedure set_group(var a : _snd_ump_msg_midi2_per_note_cc; __group : Tuint8_t);
function type(var a : _snd_ump_msg_midi2_per_note_cc) : Tuint8_t;
procedure set_type(var a : _snd_ump_msg_midi2_per_note_cc; __type : Tuint8_t);
{* MIDI 2.0 per-note management flag bits  }
{*< Reset (set) per-note controllers  }
{*< Detach per-note controllers  }
type
  Txxxxxxxxxx =  Longint;
  Const
    SND_UMP_MIDI2_PNMGMT_RESET_CONTROLLERS = $01;
    SND_UMP_MIDI2_PNMGMT_DETACH_CONTROLLERS = $02;

{* MIDI 2.0 Per-Note Management (64bit)  }
{$ifdef SNDRV_BIG_ENDIAN_BITFIELD}
{$else}
{*< Option flags (8bit)  }
{*< Note (7bit)  }
{*< Channel  }
{*< Status  }
{*< UMP Group  }
{*< UMP packet type  }
{*< Unused  }
{$endif}
type
  Psnd_ump_msg_midi2_per_note_mgmt = ^Tsnd_ump_msg_midi2_per_note_mgmt;
  Tsnd_ump_msg_midi2_per_note_mgmt = record
      flags : Tuint8_t;
      note : Tuint8_t;
      flag0 : word;
      reserved : Tuint32_t;
    end;
  Tsnd_ump_msg_midi2_per_note_mgmt_t = Tsnd_ump_msg_midi2_per_note_mgmt;
  Psnd_ump_msg_midi2_per_note_mgmt_t = ^Tsnd_ump_msg_midi2_per_note_mgmt_t;

const
  bm__snd_ump_msg_midi2_per_note_mgmt_channel = $F;
  bp__snd_ump_msg_midi2_per_note_mgmt_channel = 0;
  bm__snd_ump_msg_midi2_per_note_mgmt_status = $F0;
  bp__snd_ump_msg_midi2_per_note_mgmt_status = 4;
  bm__snd_ump_msg_midi2_per_note_mgmt_group = $F00;
  bp__snd_ump_msg_midi2_per_note_mgmt_group = 8;
  bm__snd_ump_msg_midi2_per_note_mgmt_type = $F000;
  bp__snd_ump_msg_midi2_per_note_mgmt_type = 12;

function channel(var a : _snd_ump_msg_midi2_per_note_mgmt) : Tuint8_t;
procedure set_channel(var a : _snd_ump_msg_midi2_per_note_mgmt; __channel : Tuint8_t);
function status(var a : _snd_ump_msg_midi2_per_note_mgmt) : Tuint8_t;
procedure set_status(var a : _snd_ump_msg_midi2_per_note_mgmt; __status : Tuint8_t);
function group(var a : _snd_ump_msg_midi2_per_note_mgmt) : Tuint8_t;
procedure set_group(var a : _snd_ump_msg_midi2_per_note_mgmt; __group : Tuint8_t);
function type(var a : _snd_ump_msg_midi2_per_note_mgmt) : Tuint8_t;
procedure set_type(var a : _snd_ump_msg_midi2_per_note_mgmt; __type : Tuint8_t);
{* MIDI 2.0 Control Change (64bit)  }
{$ifdef SNDRV_BIG_ENDIAN_BITFIELD}
{$else}
{*< Unused  }
{*< Control index (7bit)  }
{*< Channel  }
{*< Status  }
{*< UMP Group  }
{*< UMP packet type  }
{*< Control data (32bit)  }
{$endif}
type
  Psnd_ump_msg_midi2_cc = ^Tsnd_ump_msg_midi2_cc;
  Tsnd_ump_msg_midi2_cc = record
      reserved : Tuint8_t;
      index : Tuint8_t;
      flag0 : word;
      data : Tuint32_t;
    end;
  Tsnd_ump_msg_midi2_cc_t = Tsnd_ump_msg_midi2_cc;
  Psnd_ump_msg_midi2_cc_t = ^Tsnd_ump_msg_midi2_cc_t;

const
  bm__snd_ump_msg_midi2_cc_channel = $F;
  bp__snd_ump_msg_midi2_cc_channel = 0;
  bm__snd_ump_msg_midi2_cc_status = $F0;
  bp__snd_ump_msg_midi2_cc_status = 4;
  bm__snd_ump_msg_midi2_cc_group = $F00;
  bp__snd_ump_msg_midi2_cc_group = 8;
  bm__snd_ump_msg_midi2_cc_type = $F000;
  bp__snd_ump_msg_midi2_cc_type = 12;

function channel(var a : _snd_ump_msg_midi2_cc) : Tuint8_t;
procedure set_channel(var a : _snd_ump_msg_midi2_cc; __channel : Tuint8_t);
function status(var a : _snd_ump_msg_midi2_cc) : Tuint8_t;
procedure set_status(var a : _snd_ump_msg_midi2_cc; __status : Tuint8_t);
function group(var a : _snd_ump_msg_midi2_cc) : Tuint8_t;
procedure set_group(var a : _snd_ump_msg_midi2_cc; __group : Tuint8_t);
function type(var a : _snd_ump_msg_midi2_cc) : Tuint8_t;
procedure set_type(var a : _snd_ump_msg_midi2_cc; __type : Tuint8_t);
{* MIDI 2.0 Registered Controller (RPN) / Assignable Controller (NRPN) (64bit)  }
{$ifdef SNDRV_BIG_ENDIAN_BITFIELD}
{$else}
{*< Control index (7bit)  }
{*< Bank number (7bit)  }
{*< Channel  }
{*< Status  }
{*< UMP Group  }
{*< UMP packet type  }
{*< Data (32bit)  }
{$endif}
type
  Psnd_ump_msg_midi2_rpn = ^Tsnd_ump_msg_midi2_rpn;
  Tsnd_ump_msg_midi2_rpn = record
      index : Tuint8_t;
      bank : Tuint8_t;
      flag0 : word;
      data : Tuint32_t;
    end;
  Tsnd_ump_msg_midi2_rpn_t = Tsnd_ump_msg_midi2_rpn;
  Psnd_ump_msg_midi2_rpn_t = ^Tsnd_ump_msg_midi2_rpn_t;

const
  bm__snd_ump_msg_midi2_rpn_channel = $F;
  bp__snd_ump_msg_midi2_rpn_channel = 0;
  bm__snd_ump_msg_midi2_rpn_status = $F0;
  bp__snd_ump_msg_midi2_rpn_status = 4;
  bm__snd_ump_msg_midi2_rpn_group = $F00;
  bp__snd_ump_msg_midi2_rpn_group = 8;
  bm__snd_ump_msg_midi2_rpn_type = $F000;
  bp__snd_ump_msg_midi2_rpn_type = 12;

function channel(var a : _snd_ump_msg_midi2_rpn) : Tuint8_t;
procedure set_channel(var a : _snd_ump_msg_midi2_rpn; __channel : Tuint8_t);
function status(var a : _snd_ump_msg_midi2_rpn) : Tuint8_t;
procedure set_status(var a : _snd_ump_msg_midi2_rpn; __status : Tuint8_t);
function group(var a : _snd_ump_msg_midi2_rpn) : Tuint8_t;
procedure set_group(var a : _snd_ump_msg_midi2_rpn; __group : Tuint8_t);
function type(var a : _snd_ump_msg_midi2_rpn) : Tuint8_t;
procedure set_type(var a : _snd_ump_msg_midi2_rpn; __type : Tuint8_t);
{* MIDI 2.0 Program Change (64bit)  }
{$ifdef SNDRV_BIG_ENDIAN_BITFIELD}
{$else}
{*< Option flag: bank valid  }
{*< Unused  }
{*< Channel  }
{*< Status  }
{*< UMP Group  }
{*< UMP packet type  }
{*< LSB of bank (7bit)  }
{*< MSB of bank (8bit)  }
{*< Unused  }
{*< Program number (7bit)  }
{$endif}
type
  Psnd_ump_msg_midi2_program = ^Tsnd_ump_msg_midi2_program;
  Tsnd_ump_msg_midi2_program = record
      flag0 : longint;
      bank_lsb : Tuint8_t;
      bank_msb : Tuint8_t;
      reserved2 : Tuint8_t;
      program : Tuint8_t;
    end;
  Tsnd_ump_msg_midi2_program_t = Tsnd_ump_msg_midi2_program;
  Psnd_ump_msg_midi2_program_t = ^Tsnd_ump_msg_midi2_program_t;

const
  bm__snd_ump_msg_midi2_program_bank_valid = $1;
  bp__snd_ump_msg_midi2_program_bank_valid = 0;
  bm__snd_ump_msg_midi2_program_reserved = $FFFE;
  bp__snd_ump_msg_midi2_program_reserved = 1;
  bm__snd_ump_msg_midi2_program_channel = $F0000;
  bp__snd_ump_msg_midi2_program_channel = 16;
  bm__snd_ump_msg_midi2_program_status = $F00000;
  bp__snd_ump_msg_midi2_program_status = 20;
  bm__snd_ump_msg_midi2_program_group = $F000000;
  bp__snd_ump_msg_midi2_program_group = 24;
  bm__snd_ump_msg_midi2_program_type = $F0000000;
  bp__snd_ump_msg_midi2_program_type = 28;

function bank_valid(var a : _snd_ump_msg_midi2_program) : Tuint16_t;
procedure set_bank_valid(var a : _snd_ump_msg_midi2_program; __bank_valid : Tuint16_t);
function reserved(var a : _snd_ump_msg_midi2_program) : Tuint16_t;
procedure set_reserved(var a : _snd_ump_msg_midi2_program; __reserved : Tuint16_t);
function channel(var a : _snd_ump_msg_midi2_program) : Tuint8_t;
procedure set_channel(var a : _snd_ump_msg_midi2_program; __channel : Tuint8_t);
function status(var a : _snd_ump_msg_midi2_program) : Tuint8_t;
procedure set_status(var a : _snd_ump_msg_midi2_program; __status : Tuint8_t);
function group(var a : _snd_ump_msg_midi2_program) : Tuint8_t;
procedure set_group(var a : _snd_ump_msg_midi2_program; __group : Tuint8_t);
function type(var a : _snd_ump_msg_midi2_program) : Tuint8_t;
procedure set_type(var a : _snd_ump_msg_midi2_program; __type : Tuint8_t);
{* MIDI 2.0 Channel Pressure (64bit)  }
{$ifdef SNDRV_BIG_ENDIAN_BITFIELD}
{$else}
{*< Unused  }
{*< Channel  }
{*< Status  }
{*< UMP Group  }
{*< UMP packet type  }
{* Data (32bit)  }
{$endif}
type
  Psnd_ump_msg_midi2_caf = ^Tsnd_ump_msg_midi2_caf;
  Tsnd_ump_msg_midi2_caf = record
      reserved : Tuint16_t;
      flag0 : word;
      data : Tuint32_t;
    end;
  Tsnd_ump_msg_midi2_caf_t = Tsnd_ump_msg_midi2_caf;
  Psnd_ump_msg_midi2_caf_t = ^Tsnd_ump_msg_midi2_caf_t;

const
  bm__snd_ump_msg_midi2_caf_channel = $F;
  bp__snd_ump_msg_midi2_caf_channel = 0;
  bm__snd_ump_msg_midi2_caf_status = $F0;
  bp__snd_ump_msg_midi2_caf_status = 4;
  bm__snd_ump_msg_midi2_caf_group = $F00;
  bp__snd_ump_msg_midi2_caf_group = 8;
  bm__snd_ump_msg_midi2_caf_type = $F000;
  bp__snd_ump_msg_midi2_caf_type = 12;

function channel(var a : _snd_ump_msg_midi2_caf) : Tuint8_t;
procedure set_channel(var a : _snd_ump_msg_midi2_caf; __channel : Tuint8_t);
function status(var a : _snd_ump_msg_midi2_caf) : Tuint8_t;
procedure set_status(var a : _snd_ump_msg_midi2_caf; __status : Tuint8_t);
function group(var a : _snd_ump_msg_midi2_caf) : Tuint8_t;
procedure set_group(var a : _snd_ump_msg_midi2_caf; __group : Tuint8_t);
function type(var a : _snd_ump_msg_midi2_caf) : Tuint8_t;
procedure set_type(var a : _snd_ump_msg_midi2_caf; __type : Tuint8_t);
{ MIDI 2.0 Pitch Bend (64bit)  }
{$ifdef SNDRV_BIG_ENDIAN_BITFIELD}
{$else}
{*< Unused  }
{*< Channel  }
{*< Status  }
{*< UMP Group  }
{*< UMP packet type  }
{* Data (32bit)  }
{$endif}
type
  Psnd_ump_msg_midi2_pitchbend = ^Tsnd_ump_msg_midi2_pitchbend;
  Tsnd_ump_msg_midi2_pitchbend = record
      reserved : Tuint16_t;
      flag0 : word;
      data : Tuint32_t;
    end;
  Tsnd_ump_msg_midi2_pitchbend_t = Tsnd_ump_msg_midi2_pitchbend;
  Psnd_ump_msg_midi2_pitchbend_t = ^Tsnd_ump_msg_midi2_pitchbend_t;

const
  bm__snd_ump_msg_midi2_pitchbend_channel = $F;
  bp__snd_ump_msg_midi2_pitchbend_channel = 0;
  bm__snd_ump_msg_midi2_pitchbend_status = $F0;
  bp__snd_ump_msg_midi2_pitchbend_status = 4;
  bm__snd_ump_msg_midi2_pitchbend_group = $F00;
  bp__snd_ump_msg_midi2_pitchbend_group = 8;
  bm__snd_ump_msg_midi2_pitchbend_type = $F000;
  bp__snd_ump_msg_midi2_pitchbend_type = 12;

function channel(var a : _snd_ump_msg_midi2_pitchbend) : Tuint8_t;
procedure set_channel(var a : _snd_ump_msg_midi2_pitchbend; __channel : Tuint8_t);
function status(var a : _snd_ump_msg_midi2_pitchbend) : Tuint8_t;
procedure set_status(var a : _snd_ump_msg_midi2_pitchbend; __status : Tuint8_t);
function group(var a : _snd_ump_msg_midi2_pitchbend) : Tuint8_t;
procedure set_group(var a : _snd_ump_msg_midi2_pitchbend; __group : Tuint8_t);
function type(var a : _snd_ump_msg_midi2_pitchbend) : Tuint8_t;
procedure set_type(var a : _snd_ump_msg_midi2_pitchbend; __type : Tuint8_t);
{ MIDI 2.0 Per-Note Pitch Bend (64bit)  }
{$ifdef __BIG_ENDIAN_BITFIELD}
{$else}
{ 0  }
{*< Unused  }
{*< Note (7bit)  }
{*< Channel  }
{*< Status  }
{*< UMP Group  }
{*< UMP packet type  }
{*< Data (32bit)  }
{$endif}
type
  Psnd_ump_msg_midi2_per_note_pitchbend = ^Tsnd_ump_msg_midi2_per_note_pitchbend;
  Tsnd_ump_msg_midi2_per_note_pitchbend = record
      reserved : Tuint8_t;
      note : Tuint8_t;
      flag0 : word;
      data : Tuint32_t;
    end;
  Tsnd_ump_msg_midi2_per_note_pitchbend_t = Tsnd_ump_msg_midi2_per_note_pitchbend;
  Psnd_ump_msg_midi2_per_note_pitchbend_t = ^Tsnd_ump_msg_midi2_per_note_pitchbend_t;

const
  bm__snd_ump_msg_midi2_per_note_pitchbend_channel = $F;
  bp__snd_ump_msg_midi2_per_note_pitchbend_channel = 0;
  bm__snd_ump_msg_midi2_per_note_pitchbend_status = $F0;
  bp__snd_ump_msg_midi2_per_note_pitchbend_status = 4;
  bm__snd_ump_msg_midi2_per_note_pitchbend_group = $F00;
  bp__snd_ump_msg_midi2_per_note_pitchbend_group = 8;
  bm__snd_ump_msg_midi2_per_note_pitchbend_type = $F000;
  bp__snd_ump_msg_midi2_per_note_pitchbend_type = 12;

function channel(var a : _snd_ump_msg_midi2_per_note_pitchbend) : Tuint8_t;
procedure set_channel(var a : _snd_ump_msg_midi2_per_note_pitchbend; __channel : Tuint8_t);
function status(var a : _snd_ump_msg_midi2_per_note_pitchbend) : Tuint8_t;
procedure set_status(var a : _snd_ump_msg_midi2_per_note_pitchbend; __status : Tuint8_t);
function group(var a : _snd_ump_msg_midi2_per_note_pitchbend) : Tuint8_t;
procedure set_group(var a : _snd_ump_msg_midi2_per_note_pitchbend; __group : Tuint8_t);
function type(var a : _snd_ump_msg_midi2_per_note_pitchbend) : Tuint8_t;
procedure set_type(var a : _snd_ump_msg_midi2_per_note_pitchbend; __type : Tuint8_t);
{* MIDI2 UMP packet (64bit little-endian)  }
type
  Psnd_ump_msg_midi2 = ^Tsnd_ump_msg_midi2;
  Tsnd_ump_msg_midi2 = record
      case longint of
        0 : ( note_on : Tsnd_ump_msg_midi2_note_t );
        1 : ( note_off : Tsnd_ump_msg_midi2_note_t );
        2 : ( poly_pressure : Tsnd_ump_msg_midi2_paf_t );
        3 : ( per_note_acc : Tsnd_ump_msg_midi2_per_note_cc_t );
        4 : ( per_note_rcc : Tsnd_ump_msg_midi2_per_note_cc_t );
        5 : ( per_note_mgmt : Tsnd_ump_msg_midi2_per_note_mgmt_t );
        6 : ( control_change : Tsnd_ump_msg_midi2_cc_t );
        7 : ( rpn : Tsnd_ump_msg_midi2_rpn_t );
        8 : ( nrpn : Tsnd_ump_msg_midi2_rpn_t );
        9 : ( relative_rpn : Tsnd_ump_msg_midi2_rpn_t );
        10 : ( relative_nrpn : Tsnd_ump_msg_midi2_rpn_t );
        11 : ( program_change : Tsnd_ump_msg_midi2_program_t );
        12 : ( channel_pressure : Tsnd_ump_msg_midi2_caf_t );
        13 : ( pitchbend : Tsnd_ump_msg_midi2_pitchbend_t );
        14 : ( per_note_pitchbend : Tsnd_ump_msg_midi2_per_note_pitchbend_t );
        15 : ( hdr : Tsnd_ump_msg_hdr_t );
        16 : ( raw : array[0..1] of Tuint32_t );
      end;
  Tsnd_ump_msg_midi2_t = Tsnd_ump_msg_midi2;
  Psnd_ump_msg_midi2_t = ^Tsnd_ump_msg_midi2_t;
{*
 * UMP message type
  }
{ Utility messages  }
{ System messages  }
{ MIDI 1.0 messages  }
{ 7bit SysEx messages  }
{ MIDI 2.0 messages  }
{ 8bit data message  }
{ Flexible data messages  }
{ Stream messages  }
  Txxxxxxxxxx =  Longint;
  Const
    SND_UMP_MSG_TYPE_UTILITY = $00;
    SND_UMP_MSG_TYPE_SYSTEM = $01;
    SND_UMP_MSG_TYPE_MIDI1_CHANNEL_VOICE = $02;
    SND_UMP_MSG_TYPE_DATA = $03;
    SND_UMP_MSG_TYPE_MIDI2_CHANNEL_VOICE = $04;
    SND_UMP_MSG_TYPE_EXTENDED_DATA = $05;
    SND_UMP_MSG_TYPE_FLEX_DATA = $0d;
    SND_UMP_MSG_TYPE_STREAM = $0f;

{*
 * UMP MIDI 1.0 / 2.0 message status code (4bit)
  }
type
  Txxxxxxxxxx =  Longint;
  Const
    SND_UMP_MSG_PER_NOTE_RCC = $0;
    SND_UMP_MSG_PER_NOTE_ACC = $1;
    SND_UMP_MSG_RPN = $2;
    SND_UMP_MSG_NRPN = $3;
    SND_UMP_MSG_RELATIVE_RPN = $4;
    SND_UMP_MSG_RELATIVE_NRPN = $5;
    SND_UMP_MSG_PER_NOTE_PITCHBEND = $6;
    SND_UMP_MSG_NOTE_OFF = $8;
    SND_UMP_MSG_NOTE_ON = $9;
    SND_UMP_MSG_POLY_PRESSURE = $a;
    SND_UMP_MSG_CONTROL_CHANGE = $b;
    SND_UMP_MSG_PROGRAM_CHANGE = $c;
    SND_UMP_MSG_CHANNEL_PRESSURE = $d;
    SND_UMP_MSG_PITCHBEND = $e;
    SND_UMP_MSG_PER_NOTE_MGMT = $f;

{*
 * MIDI System / Realtime message status code (8bit)
  }
{ mask  }
type
  Txxxxxxxxxx =  Longint;
  Const
    SND_UMP_MSG_REALTIME = $f0;
    SND_UMP_MSG_SYSEX_START = $f0;
    SND_UMP_MSG_MIDI_TIME_CODE = $f1;
    SND_UMP_MSG_SONG_POSITION = $f2;
    SND_UMP_MSG_SONG_SELECT = $f3;
    SND_UMP_MSG_TUNE_REQUEST = $f6;
    SND_UMP_MSG_SYSEX_END = $f7;
    SND_UMP_MSG_TIMING_CLOCK = $f8;
    SND_UMP_MSG_START = $fa;
    SND_UMP_MSG_CONTINUE = $fb;
    SND_UMP_MSG_STOP = $fc;
    SND_UMP_MSG_ACTIVE_SENSING = $fe;
    SND_UMP_MSG_RESET = $ff;

{* MIDI 2.0 SysEx / Data Status; same values for both 7-bit and 8-bit SysEx  }
type
  Txxxxxxxxxx =  Longint;
  Const
    SND_UMP_SYSEX_STATUS_SINGLE = 0;
    SND_UMP_SYSEX_STATUS_START = 1;
    SND_UMP_SYSEX_STATUS_CONTINUE = 2;
    SND_UMP_SYSEX_STATUS_END = 3;

{* UMP Utility Type Status (type 0x0) * }
type
  Txxxxxxxxxx =  Longint;
  Const
    SND_UMP_UTILITY_MSG_STATUS_NOOP = $00;
    SND_UMP_UTILITY_MSG_STATUS_JR_CLOCK = $01;
    SND_UMP_UTILITY_MSG_STATUS_JR_TSTAMP = $02;
    SND_UMP_UTILITY_MSG_STATUS_DCTPQ = $03;
    SND_UMP_UTILITY_MSG_STATUS_DC = $04;

{* UMP Stream Message Status (type 0xf)  }
type
  Txxxxxxxxxx =  Longint;
  Const
    SND_UMP_STREAM_MSG_STATUS_EP_DISCOVERY = $00;
    SND_UMP_STREAM_MSG_STATUS_EP_INFO = $01;
    SND_UMP_STREAM_MSG_STATUS_DEVICE_INFO = $02;
    SND_UMP_STREAM_MSG_STATUS_EP_NAME = $03;
    SND_UMP_STREAM_MSG_STATUS_PRODUCT_ID = $04;
    SND_UMP_STREAM_MSG_STATUS_STREAM_CFG_REQUEST = $05;
    SND_UMP_STREAM_MSG_STATUS_STREAM_CFG = $06;
    SND_UMP_STREAM_MSG_STATUS_FB_DISCOVERY = $10;
    SND_UMP_STREAM_MSG_STATUS_FB_INFO = $11;
    SND_UMP_STREAM_MSG_STATUS_FB_NAME = $12;
    SND_UMP_STREAM_MSG_STATUS_START_CLIP = $20;
    SND_UMP_STREAM_MSG_STATUS_END_CLIP = $21;

{* UMP Endpoint Discovery filter bitmap  }
type
  Txxxxxxxxxx =  Longint;
  Const
    SND_UMP_STREAM_MSG_REQUEST_EP_INFO = 1 shl 0;
    SND_UMP_STREAM_MSG_REQUEST_DEVICE_INFO = 1 shl 1;
    SND_UMP_STREAM_MSG_REQUEST_EP_NAME = 1 shl 2;
    SND_UMP_STREAM_MSG_REQUEST_PRODUCT_ID = 1 shl 3;
    SND_UMP_STREAM_MSG_REQUEST_STREAM_CFG = 1 shl 4;

{* UMP Function Block Discovery filter bitmap  }
type
  Txxxxxxxxxx =  Longint;
  Const
    SND_UMP_STREAM_MSG_REQUEST_FB_INFO = 1 shl 0;
    SND_UMP_STREAM_MSG_REQUEST_FB_NAME = 1 shl 1;

{* UMP Endpoint Info capability bits (used for protocol request/notify, too)  }
{ Sending JRTS  }
{ Receiving JRTS  }
{ MIDI 1.0  }
{ MIDI 2.0  }
type
  Txxxxxxxxxx =  Longint;
  Const
    SND_UMP_STREAM_MSG_EP_INFO_CAP_TXJR = 1 shl 0;
    SND_UMP_STREAM_MSG_EP_INFO_CAP_RXJR = 1 shl 1;
    SND_UMP_STREAM_MSG_EP_INFO_CAP_MIDI1 = 1 shl 8;
    SND_UMP_STREAM_MSG_EP_INFO_CAP_MIDI2 = 1 shl 9;

{* UMP Endpoint / Function Block name string format bits  }
type
  Txxxxxxxxxx =  Longint;
  Const
    SND_UMP_STREAM_MSG_FORMAT_SINGLE = 0;
    SND_UMP_STREAM_MSG_FORMAT_START = 1;
    SND_UMP_STREAM_MSG_FORMAT_CONTINUE = 2;
    SND_UMP_STREAM_MSG_FORMAT_END = 3;

{*
 * \brief get UMP status (4bit) from 32bit UMP message header
  }
{xxxxxxxxxxxxxxxxx
static inline uint8_t snd_ump_msg_hdr_status(uint32_t ump)

	return (ump >> 20) & 0x0f;


static inline uint8_t snd_ump_msg_hdr_channel(uint32_t ump)

	return (ump >> 16) & 0x0f;


static inline uint8_t snd_ump_msg_hdr_type(uint32_t ump)

	return (ump >> 28);


static inline int snd_ump_msg_type_is_groupless(uint8_t type)

	return type == SND_UMP_MSG_TYPE_UTILITY || type == SND_UMP_MSG_TYPE_STREAM;


static inline uint8_t snd_ump_msg_hdr_group(uint32_t ump)

	return (ump >> 24) & 0x0f;


static inline uint8_t snd_ump_msg_status(const uint32_t *ump)

	return snd_ump_msg_hdr_status(*ump);


static inline uint8_t snd_ump_msg_channel(const uint32_t *ump)

	return snd_ump_msg_hdr_channel(*ump);


static inline uint8_t snd_ump_msg_type(const uint32_t *ump)

	return snd_ump_msg_hdr_type(*ump);


static inline uint8_t snd_ump_msg_group(const uint32_t *ump)

	return snd_ump_msg_hdr_group(*ump);


static inline uint8_t snd_ump_sysex_msg_status(const uint32_t *ump)

	return (*ump >> 20) & 0xf;


static inline uint8_t snd_ump_sysex_msg_length(const uint32_t *ump)

	return (*ump >> 16) & 0xf;

 }
(* Const before type ignored *)

function snd_ump_msg_sysex_expand(ump:Puint32_t; buf:Puint8_t; maxlen:Tsize_t; filled:Psize_t):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ __ALSA_UMP_MSG_H  }

implementation

function channel(var a : _snd_ump_msg_hdr) : Tuint8_t;
begin
  channel:=(a.flag0 and bm__snd_ump_msg_hdr_channel) shr bp__snd_ump_msg_hdr_channel;
end;

procedure set_channel(var a : _snd_ump_msg_hdr; __channel : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__channel shl bp__snd_ump_msg_hdr_channel) and bm__snd_ump_msg_hdr_channel);
end;

function status(var a : _snd_ump_msg_hdr) : Tuint8_t;
begin
  status:=(a.flag0 and bm__snd_ump_msg_hdr_status) shr bp__snd_ump_msg_hdr_status;
end;

procedure set_status(var a : _snd_ump_msg_hdr; __status : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__status shl bp__snd_ump_msg_hdr_status) and bm__snd_ump_msg_hdr_status);
end;

function group(var a : _snd_ump_msg_hdr) : Tuint8_t;
begin
  group:=(a.flag0 and bm__snd_ump_msg_hdr_group) shr bp__snd_ump_msg_hdr_group;
end;

procedure set_group(var a : _snd_ump_msg_hdr; __group : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__group shl bp__snd_ump_msg_hdr_group) and bm__snd_ump_msg_hdr_group);
end;

function type(var a : _snd_ump_msg_hdr) : Tuint8_t;
begin
  type:=(a.flag0 and bm__snd_ump_msg_hdr_type) shr bp__snd_ump_msg_hdr_type;
end;

procedure set_type(var a : _snd_ump_msg_hdr; __type : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__type shl bp__snd_ump_msg_hdr_type) and bm__snd_ump_msg_hdr_type);
end;

function channel(var a : _snd_ump_msg_midi1_note) : Tuint8_t;
begin
  channel:=(a.flag0 and bm__snd_ump_msg_midi1_note_channel) shr bp__snd_ump_msg_midi1_note_channel;
end;

procedure set_channel(var a : _snd_ump_msg_midi1_note; __channel : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__channel shl bp__snd_ump_msg_midi1_note_channel) and bm__snd_ump_msg_midi1_note_channel);
end;

function status(var a : _snd_ump_msg_midi1_note) : Tuint8_t;
begin
  status:=(a.flag0 and bm__snd_ump_msg_midi1_note_status) shr bp__snd_ump_msg_midi1_note_status;
end;

procedure set_status(var a : _snd_ump_msg_midi1_note; __status : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__status shl bp__snd_ump_msg_midi1_note_status) and bm__snd_ump_msg_midi1_note_status);
end;

function group(var a : _snd_ump_msg_midi1_note) : Tuint8_t;
begin
  group:=(a.flag0 and bm__snd_ump_msg_midi1_note_group) shr bp__snd_ump_msg_midi1_note_group;
end;

procedure set_group(var a : _snd_ump_msg_midi1_note; __group : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__group shl bp__snd_ump_msg_midi1_note_group) and bm__snd_ump_msg_midi1_note_group);
end;

function type(var a : _snd_ump_msg_midi1_note) : Tuint8_t;
begin
  type:=(a.flag0 and bm__snd_ump_msg_midi1_note_type) shr bp__snd_ump_msg_midi1_note_type;
end;

procedure set_type(var a : _snd_ump_msg_midi1_note; __type : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__type shl bp__snd_ump_msg_midi1_note_type) and bm__snd_ump_msg_midi1_note_type);
end;

function channel(var a : _snd_ump_msg_midi1_paf) : Tuint8_t;
begin
  channel:=(a.flag0 and bm__snd_ump_msg_midi1_paf_channel) shr bp__snd_ump_msg_midi1_paf_channel;
end;

procedure set_channel(var a : _snd_ump_msg_midi1_paf; __channel : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__channel shl bp__snd_ump_msg_midi1_paf_channel) and bm__snd_ump_msg_midi1_paf_channel);
end;

function status(var a : _snd_ump_msg_midi1_paf) : Tuint8_t;
begin
  status:=(a.flag0 and bm__snd_ump_msg_midi1_paf_status) shr bp__snd_ump_msg_midi1_paf_status;
end;

procedure set_status(var a : _snd_ump_msg_midi1_paf; __status : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__status shl bp__snd_ump_msg_midi1_paf_status) and bm__snd_ump_msg_midi1_paf_status);
end;

function group(var a : _snd_ump_msg_midi1_paf) : Tuint8_t;
begin
  group:=(a.flag0 and bm__snd_ump_msg_midi1_paf_group) shr bp__snd_ump_msg_midi1_paf_group;
end;

procedure set_group(var a : _snd_ump_msg_midi1_paf; __group : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__group shl bp__snd_ump_msg_midi1_paf_group) and bm__snd_ump_msg_midi1_paf_group);
end;

function type(var a : _snd_ump_msg_midi1_paf) : Tuint8_t;
begin
  type:=(a.flag0 and bm__snd_ump_msg_midi1_paf_type) shr bp__snd_ump_msg_midi1_paf_type;
end;

procedure set_type(var a : _snd_ump_msg_midi1_paf; __type : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__type shl bp__snd_ump_msg_midi1_paf_type) and bm__snd_ump_msg_midi1_paf_type);
end;

function channel(var a : _snd_ump_msg_midi1_cc) : Tuint8_t;
begin
  channel:=(a.flag0 and bm__snd_ump_msg_midi1_cc_channel) shr bp__snd_ump_msg_midi1_cc_channel;
end;

procedure set_channel(var a : _snd_ump_msg_midi1_cc; __channel : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__channel shl bp__snd_ump_msg_midi1_cc_channel) and bm__snd_ump_msg_midi1_cc_channel);
end;

function status(var a : _snd_ump_msg_midi1_cc) : Tuint8_t;
begin
  status:=(a.flag0 and bm__snd_ump_msg_midi1_cc_status) shr bp__snd_ump_msg_midi1_cc_status;
end;

procedure set_status(var a : _snd_ump_msg_midi1_cc; __status : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__status shl bp__snd_ump_msg_midi1_cc_status) and bm__snd_ump_msg_midi1_cc_status);
end;

function group(var a : _snd_ump_msg_midi1_cc) : Tuint8_t;
begin
  group:=(a.flag0 and bm__snd_ump_msg_midi1_cc_group) shr bp__snd_ump_msg_midi1_cc_group;
end;

procedure set_group(var a : _snd_ump_msg_midi1_cc; __group : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__group shl bp__snd_ump_msg_midi1_cc_group) and bm__snd_ump_msg_midi1_cc_group);
end;

function type(var a : _snd_ump_msg_midi1_cc) : Tuint8_t;
begin
  type:=(a.flag0 and bm__snd_ump_msg_midi1_cc_type) shr bp__snd_ump_msg_midi1_cc_type;
end;

procedure set_type(var a : _snd_ump_msg_midi1_cc; __type : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__type shl bp__snd_ump_msg_midi1_cc_type) and bm__snd_ump_msg_midi1_cc_type);
end;

function channel(var a : _snd_ump_msg_midi1_program) : Tuint8_t;
begin
  channel:=(a.flag0 and bm__snd_ump_msg_midi1_program_channel) shr bp__snd_ump_msg_midi1_program_channel;
end;

procedure set_channel(var a : _snd_ump_msg_midi1_program; __channel : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__channel shl bp__snd_ump_msg_midi1_program_channel) and bm__snd_ump_msg_midi1_program_channel);
end;

function status(var a : _snd_ump_msg_midi1_program) : Tuint8_t;
begin
  status:=(a.flag0 and bm__snd_ump_msg_midi1_program_status) shr bp__snd_ump_msg_midi1_program_status;
end;

procedure set_status(var a : _snd_ump_msg_midi1_program; __status : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__status shl bp__snd_ump_msg_midi1_program_status) and bm__snd_ump_msg_midi1_program_status);
end;

function group(var a : _snd_ump_msg_midi1_program) : Tuint8_t;
begin
  group:=(a.flag0 and bm__snd_ump_msg_midi1_program_group) shr bp__snd_ump_msg_midi1_program_group;
end;

procedure set_group(var a : _snd_ump_msg_midi1_program; __group : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__group shl bp__snd_ump_msg_midi1_program_group) and bm__snd_ump_msg_midi1_program_group);
end;

function type(var a : _snd_ump_msg_midi1_program) : Tuint8_t;
begin
  type:=(a.flag0 and bm__snd_ump_msg_midi1_program_type) shr bp__snd_ump_msg_midi1_program_type;
end;

procedure set_type(var a : _snd_ump_msg_midi1_program; __type : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__type shl bp__snd_ump_msg_midi1_program_type) and bm__snd_ump_msg_midi1_program_type);
end;

function channel(var a : _snd_ump_msg_midi1_caf) : Tuint8_t;
begin
  channel:=(a.flag0 and bm__snd_ump_msg_midi1_caf_channel) shr bp__snd_ump_msg_midi1_caf_channel;
end;

procedure set_channel(var a : _snd_ump_msg_midi1_caf; __channel : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__channel shl bp__snd_ump_msg_midi1_caf_channel) and bm__snd_ump_msg_midi1_caf_channel);
end;

function status(var a : _snd_ump_msg_midi1_caf) : Tuint8_t;
begin
  status:=(a.flag0 and bm__snd_ump_msg_midi1_caf_status) shr bp__snd_ump_msg_midi1_caf_status;
end;

procedure set_status(var a : _snd_ump_msg_midi1_caf; __status : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__status shl bp__snd_ump_msg_midi1_caf_status) and bm__snd_ump_msg_midi1_caf_status);
end;

function group(var a : _snd_ump_msg_midi1_caf) : Tuint8_t;
begin
  group:=(a.flag0 and bm__snd_ump_msg_midi1_caf_group) shr bp__snd_ump_msg_midi1_caf_group;
end;

procedure set_group(var a : _snd_ump_msg_midi1_caf; __group : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__group shl bp__snd_ump_msg_midi1_caf_group) and bm__snd_ump_msg_midi1_caf_group);
end;

function type(var a : _snd_ump_msg_midi1_caf) : Tuint8_t;
begin
  type:=(a.flag0 and bm__snd_ump_msg_midi1_caf_type) shr bp__snd_ump_msg_midi1_caf_type;
end;

procedure set_type(var a : _snd_ump_msg_midi1_caf; __type : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__type shl bp__snd_ump_msg_midi1_caf_type) and bm__snd_ump_msg_midi1_caf_type);
end;

function channel(var a : _snd_ump_msg_midi1_pitchbend) : Tuint8_t;
begin
  channel:=(a.flag0 and bm__snd_ump_msg_midi1_pitchbend_channel) shr bp__snd_ump_msg_midi1_pitchbend_channel;
end;

procedure set_channel(var a : _snd_ump_msg_midi1_pitchbend; __channel : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__channel shl bp__snd_ump_msg_midi1_pitchbend_channel) and bm__snd_ump_msg_midi1_pitchbend_channel);
end;

function status(var a : _snd_ump_msg_midi1_pitchbend) : Tuint8_t;
begin
  status:=(a.flag0 and bm__snd_ump_msg_midi1_pitchbend_status) shr bp__snd_ump_msg_midi1_pitchbend_status;
end;

procedure set_status(var a : _snd_ump_msg_midi1_pitchbend; __status : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__status shl bp__snd_ump_msg_midi1_pitchbend_status) and bm__snd_ump_msg_midi1_pitchbend_status);
end;

function group(var a : _snd_ump_msg_midi1_pitchbend) : Tuint8_t;
begin
  group:=(a.flag0 and bm__snd_ump_msg_midi1_pitchbend_group) shr bp__snd_ump_msg_midi1_pitchbend_group;
end;

procedure set_group(var a : _snd_ump_msg_midi1_pitchbend; __group : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__group shl bp__snd_ump_msg_midi1_pitchbend_group) and bm__snd_ump_msg_midi1_pitchbend_group);
end;

function type(var a : _snd_ump_msg_midi1_pitchbend) : Tuint8_t;
begin
  type:=(a.flag0 and bm__snd_ump_msg_midi1_pitchbend_type) shr bp__snd_ump_msg_midi1_pitchbend_type;
end;

procedure set_type(var a : _snd_ump_msg_midi1_pitchbend; __type : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__type shl bp__snd_ump_msg_midi1_pitchbend_type) and bm__snd_ump_msg_midi1_pitchbend_type);
end;

function group(var a : snd_ump_msg_system) : Tuint8_t;
begin
  group:=(a.flag0 and bm_snd_ump_msg_system_group) shr bp_snd_ump_msg_system_group;
end;

procedure set_group(var a : snd_ump_msg_system; __group : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__group shl bp_snd_ump_msg_system_group) and bm_snd_ump_msg_system_group);
end;

function type(var a : snd_ump_msg_system) : Tuint8_t;
begin
  type:=(a.flag0 and bm_snd_ump_msg_system_type) shr bp_snd_ump_msg_system_type;
end;

procedure set_type(var a : snd_ump_msg_system; __type : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__type shl bp_snd_ump_msg_system_type) and bm_snd_ump_msg_system_type);
end;

function channel(var a : _snd_ump_msg_midi2_note) : Tuint8_t;
begin
  channel:=(a.flag0 and bm__snd_ump_msg_midi2_note_channel) shr bp__snd_ump_msg_midi2_note_channel;
end;

procedure set_channel(var a : _snd_ump_msg_midi2_note; __channel : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__channel shl bp__snd_ump_msg_midi2_note_channel) and bm__snd_ump_msg_midi2_note_channel);
end;

function status(var a : _snd_ump_msg_midi2_note) : Tuint8_t;
begin
  status:=(a.flag0 and bm__snd_ump_msg_midi2_note_status) shr bp__snd_ump_msg_midi2_note_status;
end;

procedure set_status(var a : _snd_ump_msg_midi2_note; __status : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__status shl bp__snd_ump_msg_midi2_note_status) and bm__snd_ump_msg_midi2_note_status);
end;

function group(var a : _snd_ump_msg_midi2_note) : Tuint8_t;
begin
  group:=(a.flag0 and bm__snd_ump_msg_midi2_note_group) shr bp__snd_ump_msg_midi2_note_group;
end;

procedure set_group(var a : _snd_ump_msg_midi2_note; __group : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__group shl bp__snd_ump_msg_midi2_note_group) and bm__snd_ump_msg_midi2_note_group);
end;

function type(var a : _snd_ump_msg_midi2_note) : Tuint8_t;
begin
  type:=(a.flag0 and bm__snd_ump_msg_midi2_note_type) shr bp__snd_ump_msg_midi2_note_type;
end;

procedure set_type(var a : _snd_ump_msg_midi2_note; __type : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__type shl bp__snd_ump_msg_midi2_note_type) and bm__snd_ump_msg_midi2_note_type);
end;

function channel(var a : _snd_ump_msg_midi2_paf) : Tuint8_t;
begin
  channel:=(a.flag0 and bm__snd_ump_msg_midi2_paf_channel) shr bp__snd_ump_msg_midi2_paf_channel;
end;

procedure set_channel(var a : _snd_ump_msg_midi2_paf; __channel : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__channel shl bp__snd_ump_msg_midi2_paf_channel) and bm__snd_ump_msg_midi2_paf_channel);
end;

function status(var a : _snd_ump_msg_midi2_paf) : Tuint8_t;
begin
  status:=(a.flag0 and bm__snd_ump_msg_midi2_paf_status) shr bp__snd_ump_msg_midi2_paf_status;
end;

procedure set_status(var a : _snd_ump_msg_midi2_paf; __status : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__status shl bp__snd_ump_msg_midi2_paf_status) and bm__snd_ump_msg_midi2_paf_status);
end;

function group(var a : _snd_ump_msg_midi2_paf) : Tuint8_t;
begin
  group:=(a.flag0 and bm__snd_ump_msg_midi2_paf_group) shr bp__snd_ump_msg_midi2_paf_group;
end;

procedure set_group(var a : _snd_ump_msg_midi2_paf; __group : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__group shl bp__snd_ump_msg_midi2_paf_group) and bm__snd_ump_msg_midi2_paf_group);
end;

function type(var a : _snd_ump_msg_midi2_paf) : Tuint8_t;
begin
  type:=(a.flag0 and bm__snd_ump_msg_midi2_paf_type) shr bp__snd_ump_msg_midi2_paf_type;
end;

procedure set_type(var a : _snd_ump_msg_midi2_paf; __type : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__type shl bp__snd_ump_msg_midi2_paf_type) and bm__snd_ump_msg_midi2_paf_type);
end;

function channel(var a : _snd_ump_msg_midi2_per_note_cc) : Tuint8_t;
begin
  channel:=(a.flag0 and bm__snd_ump_msg_midi2_per_note_cc_channel) shr bp__snd_ump_msg_midi2_per_note_cc_channel;
end;

procedure set_channel(var a : _snd_ump_msg_midi2_per_note_cc; __channel : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__channel shl bp__snd_ump_msg_midi2_per_note_cc_channel) and bm__snd_ump_msg_midi2_per_note_cc_channel);
end;

function status(var a : _snd_ump_msg_midi2_per_note_cc) : Tuint8_t;
begin
  status:=(a.flag0 and bm__snd_ump_msg_midi2_per_note_cc_status) shr bp__snd_ump_msg_midi2_per_note_cc_status;
end;

procedure set_status(var a : _snd_ump_msg_midi2_per_note_cc; __status : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__status shl bp__snd_ump_msg_midi2_per_note_cc_status) and bm__snd_ump_msg_midi2_per_note_cc_status);
end;

function group(var a : _snd_ump_msg_midi2_per_note_cc) : Tuint8_t;
begin
  group:=(a.flag0 and bm__snd_ump_msg_midi2_per_note_cc_group) shr bp__snd_ump_msg_midi2_per_note_cc_group;
end;

procedure set_group(var a : _snd_ump_msg_midi2_per_note_cc; __group : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__group shl bp__snd_ump_msg_midi2_per_note_cc_group) and bm__snd_ump_msg_midi2_per_note_cc_group);
end;

function type(var a : _snd_ump_msg_midi2_per_note_cc) : Tuint8_t;
begin
  type:=(a.flag0 and bm__snd_ump_msg_midi2_per_note_cc_type) shr bp__snd_ump_msg_midi2_per_note_cc_type;
end;

procedure set_type(var a : _snd_ump_msg_midi2_per_note_cc; __type : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__type shl bp__snd_ump_msg_midi2_per_note_cc_type) and bm__snd_ump_msg_midi2_per_note_cc_type);
end;

function channel(var a : _snd_ump_msg_midi2_per_note_mgmt) : Tuint8_t;
begin
  channel:=(a.flag0 and bm__snd_ump_msg_midi2_per_note_mgmt_channel) shr bp__snd_ump_msg_midi2_per_note_mgmt_channel;
end;

procedure set_channel(var a : _snd_ump_msg_midi2_per_note_mgmt; __channel : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__channel shl bp__snd_ump_msg_midi2_per_note_mgmt_channel) and bm__snd_ump_msg_midi2_per_note_mgmt_channel);
end;

function status(var a : _snd_ump_msg_midi2_per_note_mgmt) : Tuint8_t;
begin
  status:=(a.flag0 and bm__snd_ump_msg_midi2_per_note_mgmt_status) shr bp__snd_ump_msg_midi2_per_note_mgmt_status;
end;

procedure set_status(var a : _snd_ump_msg_midi2_per_note_mgmt; __status : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__status shl bp__snd_ump_msg_midi2_per_note_mgmt_status) and bm__snd_ump_msg_midi2_per_note_mgmt_status);
end;

function group(var a : _snd_ump_msg_midi2_per_note_mgmt) : Tuint8_t;
begin
  group:=(a.flag0 and bm__snd_ump_msg_midi2_per_note_mgmt_group) shr bp__snd_ump_msg_midi2_per_note_mgmt_group;
end;

procedure set_group(var a : _snd_ump_msg_midi2_per_note_mgmt; __group : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__group shl bp__snd_ump_msg_midi2_per_note_mgmt_group) and bm__snd_ump_msg_midi2_per_note_mgmt_group);
end;

function type(var a : _snd_ump_msg_midi2_per_note_mgmt) : Tuint8_t;
begin
  type:=(a.flag0 and bm__snd_ump_msg_midi2_per_note_mgmt_type) shr bp__snd_ump_msg_midi2_per_note_mgmt_type;
end;

procedure set_type(var a : _snd_ump_msg_midi2_per_note_mgmt; __type : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__type shl bp__snd_ump_msg_midi2_per_note_mgmt_type) and bm__snd_ump_msg_midi2_per_note_mgmt_type);
end;

function channel(var a : _snd_ump_msg_midi2_cc) : Tuint8_t;
begin
  channel:=(a.flag0 and bm__snd_ump_msg_midi2_cc_channel) shr bp__snd_ump_msg_midi2_cc_channel;
end;

procedure set_channel(var a : _snd_ump_msg_midi2_cc; __channel : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__channel shl bp__snd_ump_msg_midi2_cc_channel) and bm__snd_ump_msg_midi2_cc_channel);
end;

function status(var a : _snd_ump_msg_midi2_cc) : Tuint8_t;
begin
  status:=(a.flag0 and bm__snd_ump_msg_midi2_cc_status) shr bp__snd_ump_msg_midi2_cc_status;
end;

procedure set_status(var a : _snd_ump_msg_midi2_cc; __status : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__status shl bp__snd_ump_msg_midi2_cc_status) and bm__snd_ump_msg_midi2_cc_status);
end;

function group(var a : _snd_ump_msg_midi2_cc) : Tuint8_t;
begin
  group:=(a.flag0 and bm__snd_ump_msg_midi2_cc_group) shr bp__snd_ump_msg_midi2_cc_group;
end;

procedure set_group(var a : _snd_ump_msg_midi2_cc; __group : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__group shl bp__snd_ump_msg_midi2_cc_group) and bm__snd_ump_msg_midi2_cc_group);
end;

function type(var a : _snd_ump_msg_midi2_cc) : Tuint8_t;
begin
  type:=(a.flag0 and bm__snd_ump_msg_midi2_cc_type) shr bp__snd_ump_msg_midi2_cc_type;
end;

procedure set_type(var a : _snd_ump_msg_midi2_cc; __type : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__type shl bp__snd_ump_msg_midi2_cc_type) and bm__snd_ump_msg_midi2_cc_type);
end;

function channel(var a : _snd_ump_msg_midi2_rpn) : Tuint8_t;
begin
  channel:=(a.flag0 and bm__snd_ump_msg_midi2_rpn_channel) shr bp__snd_ump_msg_midi2_rpn_channel;
end;

procedure set_channel(var a : _snd_ump_msg_midi2_rpn; __channel : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__channel shl bp__snd_ump_msg_midi2_rpn_channel) and bm__snd_ump_msg_midi2_rpn_channel);
end;

function status(var a : _snd_ump_msg_midi2_rpn) : Tuint8_t;
begin
  status:=(a.flag0 and bm__snd_ump_msg_midi2_rpn_status) shr bp__snd_ump_msg_midi2_rpn_status;
end;

procedure set_status(var a : _snd_ump_msg_midi2_rpn; __status : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__status shl bp__snd_ump_msg_midi2_rpn_status) and bm__snd_ump_msg_midi2_rpn_status);
end;

function group(var a : _snd_ump_msg_midi2_rpn) : Tuint8_t;
begin
  group:=(a.flag0 and bm__snd_ump_msg_midi2_rpn_group) shr bp__snd_ump_msg_midi2_rpn_group;
end;

procedure set_group(var a : _snd_ump_msg_midi2_rpn; __group : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__group shl bp__snd_ump_msg_midi2_rpn_group) and bm__snd_ump_msg_midi2_rpn_group);
end;

function type(var a : _snd_ump_msg_midi2_rpn) : Tuint8_t;
begin
  type:=(a.flag0 and bm__snd_ump_msg_midi2_rpn_type) shr bp__snd_ump_msg_midi2_rpn_type;
end;

procedure set_type(var a : _snd_ump_msg_midi2_rpn; __type : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__type shl bp__snd_ump_msg_midi2_rpn_type) and bm__snd_ump_msg_midi2_rpn_type);
end;

function bank_valid(var a : _snd_ump_msg_midi2_program) : Tuint16_t;
begin
  bank_valid:=(a.flag0 and bm__snd_ump_msg_midi2_program_bank_valid) shr bp__snd_ump_msg_midi2_program_bank_valid;
end;

procedure set_bank_valid(var a : _snd_ump_msg_midi2_program; __bank_valid : Tuint16_t);
begin
  a.flag0:=a.flag0 or ((__bank_valid shl bp__snd_ump_msg_midi2_program_bank_valid) and bm__snd_ump_msg_midi2_program_bank_valid);
end;

function reserved(var a : _snd_ump_msg_midi2_program) : Tuint16_t;
begin
  reserved:=(a.flag0 and bm__snd_ump_msg_midi2_program_reserved) shr bp__snd_ump_msg_midi2_program_reserved;
end;

procedure set_reserved(var a : _snd_ump_msg_midi2_program; __reserved : Tuint16_t);
begin
  a.flag0:=a.flag0 or ((__reserved shl bp__snd_ump_msg_midi2_program_reserved) and bm__snd_ump_msg_midi2_program_reserved);
end;

function channel(var a : _snd_ump_msg_midi2_program) : Tuint8_t;
begin
  channel:=(a.flag0 and bm__snd_ump_msg_midi2_program_channel) shr bp__snd_ump_msg_midi2_program_channel;
end;

procedure set_channel(var a : _snd_ump_msg_midi2_program; __channel : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__channel shl bp__snd_ump_msg_midi2_program_channel) and bm__snd_ump_msg_midi2_program_channel);
end;

function status(var a : _snd_ump_msg_midi2_program) : Tuint8_t;
begin
  status:=(a.flag0 and bm__snd_ump_msg_midi2_program_status) shr bp__snd_ump_msg_midi2_program_status;
end;

procedure set_status(var a : _snd_ump_msg_midi2_program; __status : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__status shl bp__snd_ump_msg_midi2_program_status) and bm__snd_ump_msg_midi2_program_status);
end;

function group(var a : _snd_ump_msg_midi2_program) : Tuint8_t;
begin
  group:=(a.flag0 and bm__snd_ump_msg_midi2_program_group) shr bp__snd_ump_msg_midi2_program_group;
end;

procedure set_group(var a : _snd_ump_msg_midi2_program; __group : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__group shl bp__snd_ump_msg_midi2_program_group) and bm__snd_ump_msg_midi2_program_group);
end;

function type(var a : _snd_ump_msg_midi2_program) : Tuint8_t;
begin
  type:=(a.flag0 and bm__snd_ump_msg_midi2_program_type) shr bp__snd_ump_msg_midi2_program_type;
end;

procedure set_type(var a : _snd_ump_msg_midi2_program; __type : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__type shl bp__snd_ump_msg_midi2_program_type) and bm__snd_ump_msg_midi2_program_type);
end;

function channel(var a : _snd_ump_msg_midi2_caf) : Tuint8_t;
begin
  channel:=(a.flag0 and bm__snd_ump_msg_midi2_caf_channel) shr bp__snd_ump_msg_midi2_caf_channel;
end;

procedure set_channel(var a : _snd_ump_msg_midi2_caf; __channel : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__channel shl bp__snd_ump_msg_midi2_caf_channel) and bm__snd_ump_msg_midi2_caf_channel);
end;

function status(var a : _snd_ump_msg_midi2_caf) : Tuint8_t;
begin
  status:=(a.flag0 and bm__snd_ump_msg_midi2_caf_status) shr bp__snd_ump_msg_midi2_caf_status;
end;

procedure set_status(var a : _snd_ump_msg_midi2_caf; __status : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__status shl bp__snd_ump_msg_midi2_caf_status) and bm__snd_ump_msg_midi2_caf_status);
end;

function group(var a : _snd_ump_msg_midi2_caf) : Tuint8_t;
begin
  group:=(a.flag0 and bm__snd_ump_msg_midi2_caf_group) shr bp__snd_ump_msg_midi2_caf_group;
end;

procedure set_group(var a : _snd_ump_msg_midi2_caf; __group : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__group shl bp__snd_ump_msg_midi2_caf_group) and bm__snd_ump_msg_midi2_caf_group);
end;

function type(var a : _snd_ump_msg_midi2_caf) : Tuint8_t;
begin
  type:=(a.flag0 and bm__snd_ump_msg_midi2_caf_type) shr bp__snd_ump_msg_midi2_caf_type;
end;

procedure set_type(var a : _snd_ump_msg_midi2_caf; __type : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__type shl bp__snd_ump_msg_midi2_caf_type) and bm__snd_ump_msg_midi2_caf_type);
end;

function channel(var a : _snd_ump_msg_midi2_pitchbend) : Tuint8_t;
begin
  channel:=(a.flag0 and bm__snd_ump_msg_midi2_pitchbend_channel) shr bp__snd_ump_msg_midi2_pitchbend_channel;
end;

procedure set_channel(var a : _snd_ump_msg_midi2_pitchbend; __channel : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__channel shl bp__snd_ump_msg_midi2_pitchbend_channel) and bm__snd_ump_msg_midi2_pitchbend_channel);
end;

function status(var a : _snd_ump_msg_midi2_pitchbend) : Tuint8_t;
begin
  status:=(a.flag0 and bm__snd_ump_msg_midi2_pitchbend_status) shr bp__snd_ump_msg_midi2_pitchbend_status;
end;

procedure set_status(var a : _snd_ump_msg_midi2_pitchbend; __status : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__status shl bp__snd_ump_msg_midi2_pitchbend_status) and bm__snd_ump_msg_midi2_pitchbend_status);
end;

function group(var a : _snd_ump_msg_midi2_pitchbend) : Tuint8_t;
begin
  group:=(a.flag0 and bm__snd_ump_msg_midi2_pitchbend_group) shr bp__snd_ump_msg_midi2_pitchbend_group;
end;

procedure set_group(var a : _snd_ump_msg_midi2_pitchbend; __group : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__group shl bp__snd_ump_msg_midi2_pitchbend_group) and bm__snd_ump_msg_midi2_pitchbend_group);
end;

function type(var a : _snd_ump_msg_midi2_pitchbend) : Tuint8_t;
begin
  type:=(a.flag0 and bm__snd_ump_msg_midi2_pitchbend_type) shr bp__snd_ump_msg_midi2_pitchbend_type;
end;

procedure set_type(var a : _snd_ump_msg_midi2_pitchbend; __type : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__type shl bp__snd_ump_msg_midi2_pitchbend_type) and bm__snd_ump_msg_midi2_pitchbend_type);
end;

function channel(var a : _snd_ump_msg_midi2_per_note_pitchbend) : Tuint8_t;
begin
  channel:=(a.flag0 and bm__snd_ump_msg_midi2_per_note_pitchbend_channel) shr bp__snd_ump_msg_midi2_per_note_pitchbend_channel;
end;

procedure set_channel(var a : _snd_ump_msg_midi2_per_note_pitchbend; __channel : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__channel shl bp__snd_ump_msg_midi2_per_note_pitchbend_channel) and bm__snd_ump_msg_midi2_per_note_pitchbend_channel);
end;

function status(var a : _snd_ump_msg_midi2_per_note_pitchbend) : Tuint8_t;
begin
  status:=(a.flag0 and bm__snd_ump_msg_midi2_per_note_pitchbend_status) shr bp__snd_ump_msg_midi2_per_note_pitchbend_status;
end;

procedure set_status(var a : _snd_ump_msg_midi2_per_note_pitchbend; __status : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__status shl bp__snd_ump_msg_midi2_per_note_pitchbend_status) and bm__snd_ump_msg_midi2_per_note_pitchbend_status);
end;

function group(var a : _snd_ump_msg_midi2_per_note_pitchbend) : Tuint8_t;
begin
  group:=(a.flag0 and bm__snd_ump_msg_midi2_per_note_pitchbend_group) shr bp__snd_ump_msg_midi2_per_note_pitchbend_group;
end;

procedure set_group(var a : _snd_ump_msg_midi2_per_note_pitchbend; __group : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__group shl bp__snd_ump_msg_midi2_per_note_pitchbend_group) and bm__snd_ump_msg_midi2_per_note_pitchbend_group);
end;

function type(var a : _snd_ump_msg_midi2_per_note_pitchbend) : Tuint8_t;
begin
  type:=(a.flag0 and bm__snd_ump_msg_midi2_per_note_pitchbend_type) shr bp__snd_ump_msg_midi2_per_note_pitchbend_type;
end;

procedure set_type(var a : _snd_ump_msg_midi2_per_note_pitchbend; __type : Tuint8_t);
begin
  a.flag0:=a.flag0 or ((__type shl bp__snd_ump_msg_midi2_per_note_pitchbend_type) and bm__snd_ump_msg_midi2_per_note_pitchbend_type);
end;


end.
