
unit procstate;
interface

{
  Automatically converted by H2Pas 1.0.0 from procstate.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    procstate.h
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
Pglibtop_proc_state  = ^glibtop_proc_state;
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
{$ifndef __GLIBTOP_PROCSTATE_H__}
{$define __GLIBTOP_PROCSTATE_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_PROC_STATE_CMD = 0;  
  GLIBTOP_PROC_STATE_STATE = 1;  
  GLIBTOP_PROC_STATE_UID = 2;  
  GLIBTOP_PROC_STATE_GID = 3;  
  GLIBTOP_PROC_STATE_RUID = 4;  
  GLIBTOP_PROC_STATE_RGID = 5;  
  GLIBTOP_PROC_STATE_HAS_CPU = 6;  
  GLIBTOP_PROC_STATE_PROCESSOR = 7;  
  GLIBTOP_PROC_STATE_LAST_PROCESSOR = 8;  
  GLIBTOP_MAX_PROC_STATE = 9;  
  GLIBTOP_PROCESS_RUNNING = 1;  
  GLIBTOP_PROCESS_INTERRUPTIBLE = 2;  
  GLIBTOP_PROCESS_UNINTERRUPTIBLE = 4;  
  GLIBTOP_PROCESS_ZOMBIE = 8;  
  GLIBTOP_PROCESS_STOPPED = 16;  
  GLIBTOP_PROCESS_SWAPPING = 32;  
  GLIBTOP_PROCESS_DEAD = 64;  
type
{ Name and status  }
{ basename of executable file in
				 * call to exec(2)  }
{ NOTE: when porting the library, TRY HARD to implement the
	 *       following two fields.  }
{ IMPORTANT NOTICE: For security reasons, it is extremely important
	 *                   only to set the flags value for those two
	 *                   fields if their values are corrent !  }
{ UID of process  }
{ GID of process  }
  Pglibtop_proc_state = ^Tglibtop_proc_state;
  Tglibtop_proc_state = record
      flags : Tguint64;
      cmd : array[0..39] of char;
      state : dword;
      uid : longint;
      gid : longint;
      ruid : longint;
      rgid : longint;
      has_cpu : longint;
      processor : longint;
      last_processor : longint;
    end;


procedure glibtop_get_proc_state(buf:Pglibtop_proc_state; pid:Tpid_t);cdecl;external;
{$if GLIBTOP_SUID_PROC_STATE}

const
  glibtop_get_proc_state_r = glibtop_get_proc_state_p;  
{$else}

const
  glibtop_get_proc_state_r = glibtop_get_proc_state_s;  
{$endif}

procedure glibtop_get_proc_state_l(server:Pglibtop; buf:Pglibtop_proc_state; pid:Tpid_t);cdecl;external;
{$if GLIBTOP_SUID_PROC_STATE}

procedure _glibtop_init_proc_state_p(server:Pglibtop);cdecl;external;
procedure glibtop_get_proc_state_p(server:Pglibtop; buf:Pglibtop_proc_state; pid:Tpid_t);cdecl;external;
{$else}

procedure _glibtop_init_proc_state_s(server:Pglibtop);cdecl;external;
procedure glibtop_get_proc_state_s(server:Pglibtop; buf:Pglibtop_proc_state; pid:Tpid_t);cdecl;external;
{$endif}
{$endif}

implementation


end.
