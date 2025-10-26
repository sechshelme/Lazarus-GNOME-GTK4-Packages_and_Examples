
unit procmem;
interface

{
  Automatically converted by H2Pas 1.0.0 from procmem.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    procmem.h
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
Pglibtop_proc_mem  = ^glibtop_proc_mem;
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
{$ifndef __GLIBTOP_PROCMEM_H__}
{$define __GLIBTOP_PROCMEM_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_PROC_MEM_SIZE = 0;  
  GLIBTOP_PROC_MEM_VSIZE = 1;  
  GLIBTOP_PROC_MEM_RESIDENT = 2;  
  GLIBTOP_PROC_MEM_SHARE = 3;  
  GLIBTOP_PROC_MEM_RSS = 4;  
  GLIBTOP_PROC_MEM_RSS_RLIM = 5;  
  GLIBTOP_MAX_PROC_MEM = 6;  
type
{ Memory section  }
{ total # of pages of memory  }
{ number of pages of virtual memory ...  }
{ number of resident set
				 * (non-swapped) pages (4k)  }
{ number of pages of shared (mmap'd) memory  }
{ resident set size  }
{ current limit (in bytes) of the rss
				 * of the process; usually 2,147,483,647  }
  Pglibtop_proc_mem = ^Tglibtop_proc_mem;
  Tglibtop_proc_mem = record
      flags : Tguint64;
      size : Tguint64;
      vsize : Tguint64;
      resident : Tguint64;
      share : Tguint64;
      rss : Tguint64;
      rss_rlim : Tguint64;
    end;

{*
 * glibtop_get_proc_mem:
 * @buf:
 * @pid:
 *
  }

procedure glibtop_get_proc_mem(buf:Pglibtop_proc_mem; pid:Tpid_t);cdecl;external;
{$if GLIBTOP_SUID_PROC_MEM}

const
  glibtop_get_proc_mem_r = glibtop_get_proc_mem_p;  
{$else}

const
  glibtop_get_proc_mem_r = glibtop_get_proc_mem_s;  
{$endif}

procedure glibtop_get_proc_mem_l(server:Pglibtop; buf:Pglibtop_proc_mem; pid:Tpid_t);cdecl;external;
{$if GLIBTOP_SUID_PROC_MEM}

procedure _glibtop_init_proc_mem_p(server:Pglibtop);cdecl;external;
procedure glibtop_get_proc_mem_p(server:Pglibtop; buf:Pglibtop_proc_mem; pid:Tpid_t);cdecl;external;
{$else}

procedure _glibtop_init_proc_mem_s(server:Pglibtop);cdecl;external;
procedure glibtop_get_proc_mem_s(server:Pglibtop; buf:Pglibtop_proc_mem; pid:Tpid_t);cdecl;external;
{$endif}
{$endif}

implementation


end.
