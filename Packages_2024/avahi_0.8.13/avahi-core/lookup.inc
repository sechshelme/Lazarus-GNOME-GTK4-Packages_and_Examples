{$IFDEF read_interface}

type
  PAvahiSRecordBrowser = type Pointer;
  PAvahiSHostNameResolver = type Pointer;
  PAvahiSAddressResolver = type Pointer;
  PAvahiSDomainBrowser = type Pointer;
  PAvahiSServiceTypeBrowser = type Pointer;
  PAvahiSServiceBrowser = type Pointer;
  PAvahiSServiceResolver = type Pointer;

  TAvahiSRecordBrowserCallback = procedure(b: PAvahiSRecordBrowser; iface: TAvahiIfIndex; protocol: TAvahiProtocol; event: TAvahiBrowserEvent; _record: PAvahiRecord;
    flags: TAvahiLookupResultFlags; userdata: pointer); cdecl;

function avahi_s_record_browser_new(server: PAvahiServer; iface: TAvahiIfIndex; protocol: TAvahiProtocol; key: PAvahiKey; flags: TAvahiLookupFlags;
  callback: TAvahiSRecordBrowserCallback; userdata: pointer): PAvahiSRecordBrowser; cdecl; external libavahi_core;
function avahi_s_record_browser_prepare(server: PAvahiServer; iface: TAvahiIfIndex; protocol: TAvahiProtocol; key: PAvahiKey; flags: TAvahiLookupFlags;
  callback: TAvahiSRecordBrowserCallback; userdata: pointer): PAvahiSRecordBrowser; cdecl; external libavahi_core;
procedure avahi_s_record_browser_free(b: PAvahiSRecordBrowser); cdecl; external libavahi_core;
procedure avahi_s_record_browser_start_query(b: PAvahiSRecordBrowser); cdecl; external libavahi_core;

type
  TAvahiSHostNameResolverCallback = procedure(r: PAvahiSHostNameResolver; iface: TAvahiIfIndex; protocol: TAvahiProtocol; event: TAvahiResolverEvent; host_name: pchar;
    a: PAvahiAddress; flags: TAvahiLookupResultFlags; userdata: pointer); cdecl;

function avahi_s_host_name_resolver_new(server: PAvahiServer; iface: TAvahiIfIndex; protocol: TAvahiProtocol; host_name: pchar; aprotocol: TAvahiProtocol;
  flags: TAvahiLookupFlags; calback: TAvahiSHostNameResolverCallback; userdata: pointer): PAvahiSHostNameResolver; cdecl; external libavahi_core;
function avahi_s_host_name_resolver_prepare(server: PAvahiServer; iface: TAvahiIfIndex; protocol: TAvahiProtocol; host_name: pchar; aprotocol: TAvahiProtocol;
  flags: TAvahiLookupFlags; calback: TAvahiSHostNameResolverCallback; userdata: pointer): PAvahiSHostNameResolver; cdecl; external libavahi_core;
procedure avahi_s_host_name_resolver_start(r: PAvahiSHostNameResolver); cdecl; external libavahi_core;
procedure avahi_s_host_name_resolver_free(r: PAvahiSHostNameResolver); cdecl; external libavahi_core;

type
  TAvahiSAddressResolverCallback = procedure(r: PAvahiSAddressResolver; iface: TAvahiIfIndex; protocol: TAvahiProtocol; event: TAvahiResolverEvent; a: PAvahiAddress;
    host_name: pchar; flags: TAvahiLookupResultFlags; userdata: pointer); cdecl;

function avahi_s_address_resolver_new(server: PAvahiServer; iface: TAvahiIfIndex; protocol: TAvahiProtocol; address: PAvahiAddress; flags: TAvahiLookupFlags;
  calback: TAvahiSAddressResolverCallback; userdata: pointer): PAvahiSAddressResolver; cdecl; external libavahi_core;
function avahi_s_address_resolver_prepare(server: PAvahiServer; iface: TAvahiIfIndex; protocol: TAvahiProtocol; address: PAvahiAddress; flags: TAvahiLookupFlags;
  calback: TAvahiSAddressResolverCallback; userdata: pointer): PAvahiSAddressResolver; cdecl; external libavahi_core;
procedure avahi_s_address_resolver_start(r: PAvahiSAddressResolver); cdecl; external libavahi_core;
procedure avahi_s_address_resolver_free(r: PAvahiSAddressResolver); cdecl; external libavahi_core;

type
  TAvahiSDomainBrowserCallback = procedure(b: PAvahiSDomainBrowser; iface: TAvahiIfIndex; protocol: TAvahiProtocol; event: TAvahiBrowserEvent; domain: pchar;
    flags: TAvahiLookupResultFlags; userdata: pointer); cdecl;

function avahi_s_domain_browser_new(server: PAvahiServer; iface: TAvahiIfIndex; protocol: TAvahiProtocol; domain: pchar; _type: TAvahiDomainBrowserType;
  flags: TAvahiLookupFlags; callback: TAvahiSDomainBrowserCallback; userdata: pointer): PAvahiSDomainBrowser; cdecl; external libavahi_core;
