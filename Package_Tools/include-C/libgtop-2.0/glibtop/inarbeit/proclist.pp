
unit proclist;
interface

{
  Automatically converted by H2Pas 1.0.0 from proclist.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    proclist.h
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
Pglibtop  = ^glibtop;
Pglibtop_proclist  = ^glibtop_proclist;
Ppid_t  = ^pid_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 1998-99 Martin Baulig
   This file is part of LibGTop 1.0.

   Contributed by Martin Baulig <martin@home-of-linux.org>, April 1998.

   LibGTop is free software; you can redistribute it and/or modify it
   under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License,
   or (at your option) any later version.

   LibGTop is distributed in the hope that it will be useful, but WITHOUT
   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
   FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
   for more details.

   You should have received a copy of the GNU General Public License
   along with LibGTop; see the file COPYING. If not, write to the
   Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.
 }
{$ifndef __GLIBTOP_PROCLIST_H__}
{$define __GLIBTOP_PROCLIST_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_PROCLIST_NUMBER = 0;  
  GLIBTOP_PROCLIST_TOTAL = 1;  
  GLIBTOP_PROCLIST_SIZE = 2;  
  GLIBTOP_MAX_PROCLIST = 3;  
{ You can use the folowing constants as the `which' member of
 * glibtop_get_proclist () to specify which processes to fetch.  }
{*
 * GLIBTOP_KERN_PROC_ALL:
 *
 * Return information about all processes
 * }
  GLIBTOP_KERN_PROC_ALL = 0;  
{*
 * GLIBTOP_KERN_PROC_PID:
 *
 * Return all processes with the pid which is passed in @arg. You can use this to find out whether some process still exists.
 * }
  GLIBTOP_KERN_PROC_PID = 1;  
{*
 * GLIBTOP_KERN_PROC_PGRP:
 *
 * Return all processes in the process group passed in @arg. 
 * }
  GLIBTOP_KERN_PROC_PGRP = 2;  
{*
 * GLIBTOP_KERN_PROC_SESSION:
 *
 * Return all processes in the session passed in @arg. 
 * }
  GLIBTOP_KERN_PROC_SESSION = 3;  
{*
 * GLIBTOP_KERN_PROC_TTY:
 *
 * Return all processes which have the controlling tty passed in @arg
 * (which is interpreted as the device number). 
 * }
  GLIBTOP_KERN_PROC_TTY = 4;  
{*
 * GLIBTOP_KERN_PROC_UID:
 *
 * Return all processes with the effective uid passed in @arg. 
 * }
  GLIBTOP_KERN_PROC_UID = 5;  
{*
 * GLIBTOP_KERN_PROC_RUID:
 *
 * Return all processes with the real uid passed in @arg. 
 * }
  GLIBTOP_KERN_PROC_RUID = 6;  
  GLIBTOP_KERN_PROC_MASK = 15;  
{*
 * GLIBTOP_EXCLUDE_IDLE:
 *
 * Exclude idle processes. 
 * }
  GLIBTOP_EXCLUDE_IDLE = $1000;  
{*
 * GLIBTOP_EXCLUDE_SYSTEM:
 *
 * Exclude system (on most UNIXes root's) processes.
 * }
  GLIBTOP_EXCLUDE_SYSTEM = $2000;  
{*
 * GLIBTOP_EXCLUDE_NOTTY:
 *
 * Exclude processes without a controlling terminal.
 * }
  GLIBTOP_EXCLUDE_NOTTY = $4000;  
type
{*
 * glibtop_proclist:
 * @number: Number of entries in the returned list.
 * @total: Total size of the returned list (this equals @number * @size).
 * @size: Size of a single entry in the returned list 
 * (this equals <type>sizeof(unsigned)</type>).
  }
{ GLIBTOP_PROCLIST_NUMBER	 }
{ GLIBTOP_PROCLIST_TOTAL	 }
{ GLIBTOP_PROCLIST_SIZE	 }
  Pglibtop_proclist = ^Tglibtop_proclist;
  Tglibtop_proclist = record
      flags : Tguint64;
      number : Tguint64;
      total : Tguint64;
      size : Tguint64;
    end;

{*
 * glibtop_get_proclist:
 * @buf: a #glibtop_proclist
 * @which: a #GLIBTOP_* constant specifying process type
 * @arg: an argument specific for the process type
 *
 * Returns: (array zero-terminated=1) (transfer full): an array of process
 *     ids
  }

function glibtop_get_proclist(buf:Pglibtop_proclist; which:Tgint64; arg:Tgint64):Ppid_t;cdecl;external;
{$if GLIBTOP_SUID_PROCLIST}

const
  glibtop_get_proclist_r = glibtop_get_proclist_p;  
{$else}

const
  glibtop_get_proclist_r = glibtop_get_proclist_s;  
{$endif}
{*
 * glibtop_get_proclist_l:
 * @server: a #glibtop server
 * @buf: a #glibtop_proclist
 * @which: a #GLIBTOP_* constant specifying process type
 * @arg: an argument specific for the process type
 *
 * Returns: (array zero-terminated=1) (transfer full): an array of process
 *     ids
  }

function glibtop_get_proclist_l(server:Pglibtop; buf:Pglibtop_proclist; which:Tgint64; arg:Tgint64):Ppid_t;cdecl;external;
{$if GLIBTOP_SUID_PROCLIST}

procedure _glibtop_init_proclist_p(server:Pglibtop);cdecl;external;
{*
 * glibtop_get_proclist_p:
 * @server: a #glibtop server
 * @buf: a #glibtop_proclist
 * @which: a #GLIBTOP_* constant specifying process type
 * @arg: an argument specific for the process type
 *
 * Returns: (array zero-terminated=1) (transfer full): an array of process
 *     ids
  }
function glibtop_get_proclist_p(server:Pglibtop; buf:Pglibtop_proclist; which:Tgint64; arg:Tgint64):Ppid_t;cdecl;external;
{$else}

procedure _glibtop_init_proclist_s(server:Pglibtop);cdecl;external;
{*
 * glibtop_get_proclist_s:
 * @server: a #glibtop server
 * @buf: a #glibtop_proclist
 * @which: a #GLIBTOP_* constant specifying process type
 * @arg: an argument specific for the process type
 *
 * Returns: (array zero-terminated=1) (transfer full): an array of process
 *     ids
  }
function glibtop_get_proclist_s(server:Pglibtop; buf:Pglibtop_proclist; which:Tgint64; arg:Tgint64):Ppid_t;cdecl;external;
{$endif}
{$endif}

implementation


end.
