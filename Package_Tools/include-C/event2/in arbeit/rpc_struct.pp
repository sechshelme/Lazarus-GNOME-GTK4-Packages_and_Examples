
unit rpc_struct;
interface

{
  Automatically converted by H2Pas 1.0.0 from rpc_struct.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rpc_struct.h
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
    Pevrpc  = ^evrpc;
    Pevrpc_base  = ^evrpc_base;
    Pevrpc_req_generic  = ^evrpc_req_generic;
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
{$ifndef EVENT2_RPC_STRUCT_H_INCLUDED_}
{$define EVENT2_RPC_STRUCT_H_INCLUDED_}
{ C++ extern C conditionnal removed }
{* @file event2/rpc_struct.h

  Structures used by rpc.h.  Using these structures directly may harm
  forward compatibility: be careful!

  }
{ Fix so that people don't have to run with <sys/queue.h>  }
{ xxxxxxxxxxxxxxxxxxxxxxxx }
{$ifndef TAILQ_ENTRY}
{$define EVENT_DEFINED_TQENTRY_}
(* error 
struct {								\
in declaration at line 47 *)
    { next element  }(* error 
	struct type *tqe_next;	/* next element */			\
(* error 
	struct type **tqe_prev;	/* address of previous next element */	\
in declaration at line 48 *)
    { address of previous next element  }(* error 
	struct type **tqe_prev;	/* address of previous next element */	\
(* error 
}
{$endif}
    { !TAILQ_ENTRY  }
    {*
     * provides information about the completed RPC request.
      }
in define line 56 *)

    const
      EVRPC_STATUS_ERR_TIMEOUT = 1;      
      EVRPC_STATUS_ERR_BADPAYLOAD = 2;      
      EVRPC_STATUS_ERR_UNSTARTED = 3;      
      EVRPC_STATUS_ERR_HOOKABORTED = 4;      
      var
        error : longint;cvar;public;
    { for looking at headers or other information  }
(* error 
	struct evhttp_request *http_req;
in declaration at line 64 *)
(* error 
};
in declaration at line 65 *)
    { the structure below needs to be synchronized with evrpc_req_generic  }
    { Encapsulates a request  }
(* error 
	TAILQ_ENTRY(evrpc) next;
 in declarator_list *)
    { the URI at which the request handler lives  }
(* Const before type ignored *)
    { creates a new request structure  }
    { frees the request structure  }
    { unmarshals the buffer into the proper request structure  }
    { creates a new reply structure  }
    { frees the reply structure  }
    { verifies that the reply is valid  }
    { marshals the reply into a buffer  }
    { the callback invoked for each received rpc  }
    { reference for further configuration  }
    type
      Pevrpc = ^Tevrpc;
      Tevrpc = record
;
          uri : Pchar;
          request_new : function (para1:pointer):pointer;cdecl;
          request_new_arg : pointer;
          request_free : procedure (para1:pointer);cdecl;
          request_unmarshal : function (para1:pointer; para2:Pevbuffer):longint;cdecl;
          reply_new : function (para1:pointer):pointer;cdecl;
          reply_new_arg : pointer;
          reply_free : procedure (para1:pointer);cdecl;
          reply_complete : function (para1:pointer):longint;cdecl;
          reply_marshal : procedure (para1:Pevbuffer; para2:pointer);cdecl;
          cb : procedure (para1:Pevrpc_req_generic; para2:pointer);cdecl;
          cb_arg : pointer;
          base : Pevrpc_base;
        end;

{$ifdef EVENT_DEFINED_TQENTRY_}
{$undef TAILQ_ENTRY}
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}
    { EVENT2_RPC_STRUCT_H_INCLUDED_  }

implementation


end.
