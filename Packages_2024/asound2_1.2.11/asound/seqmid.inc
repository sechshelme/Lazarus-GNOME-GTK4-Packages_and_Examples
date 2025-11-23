{$IFDEF read_interface}


procedure snd_seq_ev_clear(ev: Psnd_seq_event_t); inline;
procedure snd_seq_ump_ev_clear(ev: Psnd_seq_event_t); inline;

procedure snd_seq_ev_set_tag(ev: Psnd_seq_event_t; t: byte);

procedure snd_seq_ev_set_dest(ev: Psnd_seq_event_t; c, p: integer); inline;
procedure snd_seq_ev_set_subs(ev: Psnd_seq_event_t); inline;
procedure snd_seq_ev_set_broadcast(ev: Psnd_seq_event_t); inline;

procedure snd_seq_ev_set_source(ev: Psnd_seq_event_t; p: byte);
procedure snd_seq_ev_set_direct(ev: Psnd_seq_event_t);

procedure snd_seq_ev_schedule_real(ev: Psnd_seq_event_t; q: integer; relative: boolean; rtime: Psnd_seq_real_time_t); inline;
procedure snd_seq_ev_set_priority(ev: Psnd_seq_event_t; high_prior: boolean); inline;
procedure snd_seq_ev_set_fixed(ev: Psnd_seq_event_t); inline;

procedure snd_seq_ev_set_variable(ev: Psnd_seq_event_t; datalen: cardinal; dataptr: Pointer); inline;
procedure snd_seq_ev_set_varusr(ev: Psnd_seq_event_t; datalen: cardinal; dataptr: Pointer); inline;

procedure snd_seq_ev_set_queue_control(ev: Psnd_seq_event_t; typ: integer; q: integer; val: integer); inline;

procedure snd_seq_ev_set_queue_start(ev: Psnd_seq_event_t; q: longint);
procedure snd_seq_ev_set_queue_stop(ev: Psnd_seq_event_t; q: longint);
procedure snd_seq_ev_set_queue_continue(ev: Psnd_seq_event_t; q: longint);
procedure snd_seq_ev_set_queue_tempo(ev: Psnd_seq_event_t; q, val: longint);

procedure snd_seq_ev_set_queue_pos_real(ev: Psnd_seq_event_t; q: integer; rtime: Psnd_seq_real_time_t); inline;
procedure snd_seq_ev_set_queue_pos_tick(ev: Psnd_seq_event_t; q: integer; ttime: Tsnd_seq_tick_time_t); inline;
procedure snd_seq_ev_set_ump(ev: Psnd_seq_ump_event_t); inline;
function snd_seq_ev_set_ump_data(ev: Psnd_seq_ump_event_t; data: Pointer; bytes: Tsize_t): integer; inline;


function snd_seq_control_queue(seq: Psnd_seq_t; q: longint; _type: longint; value: longint; ev: Psnd_seq_event_t): longint; cdecl; external libasound;
function snd_seq_start_queue(seq: Psnd_seq_t; q: integer; ev: Psnd_seq_event_t): longint;
function snd_seq_stop_queue(seq: Psnd_seq_t; q: integer; ev: Psnd_seq_event_t): longint;
function snd_seq_continue_queue(seq: Psnd_seq_t; q: integer; ev: Psnd_seq_event_t): longint;
function snd_seq_change_queue_tempo(seq: Psnd_seq_t; q, tempo: integer; ev: Psnd_seq_event_t): longint;

function snd_seq_create_simple_port(seq: Psnd_seq_t; name: pchar; caps: dword; _type: dword): longint; cdecl; external libasound;
function snd_seq_delete_simple_port(seq: Psnd_seq_t; port: longint): longint; cdecl; external libasound;
function snd_seq_connect_from(seq: Psnd_seq_t; my_port: longint; src_client: longint; src_port: longint): longint; cdecl; external libasound;
function snd_seq_connect_to(seq: Psnd_seq_t; my_port: longint; dest_client: longint; dest_port: longint): longint; cdecl; external libasound;
function snd_seq_disconnect_from(seq: Psnd_seq_t; my_port: longint; src_client: longint; src_port: longint): longint; cdecl; external libasound;
function snd_seq_disconnect_to(seq: Psnd_seq_t; my_port: longint; dest_client: longint; dest_port: longint): longint; cdecl; external libasound;

