
unit address;
interface

{
  Automatically converted by H2Pas 1.0.0 from address.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    address.h
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
PAvahiIfIndex  = ^AvahiIfIndex;
PAvahiIPv4Address  = ^AvahiIPv4Address;
PAvahiIPv6Address  = ^AvahiIPv6Address;
PAvahiProtocol  = ^AvahiProtocol;
Pchar  = ^char;
Pxxxxxx  = ^xxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef fooaddresshfoo}
{$define fooaddresshfoo}
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
{* \file address.h Definitions and functions to manipulate IP addresses.  }
{$include <inttypes.h>}
{$include <sys/types.h>}
{$include <avahi-common/cdecl.h>}
{* Protocol family specification, takes the values AVAHI_PROTO_INET, AVAHI_PROTO_INET6, AVAHI_PROTO_UNSPEC  }
type
  PAvahiProtocol = ^TAvahiProtocol;
  TAvahiProtocol = longint;
{* Numeric network interface index. Takes OS dependent values and the special constant AVAHI_IF_UNSPEC   }

  PAvahiIfIndex = ^TAvahiIfIndex;
  TAvahiIfIndex = longint;
{* Values for AvahiProtocol  }
{*< IPv4  }
{*< IPv6  }
{*< Unspecified/all protocol(s)  }
  Txxxxxx =  Longint;
  Const
    AVAHI_PROTO_INET = 0;
    AVAHI_PROTO_INET6 = 1;
    AVAHI_PROTO_UNSPEC = -(1);

{* Special values for AvahiIfIndex  }
{*< Unspecified/all interface(s)  }
type
  Txxxxxx =  Longint;
  Const
    AVAHI_IF_UNSPEC = -(1);

{* Maximum size of an address in string form  }
{ IPv6 Max = 4*8 + 7 + 1 for NUL  }
  AVAHI_ADDRESS_STR_MAX = 40;  
{* Return TRUE if the specified interface index is valid  }
{xxxxxxxxxxxxxx#define AVAHI_IF_VALID(ifindex) (((ifindex) >= 0) || ((ifindex) == AVAHI_IF_UNSPEC)) }
{* Return TRUE if the specified protocol is valid  }
{xxxxxxxxxxxxxx#define AVAHI_PROTO_VALID(protocol) (((protocol) == AVAHI_PROTO_INET) || ((protocol) == AVAHI_PROTO_INET6) || ((protocol) == AVAHI_PROTO_UNSPEC)) }
{* An IPv4 address  }
{*< Address data in network byte order.  }
type
  PAvahiIPv4Address = ^TAvahiIPv4Address;
  TAvahiIPv4Address = record
      address : Tuint32_t;
    end;
{* An IPv6 address  }
{*< Address data  }

  PAvahiIPv6Address = ^TAvahiIPv6Address;
  TAvahiIPv6Address = record
      address : array[0..15] of Tuint8_t;
    end;
{* Protocol (address family) independent address structure  }
{*< Address family  }
{*< Address when IPv6  }
{*< Address when IPv4  }
{*< Type-independent data field  }

  PAvahiAddress = ^TAvahiAddress;
  TAvahiAddress = record
      proto : TAvahiProtocol;
      data : record
          case longint of
            0 : ( ipv6 : TAvahiIPv6Address );
            1 : ( ipv4 : TAvahiIPv4Address );
            2 : ( data : array[0..0] of Tuint8_t );
          end;
    end;
{* @ \name Comparison  }
{* Compare two addresses. Returns 0 when equal, a negative value when a < b, a positive value when a > b.  }
(* Const before type ignored *)
(* Const before type ignored *)

function avahi_address_cmp(a:PAvahiAddress; b:PAvahiAddress):longint;cdecl;external;
{* @  }
{* @ \name String conversion  }
{* Convert the specified address *a to a human readable character string, use AVAHI_ADDRESS_STR_MAX to allocate an array of the right size  }
(* Const before type ignored *)
function avahi_address_snprint(ret_s:Pchar; length:Tsize_t; a:PAvahiAddress):Pchar;cdecl;external;
{* Convert the specified human readable character string to an
 * address structure. Set af to AVAHI_UNSPEC for automatic address
 * family detection.  }
(* Const before type ignored *)
function avahi_address_parse(s:Pchar; af:TAvahiProtocol; ret_addr:PAvahiAddress):PAvahiAddress;cdecl;external;
{* @  }
{* \cond fulldocs  }
{* Generate the DNS reverse lookup name for an IPv4 or IPv6 address.  }
(* Const before type ignored *)
function avahi_reverse_lookup_name(a:PAvahiAddress; ret_s:Pchar; length:Tsize_t):Pchar;cdecl;external;
{* \endcond  }
{* @ \name Protocol/address family handling  }
{* Map AVAHI_PROTO_xxx constants to Unix AF_xxx constants  }
function avahi_proto_to_af(proto:TAvahiProtocol):longint;cdecl;external;
{* Map Unix AF_xxx constants to AVAHI_PROTO_xxx constants  }
function avahi_af_to_proto(af:longint):TAvahiProtocol;cdecl;external;
{* Return a textual representation of the specified protocol number. i.e. "IPv4", "IPv6" or "UNSPEC"  }
(* Const before type ignored *)
function avahi_proto_to_string(proto:TAvahiProtocol):Pchar;cdecl;external;
{* @  }
{$endif}

implementation


end.
