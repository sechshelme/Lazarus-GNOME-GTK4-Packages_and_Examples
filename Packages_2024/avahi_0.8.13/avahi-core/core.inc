{$IFDEF read_interface}


type
  PAvahiServer = type Pointer;

const
  AVAHI_WIDE_AREA_SERVERS_MAX = 4;

type
  TAvahiServerCallback = procedure(s: PAvahiServer; state: TAvahiServerState; userdata: pointer); cdecl;

  TAvahiServerConfig = record
    host_name: pchar;
    domain_name: pchar;
    use_ipv4: longint;
    use_ipv6: longint;
    allow_interfaces: PAvahiStringList;
    deny_interfaces: PAvahiStringList;
    publish_hinfo: longint;
    publish_addresses: longint;
    publish_workstation: longint;
    publish_domain: longint;
    check_response_ttl: longint;
    use_iff_running: longint;
    enable_reflector: longint;
    reflect_ipv: longint;
    reflect_filters: PAvahiStringList;
    add_service_cookie: longint;
    enable_wide_area: longint;
    wide_area_servers: array[0..(AVAHI_WIDE_AREA_SERVERS_MAX) - 1] of TAvahiAddress;
    n_wide_area_servers: dword;
    disallow_other_stacks: longint;
    browse_domains: PAvahiStringList;
    disable_publishing: longint;
    allow_point_to_point: longint;
    publish_a_on_ipv6: longint;
    publish_aaaa_on_ipv4: longint;
    n_cache_entries_max: dword;
    ratelimit_interval: TAvahiUsec;
    ratelimit_burst: dword;
  end;
  PAvahiServerConfig = ^TAvahiServerConfig;

function avahi_server_new(api: PAvahiPoll; sc: PAvahiServerConfig; callback: TAvahiServerCallback; userdata: pointer; error: Plongint): PAvahiServer; cdecl; external libavahi_core;
procedure avahi_server_free(s: PAvahiServer); cdecl; external libavahi_core;
function avahi_server_config_init(c: PAvahiServerConfig): PAvahiServerConfig; cdecl; external libavahi_core;
function avahi_server_config_copy(ret: PAvahiServerConfig; c: PAvahiServerConfig): PAvahiServerConfig; cdecl; external libavahi_core;
procedure avahi_server_config_free(c: PAvahiServerConfig); cdecl; external libavahi_core;
function avahi_server_get_domain_name(s: PAvahiServer): pchar; cdecl; external libavahi_core;
function avahi_server_get_host_name(s: PAvahiServer): pchar; cdecl; external libavahi_core;
function avahi_server_get_host_name_fqdn(s: PAvahiServer): pchar; cdecl; external libavahi_core;
function avahi_server_set_host_name(s: PAvahiServer; host_name: pchar): longint; cdecl; external libavahi_core;
function avahi_server_set_domain_name(s: PAvahiServer; domain_name: pchar): longint; cdecl; external libavahi_core;
function avahi_server_get_data(s: PAvahiServer): pointer; cdecl; external libavahi_core;
procedure avahi_server_set_data(s: PAvahiServer; userdata: pointer); cdecl; external libavahi_core;
function avahi_server_get_state(s: PAvahiServer): TAvahiServerState; cdecl; external libavahi_core;

type
  TAvahiDumpCallback = procedure(text: pchar; userdata: pointer); cdecl;

function avahi_server_dump(s: PAvahiServer; callback: TAvahiDumpCallback; userdata: pointer): longint; cdecl; external libavahi_core;
function avahi_server_errno(s: PAvahiServer): longint; cdecl; external libavahi_core;
function avahi_server_get_local_service_cookie(s: PAvahiServer): Tuint32_t; cdecl; external libavahi_core;
function avahi_server_set_wide_area_servers(s: PAvahiServer; a: PAvahiAddress; n: dword): longint; cdecl; external libavahi_core;
function avahi_server_set_browse_domains(s: PAvahiServer; domains: PAvahiStringList): longint; cdecl; external libavahi_core;
function avahi_server_get_config(s: PAvahiServer): PAvahiServerConfig; cdecl; external libavahi_core;

// === Konventiert am: 25-12-25 17:10:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
