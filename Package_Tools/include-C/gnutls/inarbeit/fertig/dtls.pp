
unit dtls;
interface

{
  Automatically converted by H2Pas 1.0.0 from dtls.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    dtls.h
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
Pgnutls_datum_t  = ^gnutls_datum_t;
Pgnutls_dtls_prestate_st  = ^gnutls_dtls_prestate_st;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2011-2012 Free Software Foundation, Inc.
 *
 * Author: Nikos Mavrogiannopoulos
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
{ This file contains the types and prototypes for the X.509
 * certificate and CRL handling functions.
  }
{$ifndef GNUTLS_DTLS_H}
{$define GNUTLS_DTLS_H}
{$include <gnutls/gnutls.h>}
{ C++ extern C conditionnal removed }

const
  GNUTLS_COOKIE_KEY_SIZE = 16;  

procedure gnutls_dtls_set_timeouts(session:Tgnutls_session_t; retrans_timeout:dword; total_timeout:dword);cdecl;external;
function gnutls_dtls_get_mtu(session:Tgnutls_session_t):dword;cdecl;external;
function gnutls_dtls_get_data_mtu(session:Tgnutls_session_t):dword;cdecl;external;
procedure gnutls_dtls_set_mtu(session:Tgnutls_session_t; mtu:dword);cdecl;external;
function gnutls_dtls_set_data_mtu(session:Tgnutls_session_t; mtu:dword):longint;cdecl;external;
function gnutls_dtls_get_timeout(session:Tgnutls_session_t):dword;cdecl;external;
{*
 * gnutls_dtls_prestate_st:
 * @record_seq: record sequence number
 * @hsk_read_seq: handshake read sequence number
 * @hsk_write_seq: handshake write sequence number
 *
 * DTLS cookie prestate struct.  This is usually never modified by
 * the application, it is used to carry the cookie data between
 * gnutls_dtls_cookie_send(), gnutls_dtls_cookie_verify() and
 * gnutls_dtls_prestate_set().
  }
type
  Pgnutls_dtls_prestate_st = ^Tgnutls_dtls_prestate_st;
  Tgnutls_dtls_prestate_st = record
      record_seq : dword;
      hsk_read_seq : dword;
      hsk_write_seq : dword;
    end;

function gnutls_dtls_cookie_send(key:Pgnutls_datum_t; client_data:pointer; client_data_size:Tsize_t; prestate:Pgnutls_dtls_prestate_st; ptr:Tgnutls_transport_ptr_t; 
           push_func:Tgnutls_push_func):longint;cdecl;external;
function gnutls_dtls_cookie_verify(key:Pgnutls_datum_t; client_data:pointer; client_data_size:Tsize_t; _msg:pointer; msg_size:Tsize_t; 
           prestate:Pgnutls_dtls_prestate_st):longint;cdecl;external;
procedure gnutls_dtls_prestate_set(session:Tgnutls_session_t; prestate:Pgnutls_dtls_prestate_st);cdecl;external;
function gnutls_record_get_discarded(session:Tgnutls_session_t):dword;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ GNUTLS_DTLS_H  }

implementation


end.
