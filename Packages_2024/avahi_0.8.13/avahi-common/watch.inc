{$IFDEF read_interface}


type
  PAvahiWatch = type Pointer;
  PAvahiTimeout = type Pointer;

type
  PAvahiWatchEvent = ^TAvahiWatchEvent;
  TAvahiWatchEvent = longint;

const
  AVAHI_WATCH_IN = POLLIN;
  AVAHI_WATCH_OUT = POLLOUT;
  AVAHI_WATCH_ERR = POLLERR;
  AVAHI_WATCH_HUP = POLLHUP;

type
  TAvahiWatchCallback = procedure(w: PAvahiWatch; fd: longint; event: TAvahiWatchEvent; userdata: pointer); cdecl;
  TAvahiTimeoutCallback = procedure(t: PAvahiTimeout; userdata: pointer); cdecl;

  PAvahiPoll = ^TAvahiPoll;

  TAvahiPoll = record
    userdata: pointer;
    watch_new: function(api: PAvahiPoll; fd: longint; event: TAvahiWatchEvent; callback: TAvahiWatchCallback; userdata: pointer): PAvahiWatch; cdecl;
    watch_update: procedure(w: PAvahiWatch; event: TAvahiWatchEvent); cdecl;
    watch_get_events: function(w: PAvahiWatch): TAvahiWatchEvent; cdecl;
    watch_free: procedure(w: PAvahiWatch); cdecl;
    timeout_new: function(api: PAvahiPoll; tv: Ptimeval; callback: TAvahiTimeoutCallback; userdata: pointer): PAvahiTimeout; cdecl;
    timeout_update: procedure(para1: PAvahiTimeout; tv: Ptimeval); cdecl;
    timeout_free: procedure(t: PAvahiTimeout); cdecl;
  end;

  // === Konventiert am: 24-12-25 15:59:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
