
unit loadavg;
interface

{
  Automatically converted by H2Pas 1.0.0 from loadavg.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    loadavg.h
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
Pglibtop_loadavg  = ^glibtop_loadavg;
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
{$ifndef __GLIBTOP_LOADAVG_H__}
{$define __GLIBTOP_LOADAVG_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_LOADAVG_LOADAVG = 0;  
  GLIBTOP_LOADAVG_NR_RUNNING = 1;  
  GLIBTOP_LOADAVG_NR_TASKS = 2;  
  GLIBTOP_LOADAVG_LAST_PID = 3;  
  GLIBTOP_MAX_LOADAVG = 4;  
type
{ GLIBTOP_LOADAVG_LOADAVG	 }
{ GLIBTOP_LOADAVG_NR_RUNNING	 }
{ GLIBTOP_LOADAVG_NR_TASKS	 }
{ GLIBTOP_LOADAVG_LAST_PID	 }
  Pglibtop_loadavg = ^Tglibtop_loadavg;
  Tglibtop_loadavg = record
      flags : Tguint64;
      loadavg : array[0..2] of Tdouble;
      nr_running : Tguint64;
      nr_tasks : Tguint64;
      last_pid : Tguint64;
    end;


procedure glibtop_get_loadavg(buf:Pglibtop_loadavg);cdecl;external;
{$if GLIBTOP_SUID_LOADAVG}

const
  glibtop_get_loadavg_r = glibtop_get_loadavg_p;  
{$else}

const
  glibtop_get_loadavg_r = glibtop_get_loadavg_s;  
{$endif}

procedure glibtop_get_loadavg_l(server:Pglibtop; buf:Pglibtop_loadavg);cdecl;external;
{$if GLIBTOP_SUID_LOADAVG}

procedure _glibtop_init_loadavg_p(server:Pglibtop);cdecl;external;
procedure glibtop_get_loadavg_p(server:Pglibtop; buf:Pglibtop_loadavg);cdecl;external;
{$else}

procedure _glibtop_init_loadavg_s(server:Pglibtop);cdecl;external;
procedure glibtop_get_loadavg_s(server:Pglibtop; buf:Pglibtop_loadavg);cdecl;external;
{$endif}
{$endif}

implementation


end.
