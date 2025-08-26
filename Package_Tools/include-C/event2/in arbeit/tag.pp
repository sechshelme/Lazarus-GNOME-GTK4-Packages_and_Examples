
unit tag;
interface

{
  Automatically converted by H2Pas 1.0.0 from tag.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    tag.h
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
Pev_uint32_t  = ^ev_uint32_t;
Pev_uint64_t  = ^ev_uint64_t;
Pevbuffer  = ^evbuffer;
Ptimeval  = ^timeval;
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
{$ifndef EVENT2_TAG_H_INCLUDED_}
{$define EVENT2_TAG_H_INCLUDED_}
{* @file event2/tag.h

  Helper functions for reading and writing tagged data onto buffers.

  }
{$include <event2/visibility.h>}
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
type
  Pevbuffer = ^Tevbuffer;
  Tevbuffer = record
      {undefined structure}
    end;

{
 * Marshaling tagged data - We assume that all tags are inserted in their
 * numeric order - so that unknown tags will always be higher than the
 * known ones - and we can just ignore the end of an event buffer.
  }

procedure evtag_init;cdecl;external;
{*
   Unmarshals the header and returns the length of the payload

   @param evbuf the buffer from which to unmarshal data
   @param ptag a pointer in which the tag id is being stored
   @returns -1 on failure or the number of bytes in the remaining payload.
 }
function evtag_unmarshal_header(evbuf:Pevbuffer; ptag:Pev_uint32_t):longint;cdecl;external;
(* Const before type ignored *)
procedure evtag_marshal(evbuf:Pevbuffer; tag:Tev_uint32_t; data:pointer; len:Tev_uint32_t);cdecl;external;
procedure evtag_marshal_buffer(evbuf:Pevbuffer; tag:Tev_uint32_t; data:Pevbuffer);cdecl;external;
{*
  Encode an integer and store it in an evbuffer.

  We encode integers by nybbles; the first nibble contains the number
  of significant nibbles - 1;  this allows us to encode up to 64-bit
  integers.  This function is byte-order independent.

  @param evbuf evbuffer to store the encoded number
  @param number a 32-bit integer
  }
procedure evtag_encode_int(evbuf:Pevbuffer; number:Tev_uint32_t);cdecl;external;
procedure evtag_encode_int64(evbuf:Pevbuffer; number:Tev_uint64_t);cdecl;external;
procedure evtag_marshal_int(evbuf:Pevbuffer; tag:Tev_uint32_t; integer:Tev_uint32_t);cdecl;external;
procedure evtag_marshal_int64(evbuf:Pevbuffer; tag:Tev_uint32_t; integer:Tev_uint64_t);cdecl;external;
(* Const before type ignored *)
procedure evtag_marshal_string(buf:Pevbuffer; tag:Tev_uint32_t; _string:Pchar);cdecl;external;
procedure evtag_marshal_timeval(evbuf:Pevbuffer; tag:Tev_uint32_t; tv:Ptimeval);cdecl;external;
function evtag_unmarshal(src:Pevbuffer; ptag:Pev_uint32_t; dst:Pevbuffer):longint;cdecl;external;
function evtag_peek(evbuf:Pevbuffer; ptag:Pev_uint32_t):longint;cdecl;external;
function evtag_peek_length(evbuf:Pevbuffer; plength:Pev_uint32_t):longint;cdecl;external;
function evtag_payload_length(evbuf:Pevbuffer; plength:Pev_uint32_t):longint;cdecl;external;
function evtag_consume(evbuf:Pevbuffer):longint;cdecl;external;
function evtag_unmarshal_int(evbuf:Pevbuffer; need_tag:Tev_uint32_t; pinteger:Pev_uint32_t):longint;cdecl;external;
function evtag_unmarshal_int64(evbuf:Pevbuffer; need_tag:Tev_uint32_t; pinteger:Pev_uint64_t):longint;cdecl;external;
function evtag_unmarshal_fixed(src:Pevbuffer; need_tag:Tev_uint32_t; data:pointer; len:Tsize_t):longint;cdecl;external;
function evtag_unmarshal_string(evbuf:Pevbuffer; need_tag:Tev_uint32_t; pstring:PPchar):longint;cdecl;external;
function evtag_unmarshal_timeval(evbuf:Pevbuffer; need_tag:Tev_uint32_t; ptv:Ptimeval):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ EVENT2_TAG_H_INCLUDED_  }

implementation


end.
