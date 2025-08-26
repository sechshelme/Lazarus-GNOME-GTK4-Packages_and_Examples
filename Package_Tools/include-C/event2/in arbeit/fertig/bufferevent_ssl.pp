
unit bufferevent_ssl;
interface

{
  Automatically converted by H2Pas 1.0.0 from bufferevent_ssl.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bufferevent_ssl.h
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
Pbufferevent  = ^bufferevent;
Pbufferevent_ssl_state  = ^bufferevent_ssl_state;
Pevent_base  = ^event_base;
Pssl_st  = ^ssl_st;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2009-2012 Niels Provos and Nick Mathewson
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  }
{$ifndef EVENT2_BUFFEREVENT_SSL_H_INCLUDED_}
{$define EVENT2_BUFFEREVENT_SSL_H_INCLUDED_}
{* @file event2/bufferevent_ssl.h

    OpenSSL support for bufferevents.
  }
{$include <event2/visibility.h>}
{$include <event2/event-config.h>}
{$include <event2/bufferevent.h>}
{$include <event2/util.h>}
{ C++ extern C conditionnal removed }
{ This is what openssl's SSL objects are underneath.  }
type
  Pssl_st = ^Tssl_st;
  Tssl_st = record
      {undefined structure}
    end;

{*
   The state of an SSL object to be used when creating a new
   SSL bufferevent.
  }
  Tbufferevent_ssl_state =  Longint;
  Const
    BUFFEREVENT_SSL_OPEN = 0;
    BUFFEREVENT_SSL_CONNECTING = 1;
    BUFFEREVENT_SSL_ACCEPTING = 2;

{$if defined(EVENT__HAVE_OPENSSL) || defined(EVENT_IN_DOXYGEN_)}
{*
   Create a new SSL bufferevent to send its data over another bufferevent.

   @param base An event_base to use to detect reading and writing.  It
      must also be the base for the underlying bufferevent.
   @param underlying A socket to use for this SSL
   @param ssl A SSL* object from openssl.
   @param state The current state of the SSL connection
   @param options One or more bufferevent_options
   @return A new bufferevent on success, or NULL on failure
 }

function bufferevent_openssl_filter_new(base:Pevent_base; underlying:Pbufferevent; ssl:Pssl_st; state:Tbufferevent_ssl_state; options:longint):Pbufferevent;cdecl;external;
{*
   Create a new SSL bufferevent to send its data over an SSL * on a socket.

   @param base An event_base to use to detect reading and writing
   @param fd A socket to use for this SSL
   @param ssl A SSL* object from openssl.
   @param state The current state of the SSL connection
   @param options One or more bufferevent_options
   @return A new bufferevent on success, or NULL on failure.
 }
function bufferevent_openssl_socket_new(base:Pevent_base; fd:Tevutil_socket_t; ssl:Pssl_st; state:Tbufferevent_ssl_state; options:longint):Pbufferevent;cdecl;external;
{* Control how to report dirty SSL shutdowns.

    If the peer (or the network, or an attacker) closes the TCP
    connection before closing the SSL channel, and the protocol is SSL >= v3,
    this is a "dirty" shutdown.  If allow_dirty_shutdown is 0 (default),
    this is reported as BEV_EVENT_ERROR.

    If instead allow_dirty_shutdown=1, a dirty shutdown is reported as
    BEV_EVENT_EOF.

    (Note that if the protocol is < SSLv3, you will always receive
    BEV_EVENT_EOF, since SSL 2 and earlier cannot distinguish a secure
    connection close from a dirty one.  This is one reason (among many)
    not to use SSL 2.)
 }
function bufferevent_openssl_get_allow_dirty_shutdown(bev:Pbufferevent):longint;cdecl;external;
procedure bufferevent_openssl_set_allow_dirty_shutdown(bev:Pbufferevent; allow_dirty_shutdown:longint);cdecl;external;
{* Return the underlying openssl SSL * object for an SSL bufferevent.  }
function bufferevent_openssl_get_ssl(bufev:Pbufferevent):Pssl_st;cdecl;external;
{* Tells a bufferevent to begin SSL renegotiation.  }
function bufferevent_ssl_renegotiate(bev:Pbufferevent):longint;cdecl;external;
{* Return the most recent OpenSSL error reported on an SSL bufferevent.  }
function bufferevent_get_openssl_error(bev:Pbufferevent):dword;cdecl;external;
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}
{ EVENT2_BUFFEREVENT_SSL_H_INCLUDED_  }

implementation


end.
