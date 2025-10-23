
unit sysdeps;
interface

{
  Automatically converted by H2Pas 1.0.0 from sysdeps.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sysdeps.h
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
Pglibtop_sysdeps  = ^glibtop_sysdeps;
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
{$ifndef __GLIBTOP_SYSDEPS_H__}
{$define __GLIBTOP_SYSDEPS_H__}
{$include <glibtop.h>}

const
  GLIBTOP_SYSDEPS_FEATURES = 0;  
  GLIBTOP_SYSDEPS_CPU = 1;  
  GLIBTOP_SYSDEPS_MEM = 2;  
  GLIBTOP_SYSDEPS_SWAP = 3;  
  GLIBTOP_SYSDEPS_UPTIME = 4;  
  GLIBTOP_SYSDEPS_LOADAVG = 5;  
  GLIBTOP_SYSDEPS_SHM_LIMITS = 6;  
  GLIBTOP_SYSDEPS_MSG_LIMITS = 7;  
  GLIBTOP_SYSDEPS_SEM_LIMITS = 8;  
  GLIBTOP_SYSDEPS_PROCLIST = 9;  
  GLIBTOP_SYSDEPS_PROC_STATE = 10;  
  GLIBTOP_SYSDEPS_PROC_UID = 11;  
  GLIBTOP_SYSDEPS_PROC_MEM = 12;  
  GLIBTOP_SYSDEPS_PROC_TIME = 13;  
  GLIBTOP_SYSDEPS_PROC_SIGNAL = 14;  
  GLIBTOP_SYSDEPS_PROC_KERNEL = 15;  
  GLIBTOP_SYSDEPS_PROC_SEGMENT = 16;  
  GLIBTOP_SYSDEPS_PROC_ARGS = 17;  
  GLIBTOP_SYSDEPS_PROC_MAP = 18;  
  GLIBTOP_SYSDEPS_MOUNTLIST = 19;  
  GLIBTOP_SYSDEPS_FSUSAGE = 20;  
  GLIBTOP_SYSDEPS_NETLOAD = 21;  
  GLIBTOP_SYSDEPS_PPP = 22;  
  GLIBTOP_SYSDEPS_NETLIST = 23;  
  GLIBTOP_SYSDEPS_PROC_OPEN_FILES = 24;  
  GLIBTOP_SYSDEPS_PROC_WD = 25;  
  GLIBTOP_SYSDEPS_PROC_AFFINITY = 26;  
  GLIBTOP_SYSDEPS_PROC_IO = 27;  
  GLIBTOP_SYSDEPS_DISK = 28;  
  GLIBTOP_MAX_SYSDEPS = 29;  
{ The 'features' args to glibtop_init_* is an unsigned long  }
{G_STATIC_ASSERT((1UL << (GLIBTOP_MAX_SYSDEPS - 1)) <= ULONG_MAX); }
  GLIBTOP_SYSDEPS_ALL = (1 shl GLIBTOP_MAX_SYSDEPS)-1;  
type
{ server features	 }
{ glibtop_cpu		 }
{ glibtop_mem		 }
{ glibtop_swap		 }
{ glibtop_uptime	 }
{ glibtop_loadavg	 }
{ glibtop_shm_limits	 }
{ glibtop_msg_limits	 }
{ glibtop_sem_limits	 }
{ glibtop_proclist	 }
{ glibtop_proc_state	 }
{ glibtop_proc_uid	 }
{ glibtop_proc_mem	 }
{ glibtop_proc_time	 }
{ glibtop_proc_signal	 }
{ glibtop_proc_kernel	 }
{ glibtop_proc_segment	 }
{ glibtop_proc_args	 }
{ glibtop_proc_map	 }
{ glibtop_proc_open_files  }
{ glibtop_mountlist	 }
{ glibtop_fsusage	 }
{ glibtop_netlist	 }
{ glibtop_netload	 }
{ glibtop_ppp		 }
{ glibtop_proc_wd	 }
{ glibtop_proc_affinity  }
{ glibtop_proc_io  }
{ glibtop_disk		 }
  Pglibtop_sysdeps = ^Tglibtop_sysdeps;
  Tglibtop_sysdeps = record
      flags : Tguint64;
      features : Tguint64;
      cpu : Tguint64;
      mem : Tguint64;
      swap : Tguint64;
      uptime : Tguint64;
      loadavg : Tguint64;
      shm_limits : Tguint64;
      msg_limits : Tguint64;
      sem_limits : Tguint64;
      proclist : Tguint64;
      proc_state : Tguint64;
      proc_uid : Tguint64;
      proc_mem : Tguint64;
      proc_time : Tguint64;
      proc_signal : Tguint64;
      proc_kernel : Tguint64;
      proc_segment : Tguint64;
      proc_args : Tguint64;
      proc_map : Tguint64;
      proc_open_files : Tguint64;
      mountlist : Tguint64;
      fsusage : Tguint64;
      netlist : Tguint64;
      netload : Tguint64;
      ppp : Tguint64;
      proc_wd : Tguint64;
      proc_affinity : Tguint64;
      proc_io : Tguint64;
      disk : Tguint64;
      reserved1 : Tguint64;
      reserved2 : Tguint64;
      reserved3 : Tguint64;
      reserved4 : Tguint64;
      reserved5 : Tguint64;
      reserved6 : Tguint64;
      reserved7 : Tguint64;
    end;


procedure glibtop_get_sysdeps(buf:Pglibtop_sysdeps);cdecl;external;
procedure glibtop_get_sysdeps_r(server:Pglibtop; buf:Pglibtop_sysdeps);cdecl;external;
{$endif}

implementation


end.
