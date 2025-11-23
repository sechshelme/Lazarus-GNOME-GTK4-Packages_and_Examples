unit seq_event;

interface

uses
  fp_asound;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Psnd_seq_event_type_t = ^Tsnd_seq_event_type_t;
  Tsnd_seq_event_type_t = longint;

const
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

type
  Tsnd_seq_addr_t = record
    client: byte;
    port: byte;
  end;
  Psnd_seq_addr_t = ^Tsnd_seq_addr_t;

  Tsnd_seq_connect_t = record
    sender: Tsnd_seq_addr_t;
    dest: Tsnd_seq_addr_t;
  end;
  Psnd_seq_connect_t = ^Tsnd_seq_connect_t;

  Tsnd_seq_real_time_t = record
    tv_sec: dword;
    tv_nsec: dword;
  end;
  Psnd_seq_real_time_t = ^Tsnd_seq_real_time_t;

  Psnd_seq_tick_time_t = ^Tsnd_seq_tick_time_t;
  Tsnd_seq_tick_time_t = dword;

  Tsnd_seq_timestamp_t = record
    case longint of
      0: (tick: Tsnd_seq_tick_time_t);
      1: (time: Tsnd_seq_real_time_t);
  end;
  Psnd_seq_timestamp_t = ^Tsnd_seq_timestamp_t;

const
  SND_SEQ_TIME_STAMP_TICK = 0 shl 0;
  SND_SEQ_TIME_STAMP_REAL = 1 shl 0;
  SND_SEQ_TIME_STAMP_MASK = 1 shl 0;
  SND_SEQ_TIME_MODE_ABS = 0 shl 1;
  SND_SEQ_TIME_MODE_REL = 1 shl 1;
  SND_SEQ_TIME_MODE_MASK = 1 shl 1;
  SND_SEQ_EVENT_LENGTH_FIXED = 0 shl 2;
  SND_SEQ_EVENT_LENGTH_VARIABLE = 1 shl 2;
  SND_SEQ_EVENT_LENGTH_VARUSR = 2 shl 2;
  SND_SEQ_EVENT_LENGTH_MASK = 3 shl 2;
  SND_SEQ_PRIORITY_NORMAL = 0 shl 4;
  SND_SEQ_PRIORITY_HIGH = 1 shl 4;
  SND_SEQ_PRIORITY_MASK = 1 shl 4;
  SND_SEQ_EVENT_UMP = 1 shl 5;

type
  Tsnd_seq_ev_note_t = record
    channel: byte;
    note: byte;
    velocity: byte;
    off_velocity: byte;
    duration: dword;
  end;
  Psnd_seq_ev_note_t = ^Tsnd_seq_ev_note_t;

  Tsnd_seq_ev_ctrl_t = record
    channel: byte;
    unused: array[0..2] of byte;
    param: dword;
    value: longint;
  end;
  Psnd_seq_ev_ctrl_t = ^Tsnd_seq_ev_ctrl_t;

  Tsnd_seq_ev_raw8_t = record
    d: array[0..11] of byte;
  end;
  Psnd_seq_ev_raw8_t = ^Tsnd_seq_ev_raw8_t;

  Tsnd_seq_ev_raw32_t = record
    d: array[0..2] of dword;
  end;
  Psnd_seq_ev_raw32_t = ^Tsnd_seq_ev_raw32_t;

  Tsnd_seq_ev_ext_t = record
    len: dword;
    ptr: pointer;
  end;
  Psnd_seq_ev_ext_t = ^Tsnd_seq_ev_ext_t;

  Tsnd_seq_result_t = record
    event: longint;
    result: longint;
  end;
  Psnd_seq_result_t = ^Tsnd_seq_result_t;

  Tsnd_seq_queue_skew_t = record
    value: dword;
    base: dword;
  end;
  Psnd_seq_queue_skew_t = ^Tsnd_seq_queue_skew_t;

  Tsnd_seq_ev_queue_control_t = record
    queue: byte;
    unused: array[0..2] of byte;
    param: record
      case longint of
        0: (value: longint);
        1: (time: Tsnd_seq_timestamp_t);
        2: (position: dword);
        3: (skew: Tsnd_seq_queue_skew_t);
        4: (d32: array[0..1] of dword);
        5: (d8: array[0..7] of byte);
      end;
  end;
  Psnd_seq_ev_queue_control_t = ^Tsnd_seq_ev_queue_control_t;

  Psnd_seq_event_data_t = ^Tsnd_seq_event_data_t;
  Tsnd_seq_event_data_t = record
    case longint of
      0: (note: Tsnd_seq_ev_note_t);
      1: (control: Tsnd_seq_ev_ctrl_t);
      2: (raw8: Tsnd_seq_ev_raw8_t);
      3: (raw32: Tsnd_seq_ev_raw32_t);
      4: (ext: Tsnd_seq_ev_ext_t);
      5: (queue: Tsnd_seq_ev_queue_control_t);
      6: (time: Tsnd_seq_timestamp_t);
      7: (addr: Tsnd_seq_addr_t);
      8: (connect: Tsnd_seq_connect_t);
      9: (result: Tsnd_seq_result_t);
  end;

  Tsnd_seq_event_t = record
    _type: Tsnd_seq_event_type_t;
    flags: byte;
    tag: byte;
    queue: byte;
    time: Tsnd_seq_timestamp_t;
    source: Tsnd_seq_addr_t;
    dest: Tsnd_seq_addr_t;
    data: Tsnd_seq_event_data_t;
  end;
  Psnd_seq_event_t = ^Tsnd_seq_event_t;
  PPsnd_seq_event_t = ^Psnd_seq_event_t;

  Tsnd_seq_ump_event_t = record
    _type: Tsnd_seq_event_type_t;
    flags: byte;
    tag: byte;
    queue: byte;
    time: Tsnd_seq_timestamp_t;
    source: Tsnd_seq_addr_t;
    dest: Tsnd_seq_addr_t;
    case longint of
      0: (data: Tsnd_seq_event_data_t);
      1: (ump: array[0..3] of dword);
  end;
  Psnd_seq_ump_event_t = ^Tsnd_seq_ump_event_t;
  PPsnd_seq_ump_event_t = ^Psnd_seq_ump_event_t;

  // === Konventiert am: 19-11-25 16:11:44 ===


implementation



end.
