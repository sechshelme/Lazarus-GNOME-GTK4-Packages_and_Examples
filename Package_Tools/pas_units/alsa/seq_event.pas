unit seq_event;

interface

uses
  fp_asound;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file include/seq_event.h
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
{$ifndef __ALSA_SEQ_EVENT_H}
{$define __ALSA_SEQ_EVENT_H}
{*
 *  \defgroup SeqEvents Sequencer Event Definitions
 *  Sequencer Event Definitions
 *  \ingroup Sequencer
 *  \
  }
{*
 * Sequencer event data type
  }
type
  Psnd_seq_event_type_t = ^Tsnd_seq_event_type_t;
  Tsnd_seq_event_type_t = byte;
{* Sequencer event type  }
{* system status; event data type = #snd_seq_result_t  }
{* returned result status; event data type = #snd_seq_result_t  }
{* note on and off with duration; event data type = #snd_seq_ev_note_t  }
{* note on; event data type = #snd_seq_ev_note_t  }
{* note off; event data type = #snd_seq_ev_note_t  }
{* key pressure change (aftertouch); event data type = #snd_seq_ev_note_t  }
{* controller; event data type = #snd_seq_ev_ctrl_t  }
{* program change; event data type = #snd_seq_ev_ctrl_t  }
{* channel pressure; event data type = #snd_seq_ev_ctrl_t  }
{* pitchwheel; event data type = #snd_seq_ev_ctrl_t; data is from -8192 to 8191)  }
{* 14 bit controller value; event data type = #snd_seq_ev_ctrl_t  }
{* 14 bit NRPN;  event data type = #snd_seq_ev_ctrl_t  }
{* 14 bit RPN; event data type = #snd_seq_ev_ctrl_t  }
{* SPP with LSB and MSB values; event data type = #snd_seq_ev_ctrl_t  }
{* Song Select with song ID number; event data type = #snd_seq_ev_ctrl_t  }
{* midi time code quarter frame; event data type = #snd_seq_ev_ctrl_t  }
{* SMF Time Signature event; event data type = #snd_seq_ev_ctrl_t  }
{* SMF Key Signature event; event data type = #snd_seq_ev_ctrl_t  }
{* MIDI Real Time Start message; event data type = #snd_seq_ev_queue_control_t  }
{* MIDI Real Time Continue message; event data type = #snd_seq_ev_queue_control_t  }
{* MIDI Real Time Stop message; event data type = #snd_seq_ev_queue_control_t  }
{* Set tick queue position; event data type = #snd_seq_ev_queue_control_t  }
{* Set real-time queue position; event data type = #snd_seq_ev_queue_control_t  }
{* (SMF) Tempo event; event data type = #snd_seq_ev_queue_control_t  }
{* MIDI Real Time Clock message; event data type = #snd_seq_ev_queue_control_t  }
{* MIDI Real Time Tick message; event data type = #snd_seq_ev_queue_control_t  }
{* Queue timer skew; event data type = #snd_seq_ev_queue_control_t  }
{* Sync position changed; event data type = #snd_seq_ev_queue_control_t  }
{* Tune request; event data type = none  }
{* Reset to power-on state; event data type = none  }
{* Active sensing event; event data type = none  }
{* Echo-back event; event data type = any type  }
{* OSS emulation raw event; event data type = any type  }
{* New client has connected; event data type = #snd_seq_addr_t  }
{* Client has left the system; event data type = #snd_seq_addr_t  }
{* Client status/info has changed; event data type = #snd_seq_addr_t  }
{* New port was created; event data type = #snd_seq_addr_t  }
{* Port was deleted from system; event data type = #snd_seq_addr_t  }
{* Port status/info has changed; event data type = #snd_seq_addr_t  }
{* Ports connected; event data type = #snd_seq_connect_t  }
{* Ports disconnected; event data type = #snd_seq_connect_t  }
{* user-defined event; event data type = any (fixed size)  }
{* user-defined event; event data type = any (fixed size)  }
{* user-defined event; event data type = any (fixed size)  }
{* user-defined event; event data type = any (fixed size)  }
{* user-defined event; event data type = any (fixed size)  }
{* user-defined event; event data type = any (fixed size)  }
{* user-defined event; event data type = any (fixed size)  }
{* user-defined event; event data type = any (fixed size)  }
{* user-defined event; event data type = any (fixed size)  }
{* user-defined event; event data type = any (fixed size)  }
{* system exclusive data (variable length);  event data type = #snd_seq_ev_ext_t  }
{* error event;  event data type = #snd_seq_ev_ext_t  }
{* reserved for user apps;  event data type = #snd_seq_ev_ext_t  }
{* reserved for user apps; event data type = #snd_seq_ev_ext_t  }
{* reserved for user apps; event data type = #snd_seq_ev_ext_t  }
{* reserved for user apps; event data type = #snd_seq_ev_ext_t  }
{* reserved for user apps; event data type = #snd_seq_ev_ext_t  }
{* NOP; ignored in any case  }
  Tsnd_seq_event_type =  Longint;
  Const
    SND_SEQ_EVENT_SYSTEM = 0;
    SND_SEQ_EVENT_RESULT = 1;
    SND_SEQ_EVENT_NOTE = 5;
    SND_SEQ_EVENT_NOTEON = 6;
    SND_SEQ_EVENT_NOTEOFF = 7;
    SND_SEQ_EVENT_KEYPRESS = 8;
    SND_SEQ_EVENT_CONTROLLER = 10;
    SND_SEQ_EVENT_PGMCHANGE = 11;
    SND_SEQ_EVENT_CHANPRESS = 12;
    SND_SEQ_EVENT_PITCHBEND = 13;
    SND_SEQ_EVENT_CONTROL14 = 14;
    SND_SEQ_EVENT_NONREGPARAM = 15;
    SND_SEQ_EVENT_REGPARAM = 16;
    SND_SEQ_EVENT_SONGPOS = 20;
    SND_SEQ_EVENT_SONGSEL = 21;
    SND_SEQ_EVENT_QFRAME = 22;
    SND_SEQ_EVENT_TIMESIGN = 23;
    SND_SEQ_EVENT_KEYSIGN = 24;
    SND_SEQ_EVENT_START = 30;
    SND_SEQ_EVENT_CONTINUE = 31;
    SND_SEQ_EVENT_STOP = 32;
    SND_SEQ_EVENT_SETPOS_TICK = 33;
    SND_SEQ_EVENT_SETPOS_TIME = 34;
    SND_SEQ_EVENT_TEMPO = 35;
    SND_SEQ_EVENT_CLOCK = 36;
    SND_SEQ_EVENT_TICK = 37;
    SND_SEQ_EVENT_QUEUE_SKEW = 38;
    SND_SEQ_EVENT_SYNC_POS = 39;
    SND_SEQ_EVENT_TUNE_REQUEST = 40;
    SND_SEQ_EVENT_RESET = 41;
    SND_SEQ_EVENT_SENSING = 42;
    SND_SEQ_EVENT_ECHO = 50;
    SND_SEQ_EVENT_OSS = 51;
    SND_SEQ_EVENT_CLIENT_START = 60;
    SND_SEQ_EVENT_CLIENT_EXIT = 61;
    SND_SEQ_EVENT_CLIENT_CHANGE = 62;
    SND_SEQ_EVENT_PORT_START = 63;
    SND_SEQ_EVENT_PORT_EXIT = 64;
    SND_SEQ_EVENT_PORT_CHANGE = 65;
    SND_SEQ_EVENT_PORT_SUBSCRIBED = 66;
    SND_SEQ_EVENT_PORT_UNSUBSCRIBED = 67;
    SND_SEQ_EVENT_USR0 = 90;
    SND_SEQ_EVENT_USR1 = 91;
    SND_SEQ_EVENT_USR2 = 92;
    SND_SEQ_EVENT_USR3 = 93;
    SND_SEQ_EVENT_USR4 = 94;
    SND_SEQ_EVENT_USR5 = 95;
    SND_SEQ_EVENT_USR6 = 96;
    SND_SEQ_EVENT_USR7 = 97;
    SND_SEQ_EVENT_USR8 = 98;
    SND_SEQ_EVENT_USR9 = 99;
    SND_SEQ_EVENT_SYSEX = 130;
    SND_SEQ_EVENT_BOUNCE = 131;
    SND_SEQ_EVENT_USR_VAR0 = 135;
    SND_SEQ_EVENT_USR_VAR1 = 136;
    SND_SEQ_EVENT_USR_VAR2 = 137;
    SND_SEQ_EVENT_USR_VAR3 = 138;
    SND_SEQ_EVENT_USR_VAR4 = 139;
    SND_SEQ_EVENT_NONE = 255;

{* Sequencer event address  }
{*< Client id  }
{*< Port id  }
type
  Psnd_seq_addr = ^Tsnd_seq_addr;
  Tsnd_seq_addr = record
      client : byte;
      port : byte;
    end;
  Tsnd_seq_addr_t = Tsnd_seq_addr;
  Psnd_seq_addr_t = ^Tsnd_seq_addr_t;
{* Connection (subscription) between ports  }
{*< sender address  }
{*< destination address  }

  Psnd_seq_connect = ^Tsnd_seq_connect;
  Tsnd_seq_connect = record
      sender : Tsnd_seq_addr_t;
      dest : Tsnd_seq_addr_t;
    end;
  Tsnd_seq_connect_t = Tsnd_seq_connect;
  Psnd_seq_connect_t = ^Tsnd_seq_connect_t;
{* Real-time data record  }
{*< seconds  }
{*< nanoseconds  }

  Psnd_seq_real_time = ^Tsnd_seq_real_time;
  Tsnd_seq_real_time = record
      tv_sec : dword;
      tv_nsec : dword;
    end;
  Tsnd_seq_real_time_t = Tsnd_seq_real_time;
  Psnd_seq_real_time_t = ^Tsnd_seq_real_time_t;
{* (MIDI) Tick-time data record  }

  Psnd_seq_tick_time_t = ^Tsnd_seq_tick_time_t;
  Tsnd_seq_tick_time_t = dword;
{* unioned time stamp  }
{*< tick-time  }
{*< real-time  }

  Psnd_seq_timestamp = ^Tsnd_seq_timestamp;
  Tsnd_seq_timestamp = record
      case longint of
        0 : ( tick : Tsnd_seq_tick_time_t );
        1 : ( time : Tsnd_seq_real_time );
      end;
  Tsnd_seq_timestamp_t = Tsnd_seq_timestamp;
  Psnd_seq_timestamp_t = ^Tsnd_seq_timestamp_t;
{*
 * Event mode flags
 *
 * NOTE: only 8 bits available!
  }
{*< timestamp in clock ticks  }

const
  SND_SEQ_TIME_STAMP_TICK = 0 shl 0;  
{*< timestamp in real time  }
  SND_SEQ_TIME_STAMP_REAL = 1 shl 0;  
{*< mask for timestamp bits  }
  SND_SEQ_TIME_STAMP_MASK = 1 shl 0;  
{*< absolute timestamp  }
  SND_SEQ_TIME_MODE_ABS = 0 shl 1;  
{*< relative to current time  }
  SND_SEQ_TIME_MODE_REL = 1 shl 1;  
{*< mask for time mode bits  }
  SND_SEQ_TIME_MODE_MASK = 1 shl 1;  
{*< fixed event size  }
  SND_SEQ_EVENT_LENGTH_FIXED = 0 shl 2;  
{*< variable event size  }
  SND_SEQ_EVENT_LENGTH_VARIABLE = 1 shl 2;  
{*< variable event size - user memory space  }
  SND_SEQ_EVENT_LENGTH_VARUSR = 2 shl 2;  
{*< mask for event length bits  }
  SND_SEQ_EVENT_LENGTH_MASK = 3 shl 2;  
{*< normal priority  }
  SND_SEQ_PRIORITY_NORMAL = 0 shl 4;  
{*< event should be processed before others  }
  SND_SEQ_PRIORITY_HIGH = 1 shl 4;  
{*< mask for priority bits  }
  SND_SEQ_PRIORITY_MASK = 1 shl 4;  
{*< UMP packet event  }
  SND_SEQ_EVENT_UMP = 1 shl 5;  
{* Note event  }
{*< channel number  }
{*< note  }
{*< velocity  }
{*< note-off velocity; only for #SND_SEQ_EVENT_NOTE  }
{*< duration until note-off; only for #SND_SEQ_EVENT_NOTE  }
type
  Psnd_seq_ev_note = ^Tsnd_seq_ev_note;
  Tsnd_seq_ev_note = record
      channel : byte;
      note : byte;
      velocity : byte;
      off_velocity : byte;
      duration : dword;
    end;
  Tsnd_seq_ev_note_t = Tsnd_seq_ev_note;
  Psnd_seq_ev_note_t = ^Tsnd_seq_ev_note_t;
{* Controller event  }
{*< channel number  }
{*< reserved  }
{*< control parameter  }
{*< control value  }

  Psnd_seq_ev_ctrl = ^Tsnd_seq_ev_ctrl;
  Tsnd_seq_ev_ctrl = record
      channel : byte;
      unused : array[0..2] of byte;
      param : dword;
      value : longint;
    end;
  Tsnd_seq_ev_ctrl_t = Tsnd_seq_ev_ctrl;
  Psnd_seq_ev_ctrl_t = ^Tsnd_seq_ev_ctrl_t;
{* generic set of bytes (12x8 bit)  }
{*< 8 bit value  }

  Psnd_seq_ev_raw8 = ^Tsnd_seq_ev_raw8;
  Tsnd_seq_ev_raw8 = record
      d : array[0..11] of byte;
    end;
  Tsnd_seq_ev_raw8_t = Tsnd_seq_ev_raw8;
  Psnd_seq_ev_raw8_t = ^Tsnd_seq_ev_raw8_t;
{* generic set of integers (3x32 bit)  }
{*< 32 bit value  }

  Psnd_seq_ev_raw32 = ^Tsnd_seq_ev_raw32;
  Tsnd_seq_ev_raw32 = record
      d : array[0..2] of dword;
    end;
  Tsnd_seq_ev_raw32_t = Tsnd_seq_ev_raw32;
  Psnd_seq_ev_raw32_t = ^Tsnd_seq_ev_raw32_t;
{* external stored data  }
{*< length of data  }
{*< pointer to data (note: can be 64-bit)  }
  Psnd_seq_ev_ext = ^Tsnd_seq_ev_ext;
  Tsnd_seq_ev_ext = record
      len : dword;
      ptr : pointer;
    end;

{* external stored data  }
  Tsnd_seq_ev_ext = Tsnd_seq_ev_ext_t;
{$ifdef DOC_HIDDEN}
{ redefine typedef for stupid doxygen  }

  Psnd_seq_ev_ext_t = ^Tsnd_seq_ev_ext_t;
  Tsnd_seq_ev_ext_t = Tsnd_seq_ev_ext;
{$endif}
{* Result events  }
{*< processed event type  }
{*< status  }
type
  Psnd_seq_result = ^Tsnd_seq_result;
  Tsnd_seq_result = record
      event : longint;
      result : longint;
    end;
  Tsnd_seq_result_t = Tsnd_seq_result;
  Psnd_seq_result_t = ^Tsnd_seq_result_t;
{* Queue skew values  }
{*< skew value  }
{*< skew base  }

  Psnd_seq_queue_skew = ^Tsnd_seq_queue_skew;
  Tsnd_seq_queue_skew = record
      value : dword;
      base : dword;
    end;
  Tsnd_seq_queue_skew_t = Tsnd_seq_queue_skew;
  Psnd_seq_queue_skew_t = ^Tsnd_seq_queue_skew_t;
{* queue timer control  }
{*< affected queue  }
{*< reserved  }
{*< affected value (e.g. tempo)  }
{*< time  }
{*< sync position  }
{*< queue skew  }
{*< any data  }
{*< any data  }
{*< data value union  }

  Psnd_seq_ev_queue_control = ^Tsnd_seq_ev_queue_control;
  Tsnd_seq_ev_queue_control = record
      queue : byte;
      unused : array[0..2] of byte;
      param : record
          case longint of
            0 : ( value : longint );
            1 : ( time : Tsnd_seq_timestamp_t );
            2 : ( position : dword );
            3 : ( skew : Tsnd_seq_queue_skew_t );
            4 : ( d32 : array[0..1] of dword );
            5 : ( d8 : array[0..7] of byte );
          end;
    end;
  Tsnd_seq_ev_queue_control_t = Tsnd_seq_ev_queue_control;
  Psnd_seq_ev_queue_control_t = ^Tsnd_seq_ev_queue_control_t;
{* Sequencer event data  }
{*< note information  }
{*< MIDI control information  }
{*< raw8 data  }
{*< raw32 data  }
{*< external data  }
{*< queue control  }
{*< timestamp  }
{*< address  }
{*< connect information  }
{*< operation result code  }

  Psnd_seq_event_data = ^Tsnd_seq_event_data;
  Tsnd_seq_event_data = record
      case longint of
        0 : ( note : Tsnd_seq_ev_note_t );
        1 : ( control : Tsnd_seq_ev_ctrl_t );
        2 : ( raw8 : Tsnd_seq_ev_raw8_t );
        3 : ( raw32 : Tsnd_seq_ev_raw32_t );
        4 : ( ext : Tsnd_seq_ev_ext_t );
        5 : ( queue : Tsnd_seq_ev_queue_control_t );
        6 : ( time : Tsnd_seq_timestamp_t );
        7 : ( addr : Tsnd_seq_addr_t );
        8 : ( connect : Tsnd_seq_connect_t );
        9 : ( result : Tsnd_seq_result_t );
      end;
  Tsnd_seq_event_data_t = Tsnd_seq_event_data;
  Psnd_seq_event_data_t = ^Tsnd_seq_event_data_t;
{* Sequencer event  }
{*< event type  }
{*< event flags  }
{*< tag  }
{*< schedule queue  }
{*< schedule time  }
{*< source address  }
{*< destination address  }
{*< event data...  }

  Psnd_seq_event = ^Tsnd_seq_event;
  Tsnd_seq_event = record
      _type : Tsnd_seq_event_type_t;
      flags : byte;
      tag : byte;
      queue : byte;
      time : Tsnd_seq_timestamp_t;
      source : Tsnd_seq_addr_t;
      dest : Tsnd_seq_addr_t;
      data : Tsnd_seq_event_data_t;
    end;
  Tsnd_seq_event_t = Tsnd_seq_event;
  Psnd_seq_event_t = ^Tsnd_seq_event_t;
{* UMP sequencer event; compatible with legacy sequencer event  }
{*< event type  }
{*< event flags  }
{*< tag  }
{*< schedule queue  }
{*< schedule time  }
{*< source address  }
{*< destination address  }
{*< (shared) legacy data  }
{*< UMP data bytes  }

  Psnd_seq_ump_event = ^Tsnd_seq_ump_event;
  Tsnd_seq_ump_event = record
      _type : Tsnd_seq_event_type_t;
      flags : byte;
      tag : byte;
      queue : byte;
      time : Tsnd_seq_timestamp_t;
      source : Tsnd_seq_addr_t;
      dest : Tsnd_seq_addr_t;
      xxxxxx : record
          case longint of
            0 : ( data : Tsnd_seq_event_data_t );
            1 : ( ump : array[0..3] of dword );
          end;
    end;
  Tsnd_seq_ump_event_t = Tsnd_seq_ump_event;
  Psnd_seq_ump_event_t = ^Tsnd_seq_ump_event_t;
{* \  }
{$endif}
{ __ALSA_SEQ_EVENT_H  }

// === Konventiert am: 19-11-25 16:11:44 ===


implementation



end.
