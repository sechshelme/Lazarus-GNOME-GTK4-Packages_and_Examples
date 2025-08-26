unit dns_compat;

interface

uses
  fp_event, dns;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function evdns_init: longint; cdecl; external libevent;

type
  Pevdns_base = type Pointer;

function evdns_get_global_base: Pevdns_base; cdecl; external libevent;
procedure evdns_shutdown(fail_requests: longint); cdecl; external libevent;
function evdns_nameserver_add(address: dword): longint; cdecl; external libevent;
function evdns_count_nameservers: longint; cdecl; external libevent;
function evdns_clear_nameservers_and_suspend: longint; cdecl; external libevent;
function evdns_resume: longint; cdecl; external libevent;
function evdns_nameserver_ip_add(ip_as_string: pchar): longint; cdecl; external libevent;
function evdns_resolve_ipv4(name: pchar; flags: longint; callback: Tevdns_callback_type; ptr: pointer): longint; cdecl; external libevent;
function evdns_resolve_ipv6(name: pchar; flags: longint; callback: Tevdns_callback_type; ptr: pointer): longint; cdecl; external libevent;

type
  Pin_addr = type Pointer;
  Pin6_addr = type Pointer;

function evdns_resolve_reverse(in_: Pin_addr; flags: longint; callback: Tevdns_callback_type; ptr: pointer): longint; cdecl; external libevent;
function evdns_resolve_reverse_ipv6(in_: Pin6_addr; flags: longint; callback: Tevdns_callback_type; ptr: pointer): longint; cdecl; external libevent;
function evdns_set_option(option: pchar; val: pchar; flags: longint): longint; cdecl; external libevent;
function evdns_resolv_conf_parse(flags: longint; filename: pchar): longint; cdecl; external libevent;
procedure evdns_search_clear; cdecl; external libevent;
procedure evdns_search_add(domain: pchar); cdecl; external libevent;
procedure evdns_search_ndots_set(ndots: longint); cdecl; external libevent;
function evdns_add_server_port(socket: Tevutil_socket_t; flags: longint; callback: Tevdns_request_callback_fn_type; user_data: pointer): Pevdns_server_port; cdecl; external libevent;

{$ifdef windows}
function evdns_config_windows_nameservers: longint; cdecl; external libevent;
{$endif}

// === Konventiert am: 26-8-25 17:43:49 ===


implementation



end.
