
unit msg_limits;
interface

{
  Automatically converted by H2Pas 1.0.0 from msg_limits.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    msg_limits.h
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
Pglibtop_msg_limits  = ^glibtop_msg_limits;
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
{$ifndef __GLIBTOP_MSG_LIMITS_H__}
{$define __GLIBTOP_MSG_LIMITS_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_IPC_MSGPOOL = 0;  
  GLIBTOP_IPC_MSGMAP = 1;  
  GLIBTOP_IPC_MSGMAX = 2;  
  GLIBTOP_IPC_MSGMNB = 3;  
  GLIBTOP_IPC_MSGMNI = 4;  
  GLIBTOP_IPC_MSGSSZ = 5;  
  GLIBTOP_IPC_MSGTQL = 6;  
  GLIBTOP_MAX_MSG_LIMITS = 7;  
type
{ GLIBTOP_IPC_MSGPOOL	 }
{ GLIBTOP_IPC_MSGMAP	 }
{ GLIBTOP_IPC_MSGMAX	 }
{ GLIBTOP_IPC_MSGMNB	 }
{ GLIBTOP_IPC_MSGMNI	 }
{ GLIBTOP_IPC_MSGSSZ	 }
{ GLIBTOP_IPC_MSGTQL	 }
  Pglibtop_msg_limits = ^Tglibtop_msg_limits;
  Tglibtop_msg_limits = record
      flags : Tguint64;
      msgpool : Tguint64;
      msgmap : Tguint64;
      msgmax : Tguint64;
      msgmnb : Tguint64;
      msgmni : Tguint64;
      msgssz : Tguint64;
      msgtql : Tguint64;
    end;


procedure glibtop_get_msg_limits(buf:Pglibtop_msg_limits);cdecl;external;
{$if GLIBTOP_SUID_MSG_LIMITS}

const
  glibtop_get_msg_limits_r = glibtop_get_msg_limits_p;  
{$else}

const
  glibtop_get_msg_limits_r = glibtop_get_msg_limits_s;  
{$endif}

procedure glibtop_get_msg_limits_l(server:Pglibtop; buf:Pglibtop_msg_limits);cdecl;external;
{$if GLIBTOP_SUID_MSG_LIMITS}

procedure _glibtop_init_msg_limits_p(server:Pglibtop);cdecl;external;
procedure glibtop_get_msg_limits_p(server:Pglibtop; buf:Pglibtop_msg_limits);cdecl;external;
{$else}

procedure _glibtop_init_msg_limits_s(server:Pglibtop);cdecl;external;
procedure glibtop_get_msg_limits_s(server:Pglibtop; buf:Pglibtop_msg_limits);cdecl;external;
{$endif}
{$endif}

implementation


end.
