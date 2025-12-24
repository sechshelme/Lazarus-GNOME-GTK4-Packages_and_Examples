
unit lookup;
interface

{
  Automatically converted by H2Pas 1.0.0 from lookup.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lookup.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PAvahiAddress  = ^AvahiAddress;
PAvahiAddressResolver  = ^AvahiAddressResolver;
PAvahiClient  = ^AvahiClient;
PAvahiDomainBrowser  = ^AvahiDomainBrowser;
PAvahiHostNameResolver  = ^AvahiHostNameResolver;
PAvahiRecordBrowser  = ^AvahiRecordBrowser;
PAvahiServiceBrowser  = ^AvahiServiceBrowser;
PAvahiServiceResolver  = ^AvahiServiceResolver;
PAvahiServiceTypeBrowser  = ^AvahiServiceTypeBrowser;
PAvahiStringList  = ^AvahiStringList;
Pchar  = ^char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef fooclientlookuphfoo}
{$define fooclientlookuphfoo}
{**
  This file is part of avahi.

  avahi is free software; you can redistribute it and/or modify it
  under the terms of the GNU Lesser General Public License as
  published by the Free Software Foundation; either version 2.1 of the
  License, or (at your option) any later version.

  avahi is distributed in the hope that it will be useful, but WITHOUT
  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
  or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General
  Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with avahi; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
  USA.
** }
{$include <inttypes.h>}
{$include <avahi-common/cdecl.h>}
{$include <avahi-common/address.h>}
{$include <avahi-common/strlst.h>}
{$include <avahi-common/defs.h>}
{$include <avahi-common/watch.h>}
{$include <avahi-common/gccmacro.h>}
{$include <avahi-client/client.h>}
{* \file avahi-client/lookup.h Lookup Client API  }
{* \example client-browse-services.c Example how to browse for DNS-SD
 * services using the client interface to avahi-daemon.  }
{* @ \name Domain Browser  }
{* A domain browser object  }
type
{* The function prototype for the callback of an AvahiDomainBrowser  }
(* Const before type ignored *)

  TAvahiDomainBrowserCallback = procedure (b:PAvahiDomainBrowser; interface:TAvahiIfIndex; protocol:TAvahiProtocol; event:TAvahiBrowserEvent; domain:Pchar; 
                flags:TAvahiLookupResultFlags; userdata:pointer);cdecl;
{* Browse for domains on the local network  }
(* Const before type ignored *)

