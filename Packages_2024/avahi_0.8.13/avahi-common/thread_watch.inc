{$IFDEF read_interface}


type
  PAvahiThreadedPoll = type Pointer;

function avahi_threaded_poll_new: PAvahiThreadedPoll; cdecl; external libavahi_common;
procedure avahi_threaded_poll_free(p: PAvahiThreadedPoll); cdecl; external libavahi_common;
function avahi_threaded_poll_get(p: PAvahiThreadedPoll): PAvahiPoll; cdecl; external libavahi_common;
function avahi_threaded_poll_start(p: PAvahiThreadedPoll): longint; cdecl; external libavahi_common;
function avahi_threaded_poll_stop(p: PAvahiThreadedPoll): longint; cdecl; external libavahi_common;
procedure avahi_threaded_poll_quit(p: PAvahiThreadedPoll); cdecl; external libavahi_common;
procedure avahi_threaded_poll_lock(p: PAvahiThreadedPoll); cdecl; external libavahi_common;
procedure avahi_threaded_poll_unlock(p: PAvahiThreadedPoll); cdecl; external libavahi_common;

// === Konventiert am: 24-12-25 15:59:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