function snd_seq_set_client_name(seq: Psnd_seq_t; name: pchar): longint; cdecl; external libasound;
function snd_seq_set_client_event_filter(seq: Psnd_seq_t; event_type: longint): longint; cdecl; external libasound;
function snd_seq_set_client_midi_version(seq: Psnd_seq_t; midi_version: longint): longint; cdecl; external libasound;
function snd_seq_set_client_ump_conversion(seq: Psnd_seq_t; enable: longint): longint; cdecl; external libasound;
function snd_seq_set_client_pool_output(seq: Psnd_seq_t; size: Tsize_t): longint; cdecl; external libasound;
function snd_seq_set_client_pool_output_room(seq: Psnd_seq_t; size: Tsize_t): longint; cdecl; external libasound;
function snd_seq_set_client_pool_input(seq: Psnd_seq_t; size: Tsize_t): longint; cdecl; external libasound;

function snd_seq_sync_output_queue(seq: Psnd_seq_t): longint; cdecl; external libasound;
function snd_seq_parse_address(seq: Psnd_seq_t; addr: Psnd_seq_addr_t; str: pchar): longint; cdecl; external libasound;
function snd_seq_reset_pool_output(seq: Psnd_seq_t): longint; cdecl; external libasound;
function snd_seq_reset_pool_input(seq: Psnd_seq_t): longint; cdecl; external libasound;

procedure snd_seq_ev_set_note(ev: Psnd_seq_event_t; ch, key, vel, dur: integer); inline;
procedure snd_seq_ev_set_noteon(ev: Psnd_seq_event_t; ch, key, vel: integer); inline;
procedure snd_seq_ev_set_noteoff(ev: Psnd_seq_event_t; ch, key, vel: integer); inline;
procedure snd_seq_ev_set_keypress(ev: Psnd_seq_event_t; ch, key, vel: integer); inline;
procedure snd_seq_ev_set_controller(ev: Psnd_seq_event_t; ch, cc, val: integer); inline;
procedure snd_seq_ev_set_pgmchange(ev: Psnd_seq_event_t; ch, val: integer); inline;
procedure snd_seq_ev_set_pitchbend(ev: Psnd_seq_event_t; ch, val: integer); inline;
procedure snd_seq_ev_set_chanpress(ev: Psnd_seq_event_t; ch, val: integer); inline;
procedure snd_seq_ev_set_sysex(ev: Psnd_seq_event_t; datalen: cardinal; dataptr: Pointer); inline;


// === Konventiert am: 19-11-25 16:11:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

procedure snd_seq_ev_clear(ev: Psnd_seq_event_t); inline;
begin
  FillChar(ev^, SizeOf(ev^), 0);
end;

procedure snd_seq_ump_ev_clear(ev: Psnd_seq_event_t); inline;
begin
  FillChar(ev^, SizeOf(ev^), 0);
end;

procedure snd_seq_ev_set_tag(ev: Psnd_seq_event_t; t: byte);
begin
  ev^.tag := t;
end;

procedure snd_seq_ev_set_dest(ev: Psnd_seq_event_t; c, p: integer); inline;
begin
  ev^.dest.client := c;
  ev^.dest.port := p;
end;

procedure snd_seq_ev_set_subs(ev: Psnd_seq_event_t); inline;
begin
  ev^.dest.client := SND_SEQ_ADDRESS_SUBSCRIBERS;
  ev^.dest.port := SND_SEQ_ADDRESS_UNKNOWN;
end;

procedure snd_seq_ev_set_broadcast(ev: Psnd_seq_event_t); inline;
begin
  ev^.dest.client := SND_SEQ_ADDRESS_BROADCAST;
  ev^.dest.port := SND_SEQ_ADDRESS_BROADCAST;
end;

procedure snd_seq_ev_schedule_real(ev: Psnd_seq_event_t; q: integer; relative: boolean; rtime: Psnd_seq_real_time_t);
begin
  ev^.flags := ev^.flags and not (SND_SEQ_TIME_STAMP_MASK or SND_SEQ_TIME_MODE_MASK);
  ev^.flags := ev^.flags or SND_SEQ_TIME_STAMP_REAL;
  if relative then begin
    ev^.flags := ev^.flags or SND_SEQ_TIME_MODE_REL;
  end else begin
    ev^.flags := ev^.flags or SND_SEQ_TIME_MODE_ABS;
  end;
  ev^.time.time := rtime^;
  ev^.queue := q;
end;

procedure snd_seq_ev_set_priority(ev: Psnd_seq_event_t; high_prior: boolean); inline;
begin
  ev^.flags := ev^.flags and not SND_SEQ_PRIORITY_MASK;
  if high_prior then begin
    ev^.flags := ev^.flags or SND_SEQ_PRIORITY_HIGH;
  end else begin
    ev^.flags := ev^.flags or SND_SEQ_PRIORITY_NORMAL;
  end;
