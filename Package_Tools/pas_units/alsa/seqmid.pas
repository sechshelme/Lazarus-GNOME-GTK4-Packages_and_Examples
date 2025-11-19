unit seqmid;

interface

uses
  fp_asound;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file include/seqmid.h
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
{$ifndef __ALSA_SEQMID_H}
{$define __ALSA_SEQMID_H}
{ C++ extern C conditionnal removed }
{*
 *  \defgroup SeqMiddle Sequencer Middle Level Interface
 *  Sequencer Middle Level Interface
 *  \ingroup Sequencer
 *  \
  }
{*
 * \brief initialize event record
 * \param ev event record pointer
 * 
 * This macro clears the given event record pointer to the default status.
  }
{ xxxxxxxxxxxxx
static inline void snd_seq_ev_clear(snd_seq_event_t *ev)

	memset(ev, 0, sizeof(*ev));


static inline void snd_seq_ump_ev_clear(snd_seq_ump_event_t *ev)

	memset(ev, 0, sizeof(*ev));

 }
{*
 * \brief set the tag for given event
 * \param ev event record
 * \param t event tag
 *
 * This macro sets the tag to the given event record.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function snd_seq_ev_set_tag(ev,t : longint) : longint;

{*
 * \brief set the explicit destination
 * \param ev event record
 * \param c destination client id
 * \param p destination port id
 *
 * This macro sets the client and port id numbers to the given event record.
 *
 * \sa snd_seq_ev_set_subs()
  }
{xxxxxxxx #define snd_seq_ev_set_dest(ev,c,p) ((ev)->dest.client = (c), (ev)->dest.port = (p)) }
{*
 * \brief set broadcasting to subscribers
 * \param ev event record
 *
 * This macro sets the destination as the subscribers.
 *
 * \sa snd_seq_ev_set_dest()
  }
{xxxxxx #define snd_seq_ev_set_subs(ev) ((ev)->dest.client = SND_SEQ_ADDRESS_SUBSCRIBERS,	 (ev)->dest.port = SND_SEQ_ADDRESS_UNKNOWN) }
{*
 * \brief set broadcasting to all clients/ports
 * \param ev event record
 *
 * This macro sets the destination as the broadcasting.
 *
 * \sa snd_seq_ev_set_dest()
  }
{xxxxxxxx#define snd_seq_ev_set_broadcast(ev) ((ev)->dest.client = SND_SEQ_ADDRESS_BROADCAST, (ev)->dest.port = SND_SEQ_ADDRESS_BROADCAST) }
{*
 * \brief set the source port
 * \param ev event record
 * \param p source port id
 *
 * This macro sets the source port id number.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_set_source(ev,p : longint) : longint;

{*
 * \brief set direct passing mode (without queued)
 * \param ev event instance
 *
 * This macro sets the event to the direct passing mode
 * to be delivered immediately without queueing.
 * 
 * \sa snd_seq_ev_schedule_tick(), snd_seq_ev_schedule_real()
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_set_direct(ev : longint) : longint;

{*
 * \brief set tick-scheduling mode on queue
 * \param ev event instance
 * \param q queue id to schedule
 * \param relative relative time-stamp if non-zero
 * \param ttick tick time-stamp to be delivered
 *
 * This macro sets the scheduling of the event in the
 * MIDI tick mode.
 *
 * \sa snd_seq_ev_schedule_real(), snd_seq_ev_set_direct()
  }
{xxxxxxx
#define snd_seq_ev_schedule_tick(ev, q, relative, ttick) \
	((ev)->flags &= ~(SND_SEQ_TIME_STAMP_MASK | SND_SEQ_TIME_MODE_MASK),\
	 (ev)->flags |= SND_SEQ_TIME_STAMP_TICK,\
	 (ev)->flags |= (relative) ? SND_SEQ_TIME_MODE_REL : SND_SEQ_TIME_MODE_ABS,\
	 (ev)->time.tick = (ttick),\
	 (ev)->queue = (q))

#define snd_seq_ev_schedule_real(ev, q, relative, rtime) \
	((ev)->flags &= ~(SND_SEQ_TIME_STAMP_MASK | SND_SEQ_TIME_MODE_MASK),\
	 (ev)->flags |= SND_SEQ_TIME_STAMP_REAL,\
	 (ev)->flags |= (relative) ? SND_SEQ_TIME_MODE_REL : SND_SEQ_TIME_MODE_ABS,\
	 (ev)->time.time = *(rtime),\
	 (ev)->queue = (q))

#define snd_seq_ev_set_priority(ev, high_prior) \
	((ev)->flags &= ~SND_SEQ_PRIORITY_MASK,\
	 (ev)->flags |= (high_prior) ? SND_SEQ_PRIORITY_HIGH : SND_SEQ_PRIORITY_NORMAL)
 }
{*
 * \brief set fixed data
 * \param ev event instance
 *
 * Sets the event length mode as fixed size.
 *
 * \sa snd_seq_ev_set_variable(), snd_seq_ev_set_varusr()
  }
{xxxxxxx #define snd_seq_ev_set_fixed(ev) ((ev)->flags &= ~SND_SEQ_EVENT_LENGTH_MASK, (ev)->flags |= SND_SEQ_EVENT_LENGTH_FIXED) }
{*
 * \brief set variable data
 * \param ev event instance
 * \param datalen length of the external data
 * \param dataptr pointer of the external data
 *
 * Sets the event length mode as variable length and stores the data.
 *
 * \sa snd_seq_ev_set_fixed(), snd_seq_ev_set_varusr()
  }
{xxxxxxxx
#define snd_seq_ev_set_variable(ev, datalen, dataptr) \
	((ev)->flags &= ~SND_SEQ_EVENT_LENGTH_MASK,\
	 (ev)->flags |= SND_SEQ_EVENT_LENGTH_VARIABLE,\
	 (ev)->data.ext.len = (datalen),\
	 (ev)->data.ext.ptr = (dataptr))

#define snd_seq_ev_set_varusr(ev, datalen, dataptr) \
	((ev)->flags &= ~SND_SEQ_EVENT_LENGTH_MASK,\
	 (ev)->flags |= SND_SEQ_EVENT_LENGTH_VARUSR,\
	 (ev)->data.ext.len = (datalen),\
	 (ev)->data.ext.ptr = (dataptr))

#define snd_seq_ev_set_queue_control(ev, typ, q, val) \
	((ev)->type = (typ),\
	 snd_seq_ev_set_dest(ev, SND_SEQ_CLIENT_SYSTEM, SND_SEQ_PORT_SYSTEM_TIMER),\
	 (ev)->data.queue.queue = (q),\
	 (ev)->data.queue.param.value = (val))
 }
{*
 * \brief set the start queue event
 * \param ev event record
 * \param q queue id to start
 *
 * \sa snd_seq_ev_set_queue_stop(), snd_seq_ev_set_queue_continue()
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_set_queue_start(ev,q : longint) : longint;

{*
 * \brief set the stop queue event
 * \param ev event record
 * \param q queue id to stop
 *
 * \sa snd_seq_ev_set_queue_start(), snd_seq_ev_set_queue_continue()
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_set_queue_stop(ev,q : longint) : longint;

{*
 * \brief set the stop queue event
 * \param ev event record
 * \param q queue id to continue
 *
 * \sa snd_seq_ev_set_queue_start(), snd_seq_ev_set_queue_stop()
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_set_queue_continue(ev,q : longint) : longint;

{*
 * \brief set the stop queue event
 * \param ev event record
 * \param q queue id to change tempo
 * \param val the new tempo value
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_set_queue_tempo(ev,q,val : longint) : longint;

{*
 * \brief set the real-time position of a queue
 * \param ev event record
 * \param q queue id to change tempo
 * \param rtime the new real-time pointer
  }
{
#define snd_seq_ev_set_queue_pos_real(ev, q, rtime) \
	((ev)->type = SND_SEQ_EVENT_SETPOS_TIME,\
	 snd_seq_ev_set_dest(ev, SND_SEQ_CLIENT_SYSTEM, SND_SEQ_PORT_SYSTEM_TIMER),\
	 (ev)->data.queue.queue = (q),\
	 (ev)->data.queue.param.time.time = *(rtime))

#define snd_seq_ev_set_queue_pos_tick(ev, q, ttime) \
	((ev)->type = SND_SEQ_EVENT_SETPOS_TICK,\
	 snd_seq_ev_set_dest(ev, SND_SEQ_CLIENT_SYSTEM, SND_SEQ_PORT_SYSTEM_TIMER),\
	 (ev)->data.queue.queue = (q),\
	 (ev)->data.queue.param.time.tick = (ttime))

static inline void snd_seq_ev_set_ump(snd_seq_ump_event_t *ev)

	ev->flags |= SND_SEQ_EVENT_UMP;
	ev->type = 0; 


static inline int snd_seq_ev_set_ump_data(snd_seq_ump_event_t *ev, void *data, size_t bytes)

	if (bytes > 16)
		return -EINVAL;
	snd_seq_ev_set_ump(ev);
	memcpy(ev->ump, data, bytes);
	return 0;

 }
{ set and send a queue control event  }
function snd_seq_control_queue(seq:Psnd_seq_t; q:longint; _type:longint; value:longint; ev:Psnd_seq_event_t):longint;cdecl;external libasound;
{*
 * \brief start the specified queue
 * \param seq sequencer handle
 * \param q queue id to start
 * \param ev optional event record (see #snd_seq_control_queue)
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_start_queue(seq,q,ev : longint) : longint;

{*
 * \brief stop the specified queue
 * \param seq sequencer handle
 * \param q queue id to stop
 * \param ev optional event record (see #snd_seq_control_queue)
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_stop_queue(seq,q,ev : longint) : longint;

{*
 * \brief continue the specified queue
 * \param seq sequencer handle
 * \param q queue id to continue
 * \param ev optional event record (see #snd_seq_control_queue)
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_continue_queue(seq,q,ev : longint) : longint;

{*
 * \brief change the tempo of the specified queue
 * \param seq sequencer handle
 * \param q queue id
 * \param tempo the new tempo value
 * \param ev optional event record (see #snd_seq_control_queue)
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_change_queue_tempo(seq,q,tempo,ev : longint) : longint;

{ create a port - simple version - return the port number  }
function snd_seq_create_simple_port(seq:Psnd_seq_t; name:Pchar; caps:dword; _type:dword):longint;cdecl;external libasound;
{ delete the port  }
function snd_seq_delete_simple_port(seq:Psnd_seq_t; port:longint):longint;cdecl;external libasound;
{ simple subscription between this port and another port
   (w/o exclusive & time conversion)
    }
function snd_seq_connect_from(seq:Psnd_seq_t; my_port:longint; src_client:longint; src_port:longint):longint;cdecl;external libasound;
function snd_seq_connect_to(seq:Psnd_seq_t; my_port:longint; dest_client:longint; dest_port:longint):longint;cdecl;external libasound;
function snd_seq_disconnect_from(seq:Psnd_seq_t; my_port:longint; src_client:longint; src_port:longint):longint;cdecl;external libasound;
function snd_seq_disconnect_to(seq:Psnd_seq_t; my_port:longint; dest_client:longint; dest_port:longint):longint;cdecl;external libasound;
{
 * set client information
  }
function snd_seq_set_client_name(seq:Psnd_seq_t; name:Pchar):longint;cdecl;external libasound;
function snd_seq_set_client_event_filter(seq:Psnd_seq_t; event_type:longint):longint;cdecl;external libasound;
function snd_seq_set_client_midi_version(seq:Psnd_seq_t; midi_version:longint):longint;cdecl;external libasound;
function snd_seq_set_client_ump_conversion(seq:Psnd_seq_t; enable:longint):longint;cdecl;external libasound;
function snd_seq_set_client_pool_output(seq:Psnd_seq_t; size:Tsize_t):longint;cdecl;external libasound;
function snd_seq_set_client_pool_output_room(seq:Psnd_seq_t; size:Tsize_t):longint;cdecl;external libasound;
function snd_seq_set_client_pool_input(seq:Psnd_seq_t; size:Tsize_t):longint;cdecl;external libasound;
{ sync output queue  }
function snd_seq_sync_output_queue(seq:Psnd_seq_t):longint;cdecl;external libasound;
{
 * parse the given string and get the sequencer address
  }
function snd_seq_parse_address(seq:Psnd_seq_t; addr:Psnd_seq_addr_t; str:Pchar):longint;cdecl;external libasound;
{
 * reset client input/output pool
  }
function snd_seq_reset_pool_output(seq:Psnd_seq_t):longint;cdecl;external libasound;
function snd_seq_reset_pool_input(seq:Psnd_seq_t):longint;cdecl;external libasound;
{*
 * \brief set note event
 * \param ev event record
 * \param ch channel number
 * \param key note key
 * \param vel velocity
 * \param dur duration (in tick or msec)
  }
{xxxxxxxxxxxx
#define snd_seq_ev_set_note(ev, ch, key, vel, dur) \
	((ev)->type = SND_SEQ_EVENT_NOTE,\
	 snd_seq_ev_set_fixed(ev),\
	 (ev)->data.note.channel = (ch),\
	 (ev)->data.note.note = (key),\
	 (ev)->data.note.velocity = (vel),\
	 (ev)->data.note.duration = (dur))

#define snd_seq_ev_set_noteon(ev, ch, key, vel) \
	((ev)->type = SND_SEQ_EVENT_NOTEON,\
	 snd_seq_ev_set_fixed(ev),\
	 (ev)->data.note.channel = (ch),\
	 (ev)->data.note.note = (key),\
	 (ev)->data.note.velocity = (vel))

#define snd_seq_ev_set_noteoff(ev, ch, key, vel) \
	((ev)->type = SND_SEQ_EVENT_NOTEOFF,\
	 snd_seq_ev_set_fixed(ev),\
	 (ev)->data.note.channel = (ch),\
	 (ev)->data.note.note = (key),\
	 (ev)->data.note.velocity = (vel))

#define snd_seq_ev_set_keypress(ev,ch,key,vel) \
	((ev)->type = SND_SEQ_EVENT_KEYPRESS,\
	 snd_seq_ev_set_fixed(ev),\
	 (ev)->data.note.channel = (ch),\
	 (ev)->data.note.note = (key),\
	 (ev)->data.note.velocity = (vel))

#define snd_seq_ev_set_controller(ev,ch,cc,val) \
	((ev)->type = SND_SEQ_EVENT_CONTROLLER,\
	 snd_seq_ev_set_fixed(ev),\
	 (ev)->data.control.channel = (ch),\
	 (ev)->data.control.param = (cc),\
	 (ev)->data.control.value = (val))

#define snd_seq_ev_set_pgmchange(ev,ch,val) \
	((ev)->type = SND_SEQ_EVENT_PGMCHANGE,\
	 snd_seq_ev_set_fixed(ev),\
	 (ev)->data.control.channel = (ch),\
	 (ev)->data.control.value = (val))

#define snd_seq_ev_set_pitchbend(ev,ch,val) \
	((ev)->type = SND_SEQ_EVENT_PITCHBEND,\
	 snd_seq_ev_set_fixed(ev),\
	 (ev)->data.control.channel = (ch),\
	 (ev)->data.control.value = (val))

#define snd_seq_ev_set_chanpress(ev,ch,val) \
	((ev)->type = SND_SEQ_EVENT_CHANPRESS,\
	 snd_seq_ev_set_fixed(ev),\
	 (ev)->data.control.channel = (ch),\
	 (ev)->data.control.value = (val))

#define snd_seq_ev_set_sysex(ev,datalen,dataptr) \
	((ev)->type = SND_SEQ_EVENT_SYSEX,\
	 snd_seq_ev_set_variable(ev, datalen, dataptr))

  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ __ALSA_SEQMID_H  }

// === Konventiert am: 19-11-25 16:11:42 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_set_tag(ev,t : longint) : longint;
begin
  snd_seq_ev_set_tag:=(ev^.tag):=t;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_set_source(ev,p : longint) : longint;
begin
  snd_seq_ev_set_source:=(ev^.(source.port)):=p;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_set_direct(ev : longint) : longint;
begin
  snd_seq_ev_set_direct:=(ev^.queue):=SND_SEQ_QUEUE_DIRECT;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_set_queue_start(ev,q : longint) : longint;
begin
  snd_seq_ev_set_queue_start:=snd_seq_ev_set_queue_control(ev,SND_SEQ_EVENT_START,q,0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_set_queue_stop(ev,q : longint) : longint;
begin
  snd_seq_ev_set_queue_stop:=snd_seq_ev_set_queue_control(ev,SND_SEQ_EVENT_STOP,q,0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_set_queue_continue(ev,q : longint) : longint;
begin
  snd_seq_ev_set_queue_continue:=snd_seq_ev_set_queue_control(ev,SND_SEQ_EVENT_CONTINUE,q,0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_ev_set_queue_tempo(ev,q,val : longint) : longint;
begin
  snd_seq_ev_set_queue_tempo:=snd_seq_ev_set_queue_control(ev,SND_SEQ_EVENT_TEMPO,q,val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_start_queue(seq,q,ev : longint) : longint;
begin
  snd_seq_start_queue:=snd_seq_control_queue(seq,q,SND_SEQ_EVENT_START,0,ev);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_stop_queue(seq,q,ev : longint) : longint;
begin
  snd_seq_stop_queue:=snd_seq_control_queue(seq,q,SND_SEQ_EVENT_STOP,0,ev);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_continue_queue(seq,q,ev : longint) : longint;
begin
  snd_seq_continue_queue:=snd_seq_control_queue(seq,q,SND_SEQ_EVENT_CONTINUE,0,ev);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function snd_seq_change_queue_tempo(seq,q,tempo,ev : longint) : longint;
begin
  snd_seq_change_queue_tempo:=snd_seq_control_queue(seq,q,SND_SEQ_EVENT_TEMPO,tempo,ev);
end;


end.
