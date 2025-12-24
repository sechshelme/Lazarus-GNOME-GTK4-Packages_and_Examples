
unit client;
interface

{
  Automatically converted by H2Pas 1.0.0 from client.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    client.h
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
PAvahiClient  = ^AvahiClient;
PAvahiClientFlags  = ^AvahiClientFlags;
PAvahiClientState  = ^AvahiClientState;
PAvahiPoll  = ^AvahiPoll;
Pchar  = ^char;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef fooclienthfoo}
{$define fooclienthfoo}
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
{* \file client.h Definitions and functions for the client API over D-Bus  }
{* A connection context  }
type
{* States of a client object, a superset of AvahiServerState  }
{*< Server state: REGISTERING  }
{*< Server state: RUNNING  }
{*< Server state: COLLISION  }
{*< Some kind of error happened on the client side  }
{*< We're still connecting. This state is only entered when AVAHI_CLIENT_NO_FAIL has been passed to avahi_client_new() and the daemon is not yet available.  }

  PAvahiClientState = ^TAvahiClientState;
  TAvahiClientState =  Longint;
  Const
    AVAHI_CLIENT_S_REGISTERING = AVAHI_SERVER_REGISTERING;
    AVAHI_CLIENT_S_RUNNING = AVAHI_SERVER_RUNNING;
    AVAHI_CLIENT_S_COLLISION = AVAHI_SERVER_COLLISION;
    AVAHI_CLIENT_FAILURE = 100;
    AVAHI_CLIENT_CONNECTING = 101;
;
{*< Don't read user configuration  }
{*< Don't fail if the daemon is not available when avahi_client_new() is called, instead enter AVAHI_CLIENT_CONNECTING state and wait for the daemon to appear  }
type
  PAvahiClientFlags = ^TAvahiClientFlags;
  TAvahiClientFlags =  Longint;
  Const
    AVAHI_CLIENT_IGNORE_USER_CONFIG = 1;
    AVAHI_CLIENT_NO_FAIL = 2;
;
{* The function prototype for the callback of an AvahiClient  }
{*< The new state of the client  }{*< The user data that was passed to avahi_client_new()  }type

  TAvahiClientCallback = procedure (s:PAvahiClient; state:TAvahiClientState; userdata:pointer);cdecl;
{* @ \name Construction and destruction  }
{* Creates a new client instance  }
(* Const before type ignored *)
{*< The abstract event loop API to use  }{*< Some flags to modify the behaviour of  the client library  }{*< A callback that is called whenever the state of the client changes. This may be NULL. Please note that this function is called for the first time from within the avahi_client_new() context! Thus, in the callback you should not make use of global variables that are initialized only after your call to avahi_client_new(). A common mistake is to store the AvahiClient pointer returned by avahi_client_new() in a global variable and assume that this global variable already contains the valid pointer when the callback is called for the first time. A work-around for this is to always use the AvahiClient pointer passed to the callback function instead of the global pointer.   }{*< Some arbitrary user data pointer that will be passed to the callback function  }{*< If creation of the client fails, this integer will contain the error cause. May be NULL if you aren't interested in the reason why avahi_client_new() failed.  }
function avahi_client_new(poll_api:PAvahiPoll; flags:TAvahiClientFlags; callback:TAvahiClientCallback; userdata:pointer; error:Plongint):PAvahiClient;cdecl;external;
{* Free a client instance. This will automatically free all
 * associated browser, resolve and entry group objects. All pointers
 * to such objects become invalid!  }
procedure avahi_client_free(client:PAvahiClient);cdecl;external;
{* @  }
{* @ \name Properties  }
{* Get the version of the server  }
(* Const before type ignored *)
function avahi_client_get_version_string(para1:PAvahiClient):Pchar;cdecl;external;
{* Get host name  }
(* Const before type ignored *)
function avahi_client_get_host_name(para1:PAvahiClient):Pchar;cdecl;external;
{* Set host name. \since 0.6.13  }
(* Const before type ignored *)
function avahi_client_set_host_name(para1:PAvahiClient; name:Pchar):longint;cdecl;external;
{* Get domain name  }
(* Const before type ignored *)
function avahi_client_get_domain_name(para1:PAvahiClient):Pchar;cdecl;external;
{* Get FQDN domain name  }
(* Const before type ignored *)
function avahi_client_get_host_name_fqdn(para1:PAvahiClient):Pchar;cdecl;external;
{* Get state  }
function avahi_client_get_state(client:PAvahiClient):TAvahiClientState;cdecl;external;
{* @ \name Error Handling  }
{* Get the last error number. See avahi_strerror() for converting this error code into a human readable string.  }
function avahi_client_errno(para1:PAvahiClient):longint;cdecl;external;
{* @  }
{* \cond fulldocs  }
{* Return the local service cookie. returns AVAHI_SERVICE_COOKIE_INVALID on failure.  }
function avahi_client_get_local_service_cookie(client:PAvahiClient):Tuint32_t;cdecl;external;
{* \endcond  }
{* @ \name Libc NSS Support  }
{* Return 1 if gethostbyname() supports mDNS lookups, 0 otherwise. \since 0.6.5  }
function avahi_nss_support:longint;cdecl;external;
{* @  }
{$endif}

implementation


end.
