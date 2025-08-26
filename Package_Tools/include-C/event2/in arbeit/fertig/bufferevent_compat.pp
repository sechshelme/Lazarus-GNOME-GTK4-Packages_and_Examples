
unit bufferevent_compat;
interface

{
  Automatically converted by H2Pas 1.0.0 from bufferevent_compat.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bufferevent_compat.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2007-2012 Niels Provos, Nick Mathewson
 * Copyright (c) 2000-2007 Niels Provos <provos@citi.umich.edu>
 * All rights reserved.
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
{$ifndef EVENT2_BUFFEREVENT_COMPAT_H_INCLUDED_}
{$define EVENT2_BUFFEREVENT_COMPAT_H_INCLUDED_}
{$include <event2/visibility.h>}

const
  evbuffercb = bufferevent_data_cb;  
  everrorcb = bufferevent_event_cb;  
{*
  Create a new bufferevent for an fd.

  This function is deprecated.  Use bufferevent_socket_new and
  bufferevent_set_callbacks instead.

  Libevent provides an abstraction on top of the regular event callbacks.
  This abstraction is called a buffered event.  A buffered event provides
  input and output buffers that get filled and drained automatically.  The
  user of a buffered event no longer deals directly with the I/O, but
  instead is reading from input and writing to output buffers.

  Once initialized, the bufferevent structure can be used repeatedly with
  bufferevent_enable() and bufferevent_disable().

  When read enabled the bufferevent will try to read from the file descriptor
  and call the read callback.  The write callback is executed whenever the
  output buffer is drained below the write low watermark, which is 0 by
  default.

  If multiple bases are in use, bufferevent_base_set() must be called before
  enabling the bufferevent for the first time.

  @deprecated This function is deprecated because it uses the current
    event base, and as such can be error prone for multithreaded programs.
    Use bufferevent_socket_new() instead.

  @param fd the file descriptor from which data is read and written to.
	 This file descriptor is not allowed to be a pipe(2).
  @param readcb callback to invoke when there is data to be read, or NULL if
	 no callback is desired
  @param writecb callback to invoke when the file descriptor is ready for
	 writing, or NULL if no callback is desired
  @param errorcb callback to invoke when there is an error on the file
	 descriptor
  @param cbarg an argument that will be supplied to each of the callbacks
	 (readcb, writecb, and errorcb)
  @return a pointer to a newly allocated bufferevent struct, or NULL if an
	  error occurred
  @see bufferevent_base_set(), bufferevent_free()
   }

function bufferevent_new(fd:Tevutil_socket_t; readcb:Tevbuffercb; writecb:Tevbuffercb; errorcb:Teverrorcb; cbarg:pointer):Pbufferevent;cdecl;external;
{*
  Set the read and write timeout for a buffered event.

  @param bufev the bufferevent to be modified
  @param timeout_read the read timeout
  @param timeout_write the write timeout
  }
procedure bufferevent_settimeout(bufev:Pbufferevent; timeout_read:longint; timeout_write:longint);cdecl;external;
const
  EVBUFFER_READ = BEV_EVENT_READING;  
  EVBUFFER_WRITE = BEV_EVENT_WRITING;  
  EVBUFFER_EOF = BEV_EVENT_EOF;  
  EVBUFFER_ERROR = BEV_EVENT_ERROR;  
  EVBUFFER_TIMEOUT = BEV_EVENT_TIMEOUT;  
{* macro for getting access to the input buffer of a bufferevent  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function EVBUFFER_INPUT(x : longint) : longint;

{* macro for getting access to the output buffer of a bufferevent  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EVBUFFER_OUTPUT(x : longint) : longint;

{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EVBUFFER_INPUT(x : longint) : longint;
begin
  EVBUFFER_INPUT:=bufferevent_get_input(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EVBUFFER_OUTPUT(x : longint) : longint;
begin
  EVBUFFER_OUTPUT:=bufferevent_get_output(x);
end;


end.
