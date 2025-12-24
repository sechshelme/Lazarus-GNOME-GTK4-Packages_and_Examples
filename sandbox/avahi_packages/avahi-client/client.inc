{$IFDEF read_interface}

type
  PAvahiClient = type Pointer;

type
  PAvahiClientState = ^TAvahiClientState;
  TAvahiClientState = longint;

const
  AVAHI_CLIENT_S_REGISTERING = AVAHI_SERVER_REGISTERING;
  AVAHI_CLIENT_S_RUNNING = AVAHI_SERVER_RUNNING;
  AVAHI_CLIENT_S_COLLISION = AVAHI_SERVER_COLLISION;
  AVAHI_CLIENT_FAILURE = 100;
  AVAHI_CLIENT_CONNECTING = 101;

type
  PAvahiClientFlags = ^TAvahiClientFlags;
  TAvahiClientFlags = longint;

const
  AVAHI_CLIENT_IGNORE_USER_CONFIG = 1;
  AVAHI_CLIENT_NO_FAIL = 2;

type
  TAvahiClientCallback = procedure(s: PAvahiClient; state: TAvahiClientState; userdata: pointer); cdecl;

function avahi_client_new(poll_api: PAvahiPoll; flags: TAvahiClientFlags; callback: TAvahiClientCallback; userdata: pointer; error: Plongint): PAvahiClient; cdecl; external libavahi_client;
procedure avahi_client_free(client: PAvahiClient); cdecl; external libavahi_client;
function avahi_client_get_version_string(para1: PAvahiClient): pchar; cdecl; external libavahi_client;
function avahi_client_get_host_name(para1: PAvahiClient): pchar; cdecl; external libavahi_client;
function avahi_client_set_host_name(para1: PAvahiClient; name: pchar): longint; cdecl; external libavahi_client;
function avahi_client_get_domain_name(para1: PAvahiClient): pchar; cdecl; external libavahi_client;
function avahi_client_get_host_name_fqdn(para1: PAvahiClient): pchar; cdecl; external libavahi_client;
function avahi_client_get_state(client: PAvahiClient): TAvahiClientState; cdecl; external libavahi_client;
function avahi_client_errno(para1: PAvahiClient): longint; cdecl; external libavahi_client;
function avahi_client_get_local_service_cookie(client: PAvahiClient): Tuint32_t; cdecl; external libavahi_client;
function avahi_nss_support: longint; cdecl; external libavahi_client;

// === Konventiert am: 24-12-25 19:23:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
