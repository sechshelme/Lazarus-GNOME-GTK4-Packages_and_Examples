
unit socket;
interface

{
  Automatically converted by H2Pas 1.0.0 from socket.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    socket.h
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
Psockaddr  = ^sockaddr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2016 Free Software Foundation, Inc.
 *
 * Author: Tim Ruehsen
 *
 * This file is part of GnuTLS.
 *
 * The GnuTLS is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>
 *
  }
{ This file contains socket related types, prototypes and includes.
  }
{$ifndef GNUTLS_SOCKET_H}
{$define GNUTLS_SOCKET_H}
{$include <gnutls/gnutls.h>}
{ Get socklen_t  }
{$include <sys/socket.h>}
{ C++ extern C conditionnal removed }

procedure gnutls_transport_set_fastopen(session:Tgnutls_session_t; fd:longint; connect_addr:Psockaddr; connect_addrlen:Tsocklen_t; flags:dword);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ GNUTLS_SOCKET_H  }

implementation


end.
