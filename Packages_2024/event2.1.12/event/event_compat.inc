{$IFDEF read_interface}


function event_init: Pevent_base; cdecl; external libevent;
function event_dispatch: longint; cdecl; external libevent;
function event_loop(para1: longint): longint; cdecl; external libevent;
function event_loopexit(para1: Ptimeval): longint; cdecl; external libevent;
function event_loopbreak: longint; cdecl; external libevent;

type
  TEventCallback = procedure(para1: Tevutil_socket_t; para2: smallint; para3: pointer); cdecl;

function event_once(para1: Tevutil_socket_t; para2: smallint; para3: TEventCallback; para4: pointer; para5: Ptimeval): longint; cdecl; external libevent;
function event_get_method: pchar; cdecl; external libevent;
function event_priority_init(para1: longint): longint; cdecl; external libevent;
procedure event_set(para1: Pevent; para2: Tevutil_socket_t; para3: smallint; para4: TEventCallback; para5: pointer); cdecl; external libevent;


procedure evtimer_set(ev: Pevent; cb: TEventCallback; arg: pointer);
procedure evsignal_set(ev: Pevent; x: longint; cb: TEventCallback; arg: pointer);
function timeout_add(ev: Pevent; tv: Ptimeval): longint;
procedure timeout_set(ev: Pevent; cb: TEventCallback; arg: pointer);
function timeout_del(ev: Pevent): longint;
function timeout_pending(ev: Pevent; tv: Ptimeval): longint;
function timeout_initialized(ev: Pevent): longint;
function signal_add(ev: Pevent; tv: Ptimeval): longint;
procedure signal_set(ev: Pevent; x: longint; cb: TEventCallback; arg: pointer);
function signal_del(ev: Pevent): longint;
function signal_pending(ev: Pevent; tv: Ptimeval): longint;
function signal_initialized(ev: Pevent): longint;

function EVENT_FD(ev: Pevent): longint;
function EVENT_SIGNAL(ev: Pevent): longint;


// === Konventiert am: 26-8-25 19:37:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


procedure evtimer_set(ev: Pevent; cb: TEventCallback; arg: pointer);
begin
  event_set(ev, -(1), 0, cb, arg);
end;

procedure evsignal_set(ev: Pevent; x: longint; cb: TEventCallback; arg: pointer);
begin
  event_set(ev, x, EV_SIGNAL or EV_PERSIST, cb, arg);
end;

function timeout_add(ev: Pevent; tv: Ptimeval): longint;
begin
   timeout_add := event_add(ev, tv);
end;

procedure timeout_set(ev: Pevent; cb: TEventCallback; arg: pointer);
begin
  event_set(ev, -(1), 0, cb, arg);
end;

function timeout_del(ev: Pevent): longint;
begin
  timeout_del := event_del(ev);
end;

function timeout_pending(ev: Pevent; tv: Ptimeval): longint;
begin
  timeout_pending := event_pending(ev, EV_TIMEOUT, tv);
end;

function timeout_initialized(ev: Pevent): longint;
begin
  timeout_initialized := event_initialized(ev);
end;

function signal_add(ev: Pevent; tv: Ptimeval): longint;
begin
  signal_add := event_add(ev, tv);
end;

procedure signal_set(ev: Pevent; x: longint; cb: TEventCallback; arg: pointer);
begin
  event_set(ev, x, EV_SIGNAL or EV_PERSIST, cb, arg);
end;

function signal_del(ev: Pevent): longint;
begin
  signal_del := event_del(ev);
end;

function signal_pending(ev: Pevent; tv: Ptimeval): longint;
begin
  signal_pending := event_pending(ev, EV_SIGNAL, tv);
end;

function signal_initialized(ev: Pevent): longint;
begin
  signal_initialized := event_initialized(ev);
end;

function EVENT_FD(ev: Pevent): longint;
begin
  EVENT_FD := longint(event_get_fd(ev));
end;

function EVENT_SIGNAL(ev: Pevent): longint;
begin
  EVENT_SIGNAL := event_get_signal(ev);
end;


{$ENDIF read_implementation}
