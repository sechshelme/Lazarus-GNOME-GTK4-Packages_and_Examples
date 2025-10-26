unit sysinfo;

interface

uses
  fp_glib2, fp_libgtop2;

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
{$ifndef __GLIBTOP_SYSINFO_H__}
{$define __GLIBTOP_SYSINFO_H__}
{$include <glibtop.h>}
{$include <glibtop/cpu.h>}
{$include <glibtop/global.h>}
{$include <glib.h>}

const
  GLIBTOP_SYSINFO_NCPU = 0;  
  GLIBTOP_SYSINFO_CPUINFO = 1;  
  GLIBTOP_MAX_SYSINFO = 2;  
type
{ key -> description  }
{ unused  }
  Pglibtop_entry = ^Tglibtop_entry;
  Tglibtop_entry = record
      labels : PGPtrArray;
      values : PGHashTable;
      descriptions : PGHashTable;
    end;

  Pglibtop_sysinfo = ^Tglibtop_sysinfo;
  Tglibtop_sysinfo = record
      flags : Tguint64;
      ncpu : Tguint64;
      cpuinfo : array[0..(GLIBTOP_NCPU)-1] of Tglibtop_entry;
    end;


const
  glibtop_get_sysinfo_r = glibtop_get_sysinfo_s;  

function glibtop_get_sysinfo_s(server:Pglibtop):Pglibtop_sysinfo;cdecl;external libgtop2;
function glibtop_get_sysinfo:Pglibtop_sysinfo;cdecl;external libgtop2;
{$endif}

// === Konventiert am: 26-10-25 12:03:52 ===


implementation



end.
