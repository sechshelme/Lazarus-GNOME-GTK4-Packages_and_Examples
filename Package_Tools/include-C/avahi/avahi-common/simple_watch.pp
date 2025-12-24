
unit simple_watch;
interface

{
  Automatically converted by H2Pas 1.0.0 from simple_watch.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    simple_watch.h
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
PAvahiPoll  = ^AvahiPoll;
PAvahiSimplePoll  = ^AvahiSimplePoll;
Ppollfd  = ^pollfd;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef foosimplewatchhfoo}
{$define foosimplewatchhfoo}
{**
  This file is part of avahi.

  avahi is free software; you can redistribute it and/or modify it
  under the terms of the GNU Lesser General Public License as
  published by the Free Software Foundation; either version 2.1 of the
  License, or (at your option) any later version.

  avahi is distributed in the hope that it will be useful, but WITHOUT
  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
  or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General
  Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with avahi; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
  USA.
** }
{* \file simple-watch.h Simple poll() based main loop implementation  }
{$include <poll.h>}
{$include <avahi-common/cdecl.h>}
{$include <avahi-common/watch.h>}
{* A main loop object. Main loops of this type aren't very flexible
 * since they only support a single wakeup type. Nevertheless it
 * should suffice for small test and example applications.   }
type
{* Create a new main loop object  }

function avahi_simple_poll_new:PAvahiSimplePoll;cdecl;external;
{* Free a main loop object  }
procedure avahi_simple_poll_free(s:PAvahiSimplePoll);cdecl;external;
{* Return the abstracted poll API object for this main loop
 * object. The is will return the same pointer each time it is
 * called.  }
(* Const before type ignored *)
function avahi_simple_poll_get(s:PAvahiSimplePoll):PAvahiPoll;cdecl;external;
{* Run a single main loop iteration of this main loop. If sleep_time
is < 0 this will block until any of the registered events happens,
then it will execute the attached callback function. If sleep_time is
0 the routine just checks if any event is pending. If yes the attached
callback function is called, otherwise the function returns
immediately. If sleep_time > 0 the function will block for at most the
specified time in msecs. Returns -1 on error, 0 on success and 1 if a
quit request has been scheduled. Usually this function should be called
in a loop until it returns a non-zero value }
function avahi_simple_poll_iterate(s:PAvahiSimplePoll; sleep_time:longint):longint;cdecl;external;
{* Request that the main loop quits. If this is called the next
 call to avahi_simple_poll_iterate() will return 1  }
procedure avahi_simple_poll_quit(s:PAvahiSimplePoll);cdecl;external;
{* Prototype for a poll() type function  }
type

  TAvahiPollFunc = function (ufds:Ppollfd; nfds:dword; timeout:longint; userdata:pointer):longint;cdecl;
{* Replace the internally used poll() function. By default the system's poll() will be used  }

procedure avahi_simple_poll_set_func(s:PAvahiSimplePoll; func:TAvahiPollFunc; userdata:pointer);cdecl;external;
{* The first stage of avahi_simple_poll_iterate(), use this function only if you know what you do  }
function avahi_simple_poll_prepare(s:PAvahiSimplePoll; timeout:longint):longint;cdecl;external;
{* The second stage of avahi_simple_poll_iterate(), use this function only if you know what you do  }
function avahi_simple_poll_run(s:PAvahiSimplePoll):longint;cdecl;external;
{* The third and final stage of avahi_simple_poll_iterate(), use this function only if you know what you do  }
function avahi_simple_poll_dispatch(s:PAvahiSimplePoll):longint;cdecl;external;
{* Call avahi_simple_poll_iterate() in a loop and return if it returns non-zero  }
function avahi_simple_poll_loop(s:PAvahiSimplePoll):longint;cdecl;external;
{* Wakeup the main loop. (for threaded environments)  }
procedure avahi_simple_poll_wakeup(s:PAvahiSimplePoll);cdecl;external;
{$endif}

implementation


end.
