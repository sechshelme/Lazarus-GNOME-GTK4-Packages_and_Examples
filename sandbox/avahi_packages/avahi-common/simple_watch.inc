{$IFDEF read_interface}


type
  PAvahiSimplePoll = type Pointer;

function avahi_simple_poll_new: PAvahiSimplePoll; cdecl; external libavahi_common;
procedure avahi_simple_poll_free(s: PAvahiSimplePoll); cdecl; external libavahi_common;
function avahi_simple_poll_get(s: PAvahiSimplePoll): PAvahiPoll; cdecl; external libavahi_common;
function avahi_simple_poll_iterate(s: PAvahiSimplePoll; sleep_time: longint): longint; cdecl; external libavahi_common;
procedure avahi_simple_poll_quit(s: PAvahiSimplePoll); cdecl; external libavahi_common;

type
  TAvahiPollFunc = function(ufds: Ppollfd; nfds: dword; timeout: longint; userdata: pointer): longint; cdecl;

procedure avahi_simple_poll_set_func(s: PAvahiSimplePoll; func: TAvahiPollFunc; userdata: pointer); cdecl; external libavahi_common;
function avahi_simple_poll_prepare(s: PAvahiSimplePoll; timeout: longint): longint; cdecl; external libavahi_common;
function avahi_simple_poll_run(s: PAvahiSimplePoll): longint; cdecl; external libavahi_common;
function avahi_simple_poll_dispatch(s: PAvahiSimplePoll): longint; cdecl; external libavahi_common;
function avahi_simple_poll_loop(s: PAvahiSimplePoll): longint; cdecl; external libavahi_common;
procedure avahi_simple_poll_wakeup(s: PAvahiSimplePoll); cdecl; external libavahi_common;

// === Konventiert am: 24-12-25 15:59:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
