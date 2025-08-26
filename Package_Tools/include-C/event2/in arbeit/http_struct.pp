
unit http_struct;
interface

{
  Automatically converted by H2Pas 1.0.0 from http_struct.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    http_struct.h
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
Pevbuffer  = ^evbuffer;
Pevhttp_connection  = ^evhttp_connection;
Pevhttp_request  = ^evhttp_request;
Pevhttp_uri  = ^evhttp_uri;
Pevkeyvalq  = ^evkeyvalq;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2000-2007 Niels Provos <provos@citi.umich.edu>
 * Copyright (c) 2007-2012 Niels Provos and Nick Mathewson
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
{$ifndef EVENT2_HTTP_STRUCT_H_INCLUDED_}
{$define EVENT2_HTTP_STRUCT_H_INCLUDED_}
{* @file event2/http_struct.h

  Data structures for http.  Using these structures may hurt forward
  compatibility with later versions of Libevent: be careful!

  }
{ C++ extern C conditionnal removed }
{$include <event2/event-config.h>}
{$ifdef EVENT__HAVE_SYS_TYPES_H}
{$include <sys/types.h>}
{$endif}
{$ifdef EVENT__HAVE_SYS_TIME_H}
{$include <sys/time.h>}
{$endif}
{ For int types.  }
{$include <event2/util.h>}
{*
 * the request structure that a server receives.
 * WARNING: expect this structure to change.  I will try to provide
 * reasonable accessors.
  }

const
  EVHTTP_REQ_OWN_CONNECTION = $0001;  
{* Request was made via a proxy  }
  EVHTTP_PROXY_REQUEST = $0002;  
{* The request object is owned by the user; the user must free it  }
  EVHTTP_USER_OWNED = $0004;  
{* The request will be used again upstack; freeing must be deferred  }
  EVHTTP_REQ_DEFER_FREE = $0008;  
{* The request should be freed upstack  }
  EVHTTP_REQ_NEEDS_FREE = $0010;  
{ the connection object that this request belongs to  }
{* The request obj owns the evhttp connection and needs to free it  }
{ address of the remote host and the port connection came from  }
{ cache of the hostname for evhttp_request_get_host  }
{ uri after HTTP request was parsed  }
{ uri elements  }
{ HTTP Major number  }
{ HTTP Minor number  }
{ HTTP Response code  }
{ Readable response  }
{ read data  }
{ a chunked request  }
{ the user has sent all data  }
{ outgoing post or data  }
{ Callback  }
{
	 * Chunked data callback - call for each completed chunk if
	 * specified.  If not specified, all the data is delivered via
	 * the regular callback.
	  }
{
	 * Callback added for forked-daapd so they can collect ICY
	 * (shoutcast) metadata from the http header. If return
	 * int is negative the connection will be closed.
	  }
{
	 * Error callback - called when error is occured.
	 * @see evhttp_request_error for error types.
	 *
	 * @see evhttp_request_set_error_cb()
	  }
{
	 * Send complete callback - called when the request is actually
	 * sent and completed.
	  }
type
  Pevhttp_request = ^Tevhttp_request;
  Tevhttp_request = record
      next : record
          tqe_next : Pevhttp_request;
          tqe_prev : ^Pevhttp_request;
        end;
      evcon : Pevhttp_connection;
      flags : longint;
      input_headers : Pevkeyvalq;
      output_headers : Pevkeyvalq;
      remote_host : Pchar;
      remote_port : Tev_uint16_t;
      host_cache : Pchar;
      kind : Tevhttp_request_kind;
      _type : Tevhttp_cmd_type;
      headers_size : Tsize_t;
      body_size : Tsize_t;
      uri : Pchar;
      uri_elems : Pevhttp_uri;
      major : char;
      minor : char;
      response_code : longint;
      response_code_line : Pchar;
      input_buffer : Pevbuffer;
      ntoread : Tev_int64_t;
      flag0 : word;
      output_buffer : Pevbuffer;
      cb : procedure (para1:Pevhttp_request; para2:pointer);cdecl;
      cb_arg : pointer;
      chunk_cb : procedure (para1:Pevhttp_request; para2:pointer);cdecl;
      header_cb : function (para1:Pevhttp_request; para2:pointer):longint;cdecl;
      error_cb : procedure (para1:Tevhttp_request_error; para2:pointer);cdecl;
      on_complete_cb : procedure (para1:Pevhttp_request; para2:pointer);cdecl;
      on_complete_cb_arg : pointer;
    end;


const
  bm_Tevhttp_request_chunked = $1;
  bp_Tevhttp_request_chunked = 0;
  bm_Tevhttp_request_userdone = $2;
  bp_Tevhttp_request_userdone = 1;

function chunked(var a : Tevhttp_request) : dword;
procedure set_chunked(var a : Tevhttp_request; __chunked : dword);
function userdone(var a : Tevhttp_request) : dword;
procedure set_userdone(var a : Tevhttp_request; __userdone : dword);
{ C++ end of extern C conditionnal removed }
{$endif}
{ EVENT2_HTTP_STRUCT_H_INCLUDED_  }

implementation

function chunked(var a : Tevhttp_request) : dword;
begin
  chunked:=(a.flag0 and bm_Tevhttp_request_chunked) shr bp_Tevhttp_request_chunked;
end;

procedure set_chunked(var a : Tevhttp_request; __chunked : dword);
begin
  a.flag0:=a.flag0 or ((__chunked shl bp_Tevhttp_request_chunked) and bm_Tevhttp_request_chunked);
end;

function userdone(var a : Tevhttp_request) : dword;
begin
  userdone:=(a.flag0 and bm_Tevhttp_request_userdone) shr bp_Tevhttp_request_userdone;
end;

procedure set_userdone(var a : Tevhttp_request; __userdone : dword);
begin
  a.flag0:=a.flag0 or ((__userdone shl bp_Tevhttp_request_userdone) and bm_Tevhttp_request_userdone);
end;


end.