function avahi_domain_browser_new(client:PAvahiClient; interface:TAvahiIfIndex; protocol:TAvahiProtocol; domain:Pchar; btype:TAvahiDomainBrowserType; 
           flags:TAvahiLookupFlags; callback:TAvahiDomainBrowserCallback; userdata:pointer):PAvahiDomainBrowser;cdecl;external;
{* Get the parent client of an AvahiDomainBrowser object  }
function avahi_domain_browser_get_client(para1:PAvahiDomainBrowser):PAvahiClient;cdecl;external;
{* Cleans up and frees an AvahiDomainBrowser object  }
function avahi_domain_browser_free(para1:PAvahiDomainBrowser):longint;cdecl;external;
{* @  }
{* @ \name Service Browser  }
{* A service browser object  }
type
{* The function prototype for the callback of an AvahiServiceBrowser  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TAvahiServiceBrowserCallback = procedure (b:PAvahiServiceBrowser; interface:TAvahiIfIndex; protocol:TAvahiProtocol; event:TAvahiBrowserEvent; name:Pchar; 
                _type:Pchar; domain:Pchar; flags:TAvahiLookupResultFlags; userdata:pointer);cdecl;
{* Browse for services of a type on the network. In most cases you
 * probably want to pass AVAHI_IF_UNSPEC and AVAHI_PROTO_UNSPED in
 * interface, resp. protocol to browse on all local networks. The
 * specified callback will be called whenever a new service appears
 * or is removed from the network. Please note that events may be
 * collapsed to minimize traffic (i.e. a REMOVED followed by a NEW for
 * the same service data is dropped because redundant). If you want to
 * subscribe to service data changes, you should use
 * avahi_service_resolver_new() and keep it open, in which case you
 * will be notified via AVAHI_RESOLVE_FOUND everytime the service data
 * changes.  }
{*< In most cases pass AVAHI_IF_UNSPEC here  }
{*< In most cases pass AVAHI_PROTO_UNSPEC here  }
(* Const before type ignored *)
{*< A service type such as "_http._tcp"  }
(* Const before type ignored *)
{*< A domain to browse in. In most cases you want to pass NULL here for the default domain (usually ".local")  }

function avahi_service_browser_new(client:PAvahiClient; interface:TAvahiIfIndex; protocol:TAvahiProtocol; _type:Pchar; domain:Pchar; 
           flags:TAvahiLookupFlags; callback:TAvahiServiceBrowserCallback; userdata:pointer):PAvahiServiceBrowser;cdecl;external;
{* Get the parent client of an AvahiServiceBrowser object  }
function avahi_service_browser_get_client(para1:PAvahiServiceBrowser):PAvahiClient;cdecl;external;
{* Cleans up and frees an AvahiServiceBrowser object  }
function avahi_service_browser_free(para1:PAvahiServiceBrowser):longint;cdecl;external;
{* @  }
{* \cond fulldocs  }
{* A service type browser object  }
type
{* The function prototype for the callback of an AvahiServiceTypeBrowser  }
(* Const before type ignored *)
(* Const before type ignored *)

  TAvahiServiceTypeBrowserCallback = procedure (b:PAvahiServiceTypeBrowser; interface:TAvahiIfIndex; protocol:TAvahiProtocol; event:TAvahiBrowserEvent; _type:Pchar; 
                domain:Pchar; flags:TAvahiLookupResultFlags; userdata:pointer);cdecl;
{* Browse for service types on the local network  }
(* Const before type ignored *)

function avahi_service_type_browser_new(client:PAvahiClient; interface:TAvahiIfIndex; protocol:TAvahiProtocol; domain:Pchar; flags:TAvahiLookupFlags; 
           callback:TAvahiServiceTypeBrowserCallback; userdata:pointer):PAvahiServiceTypeBrowser;cdecl;external;
{* Get the parent client of an AvahiServiceTypeBrowser object  }
function avahi_service_type_browser_get_client(para1:PAvahiServiceTypeBrowser):PAvahiClient;cdecl;external;
{* Cleans up and frees an AvahiServiceTypeBrowser object  }
function avahi_service_type_browser_free(para1:PAvahiServiceTypeBrowser):longint;cdecl;external;
{* \endcond  }
{* @ \name Service Resolver  }
{* A service resolver object  }
type
{* The function prototype for the callback of an AvahiServiceResolver  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TAvahiServiceResolverCallback = procedure (r:PAvahiServiceResolver; interface:TAvahiIfIndex; protocol:TAvahiProtocol; event:TAvahiResolverEvent; name:Pchar; 
                _type:Pchar; domain:Pchar; host_name:Pchar; a:PAvahiAddress; port:Tuint16_t; 
                txt:PAvahiStringList; flags:TAvahiLookupResultFlags; userdata:pointer);cdecl;
{* Create a new service resolver object. Please make sure to pass all the
 * service data you received via avahi_service_browser_new()'s callback
 * function, especially interface and protocol. The protocol argument specifies
 * the protocol (IPv4 or IPv6) to use as transport for the queries which are
 * sent out by this resolver. The aprotocol argument specifies the adress
 * family (IPv4 or IPv6) of the address of the service we are looking for.
 * Generally, on "protocol" you should only pass what was supplied to you as
 * parameter to your AvahiServiceBrowserCallback. In "aprotocol" you should
 * pass what your application code can deal with when connecting to the
 * service. Or, more technically speaking: protocol specifies if the mDNS
 * queries should be sent as UDP/IPv4 resp. UDP/IPv6 packets. aprotocol
 * specifies whether the query is for a A resp. AAAA resource record.
 *
 * Avahi browser and resolver callbacks only receive a concrete protocol;
 * always AVAHI_PROTO_INET or AVAHI_PROTO_INET6 and never AVAHI_PROTO_UNSPEC. A
 * new browser given UNSPEC will receive both (separate) INET and INET6 events.
 * A new resolver given a query protocol of UNSPEC will default to querying
 * with INET6. A new resolver given an address protocol of UNSPEC will always
 * resolve a service to an address matching the query protocol. So a resolver
 * with UNSPEC/UNSPEC is equivalent to INET6/INET6. By default the avahi daemon
 * publishes AAAA (IPv6) records over IPv4, but not A (IPv4) records over IPv6
 * (see 'publish-aaaa-on-ipv4' and 'publish-a-on-ipv6' in 'avahi-daemon.conf').
 * That's why, given most daemons, all four combinations of concrete query and
 * address protocols resolve except INET addresses via INET6 queries.  }
{*< Pass the interface argument you received in AvahiServiceBrowserCallback here.  }
{*< Pass the protocol argument you received in AvahiServiceBrowserCallback here.  }
(* Const before type ignored *)
{*< Pass the name argument you received in AvahiServiceBrowserCallback here.  }
(* Const before type ignored *)
{*< Pass the type argument you received in AvahiServiceBrowserCallback here.  }
(* Const before type ignored *)
{*< Pass the domain argument you received in AvahiServiceBrowserCallback here.  }
{*< The desired address family of the service address to resolve. AVAHI_PROTO_UNSPEC if your application can deal with both IPv4 and IPv6  }

function avahi_service_resolver_new(client:PAvahiClient; interface:TAvahiIfIndex; protocol:TAvahiProtocol; name:Pchar; _type:Pchar; 
           domain:Pchar; aprotocol:TAvahiProtocol; flags:TAvahiLookupFlags; callback:TAvahiServiceResolverCallback; userdata:pointer):PAvahiServiceResolver;cdecl;external;
{* Get the parent client of an AvahiServiceResolver object  }
function avahi_service_resolver_get_client(para1:PAvahiServiceResolver):PAvahiClient;cdecl;external;
{* Free a service resolver object  }
function avahi_service_resolver_free(r:PAvahiServiceResolver):longint;cdecl;external;
{* @  }
{* \cond fulldocs  }
{* A service resolver object  }
type
{* The function prototype for the callback of an AvahiHostNameResolver  }
(* Const before type ignored *)
(* Const before type ignored *)

  TAvahiHostNameResolverCallback = procedure (r:PAvahiHostNameResolver; interface:TAvahiIfIndex; protocol:TAvahiProtocol; event:TAvahiResolverEvent; name:Pchar; 
                a:PAvahiAddress; flags:TAvahiLookupResultFlags; userdata:pointer);cdecl;
{* Create a new hostname resolver object  }
(* Const before type ignored *)

function avahi_host_name_resolver_new(client:PAvahiClient; interface:TAvahiIfIndex; protocol:TAvahiProtocol; name:Pchar; aprotocol:TAvahiProtocol; 
           flags:TAvahiLookupFlags; callback:TAvahiHostNameResolverCallback; userdata:pointer):PAvahiHostNameResolver;cdecl;external;
{* Get the parent client of an AvahiHostNameResolver object  }
function avahi_host_name_resolver_get_client(para1:PAvahiHostNameResolver):PAvahiClient;cdecl;external;
{* Free a hostname resolver object  }
function avahi_host_name_resolver_free(r:PAvahiHostNameResolver):longint;cdecl;external;
{* An address resolver object  }
type
{* The function prototype for the callback of an AvahiAddressResolver  }
(* Const before type ignored *)
(* Const before type ignored *)

  TAvahiAddressResolverCallback = procedure (r:PAvahiAddressResolver; interface:TAvahiIfIndex; protocol:TAvahiProtocol; event:TAvahiResolverEvent; a:PAvahiAddress; 
                name:Pchar; flags:TAvahiLookupResultFlags; userdata:pointer);cdecl;
{* Create a new address resolver object from an AvahiAddress object  }
(* Const before type ignored *)

function avahi_address_resolver_new(client:PAvahiClient; interface:TAvahiIfIndex; protocol:TAvahiProtocol; a:PAvahiAddress; flags:TAvahiLookupFlags; 
           callback:TAvahiAddressResolverCallback; userdata:pointer):PAvahiAddressResolver;cdecl;external;
{* Get the parent client of an AvahiAddressResolver object  }
function avahi_address_resolver_get_client(para1:PAvahiAddressResolver):PAvahiClient;cdecl;external;
{* Free a AvahiAddressResolver resolver object  }
function avahi_address_resolver_free(r:PAvahiAddressResolver):longint;cdecl;external;
{* \endcond  }
{* @ \name Record Browser  }
{* A record browser object  }
type
{* The function prototype for the callback of an AvahiRecordBrowser  }
(* Const before type ignored *)
(* Const before type ignored *)

  TAvahiRecordBrowserCallback = procedure (b:PAvahiRecordBrowser; interface:TAvahiIfIndex; protocol:TAvahiProtocol; event:TAvahiBrowserEvent; name:Pchar; 
                clazz:Tuint16_t; _type:Tuint16_t; rdata:pointer; size:Tsize_t; flags:TAvahiLookupResultFlags; 
                userdata:pointer);cdecl;
{* Browse for records of a type on the local network  }
(* Const before type ignored *)

function avahi_record_browser_new(client:PAvahiClient; interface:TAvahiIfIndex; protocol:TAvahiProtocol; name:Pchar; clazz:Tuint16_t; 
           _type:Tuint16_t; flags:TAvahiLookupFlags; callback:TAvahiRecordBrowserCallback; userdata:pointer):PAvahiRecordBrowser;cdecl;external;
{* Get the parent client of an AvahiRecordBrowser object  }
function avahi_record_browser_get_client(para1:PAvahiRecordBrowser):PAvahiClient;cdecl;external;
{* Cleans up and frees an AvahiRecordBrowser object  }
function avahi_record_browser_free(para1:PAvahiRecordBrowser):longint;cdecl;external;
{* @  }
{$endif}

implementation


end.
