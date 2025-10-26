
unit mem;
interface

{
  Automatically converted by H2Pas 1.0.0 from mem.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mem.h
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
Pglibtop_mem  = ^glibtop_mem;
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
{$ifndef __GLIBTOP_MEM_H__}
{$define __GLIBTOP_MEM_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_MEM_TOTAL = 0;  
  GLIBTOP_MEM_USED = 1;  
  GLIBTOP_MEM_FREE = 2;  
  GLIBTOP_MEM_SHARED = 3;  
  GLIBTOP_MEM_BUFFER = 4;  
  GLIBTOP_MEM_CACHED = 5;  
  GLIBTOP_MEM_USER = 6;  
  GLIBTOP_MEM_LOCKED = 7;  
  GLIBTOP_MAX_MEM = 8;  
type
{ GLIBTOP_MEM_TOTAL	 }
{ GLIBTOP_MEM_USED	 }
{ GLIBTOP_MEM_FREE	 }
{ GLIBTOP_MEM_SHARED	 }
{ GLIBTOP_MEM_BUFFER	 }
{ GLIBTOP_MEM_CACHED	 }
{ GLIBTOP_MEM_USER	 }
{ GLIBTOP_MEM_LOCKED	 }
  Pglibtop_mem = ^Tglibtop_mem;
  Tglibtop_mem = record
      flags : Tguint64;
      total : Tguint64;
      used : Tguint64;
      free : Tguint64;
      shared : Tguint64;
      buffer : Tguint64;
      cached : Tguint64;
      user : Tguint64;
      locked : Tguint64;
    end;


procedure glibtop_get_mem(buf:Pglibtop_mem);cdecl;external;
{$if GLIBTOP_SUID_MEM}

const
  glibtop_get_mem_r = glibtop_get_mem_p;  
{$else}

const
  glibtop_get_mem_r = glibtop_get_mem_s;  
{$endif}

procedure glibtop_get_mem_l(server:Pglibtop; buf:Pglibtop_mem);cdecl;external;
{$if GLIBTOP_SUID_MEM}

procedure _glibtop_init_mem_p(server:Pglibtop);cdecl;external;
procedure glibtop_get_mem_p(server:Pglibtop; buf:Pglibtop_mem);cdecl;external;
{$else}

procedure _glibtop_init_mem_s(server:Pglibtop);cdecl;external;
procedure glibtop_get_mem_s(server:Pglibtop; buf:Pglibtop_mem);cdecl;external;
{$endif}
{$endif}

implementation


end.
