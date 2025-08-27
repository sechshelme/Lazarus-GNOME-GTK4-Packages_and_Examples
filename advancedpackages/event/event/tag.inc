{$IFDEF read_interface}


type
  Pevbuffer = type Pointer;

procedure evtag_init; cdecl; external libevent;
function evtag_unmarshal_header(evbuf: Pevbuffer; ptag: Pev_uint32_t): longint; cdecl; external libevent;
procedure evtag_marshal(evbuf: Pevbuffer; tag: Tev_uint32_t; data: pointer; len: Tev_uint32_t); cdecl; external libevent;
procedure evtag_marshal_buffer(evbuf: Pevbuffer; tag: Tev_uint32_t; data: Pevbuffer); cdecl; external libevent;
procedure evtag_encode_int(evbuf: Pevbuffer; number: Tev_uint32_t); cdecl; external libevent;
procedure evtag_encode_int64(evbuf: Pevbuffer; number: Tev_uint64_t); cdecl; external libevent;
procedure evtag_marshal_int(evbuf: Pevbuffer; tag: Tev_uint32_t; integer: Tev_uint32_t); cdecl; external libevent;
procedure evtag_marshal_int64(evbuf: Pevbuffer; tag: Tev_uint32_t; integer: Tev_uint64_t); cdecl; external libevent;
procedure evtag_marshal_string(buf: Pevbuffer; tag: Tev_uint32_t; _string: pchar); cdecl; external libevent;
procedure evtag_marshal_timeval(evbuf: Pevbuffer; tag: Tev_uint32_t; tv: Ptimeval); cdecl; external libevent;
function evtag_unmarshal(src: Pevbuffer; ptag: Pev_uint32_t; dst: Pevbuffer): longint; cdecl; external libevent;
function evtag_peek(evbuf: Pevbuffer; ptag: Pev_uint32_t): longint; cdecl; external libevent;
function evtag_peek_length(evbuf: Pevbuffer; plength: Pev_uint32_t): longint; cdecl; external libevent;
function evtag_payload_length(evbuf: Pevbuffer; plength: Pev_uint32_t): longint; cdecl; external libevent;
function evtag_consume(evbuf: Pevbuffer): longint; cdecl; external libevent;
function evtag_unmarshal_int(evbuf: Pevbuffer; need_tag: Tev_uint32_t; pinteger: Pev_uint32_t): longint; cdecl; external libevent;
function evtag_unmarshal_int64(evbuf: Pevbuffer; need_tag: Tev_uint32_t; pinteger: Pev_uint64_t): longint; cdecl; external libevent;
function evtag_unmarshal_fixed(src: Pevbuffer; need_tag: Tev_uint32_t; data: pointer; len: Tsize_t): longint; cdecl; external libevent;
function evtag_unmarshal_string(evbuf: Pevbuffer; need_tag: Tev_uint32_t; pstring: PPchar): longint; cdecl; external libevent;
function evtag_unmarshal_timeval(evbuf: Pevbuffer; need_tag: Tev_uint32_t; ptv: Ptimeval): longint; cdecl; external libevent;

// === Konventiert am: 26-8-25 19:38:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
