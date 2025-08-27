{$IFDEF read_interface}



const
  DNS_ERR_NONE = 0;
  DNS_ERR_FORMAT = 1;
  DNS_ERR_SERVERFAILED = 2;
  DNS_ERR_NOTEXIST = 3;
  DNS_ERR_NOTIMPL = 4;
  DNS_ERR_REFUSED = 5;
  DNS_ERR_TRUNCATED = 65;
  DNS_ERR_UNKNOWN = 66;
  DNS_ERR_TIMEOUT = 67;
  DNS_ERR_SHUTDOWN = 68;
  DNS_ERR_CANCEL = 69;
  DNS_ERR_NODATA = 70;
  DNS_IPv4_A = 1;
  DNS_PTR = 2;
  DNS_IPv6_AAAA = 3;
  DNS_QUERY_NO_SEARCH = 1;
  DNS_OPTION_SEARCH = 1;
  DNS_OPTION_NAMESERVERS = 2;
  DNS_OPTION_MISC = 4;
  DNS_OPTION_HOSTSFILE = 8;
  DNS_OPTIONS_ALL = DNS_OPTION_SEARCH or DNS_OPTION_NAMESERVERS or DNS_OPTION_MISC or DNS_OPTION_HOSTSFILE or 0;
  DNS_OPTION_NAMESERVERS_NO_DEFAULT = 16;
  DNS_NO_SEARCH = DNS_QUERY_NO_SEARCH;

type
  Tevdns_callback_type = procedure(result: longint; _type: char; count: longint; ttl: longint; addresses: pointer; arg: pointer); cdecl;
  Pevdns_base = type Pointer;

const
  EVDNS_BASE_INITIALIZE_NAMESERVERS = 1;
  EVDNS_BASE_DISABLE_WHEN_INACTIVE = $8000;
  EVDNS_BASE_NAMESERVERS_NO_DEFAULT = $10000;

function evdns_base_new(event_base: Pevent_base; initialize_nameservers: longint): Pevdns_base; cdecl; external libevent;
procedure evdns_base_free(base: Pevdns_base; fail_requests: longint); cdecl; external libevent;
procedure evdns_base_clear_host_addresses(base: Pevdns_base); cdecl; external libevent;
function evdns_err_to_string(err: longint): pchar; cdecl; external libevent;
function evdns_base_nameserver_add(base: Pevdns_base; address: dword): longint; cdecl; external libevent;
function evdns_base_count_nameservers(base: Pevdns_base): longint; cdecl; external libevent;
function evdns_base_clear_nameservers_and_suspend(base: Pevdns_base): longint; cdecl; external libevent;
function evdns_base_resume(base: Pevdns_base): longint; cdecl; external libevent;
function evdns_base_nameserver_ip_add(base: Pevdns_base; ip_as_string: pchar): longint; cdecl; external libevent;
function evdns_base_nameserver_sockaddr_add(base: Pevdns_base; sa: Psockaddr; len: Tev_socklen_t; flags: dword): longint; cdecl; external libevent;

type
  Pevdns_request = type Pointer;

function evdns_base_resolve_ipv4(base: Pevdns_base; name: pchar; flags: longint; callback: Tevdns_callback_type; ptr: pointer): Pevdns_request; cdecl; external libevent;
function evdns_base_resolve_ipv6(base: Pevdns_base; name: pchar; flags: longint; callback: Tevdns_callback_type; ptr: pointer): Pevdns_request; cdecl; external libevent;

type
  Pin_addr = type Pointer;
  Pin6_addr = type Pointer;

function evdns_base_resolve_reverse(base: Pevdns_base; in_: Pin_addr; flags: longint; callback: Tevdns_callback_type; ptr: pointer): Pevdns_request; cdecl; external libevent;
function evdns_base_resolve_reverse_ipv6(base: Pevdns_base; in_: Pin6_addr; flags: longint; callback: Tevdns_callback_type; ptr: pointer): Pevdns_request; cdecl; external libevent;
procedure evdns_cancel_request(base: Pevdns_base; req: Pevdns_request); cdecl; external libevent;
function evdns_base_set_option(base: Pevdns_base; option: pchar; val: pchar): longint; cdecl; external libevent;
function evdns_base_resolv_conf_parse(base: Pevdns_base; flags: longint; filename: pchar): longint; cdecl; external libevent;
function evdns_base_load_hosts(base: Pevdns_base; hosts_fname: pchar): longint; cdecl; external libevent;

