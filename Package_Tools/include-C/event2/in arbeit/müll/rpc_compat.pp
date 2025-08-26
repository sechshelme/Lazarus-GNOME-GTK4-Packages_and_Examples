
unit rpc_compat;
interface

{
  Automatically converted by H2Pas 1.0.0 from rpc_compat.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rpc_compat.h
}

    { Pointers to basic pascal types, inserted by h2pas conversion program.}
    Type
      PLongint  = ^Longint;
      PSmallInt = ^SmallInt;
      PByte     = ^Byte;
      PWord     = ^Word;
      PDWord    = ^DWord;
      PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2006-2007 Niels Provos <provos@citi.umich.edu>
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
{$ifndef EVENT2_RPC_COMPAT_H_INCLUDED_}
{$define EVENT2_RPC_COMPAT_H_INCLUDED_}
{* @file event2/rpc_compat.h

  Deprecated versions of the functions in rpc.h: provided only for
  backwards compatibility.

  }
{ C++ extern C conditionnal removed }
{* backwards compatible accessors that work only with gcc  }
{$if defined(__GNUC__) && !defined(__STRICT_ANSI__)}
{$undef EVTAG_ASSIGN}
{$undef EVTAG_GET}
{$undef EVTAG_ADD}
(* error 
#define EVTAG_ASSIGN(msg, member, args...) \
in define line 49 *)
(* error 
#define EVTAG_GET(msg, member, args...) \
in define line 51 *)
(* error 
#define EVTAG_ADD(msg, member, args...) \
in define line 53 *)
{$endif}
(* error 
#define EVTAG_LEN(msg, member) ((msg)->member##_length)
in define line 55 *)
{ C++ end of extern C conditionnal removed }
{$endif}
    { EVENT2_EVENT_COMPAT_H_INCLUDED_  }

implementation


end.
