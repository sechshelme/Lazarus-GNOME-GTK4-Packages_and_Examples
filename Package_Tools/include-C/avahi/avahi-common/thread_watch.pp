
unit thread_watch;
interface

{
  Automatically converted by H2Pas 1.0.0 from thread_watch.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    thread_watch.h
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
PAvahiThreadedPoll  = ^AvahiThreadedPoll;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef foothreadedwatchhfoo}
{$define foothreadedwatchhfoo}
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
{* \file thread-watch.h Threaded poll() based main loop implementation  }
{$include <poll.h>}
{$include <avahi-common/cdecl.h>}
{$include <avahi-common/watch.h>}
{* A main loop object that runs an AvahiSimplePoll in its own thread. \since 0.6.4  }
type
{* Create a new event loop object. This will allocate the internal
 * AvahiSimplePoll, but will not start the helper thread. \since 0.6.4  }

function avahi_threaded_poll_new:PAvahiThreadedPoll;cdecl;external;
{* Free an event loop object. This will stop the associated event loop
 * thread (if it is running). \since 0.6.4  }
procedure avahi_threaded_poll_free(p:PAvahiThreadedPoll);cdecl;external;
{* Return the abstracted poll API object for this event loop
 * object. The will return the same pointer each time it is
 * called. \since 0.6.4  }
(* Const before type ignored *)
function avahi_threaded_poll_get(p:PAvahiThreadedPoll):PAvahiPoll;cdecl;external;
{* Start the event loop helper thread. After the thread has started
 * you must make sure to access the event loop object
 * (AvahiThreadedPoll, AvahiPoll and all its associated objects)
 * synchronized, i.e. with proper locking. You may want to use
 * avahi_threaded_poll_lock()/avahi_threaded_poll_unlock() for this,
 * which will lock the the entire event loop. Please note that event
 * loop callback functions are called from the event loop helper thread
 * with that lock held, i.e. avahi_threaded_poll_lock() calls are not
 * required from event callbacks. \since 0.6.4  }
function avahi_threaded_poll_start(p:PAvahiThreadedPoll):longint;cdecl;external;
{* Request that the event loop quits and the associated thread
 stops. Call this from outside the helper thread if you want to shut
 it down. \since 0.6.4  }
function avahi_threaded_poll_stop(p:PAvahiThreadedPoll):longint;cdecl;external;
{* Request that the event loop quits and the associated thread
 stops. Call this from inside the helper thread if you want to shut it
 down. \since 0.6.4   }
procedure avahi_threaded_poll_quit(p:PAvahiThreadedPoll);cdecl;external;
{* Lock the main loop object. Use this if you want to access the event
 * loop objects (such as creating a new event source) from anything
 * else but the event loop helper thread, i.e. from anything else but event
 * loop callbacks \since 0.6.4   }
procedure avahi_threaded_poll_lock(p:PAvahiThreadedPoll);cdecl;external;
{* Unlock the event loop object, use this as counterpart to
 * avahi_threaded_poll_lock() \since 0.6.4  }
procedure avahi_threaded_poll_unlock(p:PAvahiThreadedPoll);cdecl;external;
{$endif}

implementation


end.
