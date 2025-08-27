{$IFDEF read_interface}


function evbuffer_readline(buffer: Pevbuffer): pchar; cdecl; external libevent;

type
  Tevbuffer_cb = procedure(buffer: Pevbuffer; old_len: Tsize_t; new_len: Tsize_t; arg: pointer); cdecl;

function evbuffer_setcb(buffer: Pevbuffer; cb: Tevbuffer_cb; cbarg: pointer): longint; cdecl; external libevent;
function evbuffer_find(buffer: Pevbuffer; what: pbyte; len: Tsize_t): pbyte; cdecl; external libevent;

function EVBUFFER_LENGTH(x: Pevbuffer): Tsize_t;
function EVBUFFER_DATA(x: Pevbuffer): PByte;

// === Konventiert am: 26-8-25 17:43:34 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EVBUFFER_LENGTH(x: Pevbuffer): Tsize_t;
begin
  EVBUFFER_LENGTH := evbuffer_get_length(x);
end;

function EVBUFFER_DATA(x: Pevbuffer): PByte;
begin
  EVBUFFER_DATA := evbuffer_pullup(x, -(1));
end;


{$ENDIF read_implementation}
