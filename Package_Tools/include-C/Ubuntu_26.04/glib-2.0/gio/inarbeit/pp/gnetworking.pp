
unit gnetworking;
interface

{
  Automatically converted by H2Pas 1.0.0 from gnetworking.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gnetworking.h
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
Pcmsghdr  = ^cmsghdr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2008-2011 Red Hat, Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef __G_NETWORKING_H__}
{$define __G_NETWORKING_H__}
{$include <glib.h>}
{$include <gio/gio-visibility.h>}
{$ifdef G_OS_WIN32}
{$include <winsock2.h>}
{$include <ws2tcpip.h>}
{$include <windns.h>}
{$include <mswsock.h>}
{$include <wspiapi.h>}
{$include <iphlpapi.h>}
{$undef interface}
{$else}
{ !G_OS_WIN32  }
{$include <sys/types.h>}
{$include <netdb.h>}
{$include <netinet/in.h>}
{$include <netinet/tcp.h>}
{$include <resolv.h>}
{$include <sys/socket.h>}
{$include <sys/un.h>}
{$include <net/if.h>}
{$include <arpa/inet.h>}
{$include <arpa/nameser.h>}
{$ifndef __GI_SCANNER__}
{$ifndef T_SRV}

const
  T_SRV = 33;  
{$endif}
{$ifndef _PATH_RESCONF}

const
  _PATH_RESCONF = '/etc/resolv.conf';  
{$endif}
{$ifndef CMSG_LEN}
{ CMSG_LEN and CMSG_SPACE are defined by RFC 2292, but missing on
 * some older platforms.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function CMSG_LEN(len : longint) : longint;

{ CMSG_SPACE must add at least as much padding as CMSG_NXTHDR()
 * adds. We overestimate here.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GLIB_ALIGN_TO_SIZEOF(len,obj : longint) : longint;

{xxxxxxxxxx #define CMSG_SPACE(len) GLIB_ALIGN_TO_SIZEOF (CMSG_LEN (len), struct cmsghdr) }
{$endif}
{$endif}
{$endif}
{ !__GI_SCANNER__  }

procedure g_networking_init;cdecl;external;
{$endif}
{ __G_NETWORKING_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CMSG_LEN(len : longint) : longint;
begin
  CMSG_LEN:=(Tsize_t(CMSG_DATA(Pcmsghdr(NULL))))+len;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GLIB_ALIGN_TO_SIZEOF(len,obj : longint) : longint;
begin
  GLIB_ALIGN_TO_SIZEOF:=((Tlen(+(sizeof(obj))))-1) and ( not ((sizeof(obj))-1));
end;


end.
