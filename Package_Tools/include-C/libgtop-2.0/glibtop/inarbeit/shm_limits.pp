
unit shm_limits;
interface

{
  Automatically converted by H2Pas 1.0.0 from shm_limits.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shm_limits.h
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
Pglibtop_shm_limits  = ^glibtop_shm_limits;
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
{$ifndef __GLIBTOP_SHM_LIMITS_H__}
{$define __GLIBTOP_SHM_LIMITS_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_IPC_SHMMAX = 0;  
  GLIBTOP_IPC_SHMMIN = 1;  
  GLIBTOP_IPC_SHMMNI = 2;  
  GLIBTOP_IPC_SHMSEG = 3;  
  GLIBTOP_IPC_SHMALL = 4;  
  GLIBTOP_MAX_SHM_LIMITS = 5;  
type
{*
 * glibtop_shm_limits:
  }
{ GLIBTOP_IPC_SHMMAX	 }
{ GLIBTOP_IPC_SHMMIN	 }
{ GLIBTOP_IPC_SHMMNI	 }
{ GLIBTOP_IPC_SHMSEG	 }
{ GLIBTOP_IPC_SHMALL	 }
  Pglibtop_shm_limits = ^Tglibtop_shm_limits;
  Tglibtop_shm_limits = record
      flags : Tguint64;
      shmmax : Tguint64;
      shmmin : Tguint64;
      shmmni : Tguint64;
      shmseg : Tguint64;
      shmall : Tguint64;
    end;

{*
 * glibtop_get_shm_limits:
 * @buf: a #glibtop_shm_limits
  }

procedure glibtop_get_shm_limits(buf:Pglibtop_shm_limits);cdecl;external;
{$if GLIBTOP_SUID_SHM_LIMITS}

const
  glibtop_get_shm_limits_r = glibtop_get_shm_limits_p;  
{$else}

const
  glibtop_get_shm_limits_r = glibtop_get_shm_limits_s;  
{$endif}
{*
 * glibtop_get_shm_limits_l:
 * @server: a #glibtop server
 * @buf: a #glibtop_shm_limits
  }

procedure glibtop_get_shm_limits_l(server:Pglibtop; buf:Pglibtop_shm_limits);cdecl;external;
{$if GLIBTOP_SUID_SHM_LIMITS}

procedure _glibtop_init_shm_limits_p(server:Pglibtop);cdecl;external;
{*
 * glibtop_get_shm_limits_p:
 * @server: a #glibtop server
 * @buf: a #glibtop_shm_limits
  }
procedure glibtop_get_shm_limits_p(para1:Pglibtop; buf:Pglibtop_shm_limits);cdecl;external;
{$else}

procedure _glibtop_init_shm_limits_s(server:Pglibtop);cdecl;external;
{*
 * glibtop_get_shm_limits_s:
 * @server: a #glibtop server
 * @buf: a #glibtop_shm_limits
  }
procedure glibtop_get_shm_limits_s(server:Pglibtop; buf:Pglibtop_shm_limits);cdecl;external;
{$endif}
{$endif}

implementation


end.
