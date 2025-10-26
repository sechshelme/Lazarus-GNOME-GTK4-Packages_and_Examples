
unit uptime;
interface

{
  Automatically converted by H2Pas 1.0.0 from uptime.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    uptime.h
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
Pglibtop_uptime  = ^glibtop_uptime;
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
{$ifndef __GLIBTOP_UPTIME_H__}
{$define __GLIBTOP_UPTIME_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_UPTIME_UPTIME = 0;  
  GLIBTOP_UPTIME_IDLETIME = 1;  
  GLIBTOP_UPTIME_BOOT_TIME = 2;  
  GLIBTOP_MAX_UPTIME = 3;  
type
{ GLIBTOP_UPTIME_UPTIME	 }
{ GLIBTOP_UPTIME_IDLETIME	 }
  Pglibtop_uptime = ^Tglibtop_uptime;
  Tglibtop_uptime = record
      flags : Tguint64;
      uptime : Tdouble;
      idletime : Tdouble;
      boot_time : Tguint64;
    end;


procedure glibtop_get_uptime(buf:Pglibtop_uptime);cdecl;external;
{$if GLIBTOP_SUID_UPTIME}

const
  glibtop_get_uptime_r = glibtop_get_uptime_p;  
{$else}

const
  glibtop_get_uptime_r = glibtop_get_uptime_s;  
{$endif}

procedure glibtop_get_uptime_l(server:Pglibtop; buf:Pglibtop_uptime);cdecl;external;
{$if GLIBTOP_SUID_UPTIME}

procedure _glibtop_init_uptime_p(server:Pglibtop);cdecl;external;
procedure glibtop_get_uptime_p(server:Pglibtop; buf:Pglibtop_uptime);cdecl;external;
{$else}

procedure _glibtop_init_uptime_s(server:Pglibtop);cdecl;external;
procedure glibtop_get_uptime_s(server:Pglibtop; buf:Pglibtop_uptime);cdecl;external;
{$endif}
{$endif}

implementation


end.