function avahi_s_domain_browser_prepare(server: PAvahiServer; iface: TAvahiIfIndex; protocol: TAvahiProtocol; domain: pchar; _type: TAvahiDomainBrowserType;
  flags: TAvahiLookupFlags; callback: TAvahiSDomainBrowserCallback; userdata: pointer): PAvahiSDomainBrowser; cdecl; external libavahi_core;
procedure avahi_s_domain_browser_start(b: PAvahiSDomainBrowser); cdecl; external libavahi_core;
procedure avahi_s_domain_browser_free(b: PAvahiSDomainBrowser); cdecl; external libavahi_core;

type
  TAvahiSServiceTypeBrowserCallback = procedure(b: PAvahiSServiceTypeBrowser; iface: TAvahiIfIndex; protocol: TAvahiProtocol; event: TAvahiBrowserEvent; _type: pchar;
    domain: pchar; flags: TAvahiLookupResultFlags; userdata: pointer); cdecl;

function avahi_s_service_type_browser_new(server: PAvahiServer; iface: TAvahiIfIndex; protocol: TAvahiProtocol; domain: pchar; flags: TAvahiLookupFlags;
  callback: TAvahiSServiceTypeBrowserCallback; userdata: pointer): PAvahiSServiceTypeBrowser; cdecl; external libavahi_core;
function avahi_s_service_type_browser_prepare(server: PAvahiServer; iface: TAvahiIfIndex; protocol: TAvahiProtocol; domain: pchar; flags: TAvahiLookupFlags;
  callback: TAvahiSServiceTypeBrowserCallback; userdata: pointer): PAvahiSServiceTypeBrowser; cdecl; external libavahi_core;
procedure avahi_s_service_type_browser_start(b: PAvahiSServiceTypeBrowser); cdecl; external libavahi_core;
procedure avahi_s_service_type_browser_free(b: PAvahiSServiceTypeBrowser); cdecl; external libavahi_core;

type
  TAvahiSServiceBrowserCallback = procedure(b: PAvahiSServiceBrowser; iface: TAvahiIfIndex; protocol: TAvahiProtocol; event: TAvahiBrowserEvent; name: pchar;
    _type: pchar; domain: pchar; flags: TAvahiLookupResultFlags; userdata: pointer); cdecl;

function avahi_s_service_browser_new(server: PAvahiServer; iface: TAvahiIfIndex; protocol: TAvahiProtocol; service_type: pchar; domain: pchar;
  flags: TAvahiLookupFlags; callback: TAvahiSServiceBrowserCallback; userdata: pointer): PAvahiSServiceBrowser; cdecl; external libavahi_core;
function avahi_s_service_browser_prepare(server: PAvahiServer; iface: TAvahiIfIndex; protocol: TAvahiProtocol; service_type: pchar; domain: pchar;
  flags: TAvahiLookupFlags; callback: TAvahiSServiceBrowserCallback; userdata: pointer): PAvahiSServiceBrowser; cdecl; external libavahi_core;
procedure avahi_s_service_browser_start(b: PAvahiSServiceBrowser); cdecl; external libavahi_core;
procedure avahi_s_service_browser_free(b: PAvahiSServiceBrowser); cdecl; external libavahi_core;

type
  TAvahiSServiceResolverCallback = procedure(r: PAvahiSServiceResolver; iface: TAvahiIfIndex; protocol: TAvahiProtocol; event: TAvahiResolverEvent; name: pchar;
    _type: pchar; domain: pchar; host_name: pchar; a: PAvahiAddress; port: Tuint16_t;
    txt: PAvahiStringList; flags: TAvahiLookupResultFlags; userdata: pointer); cdecl;

function avahi_s_service_resolver_new(server: PAvahiServer; iface: TAvahiIfIndex; protocol: TAvahiProtocol; name: pchar; _type: pchar;
  domain: pchar; aprotocol: TAvahiProtocol; flags: TAvahiLookupFlags; calback: TAvahiSServiceResolverCallback; userdata: pointer): PAvahiSServiceResolver; cdecl; external libavahi_core;
function avahi_s_service_resolver_prepare(server: PAvahiServer; iface: TAvahiIfIndex; protocol: TAvahiProtocol; name: pchar; _type: pchar;
  domain: pchar; aprotocol: TAvahiProtocol; flags: TAvahiLookupFlags; calback: TAvahiSServiceResolverCallback; userdata: pointer): PAvahiSServiceResolver; cdecl; external libavahi_core;
procedure avahi_s_service_resolver_start(r: PAvahiSServiceResolver); cdecl; external libavahi_core;
procedure avahi_s_service_resolver_free(r: PAvahiSServiceResolver); cdecl; external libavahi_core;

// === Konventiert am: 25-12-25 17:10:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
