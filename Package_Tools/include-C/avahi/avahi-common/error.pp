
unit error;
interface

{
  Automatically converted by H2Pas 1.0.0 from error.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    error.h
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
Pchar  = ^char;
Pxxxxx  = ^xxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef fooerrorhfoo}
{$define fooerrorhfoo}
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
{* \file error.h Error codes and auxiliary functions  }
{$include <avahi-common/cdecl.h>}
{* Error codes used by avahi  }
{*< OK  }
{*< Generic error code  }
{*< Object was in a bad state  }
{*< Invalid host name  }
{*< Invalid domain name  }
{*< No suitable network protocol available  }
{*< Invalid DNS TTL  }
{*< RR key is pattern  }
{*< Name collision  }
{*< Invalid RR  }
{*< Invalid service name  }
{*< Invalid service type  }
{*< Invalid port number  }
{*< Invalid key  }
{*< Invalid address  }
{*< Timeout reached  }
{*< Too many clients  }
{*< Too many objects  }
{*< Too many entries  }
{*< OS error  }
{*< Access denied  }
{*< Invalid operation  }
{*< An unexpected D-Bus error occurred  }
{*< Daemon connection failed  }
{*< Memory exhausted  }
{*< The object passed to this function was invalid  }
{*< Daemon not running  }
{*< Invalid interface  }
{*< Invalid protocol  }
{*< Invalid flags  }
{*< Not found  }
{*< Configuration error  }
{*< Verson mismatch  }
{*< Invalid service subtype  }
{*< Invalid packet  }
{*< Invlaid DNS return code  }
{*< DNS Error: Form error  }
{*< DNS Error: Server Failure  }
{*< DNS Error: No such domain  }
{*< DNS Error: Not implemented  }
{*< DNS Error: Operation refused  }
{*< DNS Error: Not authorized  }
{*< Invalid RDATA  }
{*< Invalid DNS class  }
{*< Invalid DNS type  }
{*< Not supported  }
{*< Operation not permitted  }
{*< Invalid argument  }
{*< Is empty  }
{*< The requested operation is invalid because it is redundant  }
{***
     ****    IF YOU ADD A NEW ERROR CODE HERE, PLEASE DON'T FORGET TO ADD
     ****    IT TO THE STRING ARRAY IN avahi_strerror() IN error.c AND
     ****    TO THE ARRAY IN dbus.c AND FINALLY TO dbus.h!
     ****
     ****    Also remember to update the MAX value below.
     *** }
type
  Txxxxx =  Longint;
  Const
    AVAHI_OK = 0;
    AVAHI_ERR_FAILURE = -(1);
    AVAHI_ERR_BAD_STATE = -(2);
    AVAHI_ERR_INVALID_HOST_NAME = -(3);
    AVAHI_ERR_INVALID_DOMAIN_NAME = -(4);
    AVAHI_ERR_NO_NETWORK = -(5);
    AVAHI_ERR_INVALID_TTL = -(6);
    AVAHI_ERR_IS_PATTERN = -(7);
    AVAHI_ERR_COLLISION = -(8);
    AVAHI_ERR_INVALID_RECORD = -(9);
    AVAHI_ERR_INVALID_SERVICE_NAME = -(10);
    AVAHI_ERR_INVALID_SERVICE_TYPE = -(11);
    AVAHI_ERR_INVALID_PORT = -(12);
    AVAHI_ERR_INVALID_KEY = -(13);
    AVAHI_ERR_INVALID_ADDRESS = -(14);
    AVAHI_ERR_TIMEOUT = -(15);
    AVAHI_ERR_TOO_MANY_CLIENTS = -(16);
    AVAHI_ERR_TOO_MANY_OBJECTS = -(17);
    AVAHI_ERR_TOO_MANY_ENTRIES = -(18);
    AVAHI_ERR_OS = -(19);
    AVAHI_ERR_ACCESS_DENIED = -(20);
    AVAHI_ERR_INVALID_OPERATION = -(21);
    AVAHI_ERR_DBUS_ERROR = -(22);
    AVAHI_ERR_DISCONNECTED = -(23);
    AVAHI_ERR_NO_MEMORY = -(24);
    AVAHI_ERR_INVALID_OBJECT = -(25);
    AVAHI_ERR_NO_DAEMON = -(26);
    AVAHI_ERR_INVALID_INTERFACE = -(27);
    AVAHI_ERR_INVALID_PROTOCOL = -(28);
    AVAHI_ERR_INVALID_FLAGS = -(29);
    AVAHI_ERR_NOT_FOUND = -(30);
    AVAHI_ERR_INVALID_CONFIG = -(31);
    AVAHI_ERR_VERSION_MISMATCH = -(32);
    AVAHI_ERR_INVALID_SERVICE_SUBTYPE = -(33);
    AVAHI_ERR_INVALID_PACKET = -(34);
    AVAHI_ERR_INVALID_DNS_ERROR = -(35);
    AVAHI_ERR_DNS_FORMERR = -(36);
    AVAHI_ERR_DNS_SERVFAIL = -(37);
    AVAHI_ERR_DNS_NXDOMAIN = -(38);
    AVAHI_ERR_DNS_NOTIMP = -(39);
    AVAHI_ERR_DNS_REFUSED = -(40);
    AVAHI_ERR_DNS_YXDOMAIN = -(41);
    AVAHI_ERR_DNS_YXRRSET = -(42);
    AVAHI_ERR_DNS_NXRRSET = -(43);
    AVAHI_ERR_DNS_NOTAUTH = -(44);
    AVAHI_ERR_DNS_NOTZONE = -(45);
    AVAHI_ERR_INVALID_RDATA = -(46);
    AVAHI_ERR_INVALID_DNS_CLASS = -(47);
    AVAHI_ERR_INVALID_DNS_TYPE = -(48);
    AVAHI_ERR_NOT_SUPPORTED = -(49);
    AVAHI_ERR_NOT_PERMITTED = -(50);
    AVAHI_ERR_INVALID_ARGUMENT = -(51);
    AVAHI_ERR_IS_EMPTY = -(52);
    AVAHI_ERR_NO_CHANGE = -(53);
    AVAHI_ERR_MAX = -(54);

{* Return a human readable error string for the specified error code  }
(* Const before type ignored *)

function avahi_strerror(error:longint):Pchar;cdecl;external;
{$endif}

implementation


end.
