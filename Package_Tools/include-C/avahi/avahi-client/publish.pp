
unit publish;
interface

{
  Automatically converted by H2Pas 1.0.0 from publish.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    publish.h
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
PAvahiClient  = ^AvahiClient;
PAvahiEntryGroup  = ^AvahiEntryGroup;
PAvahiStringList  = ^AvahiStringList;
Pchar  = ^char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef fooclientpublishhfoo}
{$define fooclientpublishhfoo}
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
{* \file avahi-client/publish.h Publishing Client API  }
{* \example client-publish-service.c Example how to register a DNS-SD
 * service using the client interface to avahi-daemon. It behaves like a network
 * printer registering both an IPP and a BSD LPR service.  }
{* An entry group object  }
type
{* The function prototype for the callback of an AvahiEntryGroup  }
{*< The new state of the entry group  }{ The arbitrary user data pointer originally passed to avahi_entry_group_new() }
  TAvahiEntryGroupCallback = procedure (g:PAvahiEntryGroup; state:TAvahiEntryGroupState; userdata:pointer);cdecl;
{* @ \name Construction and destruction  }
{* Create a new AvahiEntryGroup object  }
{*< This callback is called whenever the state of this entry group changes. May not be NULL. Please note that this function is called for the first time from within the avahi_entry_group_new() context! Thus, in the callback you should not make use of global variables that are initialized only after your call to avahi_entry_group_new(). A common mistake is to store the AvahiEntryGroup pointer returned by avahi_entry_group_new() in a global variable and assume that this global variable already contains the valid pointer when the callback is called for the first time. A work-around for this is to always use the AvahiEntryGroup pointer passed to the callback function instead of the global pointer.  }{*< This arbitrary user data pointer will be passed to the callback functon  }
function avahi_entry_group_new(c:PAvahiClient; callback:TAvahiEntryGroupCallback; userdata:pointer):PAvahiEntryGroup;cdecl;external;
{* Clean up and free an AvahiEntryGroup object  }
function avahi_entry_group_free(para1:PAvahiEntryGroup):longint;cdecl;external;
{* @  }
{* @ \name State  }
{* Commit an AvahiEntryGroup. The entries in the entry group are now registered on the network. Commiting empty entry groups is considered an error.  }
function avahi_entry_group_commit(para1:PAvahiEntryGroup):longint;cdecl;external;
{* Reset an AvahiEntryGroup. This takes effect immediately.  }
function avahi_entry_group_reset(para1:PAvahiEntryGroup):longint;cdecl;external;
{* Get an AvahiEntryGroup's state  }
function avahi_entry_group_get_state(para1:PAvahiEntryGroup):longint;cdecl;external;
{* Check if an AvahiEntryGroup is empty  }
function avahi_entry_group_is_empty(para1:PAvahiEntryGroup):longint;cdecl;external;
{* Get an AvahiEntryGroup's owning client instance  }
function avahi_entry_group_get_client(para1:PAvahiEntryGroup):PAvahiClient;cdecl;external;
{* @  }
{* @ \name Adding and updating entries  }
{* Add a service. Takes a variable NULL terminated list of TXT record strings as last arguments. Please note that this service is not announced on the network before avahi_entry_group_commit() is called.  }
{*< The interface this service shall be announced on. We recommend to pass AVAHI_IF_UNSPEC here, to announce on all interfaces.  }{*< The protocol this service shall be announced with, i.e. MDNS over IPV4 or MDNS over IPV6. We recommend to pass AVAHI_PROTO_UNSPEC here, to announce this service on all protocols the daemon supports.  }{*< Usually 0, unless you know what you do  }(* Const before type ignored *)
{*< The name for the new service. Must be valid service name. i.e. a string shorter than 63 characters and valid UTF-8. May not be NULL.  }(* Const before type ignored *)
{*< The service type for the new service, such as _http._tcp. May not be NULL.  }(* Const before type ignored *)
{*< The domain to register this domain in. We recommend to pass NULL here, to let the daemon decide  }(* Const before type ignored *)
{*< The host this services is residing on. We recommend to pass NULL here, the daemon will than automatically insert the local host name in that case  }{*< The IP port number of this service  }function avahi_entry_group_add_service(group:PAvahiEntryGroup; interface:TAvahiIfIndex; protocol:TAvahiProtocol; flags:TAvahiPublishFlags; name:Pchar; 
           _type:Pchar; domain:Pchar; host:Pchar; port:Tuint16_t; args:array of const):longint;cdecl;external;
function avahi_entry_group_add_service(group:PAvahiEntryGroup; interface:TAvahiIfIndex; protocol:TAvahiProtocol; flags:TAvahiPublishFlags; name:Pchar; 
           _type:Pchar; domain:Pchar; host:Pchar; port:Tuint16_t):longint;cdecl;external;
{* Add a service, takes an AvahiStringList for TXT records. Arguments have the same meaning as for avahi_entry_group_add_service().  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{*< The TXT data for this service. You may free this object after calling this function, it is not referenced any further  }function avahi_entry_group_add_service_strlst(group:PAvahiEntryGroup; interface:TAvahiIfIndex; protocol:TAvahiProtocol; flags:TAvahiPublishFlags; name:Pchar; 
           _type:Pchar; domain:Pchar; host:Pchar; port:Tuint16_t; txt:PAvahiStringList):longint;cdecl;external;
{* Add a subtype for a service. The service should already be existent in the entry group. You may add as many subtypes for a service as you wish.  }
{*< The interface this subtype shall be announced on. This should match the value passed for the original avahi_entry_group_add_service() call.  }{*< The protocol this subtype shall be announced with. This should match the value passed for the original avahi_entry_group_add_service() call.  }{*< Only != 0 if you really know what you do  }(* Const before type ignored *)
{*< The name of the service, as passed to avahi_entry_group_add_service(). May not be NULL.  }(* Const before type ignored *)
{*< The type of the service, as passed to avahi_entry_group_add_service(). May not be NULL.  }(* Const before type ignored *)
{*< The domain this service resides is, as passed to avahi_entry_group_add_service(). May be NULL.  }(* Const before type ignored *)
{*< The new subtype to register for the specified service. May not be NULL.  }function avahi_entry_group_add_service_subtype(group:PAvahiEntryGroup; interface:TAvahiIfIndex; protocol:TAvahiProtocol; flags:TAvahiPublishFlags; name:Pchar; 
           _type:Pchar; domain:Pchar; subtype:Pchar):longint;cdecl;external;
{* Update a TXT record for an existing service. The service should already be existent in the entry group.  }
{*< The interface this service is announced on. This should match the value passed to the original avahi_entry_group_add_service() call.  }{*< The protocol this service is announced with. This should match the value passed to the original avahi_entry_group_add_service() call.  }{*< Only != 0 if you really know what you do  }(* Const before type ignored *)
{*< The name of the service, as passed to avahi_entry_group_add_service(). May not be NULL.  }(* Const before type ignored *)
{*< The type of the service, as passed to avahi_entry_group_add_service(). May not be NULL.  }(* Const before type ignored *)
{*< The domain this service resides is, as passed to avahi_entry_group_add_service(). May be NULL.  }function avahi_entry_group_update_service_txt(g:PAvahiEntryGroup; interface:TAvahiIfIndex; protocol:TAvahiProtocol; flags:TAvahiPublishFlags; name:Pchar; 
           _type:Pchar; domain:Pchar; args:array of const):longint;cdecl;external;
function avahi_entry_group_update_service_txt(g:PAvahiEntryGroup; interface:TAvahiIfIndex; protocol:TAvahiProtocol; flags:TAvahiPublishFlags; name:Pchar; 
           _type:Pchar; domain:Pchar):longint;cdecl;external;
{* Update a TXT record for an existing service. Similar to avahi_entry_group_update_service_txt() but takes an AvahiStringList for the TXT strings, instead of a NULL terminated list of arguments.  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function avahi_entry_group_update_service_txt_strlst(g:PAvahiEntryGroup; interface:TAvahiIfIndex; protocol:TAvahiProtocol; flags:TAvahiPublishFlags; name:Pchar; 
           _type:Pchar; domain:Pchar; strlst:PAvahiStringList):longint;cdecl;external;
{* \cond fulldocs  }
{* Add a host/address pair  }
(* Const before type ignored *)
{*< The FDQN of the new hostname to register  }(* Const before type ignored *)
{*< The address this host name shall map to  }function avahi_entry_group_add_address(group:PAvahiEntryGroup; interface:TAvahiIfIndex; protocol:TAvahiProtocol; flags:TAvahiPublishFlags; name:Pchar; 
           a:PAvahiAddress):longint;cdecl;external;
{* \endcond  }
{* Add an arbitrary record. I hope you know what you do.  }
(* Const before type ignored *)
(* Const before type ignored *)
function avahi_entry_group_add_record(group:PAvahiEntryGroup; interface:TAvahiIfIndex; protocol:TAvahiProtocol; flags:TAvahiPublishFlags; name:Pchar; 
           clazz:Tuint16_t; _type:Tuint16_t; ttl:Tuint32_t; rdata:pointer; size:Tsize_t):longint;cdecl;external;
{* @  }
{$endif}

implementation


end.