{$ifdef windows}
function evdns_base_config_windows_nameservers(para1: Pevdns_base): longint; cdecl; external libevent;
{$endif}

procedure evdns_base_search_clear(base: Pevdns_base); cdecl; external libevent;
procedure evdns_base_search_add(base: Pevdns_base; domain: pchar); cdecl; external libevent;
procedure evdns_base_search_ndots_set(base: Pevdns_base; ndots: longint); cdecl; external libevent;

type
  Tevdns_debug_log_fn_type = procedure(is_warning: longint; msg: pchar); cdecl;

procedure evdns_set_log_fn(fn: Tevdns_debug_log_fn_type); cdecl; external libevent;

type
  TFunc = function: Tev_uint16_t;
  TRandom_func = procedure(para1: pchar; para2: Tsize_t);

procedure evdns_set_transaction_id_fn(fn: TFunc); cdecl; external libevent;
procedure evdns_set_random_bytes_fn(fn: TRandom_func); cdecl; external libevent;

type
  Tevdns_request_callback_fn_type = procedure(para1: Pevdns_server_request; para2: pointer); cdecl;

const
  EVDNS_ANSWER_SECTION = 0;
  EVDNS_AUTHORITY_SECTION = 1;
  EVDNS_ADDITIONAL_SECTION = 2;
  EVDNS_TYPE_A = 1;
  EVDNS_TYPE_NS = 2;
  EVDNS_TYPE_CNAME = 5;
  EVDNS_TYPE_SOA = 6;
  EVDNS_TYPE_PTR = 12;
  EVDNS_TYPE_MX = 15;
  EVDNS_TYPE_TXT = 16;
  EVDNS_TYPE_AAAA = 28;
  EVDNS_QTYPE_AXFR = 252;
  EVDNS_QTYPE_ALL = 255;
  EVDNS_CLASS_INET = 1;
  EVDNS_FLAGS_AA = $400;
  EVDNS_FLAGS_RD = $080;

function evdns_add_server_port_with_base(base: Pevent_base; socket: Tevutil_socket_t; flags: longint; callback: Tevdns_request_callback_fn_type; user_data: pointer): Pevdns_server_port; cdecl; external libevent;
procedure evdns_close_server_port(port: Pevdns_server_port); cdecl; external libevent;
procedure evdns_server_request_set_flags(req: Pevdns_server_request; flags: longint); cdecl; external libevent;
function evdns_server_request_add_reply(req: Pevdns_server_request; section: longint; name: pchar; _type: longint; dns_class: longint;
  ttl: longint; datalen: longint; is_name: longint; data: pchar): longint; cdecl; external libevent;
function evdns_server_request_add_a_reply(req: Pevdns_server_request; name: pchar; n: longint; addrs: pointer; ttl: longint): longint; cdecl; external libevent;
function evdns_server_request_add_aaaa_reply(req: Pevdns_server_request; name: pchar; n: longint; addrs: pointer; ttl: longint): longint; cdecl; external libevent;
function evdns_server_request_add_ptr_reply(req: Pevdns_server_request; in_: Pin_addr; inaddr_name: pchar; hostname: pchar; ttl: longint): longint; cdecl; external libevent;
function evdns_server_request_add_cname_reply(req: Pevdns_server_request; name: pchar; cname: pchar; ttl: longint): longint; cdecl; external libevent;
function evdns_server_request_respond(req: Pevdns_server_request; err: longint): longint; cdecl; external libevent;
function evdns_server_request_drop(req: Pevdns_server_request): longint; cdecl; external libevent;

function evdns_server_request_get_requesting_addr(req: Pevdns_server_request; sa: Psockaddr; addr_len: longint): longint; cdecl; external libevent;

type
  Tevdns_getaddrinfo_cb = procedure(result: longint; res: Pevutil_addrinfo; arg: pointer); cdecl;
  Pevdns_getaddrinfo_request = type Pointer;

function evdns_getaddrinfo(dns_base: Pevdns_base; nodename: pchar; servname: pchar; hints_in: Pevutil_addrinfo; cb: Tevdns_getaddrinfo_cb;
  arg: pointer): Pevdns_getaddrinfo_request; cdecl; external libevent;
procedure evdns_getaddrinfo_cancel(req: Pevdns_getaddrinfo_request); cdecl; external libevent;
function evdns_base_get_nameserver_addr(base: Pevdns_base; idx: longint; sa: Psockaddr; len: Tev_socklen_t): longint; cdecl; external libevent;

// === Konventiert am: 26-8-25 17:43:47 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
