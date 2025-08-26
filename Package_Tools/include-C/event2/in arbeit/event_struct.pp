
unit event_struct;
interface

{
  Automatically converted by H2Pas 1.0.0 from event_struct.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    event_struct.h
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
Pevent  = ^event;
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
{$ifndef EVENT2_EVENT_STRUCT_H_INCLUDED_}
{$define EVENT2_EVENT_STRUCT_H_INCLUDED_}
{* @file event2/event_struct.h

  Structures used by event.h.  Using these structures directly WILL harm
  forward compatibility: be careful.

  No field declared in this file should be used directly in user code.  Except
  for historical reasons, these fields would not be exposed at all.
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
{ For evkeyvalq  }
{$include <event2/keyvalq_struct.h>}

const
  EVLIST_TIMEOUT = $01;  
  EVLIST_INSERTED = $02;  
  EVLIST_SIGNAL = $04;  
  EVLIST_ACTIVE = $08;  
  EVLIST_INTERNAL = $10;  
  EVLIST_ACTIVE_LATER = $20;  
  EVLIST_FINALIZING = $40;  
  EVLIST_INIT = $80;  
  EVLIST_ALL = $ff;  
{ xxxxxxxxxxxxxxxxxxxxxxxx }
type
  Pevent = ^Tevent;
  Tevent = record
      {undefined structure}
    end;

{$ifdef EVENT_DEFINED_TQENTRY_}
{$undef TAILQ_ENTRY}
{$endif}
{$ifdef EVENT_DEFINED_TQHEAD_}
{$undef TAILQ_HEAD}
{$endif}
(* error 
LIST_HEAD (event_dlist, event); 
(* error 
LIST_HEAD (event_dlist, event); 
 in declarator_list *)
 in declarator_list *)
{$ifdef EVENT_DEFINED_LISTENTRY_}
{$undef LIST_ENTRY}
{$endif}
{$ifdef EVENT_DEFINED_LISTHEAD_}
{$undef LIST_HEAD}
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}
{ EVENT2_EVENT_STRUCT_H_INCLUDED_  }

implementation


end.