end;

procedure snd_seq_ev_set_fixed(ev: Psnd_seq_event_t); inline;
begin
  ev^.flags := ev^.flags and not SND_SEQ_EVENT_LENGTH_MASK;
  ev^.flags := ev^.flags or SND_SEQ_EVENT_LENGTH_FIXED;
end;


procedure snd_seq_ev_set_source(ev: Psnd_seq_event_t; p: byte);
begin
  ev^.source.port := p;
end;

procedure snd_seq_ev_set_direct(ev: Psnd_seq_event_t);
begin
  ev^.queue := SND_SEQ_QUEUE_DIRECT;
end;

procedure snd_seq_ev_set_variable(ev: Psnd_seq_event_t; datalen: cardinal; dataptr: Pointer); inline;
begin
  ev^.flags := ev^.flags and not SND_SEQ_EVENT_LENGTH_MASK;
  ev^.flags := ev^.flags or SND_SEQ_EVENT_LENGTH_VARIABLE;
  ev^.data.ext.len := datalen;
  ev^.data.ext.ptr := dataptr;
end;

procedure snd_seq_ev_set_varusr(ev: Psnd_seq_event_t; datalen: cardinal; dataptr: Pointer); inline;
begin
  ev^.flags := ev^.flags and not SND_SEQ_EVENT_LENGTH_MASK;
  ev^.flags := ev^.flags or SND_SEQ_EVENT_LENGTH_VARUSR;
  ev^.data.ext.len := datalen;
  ev^.data.ext.ptr := dataptr;
end;

procedure snd_seq_ev_set_queue_control(ev: Psnd_seq_event_t; typ: integer; q: integer; val: integer); inline;
begin
  ev^._type := typ;
  snd_seq_ev_set_dest(ev, SND_SEQ_CLIENT_SYSTEM, SND_SEQ_PORT_SYSTEM_TIMER);
  ev^.data.queue.queue := q;
  ev^.data.queue.param.value := val;
end;

procedure snd_seq_ev_set_queue_start(ev: Psnd_seq_event_t; q: longint);
begin
  snd_seq_ev_set_queue_control(ev, SND_SEQ_EVENT_START, q, 0);
end;

procedure snd_seq_ev_set_queue_stop(ev: Psnd_seq_event_t; q: longint);
begin
  snd_seq_ev_set_queue_control(ev, SND_SEQ_EVENT_STOP, q, 0);
end;

procedure snd_seq_ev_set_queue_continue(ev: Psnd_seq_event_t; q: longint);
begin
  snd_seq_ev_set_queue_control(ev, SND_SEQ_EVENT_CONTINUE, q, 0);
end;

procedure snd_seq_ev_set_queue_tempo(ev: Psnd_seq_event_t; q, val: longint);
begin
  snd_seq_ev_set_queue_control(ev, SND_SEQ_EVENT_TEMPO, q, val);
end;

procedure snd_seq_ev_set_queue_pos_real(ev: Psnd_seq_event_t; q: integer; rtime: Psnd_seq_real_time_t); inline;
begin
  ev^._type := SND_SEQ_EVENT_SETPOS_TIME;
  snd_seq_ev_set_dest(ev, SND_SEQ_CLIENT_SYSTEM, SND_SEQ_PORT_SYSTEM_TIMER);
  ev^.data.queue.queue := q;
  ev^.data.queue.param.time.time := rtime^;
end;

procedure snd_seq_ev_set_queue_pos_tick(ev: Psnd_seq_event_t; q: integer;
  ttime: Tsnd_seq_tick_time_t);
begin
  ev^._type := SND_SEQ_EVENT_SETPOS_TICK;
  snd_seq_ev_set_dest(ev, SND_SEQ_CLIENT_SYSTEM, SND_SEQ_PORT_SYSTEM_TIMER);
  ev^.data.queue.queue := q;
  ev^.data.queue.param.time.tick := ttime;
end;

procedure snd_seq_ev_set_ump(ev: Psnd_seq_ump_event_t); inline;
begin
  ev^.flags := ev^.flags or SND_SEQ_EVENT_UMP;
  ev^._type := 0;
end;

function snd_seq_ev_set_ump_data(ev: Psnd_seq_ump_event_t; data: Pointer; bytes: Tsize_t): integer;
const
  EINVAL = 22;
