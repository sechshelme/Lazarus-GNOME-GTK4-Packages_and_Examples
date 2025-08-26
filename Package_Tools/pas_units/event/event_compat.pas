unit event_compat;

interface

uses
  fp_event;

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
{$ifndef EVENT2_EVENT_COMPAT_H_INCLUDED_}
{$define EVENT2_EVENT_COMPAT_H_INCLUDED_}
{* @file event2/event_compat.h

  Potentially non-threadsafe versions of the functions in event.h: provided
  only for backwards compatibility.

  In the oldest versions of Libevent, event_base was not a first-class
  structure.  Instead, there was a single event base that every function
  manipulated.  Later, when separate event bases were added, the old functions
  that didn't take an event_base argument needed to work by manipulating the
  "current" event base.  This could lead to thread-safety issues, and obscure,
  hard-to-diagnose bugs.

  @deprecated All functions in this file are by definition deprecated.
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
{*
  Initialize the event API.

  The event API needs to be initialized with event_init() before it can be
  used.  Sets the global current base that gets used for events that have no
  base associated with them.

  @deprecated This function is deprecated because it replaces the "current"
    event_base, and is totally unsafe for multithreaded use.  The replacement
    is event_base_new().

  @see event_base_set(), event_base_new()
  }

function event_init:Pevent_base;cdecl;external libevent;
{*
  Loop to process events.

  Like event_base_dispatch(), but uses the "current" base.

  @deprecated This function is deprecated because it is easily confused by
    multiple calls to event_init(), and because it is not safe for
    multithreaded use.  The replacement is event_base_dispatch().

  @see event_base_dispatch(), event_init()
  }
function event_dispatch:longint;cdecl;external libevent;
{*
  Handle events.

  This function behaves like event_base_loop(), but uses the "current" base

  @deprecated This function is deprecated because it uses the event base from
    the last call to event_init, and is therefore not safe for multithreaded
    use.  The replacement is event_base_loop().

  @see event_base_loop(), event_init()
 }
function event_loop(para1:longint):longint;cdecl;external libevent;
{*
  Exit the event loop after the specified time.

  This function behaves like event_base_loopexit(), except that it uses the
  "current" base.

  @deprecated This function is deprecated because it uses the event base from
    the last call to event_init, and is therefore not safe for multithreaded
    use.  The replacement is event_base_loopexit().

  @see event_init, event_base_loopexit()
   }
function event_loopexit(para1:Ptimeval):longint;cdecl;external libevent;
{*
  Abort the active event_loop() immediately.

  This function behaves like event_base_loopbreakt(), except that it uses the
  "current" base.

  @deprecated This function is deprecated because it uses the event base from
    the last call to event_init, and is therefore not safe for multithreaded
    use.  The replacement is event_base_loopbreak().

  @see event_base_loopbreak(), event_init()
  }
function event_loopbreak:longint;cdecl;external libevent;
{*
  Schedule a one-time event to occur.

  @deprecated This function is obsolete, and has been replaced by
    event_base_once(). Its use is deprecated because it relies on the
    "current" base configured by event_init().

  @see event_base_once()
  }
function event_once(para1:Tevutil_socket_t; para2:smallint; para3:procedure (para1:Tevutil_socket_t; para2:smallint; para3:pointer); para4:pointer; para5:Ptimeval):longint;cdecl;external libevent;
{*
  Get the kernel event notification mechanism used by Libevent.

  @deprecated This function is obsolete, and has been replaced by
    event_base_get_method(). Its use is deprecated because it relies on the
    "current" base configured by event_init().

  @see event_base_get_method()
  }
function event_get_method:Pchar;cdecl;external libevent;
{*
  Set the number of different event priorities.

  @deprecated This function is deprecated because it is easily confused by
    multiple calls to event_init(), and because it is not safe for
    multithreaded use.  The replacement is event_base_priority_init().

  @see event_base_priority_init()
  }
function event_priority_init(para1:longint):longint;cdecl;external libevent;
{*
  Prepare an event structure to be added.

  @deprecated event_set() is not recommended for new code, because it requires
     a subsequent call to event_base_set() to be safe under most circumstances.
     Use event_assign() or event_new() instead.
  }
procedure event_set(para1:Pevent; para2:Tevutil_socket_t; para3:smallint; para4:procedure (para1:Tevutil_socket_t; para2:smallint; para3:pointer); para5:pointer);cdecl;external libevent;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function evtimer_set(ev,cb,arg : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function evsignal_set(ev,x,cb,arg : longint) : longint;

{*
   @name timeout_* macros

   @deprecated These macros are deprecated because their naming is inconsistent
     with the rest of Libevent.  Use the evtimer_* macros instead.
   @
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function timeout_add(ev,tv : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function timeout_set(ev,cb,arg : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function timeout_del(ev : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function timeout_pending(ev,tv : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function timeout_initialized(ev : longint) : longint;

{*@ }
{*
   @name signal_* macros

   @deprecated These macros are deprecated because their naming is inconsistent
     with the rest of Libevent.  Use the evsignal_* macros instead.
   @
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function signal_add(ev,tv : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function signal_set(ev,x,cb,arg : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function signal_del(ev : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function signal_pending(ev,tv : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function signal_initialized(ev : longint) : longint;

{*@ }
{$ifndef EVENT_FD}
{ These macros are obsolete; use event_get_fd and event_get_signal instead.  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function EVENT_FD(ev : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EVENT_SIGNAL(ev : longint) : longint;

{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}
{ EVENT2_EVENT_COMPAT_H_INCLUDED_  }

// === Konventiert am: 26-8-25 19:37:42 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function evtimer_set(ev,cb,arg : longint) : longint;
begin
  evtimer_set:=event_set(ev,-(1),0,cb,arg);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function evsignal_set(ev,x,cb,arg : longint) : longint;
begin
  evsignal_set:=event_set(ev,x,EV_SIGNAL or EV_PERSIST,cb,arg);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function timeout_add(ev,tv : longint) : longint;
begin
  timeout_add:=event_add(ev,tv);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function timeout_set(ev,cb,arg : longint) : longint;
begin
  timeout_set:=event_set(ev,-(1),0,cb,arg);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function timeout_del(ev : longint) : longint;
begin
  timeout_del:=event_del(ev);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function timeout_pending(ev,tv : longint) : longint;
begin
  timeout_pending:=event_pending(ev,EV_TIMEOUT,tv);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function timeout_initialized(ev : longint) : longint;
begin
  timeout_initialized:=event_initialized(ev);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function signal_add(ev,tv : longint) : longint;
begin
  signal_add:=event_add(ev,tv);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function signal_set(ev,x,cb,arg : longint) : longint;
begin
  signal_set:=event_set(ev,x,EV_SIGNAL or EV_PERSIST,cb,arg);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function signal_del(ev : longint) : longint;
begin
  signal_del:=event_del(ev);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function signal_pending(ev,tv : longint) : longint;
begin
  signal_pending:=event_pending(ev,EV_SIGNAL,tv);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function signal_initialized(ev : longint) : longint;
begin
  signal_initialized:=event_initialized(ev);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function EVENT_FD(ev : longint) : longint;
begin
  EVENT_FD:=longint(event_get_fd(ev));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EVENT_SIGNAL(ev : longint) : longint;
begin
  EVENT_SIGNAL:=event_get_signal(ev);
end;


end.
