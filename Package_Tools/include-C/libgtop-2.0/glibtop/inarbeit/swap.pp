
unit swap;
interface

{
  Automatically converted by H2Pas 1.0.0 from swap.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    swap.h
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
Pglibtop_swap  = ^glibtop_swap;
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
{$ifndef __GLIBTOP_SWAP_H__}
{$define __GLIBTOP_SWAP_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_SWAP_TOTAL = 0;  
  GLIBTOP_SWAP_USED = 1;  
  GLIBTOP_SWAP_FREE = 2;  
  GLIBTOP_SWAP_PAGEIN = 3;  
  GLIBTOP_SWAP_PAGEOUT = 4;  
  GLIBTOP_MAX_SWAP = 5;  
type
{ GLIBTOP_SWAP_TOTAL	 }
{ GLIBTOP_SWAP_USED	 }
{ GLIBTOP_SWAP_FREE	 }
{ GLIBTOP_SWAP_PAGEIN	 }
{ GLIBTOP_SWAP_PAGEOUT	 }
  Pglibtop_swap = ^Tglibtop_swap;
  Tglibtop_swap = record
      flags : Tguint64;
      total : Tguint64;
      used : Tguint64;
      free : Tguint64;
      pagein : Tguint64;
      pageout : Tguint64;
    end;


procedure glibtop_get_swap(buf:Pglibtop_swap);cdecl;external;
{$if GLIBTOP_SUID_SWAP}

const
  glibtop_get_swap_r = glibtop_get_swap_p;  
{$else}

const
  glibtop_get_swap_r = glibtop_get_swap_s;  
{$endif}

procedure glibtop_get_swap_l(server:Pglibtop; buf:Pglibtop_swap);cdecl;external;
{$if GLIBTOP_SUID_SWAP}

procedure _glibtop_init_swap_p(server:Pglibtop);cdecl;external;
procedure glibtop_get_swap_p(server:Pglibtop; buf:Pglibtop_swap);cdecl;external;
{$else}

procedure _glibtop_init_swap_s(server:Pglibtop);cdecl;external;
procedure glibtop_get_swap_s(server:Pglibtop; buf:Pglibtop_swap);cdecl;external;
{$endif}
{$endif}

implementation


end.