begin
  if bytes > 16 then begin
    Exit(-EINVAL);
  end;
  snd_seq_ev_set_ump(ev);
  Move(data^, ev^.ump[0], bytes);
  Result := 0;
end;


function snd_seq_start_queue(seq: Psnd_seq_t; q: integer; ev: Psnd_seq_event_t
  ): longint;
begin
  snd_seq_start_queue := snd_seq_control_queue(seq, q, SND_SEQ_EVENT_START, 0, ev);
end;

function snd_seq_stop_queue(seq: Psnd_seq_t; q: integer; ev: Psnd_seq_event_t
  ): longint;
begin
  snd_seq_stop_queue := snd_seq_control_queue(seq, q, SND_SEQ_EVENT_STOP, 0, ev);
end;

function snd_seq_continue_queue(seq: Psnd_seq_t; q: integer;
  ev: Psnd_seq_event_t): longint;
begin
  snd_seq_continue_queue := snd_seq_control_queue(seq, q, SND_SEQ_EVENT_CONTINUE, 0, ev);
end;

function snd_seq_change_queue_tempo(seq: Psnd_seq_t; q, tempo: integer;
  ev: Psnd_seq_event_t): longint;
begin
  snd_seq_change_queue_tempo := snd_seq_control_queue(seq, q, SND_SEQ_EVENT_TEMPO, tempo, ev);
end;

procedure snd_seq_ev_set_note(ev: Psnd_seq_event_t; ch, key, vel, dur: integer); inline;
begin
  ev^._type := SND_SEQ_EVENT_NOTE;
  snd_seq_ev_set_fixed(ev);
  ev^.data.note.channel := ch;
  ev^.data.note.note := key;
  ev^.data.note.velocity := vel;
  ev^.data.note.duration := dur;
end;

procedure snd_seq_ev_set_noteon(ev: Psnd_seq_event_t; ch, key, vel: integer); inline;
begin
  ev^._type := SND_SEQ_EVENT_NOTEON;
  snd_seq_ev_set_fixed(ev);
  ev^.data.note.channel := ch;
  ev^.data.note.note := key;
  ev^.data.note.velocity := vel;
end;

procedure snd_seq_ev_set_noteoff(ev: Psnd_seq_event_t; ch, key, vel: integer); inline;
begin
  ev^._type := SND_SEQ_EVENT_NOTEOFF;
  snd_seq_ev_set_fixed(ev);
  ev^.data.note.channel := ch;
  ev^.data.note.note := key;
  ev^.data.note.velocity := vel;
end;

procedure snd_seq_ev_set_keypress(ev: Psnd_seq_event_t; ch, key, vel: integer); inline;
begin
  ev^._type := SND_SEQ_EVENT_KEYPRESS;
  snd_seq_ev_set_fixed(ev);
  ev^.data.note.channel := ch;
  ev^.data.note.note := key;
  ev^.data.note.velocity := vel;
end;

procedure snd_seq_ev_set_controller(ev: Psnd_seq_event_t; ch, cc, val: integer); inline;
begin
  ev^._type := SND_SEQ_EVENT_CONTROLLER;
  snd_seq_ev_set_fixed(ev);
  ev^.data.control.channel := ch;
  ev^.data.control.param := cc;
  ev^.data.control.value := val;
end;

procedure snd_seq_ev_set_pgmchange(ev: Psnd_seq_event_t; ch, val: integer); inline;
begin
  ev^._type := SND_SEQ_EVENT_PGMCHANGE;
  snd_seq_ev_set_fixed(ev);
  ev^.data.control.channel := ch;
  ev^.data.control.value := val;
end;

procedure snd_seq_ev_set_pitchbend(ev: Psnd_seq_event_t; ch, val: integer); inline;
begin
  ev^._type := SND_SEQ_EVENT_PITCHBEND;
  snd_seq_ev_set_fixed(ev);
  ev^.data.control.channel := ch;
  ev^.data.control.value := val;
end;

procedure snd_seq_ev_set_chanpress(ev: Psnd_seq_event_t; ch, val: integer); inline;
begin
  ev^._type := SND_SEQ_EVENT_CHANPRESS;
  snd_seq_ev_set_fixed(ev);
  ev^.data.control.channel := ch;
  ev^.data.control.value := val;
end;

procedure snd_seq_ev_set_sysex(ev: Psnd_seq_event_t; datalen: cardinal; dataptr: Pointer); inline;
begin
  ev^._type := SND_SEQ_EVENT_SYSEX;
  snd_seq_ev_set_variable(ev, datalen, dataptr);
end;


{$ENDIF read_implementation}
