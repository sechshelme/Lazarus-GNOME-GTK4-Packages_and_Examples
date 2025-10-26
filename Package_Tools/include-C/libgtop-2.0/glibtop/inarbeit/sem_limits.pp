
unit sem_limits;
interface

{
  Automatically converted by H2Pas 1.0.0 from sem_limits.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sem_limits.h
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
Pglibtop_sem_limits  = ^glibtop_sem_limits;
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
{$ifndef __GLIBTOP_SEM_LIMITS_H__}
{$define __GLIBTOP_SEM_LIMITS_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_IPC_SEMMAP = 0;  
  GLIBTOP_IPC_SEMMNI = 1;  
  GLIBTOP_IPC_SEMMNS = 2;  
  GLIBTOP_IPC_SEMMNU = 3;  
  GLIBTOP_IPC_SEMMSL = 4;  
  GLIBTOP_IPC_SEMOPM = 5;  
  GLIBTOP_IPC_SEMUME = 6;  
  GLIBTOP_IPC_SEMUSZ = 7;  
  GLIBTOP_IPC_SEMVMX = 8;  
  GLIBTOP_IPC_SEMAEM = 9;  
  GLIBTOP_MAX_SEM_LIMITS = 10;  
type
{ GLIBTOP_IPC_SEMMAP	 }
{ GLIBTOP_IPC_SEMMNI	 }
{ GLIBTOP_IPC_SEMMNS	 }
{ GLIBTOP_IPC_SEMMNU	 }
{ GLIBTOP_IPC_SEMMSL	 }
{ GLIBTOP_IPC_SEMOPM	 }
{ GLIBTOP_IPC_SEMUME	 }
{ GLIBTOP_IPC_SEMUSZ	 }
{ GLIBTOP_IPC_SEMVMX	 }
{ GLIBTOP_IPC_SEMAEM	 }
  Pglibtop_sem_limits = ^Tglibtop_sem_limits;
  Tglibtop_sem_limits = record
      flags : Tguint64;
      semmap : Tguint64;
      semmni : Tguint64;
      semmns : Tguint64;
      semmnu : Tguint64;
      semmsl : Tguint64;
      semopm : Tguint64;
      semume : Tguint64;
      semusz : Tguint64;
      semvmx : Tguint64;
      semaem : Tguint64;
    end;


procedure glibtop_get_sem_limits(buf:Pglibtop_sem_limits);cdecl;external;
{$if GLIBTOP_SUID_SEM_LIMITS}

const
  glibtop_get_sem_limits_r = glibtop_get_sem_limits_p;  
{$else}

const
  glibtop_get_sem_limits_r = glibtop_get_sem_limits_s;  
{$endif}

procedure glibtop_get_sem_limits_l(server:Pglibtop; buf:Pglibtop_sem_limits);cdecl;external;
{$if GLIBTOP_SUID_SEM_LIMITS}

procedure _glibtop_init_sem_limits_p(server:Pglibtop);cdecl;external;
procedure glibtop_get_sem_limits_p(server:Pglibtop; buf:Pglibtop_sem_limits);cdecl;external;
{$else}

procedure _glibtop_init_sem_limits_s(server:Pglibtop);cdecl;external;
procedure glibtop_get_sem_limits_s(server:Pglibtop; buf:Pglibtop_sem_limits);cdecl;external;
{$endif}
{$endif}

implementation


end.
