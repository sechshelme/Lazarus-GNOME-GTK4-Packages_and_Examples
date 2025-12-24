
unit watch;
interface

{
  Automatically converted by H2Pas 1.0.0 from watch.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    watch.h
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
PAvahiTimeout  = ^AvahiTimeout;
PAvahiWatch  = ^AvahiWatch;
PAvahiWatchEvent  = ^AvahiWatchEvent;
Ptimeval  = ^timeval;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef foowatchhfoo}
{$define foowatchhfoo}
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
{* \file watch.h Simplistic main loop abstraction  }
{$include <poll.h>}
{$include <sys/time.h>}
{$include <avahi-common/cdecl.h>}
{* An I/O watch object  }
type
{* A timeout watch object  }
{* An event polling abstraction object  }
{* Type of watch events  }
{*< Input event  }
{*< Output event  }
{*< Error event  }
{*< Hangup event  }

  PAvahiWatchEvent = ^TAvahiWatchEvent;
  TAvahiWatchEvent =  Longint;
  Const
    AVAHI_WATCH_IN = POLLIN;
    AVAHI_WATCH_OUT = POLLOUT;
    AVAHI_WATCH_ERR = POLLERR;
    AVAHI_WATCH_HUP = POLLHUP;
;
{* Called whenever an I/O event happens  on an I/O watch  }
type

  TAvahiWatchCallback = procedure (w:PAvahiWatch; fd:longint; event:TAvahiWatchEvent; userdata:pointer);cdecl;
{* Called when the timeout is reached  }

  TAvahiTimeoutCallback = procedure (t:PAvahiTimeout; userdata:pointer);cdecl;
{* Defines an abstracted event polling API. This may be used to
 connect Avahi to other main loops. This is loosely based on Unix
 poll(2). A consumer will call watch_new() for all file descriptors it
 wants to listen for events on. In addition he can call timeout_new()
 to define time based events . }
{* Some abstract user data usable by the provider of the API  }
{* Create a new watch for the specified file descriptor and for
     * the specified events. The API will call the callback function
     * whenever any of the events happens.  }
(* Const before type ignored *)
{* Update the events to wait for. It is safe to call this function from an AvahiWatchCallback  }
{* Return the events that happened. It is safe to call this function from an AvahiWatchCallback   }
{* Free a watch. It is safe to call this function from an AvahiWatchCallback  }
{* Set a wakeup time for the polling loop. The API will call the
    callback function when the absolute time *tv is reached. If tv is
    NULL, the timeout is disabled. After the timeout expired the
    callback function will be called and the timeout is disabled. You
    can reenable it by calling timeout_update()   }
(* Const before type ignored *)
(* Const before type ignored *)
{* Update the absolute expiration time for a timeout, If tv is
     * NULL, the timeout is disabled. It is safe to call this function from an AvahiTimeoutCallback  }
(* Const before type ignored *)
{* Free a timeout. It is safe to call this function from an AvahiTimeoutCallback  }
  PAvahiPoll = ^TAvahiPoll;
  TAvahiPoll = record
      userdata : pointer;cdecl;
      watch_new : function (api:PAvahiPoll; fd:longint; event:TAvahiWatchEvent; callback:TAvahiWatchCallback; userdata:pointer):PAvahiWatch;cdecl;
      watch_update : procedure (w:PAvahiWatch; event:TAvahiWatchEvent);cdecl;
      watch_get_events : function (w:PAvahiWatch):TAvahiWatchEvent;cdecl;
      watch_free : procedure (w:PAvahiWatch);cdecl;
      timeout_new : function (api:PAvahiPoll; tv:Ptimeval; callback:TAvahiTimeoutCallback; userdata:pointer):PAvahiTimeout;cdecl;
      timeout_update : procedure (para1:PAvahiTimeout; tv:Ptimeval);cdecl;
      timeout_free : procedure (t:PAvahiTimeout);cdecl;
    end;

{$endif}

implementation


end.
