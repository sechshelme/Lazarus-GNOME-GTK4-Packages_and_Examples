
unit proctime;
interface

{
  Automatically converted by H2Pas 1.0.0 from proctime.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    proctime.h
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
Pglibtop_proc_time  = ^glibtop_proc_time;
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
{$ifndef __GLIBTOP_PROCTIME_H__}
{$define __GLIBTOP_PROCTIME_H__}
{$include <glibtop.h>}
{$include <glibtop/cpu.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_PROC_TIME_START_TIME = 0;  
  GLIBTOP_PROC_TIME_RTIME = 1;  
  GLIBTOP_PROC_TIME_UTIME = 2;  
  GLIBTOP_PROC_TIME_STIME = 3;  
  GLIBTOP_PROC_TIME_CUTIME = 4;  
  GLIBTOP_PROC_TIME_CSTIME = 5;  
  GLIBTOP_PROC_TIME_TIMEOUT = 6;  
  GLIBTOP_PROC_TIME_IT_REAL_VALUE = 7;  
  GLIBTOP_PROC_TIME_FREQUENCY = 8;  
  GLIBTOP_PROC_TIME_XCPU_UTIME = 9;  
  GLIBTOP_PROC_TIME_XCPU_STIME = 10;  
  GLIBTOP_MAX_PROC_TIME = 11;  
type
{ Time section  }
{*
 * glibtop_proc_time:
 * @start_time: Start time of process in seconds since the epoch.
 * @rtime: Real time accumulated by process (should be @utime + @stime).
 * @utime: User-mode CPU time accumulated by process.
 * @stime: Kernel-mode CPU time accumulated by process.
 * @cutime: Cumulative utime of process and reaped children.
 * @cstime: Cumulative stime of process and reaped children.
 * @timeout: The time (in jiffies) of the process’s next timeout.
 * @it_real_value: The time (in jiffies) before the next <type>SIGALRM</type>
 * is sent to the process due to an interval timer.
 * @frequency: Tick frequency.
 * @xcpu_utime: SMP user-mode CPU time accumulated by process.
 * @xcpu_stime: SMP kernel-mode CPU time accumulated by process 
 *
 * Process time data filled by glibtop_get_proc_time().
 *
 * Under Linux the @start_time value may be wrong due to the information
 * available from the kernel.
 * 
 * The Linux kernel defines <type>INITIAL_JIFFIES</type> which implies a time
 * shift. Because <type>INITIAL_JIFFIES</type> is not user-space defined,
 * we cannot use it to compute an accurate @start_time. On Linux 2.6,
 * <type>INITIAL_JIFFIES</type> is 300 so @start_time is 
 * always 3s different from the real start time of the given process. You 
 * may also get shift results if your system clock is not synchronised 
 * with your hardware clock. See <command>man hwclock</command>.
  }
{< private > }
{< public > }
  Pglibtop_proc_time = ^Tglibtop_proc_time;
  Tglibtop_proc_time = record
      flags : Tguint64;
      start_time : Tguint64;
      rtime : Tguint64;
      utime : Tguint64;
      stime : Tguint64;
      cutime : Tguint64;
      cstime : Tguint64;
      timeout : Tguint64;
      it_real_value : Tguint64;
      frequency : Tguint64;
      xcpu_utime : array[0..(GLIBTOP_NCPU)-1] of Tguint64;
      xcpu_stime : array[0..(GLIBTOP_NCPU)-1] of Tguint64;
    end;


procedure glibtop_get_proc_time(buf:Pglibtop_proc_time; pid:Tpid_t);cdecl;external;
{$if GLIBTOP_SUID_PROC_TIME}

const
  glibtop_get_proc_time_r = glibtop_get_proc_time_p;  
{$else}

const
  glibtop_get_proc_time_r = glibtop_get_proc_time_s;  
{$endif}

procedure glibtop_get_proc_time_l(server:Pglibtop; buf:Pglibtop_proc_time; pid:Tpid_t);cdecl;external;
{$if GLIBTOP_SUID_PROC_TIME}

procedure _glibtop_init_proc_time_p(server:Pglibtop);cdecl;external;
procedure glibtop_get_proc_time_p(server:Pglibtop; buf:Pglibtop_proc_time; pid:Tpid_t);cdecl;external;
{$else}

procedure _glibtop_init_proc_time_s(server:Pglibtop);cdecl;external;
procedure glibtop_get_proc_time_s(server:Pglibtop; buf:Pglibtop_proc_time; pid:Tpid_t);cdecl;external;
{$endif}
{$endif}

implementation


end.
