{$IFDEF read_interface}


type
  PAvahiLogLevel = ^TAvahiLogLevel;
  TAvahiLogLevel = longint;

const
  AVAHI_LOG_ERROR_ = 0;
  AVAHI_LOG_WARN_ = 1;
  AVAHI_LOG_NOTICE_ = 2;
  AVAHI_LOG_INFO_ = 3;
  AVAHI_LOG_DEBUG_ = 4;
  AVAHI_LOG_LEVEL_MAX = 5;

type
  TAvahiLogFunction = procedure(level: TAvahiLogLevel; txt: pchar); cdecl;

procedure avahi_set_log_function(_function: TAvahiLogFunction); cdecl; external libavahi_core;
procedure avahi_log_ap(level: TAvahiLogLevel; format: pchar; ap: Tva_list); cdecl; external libavahi_core;
procedure avahi_log(level: TAvahiLogLevel; format: pchar); cdecl; varargs; external libavahi_core;
procedure avahi_log_error(format: pchar); cdecl; varargs; external libavahi_core;
procedure avahi_log_warn(format: pchar); cdecl; varargs; external libavahi_core;
procedure avahi_log_notice(format: pchar); cdecl; varargs; external libavahi_core;
procedure avahi_log_info(format: pchar); cdecl; varargs; external libavahi_core;
procedure avahi_log_debug(format: pchar); cdecl; varargs; external libavahi_core;

// === Konventiert am: 25-12-25 17:10:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
