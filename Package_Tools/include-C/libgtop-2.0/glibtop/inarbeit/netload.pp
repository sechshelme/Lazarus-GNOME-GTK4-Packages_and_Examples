
unit netload;
interface

{
  Automatically converted by H2Pas 1.0.0 from netload.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    netload.h
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
Pglibtop  = ^glibtop;
PGLIBTOP_IF_IN6_SCOPE  = ^GLIBTOP_IF_IN6_SCOPE;
Pglibtop_netload  = ^glibtop_netload;
Pxxxxxx  = ^xxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 1998-99 Martin Baulig
   This file is part of LibGTop 1.0.

   Contributed by Martin Baulig <martin@home-of-linux.org>, April 1998.

   LibGTop is free software; you can redistribute it and/or modify it
   under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License,
   or (at your option) any later version.

   LibGTop is distributed in the hope that it will be useful, but WITHOUT
   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
   FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
   for more details.

   You should have received a copy of the GNU General Public License
   along with LibGTop; see the file COPYING. If not, write to the
   Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.
 }
{$ifndef __GLIBTOP_NETLOAD_H__}
{$define __GLIBTOP_NETLOAD_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_NETLOAD_IF_FLAGS = 0;  
  GLIBTOP_NETLOAD_MTU = 1;  
  GLIBTOP_NETLOAD_SUBNET = 2;  
  GLIBTOP_NETLOAD_ADDRESS = 3;  
  GLIBTOP_NETLOAD_PACKETS_IN = 4;  
  GLIBTOP_NETLOAD_PACKETS_OUT = 5;  
  GLIBTOP_NETLOAD_PACKETS_TOTAL = 6;  
  GLIBTOP_NETLOAD_BYTES_IN = 7;  
  GLIBTOP_NETLOAD_BYTES_OUT = 8;  
  GLIBTOP_NETLOAD_BYTES_TOTAL = 9;  
  GLIBTOP_NETLOAD_ERRORS_IN = 10;  
  GLIBTOP_NETLOAD_ERRORS_OUT = 11;  
  GLIBTOP_NETLOAD_ERRORS_TOTAL = 12;  
  GLIBTOP_NETLOAD_COLLISIONS = 13;  
  GLIBTOP_NETLOAD_ADDRESS6 = 14;  
  GLIBTOP_NETLOAD_PREFIX6 = 15;  
  GLIBTOP_NETLOAD_SCOPE6 = 16;  
  GLIBTOP_NETLOAD_HWADDRESS = 17;  
  GLIBTOP_MAX_NETLOAD = 18;  
type
  Txxxxxx =  Longint;
  Const
    GLIBTOP_IF_FLAGS_UP = 1;
    GLIBTOP_IF_FLAGS_BROADCAST = 2;
    GLIBTOP_IF_FLAGS_DEBUG = 3;
    GLIBTOP_IF_FLAGS_LOOPBACK = 4;
    GLIBTOP_IF_FLAGS_POINTOPOINT = 5;
    GLIBTOP_IF_FLAGS_RUNNING = 6;
    GLIBTOP_IF_FLAGS_NOARP = 7;
    GLIBTOP_IF_FLAGS_PROMISC = 8;
    GLIBTOP_IF_FLAGS_ALLMULTI = 9;
    GLIBTOP_IF_FLAGS_OACTIVE = 10;
    GLIBTOP_IF_FLAGS_SIMPLEX = 11;
    GLIBTOP_IF_FLAGS_LINK0 = 12;
    GLIBTOP_IF_FLAGS_LINK1 = 13;
    GLIBTOP_IF_FLAGS_LINK2 = 14;
    GLIBTOP_IF_FLAGS_ALTPHYS = 15;
    GLIBTOP_IF_FLAGS_MULTICAST = 16;
    GLIBTOP_IF_FLAGS_WIRELESS = 17;

type
  TGLIBTOP_IF_IN6_SCOPE =  Longint;
  Const
    GLIBTOP_IF_IN6_SCOPE_UNKNOWN = 0;
    GLIBTOP_IF_IN6_SCOPE_LINK = 1;
    GLIBTOP_IF_IN6_SCOPE_SITE = 2;
    GLIBTOP_IF_IN6_SCOPE_GLOBAL = 4;
    GLIBTOP_IF_IN6_SCOPE_HOST = 8;

{ GLIBTOP_NETLOAD_IF_FLAGS	 }
{ GLIBTOP_NETLOAD_MTU		 }
{ GLIBTOP_NETLOAD_SUBNET	 }
{ GLIBTOP_NETLOAD_ADDRESS	 }
{ GLIBTOP_NETLOAD_PACKETS_IN	 }
{ GLIBTOP_NETLOAD_PACKETS_OUT	 }
{ GLIBTOP_NETLOAD_PACKETS_TOTAL }
{ GLIBTOP_NETLOAD_BYTES_IN	 }
{ GLIBTOP_NETLOAD_BYTES_OUT	 }
{ GLIBTOP_NETLOAD_BYTES_TOTAL	 }
{ GLIBTOP_NETLOAD_ERRORS_IN	 }
{ GLIBTOP_NETLOAD_ERRORS_OUT	 }
{ GLIBTOP_NETLOAD_ERRORS_TOTAL	 }
{ GLIBTOP_NETLOAD_COLLISIONS	 }
{ GLIBTOP_NETLOAD_ADDRESS6      }
{ GLIBTOP_NETLOAD_PREXIF6       }
{ GLIBTOP_NETLOAD_SCOPE6        }
{ GLIBTOP_NETLOAD_HWADDRESS     }
type
  Pglibtop_netload = ^Tglibtop_netload;
  Tglibtop_netload = record
      flags : Tguint64;
      if_flags : Tguint64;
      mtu : Tguint32;
      subnet : Tguint32;
      address : Tguint32;
      packets_in : Tguint64;
      packets_out : Tguint64;
      packets_total : Tguint64;
      bytes_in : Tguint64;
      bytes_out : Tguint64;
      bytes_total : Tguint64;
      errors_in : Tguint64;
      errors_out : Tguint64;
      errors_total : Tguint64;
      collisions : Tguint64;
      address6 : array[0..15] of Tguint8;
      prefix6 : array[0..15] of Tguint8;
      scope6 : Tguint8;
      hwaddress : array[0..7] of Tguint8;
    end;

(* Const before type ignored *)

procedure glibtop_get_netload(buf:Pglibtop_netload; interface:Pchar);cdecl;external;
{$if GLIBTOP_SUID_NETLOAD}

const
  glibtop_get_netload_r = glibtop_get_netload_p;  
{$else}

const
  glibtop_get_netload_r = glibtop_get_netload_s;  
{$endif}
(* Const before type ignored *)

procedure glibtop_get_netload_l(server:Pglibtop; buf:Pglibtop_netload; interface:Pchar);cdecl;external;
{$if GLIBTOP_SUID_NETLOAD}

procedure _glibtop_init_netload_p(server:Pglibtop);cdecl;external;
(* Const before type ignored *)
procedure glibtop_get_netload_p(server:Pglibtop; buf:Pglibtop_netload; interface:Pchar);cdecl;external;
{$else}

procedure _glibtop_init_netload_s(server:Pglibtop);cdecl;external;
(* Const before type ignored *)
procedure glibtop_get_netload_s(server:Pglibtop; buf:Pglibtop_netload; interface:Pchar);cdecl;external;
{$endif}
{$endif}

implementation


end.
