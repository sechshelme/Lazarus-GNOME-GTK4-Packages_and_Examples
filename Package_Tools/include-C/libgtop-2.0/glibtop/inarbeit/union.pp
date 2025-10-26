
unit union;
interface

{
  Automatically converted by H2Pas 1.0.0 from union.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    union.h
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
Pglibtop_union  = ^glibtop_union;
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
{$ifndef __GLIBTOP_UNION_H__}
{$define __GLIBTOP_UNION_H__}
{$include <glibtop/cpu.h>}
{$include <glibtop/disk.h>}
{$include <glibtop/mem.h>}
{$include <glibtop/swap.h>}
{$include <glibtop/uptime.h>}
{$include <glibtop/loadavg.h>}
{$include <glibtop/shm_limits.h>}
{$include <glibtop/msg_limits.h>}
{$include <glibtop/sem_limits.h>}
{$include <glibtop/proclist.h>}
{$include <glibtop/procstate.h>}
{$include <glibtop/procuid.h>}
{$include <glibtop/procmem.h>}
{$include <glibtop/proctime.h>}
{$include <glibtop/procsignal.h>}
{$include <glibtop/prockernel.h>}
{$include <glibtop/procsegment.h>}
{$include <glibtop/procargs.h>}
{$include <glibtop/procmap.h>}
{$include <glibtop/procopenfiles.h>}
{$include <glibtop/procwd.h>}
{$include <glibtop/procaffinity.h>}
{$include <glibtop/procio.h>}
{$include <glibtop/mountlist.h>}
{$include <glibtop/fsusage.h>}
{$include <glibtop/netload.h>}
{$include <glibtop/netlist.h>}
{$include <glibtop/ppp.h>}
type
  Pglibtop_union = ^Tglibtop_union;
  Tglibtop_union = Tglibtop_union;
  Pglibtop_union = ^Tglibtop_union;
  Tglibtop_union = record
      case longint of
        0 : ( cpu : Tglibtop_cpu );
        1 : ( disk : Tglibtop_disk );
        2 : ( mem : Tglibtop_mem );
        3 : ( swap : Tglibtop_swap );
        4 : ( uptime : Tglibtop_uptime );
        5 : ( loadavg : Tglibtop_loadavg );
        6 : ( shm_limits : Tglibtop_shm_limits );
        7 : ( msg_limits : Tglibtop_msg_limits );
        8 : ( sem_limits : Tglibtop_sem_limits );
        9 : ( proclist : Tglibtop_proclist );
        10 : ( proc_state : Tglibtop_proc_state );
        11 : ( proc_uid : Tglibtop_proc_uid );
        12 : ( proc_mem : Tglibtop_proc_mem );
        13 : ( proc_time : Tglibtop_proc_time );
        14 : ( proc_signal : Tglibtop_proc_signal );
        15 : ( proc_kernel : Tglibtop_proc_kernel );
        16 : ( proc_segment : Tglibtop_proc_segment );
        17 : ( proc_args : Tglibtop_proc_args );
        18 : ( proc_map : Tglibtop_proc_map );
        19 : ( mountlist : Tglibtop_mountlist );
        20 : ( fsusage : Tglibtop_fsusage );
        21 : ( netlist : Tglibtop_netlist );
        22 : ( netload : Tglibtop_netload );
        23 : ( ppp : Tglibtop_ppp );
        24 : ( proc_open_files : Tglibtop_proc_open_files );
        25 : ( proc_wd : Tglibtop_proc_wd );
        26 : ( proc_affinity : Tglibtop_proc_affinity );
        27 : ( proc_io : Tglibtop_proc_io );
      end;

{$endif}

implementation


end.
