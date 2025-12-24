unit lookup;

interface

uses
  fp_avahi_common, client;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAvahiDomainBrowser = type Pointer;
  TAvahiDomainBrowserCallback = procedure(b: PAvahiDomainBrowser; iface: TAvahiIfIndex; protocol: TAvahiProtocol; event: TAvahiBrowserEvent; domain: pchar;
    flags: TAvahiLookupResultFlags; userdata: pointer); cdecl;

function avahi_domain_browser_new(client: PAvahiClient; iface: TAvahiIfIndex; protocol: TAvahiProtocol; domain: pchar; btype: TAvahiDomainBrowserType;
  flags: TAvahiLookupFlags; callback: TAvahiDomainBrowserCallback; userdata: pointer): PAvahiDomainBrowser; cdecl; external libavahi_client;
function avahi_domain_browser_get_client(para1: PAvahiDomainBrowser): PAvahiClient; cdecl; external libavahi_client;
function avahi_domain_browser_free(para1: PAvahiDomainBrowser): longint; cdecl; external libavahi_client;

type
  PAvahiServiceBrowser = type Pointer;
  TAvahiServiceBrowserCallback = procedure(b: PAvahiServiceBrowser; iface: TAvahiIfIndex; protocol: TAvahiProtocol; event: TAvahiBrowserEvent; name: pchar;
    _type: pchar; domain: pchar; flags: TAvahiLookupResultFlags; userdata: pointer); cdecl;

function avahi_service_browser_new(client: PAvahiClient; iface: TAvahiIfIndex; protocol: TAvahiProtocol; _type: pchar; domain: pchar;
  flags: TAvahiLookupFlags; callback: TAvahiServiceBrowserCallback; userdata: pointer): PAvahiServiceBrowser; cdecl; external libavahi_client;
function avahi_service_browser_get_client(para1: PAvahiServiceBrowser): PAvahiClient; cdecl; external libavahi_client;
function avahi_service_browser_free(para1: PAvahiServiceBrowser): longint; cdecl; external libavahi_client;

type
  PAvahiServiceTypeBrowser = type Pointer;
  TAvahiServiceTypeBrowserCallback = procedure(b: PAvahiServiceTypeBrowser; iface: TAvahiIfIndex; protocol: TAvahiProtocol; event: TAvahiBrowserEvent; _type: pchar;
    domain: pchar; flags: TAvahiLookupResultFlags; userdata: pointer); cdecl;

function avahi_service_type_browser_new(client: PAvahiClient; iface: TAvahiIfIndex; protocol: TAvahiProtocol; domain: pchar; flags: TAvahiLookupFlags;
  callback: TAvahiServiceTypeBrowserCallback; userdata: pointer): PAvahiServiceTypeBrowser; cdecl; external libavahi_client;
function avahi_service_type_browser_get_client(para1: PAvahiServiceTypeBrowser): PAvahiClient; cdecl; external libavahi_client;
function avahi_service_type_browser_free(para1: PAvahiServiceTypeBrowser): longint; cdecl; external libavahi_client;

type
  PAvahiServiceResolver = type Pointer;
  TAvahiServiceResolverCallback = procedure(r: PAvahiServiceResolver; iface: TAvahiIfIndex; protocol: TAvahiProtocol; event: TAvahiResolverEvent; name: pchar;
    _type: pchar; domain: pchar; host_name: pchar; a: PAvahiAddress; port: Tuint16_t;
    txt: PAvahiStringList; flags: TAvahiLookupResultFlags; userdata: pointer); cdecl;

function avahi_service_resolver_new(client: PAvahiClient; iface: TAvahiIfIndex; protocol: TAvahiProtocol; name: pchar; _type: pchar;
  domain: pchar; aprotocol: TAvahiProtocol; flags: TAvahiLookupFlags; callback: TAvahiServiceResolverCallback; userdata: pointer): PAvahiServiceResolver; cdecl; external libavahi_client;
function avahi_service_resolver_get_client(para1: PAvahiServiceResolver): PAvahiClient; cdecl; external libavahi_client;
function avahi_service_resolver_free(r: PAvahiServiceResolver): longint; cdecl; external libavahi_client;

type
  PAvahiHostNameResolver = type Pointer;
  TAvahiHostNameResolverCallback = procedure(r: PAvahiHostNameResolver; iface: TAvahiIfIndex; protocol: TAvahiProtocol; event: TAvahiResolverEvent; name: pchar;
    a: PAvahiAddress; flags: TAvahiLookupResultFlags; userdata: pointer); cdecl;

function avahi_host_name_resolver_new(client: PAvahiClient; iface: TAvahiIfIndex; protocol: TAvahiProtocol; name: pchar; aprotocol: TAvahiProtocol;
  flags: TAvahiLookupFlags; callback: TAvahiHostNameResolverCallback; userdata: pointer): PAvahiHostNameResolver; cdecl; external libavahi_client;
function avahi_host_name_resolver_get_client(para1: PAvahiHostNameResolver): PAvahiClient; cdecl; external libavahi_client;
function avahi_host_name_resolver_free(r: PAvahiHostNameResolver): longint; cdecl; external libavahi_client;

type
  PAvahiAddressResolver = type Pointer;
  TAvahiAddressResolverCallback = procedure(r: PAvahiAddressResolver; iface: TAvahiIfIndex; protocol: TAvahiProtocol; event: TAvahiResolverEvent; a: PAvahiAddress;
    name: pchar; flags: TAvahiLookupResultFlags; userdata: pointer); cdecl;

function avahi_address_resolver_new(client: PAvahiClient; iface: TAvahiIfIndex; protocol: TAvahiProtocol; a: PAvahiAddress; flags: TAvahiLookupFlags;
  callback: TAvahiAddressResolverCallback; userdata: pointer): PAvahiAddressResolver; cdecl; external libavahi_client;
function avahi_address_resolver_get_client(para1: PAvahiAddressResolver): PAvahiClient; cdecl; external libavahi_client;
function avahi_address_resolver_free(r: PAvahiAddressResolver): longint; cdecl; external libavahi_client;

type
  PAvahiRecordBrowser = type Pointer;
  TAvahiRecordBrowserCallback = procedure(b: PAvahiRecordBrowser; iface: TAvahiIfIndex; protocol: TAvahiProtocol; event: TAvahiBrowserEvent; name: pchar;
    clazz: Tuint16_t; _type: Tuint16_t; rdata: pointer; size: Tsize_t; flags: TAvahiLookupResultFlags;
    userdata: pointer); cdecl;

function avahi_record_browser_new(client: PAvahiClient; iface: TAvahiIfIndex; protocol: TAvahiProtocol; name: pchar; clazz: Tuint16_t;
  _type: Tuint16_t; flags: TAvahiLookupFlags; callback: TAvahiRecordBrowserCallback; userdata: pointer): PAvahiRecordBrowser; cdecl; external libavahi_client;
function avahi_record_browser_get_client(para1: PAvahiRecordBrowser): PAvahiClient; cdecl; external libavahi_client;
function avahi_record_browser_free(para1: PAvahiRecordBrowser): longint; cdecl; external libavahi_client;

// === Konventiert am: 24-12-25 19:23:17 ===


implementation



end.
