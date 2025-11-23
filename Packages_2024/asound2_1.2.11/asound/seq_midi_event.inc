{$IFDEF read_interface}

type
  Psnd_midi_event_t = type Pointer;
  PPsnd_midi_event_t = ^Psnd_midi_event_t;

function snd_midi_event_new(bufsize: Tsize_t; rdev: PPsnd_midi_event_t): longint; cdecl; external libasound;
function snd_midi_event_resize_buffer(dev: Psnd_midi_event_t; bufsize: Tsize_t): longint; cdecl; external libasound;
procedure snd_midi_event_free(dev: Psnd_midi_event_t); cdecl; external libasound;
procedure snd_midi_event_init(dev: Psnd_midi_event_t); cdecl; external libasound;
procedure snd_midi_event_reset_encode(dev: Psnd_midi_event_t); cdecl; external libasound;
procedure snd_midi_event_reset_decode(dev: Psnd_midi_event_t); cdecl; external libasound;
procedure snd_midi_event_no_status(dev: Psnd_midi_event_t; on: longint); cdecl; external libasound;
function snd_midi_event_encode(dev: Psnd_midi_event_t; buf: pbyte; count: Tlong; ev: Psnd_seq_event_t): Tlong; cdecl; external libasound;
function snd_midi_event_encode_byte(dev: Psnd_midi_event_t; c: longint; ev: Psnd_seq_event_t): longint; cdecl; external libasound;
function snd_midi_event_decode(dev: Psnd_midi_event_t; buf: pbyte; count: Tlong; ev: Psnd_seq_event_t): Tlong; cdecl; external libasound;

// === Konventiert am: 19-11-25 16:11:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
