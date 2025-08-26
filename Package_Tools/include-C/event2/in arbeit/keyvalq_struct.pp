
unit keyvalq_struct;
interface

{
  Automatically converted by H2Pas 1.0.0 from keyvalq_struct.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    keyvalq_struct.h
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
{$ifndef EVENT2_KEYVALQ_STRUCT_H_INCLUDED_}
{$define EVENT2_KEYVALQ_STRUCT_H_INCLUDED_}
{ C++ extern C conditionnal removed }
{ xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx }
{ Fix so that people don't have to run with <sys/queue.h>  }
{ XXXX This code is duplicated with event_struct.h  }
{$ifndef TAILQ_ENTRY}
{$define EVENT_DEFINED_TQENTRY_}
(* error 
struct {								\
in declaration at line 42 *)
    { next element  }(* error 
	struct type *tqe_next;	/* next element */			\
(* error 
	struct type **tqe_prev;	/* address of previous next element */	\
in declaration at line 43 *)
    { address of previous next element  }(* error 
	struct type **tqe_prev;	/* address of previous next element */	\
(* error 
}
{$endif}
    { !TAILQ_ENTRY  }
{$ifndef TAILQ_HEAD}
in define line 48 *)
(* error 
struct name {					\
in declaration at line 51 *)
(* error 
	struct type *tqh_first;			\
(* error 
	struct type **tqh_last;			\
in declaration at line 52 *)
(* error 
	struct type **tqh_last;			\
(* error 
}
{$endif}
    {
     * Key-Value pairs.  Can be used for HTTP headers but also for
     * query argument parsing.
      }
in declaration at line 61 *)
      var
        key : Pchar;cvar;public;
        value : Pchar;cvar;public;
(* error 
};
in declaration at line 65 *)
(* error 
TAILQ_HEAD (evkeyvalq, evkeyval);
(* error 
TAILQ_HEAD (evkeyvalq, evkeyval);
 in declarator_list *)
 in declarator_list *)
    { XXXX This code is duplicated with event_struct.h  }
{$ifdef EVENT_DEFINED_TQENTRY_}
{$undef TAILQ_ENTRY}
{$endif}
{$ifdef EVENT_DEFINED_TQHEAD_}
{$undef TAILQ_HEAD}
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
