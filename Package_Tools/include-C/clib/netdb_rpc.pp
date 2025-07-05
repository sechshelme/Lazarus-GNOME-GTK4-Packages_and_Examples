
unit netdb_rpc;
interface

{
  Automatically converted by H2Pas 1.0.0 from netdb_rpc.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    netdb_rpc.h
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
Prpcent  = ^rpcent;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ @(#)netdb.h	2.1 88/07/29 3.9 RPCSRC  }
{
 * Copyright (c) 2010, Oracle America, Inc.
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above
 *       copyright notice, this list of conditions and the following
 *       disclaimer in the documentation and/or other materials
 *       provided with the distribution.
 *     * Neither the name of the "Oracle America, Inc." nor the names of its
 *       contributors may be used to endorse or promote products derived
 *       from this software without specific prior written permission.
 *
 *   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 *   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 *   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 *   FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 *   COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 *   INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 *   DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 *   GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 *   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 *   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 *   NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 *   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  }
{ Cleaned up for GNU C library roland@gnu.ai.mit.edu:
   added multiple inclusion protection and use of <sys/cdefs.h>.
   In GNU this file is #include'd by <netdb.h>.   }
{$ifndef _RPC_NETDB_H}

const
  _RPC_NETDB_H = 1;  
{$include <features.h>}
{$define __need_size_t}
{$include <stddef.h>}
{ Name of server for this rpc program.   }
{ Alias list.   }
{ RPC program number.   }
type
  Prpcent = ^Trpcent;
  Trpcent = record
      r_name : Pchar;
      r_aliases : ^Pchar;
      r_number : longint;
    end;


procedure setrpcent(__stayopen:longint);cdecl;external;
procedure endrpcent;cdecl;external;
(* Const before type ignored *)
function getrpcbyname(__name:Pchar):Prpcent;cdecl;external;
function getrpcbynumber(__number:longint):Prpcent;cdecl;external;
function getrpcent:Prpcent;cdecl;external;
{$ifdef __USE_MISC}
(* Const before type ignored *)
function getrpcbyname_r(__name:Pchar; __result_buf:Prpcent; __buffer:Pchar; __buflen:Tsize_t; __result:PPrpcent):longint;cdecl;external;
function getrpcbynumber_r(__number:longint; __result_buf:Prpcent; __buffer:Pchar; __buflen:Tsize_t; __result:PPrpcent):longint;cdecl;external;
function getrpcent_r(__result_buf:Prpcent; __buffer:Pchar; __buflen:Tsize_t; __result:PPrpcent):longint;cdecl;external;
{$endif}

implementation


end.
