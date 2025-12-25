
unit ga_enums;
interface

{
  Automatically converted by H2Pas 1.0.0 from ga_enums.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ga_enums.h
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
PGaBrowserEvent  = ^GaBrowserEvent;
PGaLookupFlags  = ^GaLookupFlags;
PGaLookupResultFlags  = ^GaLookupResultFlags;
PGaProtocol  = ^GaProtocol;
PGaResolverEvent  = ^GaResolverEvent;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * ga-enums.h
 * Copyright (C) 2006-2007 Collabora Ltd.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
  }
{$ifndef __GA_ENUMS_H__}
{$define __GA_ENUMS_H__}
{$include <glib-object.h>}
{$include <avahi-common/defs.h>}
{$include <avahi-common/address.h>}
{* Values for GaProtocol  }
{*< IPv4  }
{*< IPv6  }
{*< Unspecified/all protocol(s)  }
type
  PGaProtocol = ^TGaProtocol;
  TGaProtocol =  Longint;
  Const
    GA_PROTOCOL_INET = AVAHI_PROTO_INET;
    GA_PROTOCOL_INET6 = AVAHI_PROTO_INET6;
    GA_PROTOCOL_UNSPEC = AVAHI_PROTO_UNSPEC;
;
{* Some flags for lookup callback functions  }
{*< This response originates from the cache  }
{*< This response originates from wide area DNS  }
{*< This response originates from multicast DNS  }
{*< This record/service resides on and was announced by the local host. Only available in service and record browsers and only on AVAHI_BROWSER_NEW.  }
{*< This service belongs to the same local client as the browser object. Only available in avahi-client, and only for service browsers and only on AVAHI_BROWSER_NEW.  }
{*< The returned data has been defined statically by some configuration option  }
type
  PGaLookupResultFlags = ^TGaLookupResultFlags;
  TGaLookupResultFlags =  Longint;
  Const
    GA_LOOKUP_RESULT_CACHED = AVAHI_LOOKUP_RESULT_CACHED;
    GA_LOOKUP_RESULT_WIDE_AREA = AVAHI_LOOKUP_RESULT_WIDE_AREA;
    GA_LOOKUP_RESULT_MULTICAST = AVAHI_LOOKUP_RESULT_MULTICAST;
    GA_LOOKUP_RESULT_LOCAL = AVAHI_LOOKUP_RESULT_LOCAL;
    GA_LOOKUP_RESULT_OUR_OWN = AVAHI_LOOKUP_RESULT_OUR_OWN;
    GA_LOOKUP_RESULT_STATIC = AVAHI_LOOKUP_RESULT_STATIC;
;
{*< Force lookup via wide area DNS  }
{*< Force lookup via multicast DNS  }
{*< When doing service resolving, don't lookup TXT record  }
{*< When doing service resolving, don't lookup A/AAAA record  }
type
  PGaLookupFlags = ^TGaLookupFlags;
  TGaLookupFlags =  Longint;
  Const
    GA_LOOKUP_NO_FLAGS = 0;
    GA_LOOKUP_USE_WIDE_AREA = AVAHI_LOOKUP_USE_WIDE_AREA;
    GA_LOOKUP_USE_MULTICAST = AVAHI_LOOKUP_USE_MULTICAST;
    GA_LOOKUP_NO_TXT = AVAHI_LOOKUP_NO_TXT;
    GA_LOOKUP_NO_ADDRESS = AVAHI_LOOKUP_NO_ADDRESS;
;
{*< RR found, resolving successful  }
{*< Resolving failed due to some reason which can be retrieved using avahi_server_errno()/avahi_client_errno()  }
type
  PGaResolverEvent = ^TGaResolverEvent;
  TGaResolverEvent =  Longint;
  Const
    GA_RESOLVER_FOUND = AVAHI_RESOLVER_FOUND;
    GA_RESOLVER_FAILURE = AVAHI_RESOLVER_FAILURE;
;
{*< The object is new on the network  }
{*< The object has been removed from the network  }
{*< One-time event, to notify the user that all entries from the caches have been send  }
{*< One-time event, to notify the user that more records will probably not show up in the near future, i.e. all cache entries have been read and all static servers been queried  }
{*< Browsing failed due to some reason which can be retrieved using avahi_server_errno()/avahi_client_errno()  }
type
  PGaBrowserEvent = ^TGaBrowserEvent;
  TGaBrowserEvent =  Longint;
  Const
    GA_BROWSER_NEW = AVAHI_BROWSER_NEW;
    GA_BROWSER_REMOVE = AVAHI_BROWSER_REMOVE;
    GA_BROWSER_CACHE_EXHAUSTED = AVAHI_BROWSER_CACHE_EXHAUSTED;
    GA_BROWSER_ALL_FOR_NOW = AVAHI_BROWSER_ALL_FOR_NOW;
    GA_BROWSER_FAILURE = AVAHI_BROWSER_FAILURE;
;
{$endif}
{ #ifndef __GA_CLIENT_H__  }

implementation


end.
