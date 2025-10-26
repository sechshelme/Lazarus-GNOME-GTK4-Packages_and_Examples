
unit ppp;
interface

{
  Automatically converted by H2Pas 1.0.0 from ppp.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ppp.h
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
Pglibtop_ppp  = ^glibtop_ppp;
Pxxxx  = ^xxxx;
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
{$ifndef __GLIBTOP_PPP_H__}
{$define __GLIBTOP_PPP_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_PPP_STATE = 0;  
  GLIBTOP_PPP_BYTES_IN = 1;  
  GLIBTOP_PPP_BYTES_OUT = 2;  
  GLIBTOP_MAX_PPP = 3;  
type
  Txxxx =  Longint;
  Const
    GLIBTOP_PPP_STATE_UNKNOWN = 0;
    GLIBTOP_PPP_STATE_HANGUP = 1;
    GLIBTOP_PPP_STATE_ONLINE = 2;

{ GLIBTOP_PPP_STATE		 }
{ GLIBTOP_PPP_BYTES_IN		 }
{ GLIBTOP_PPP_BYTES_OUT	 }
type
  Pglibtop_ppp = ^Tglibtop_ppp;
  Tglibtop_ppp = record
      flags : Tguint64;
      state : Tguint64;
      bytes_in : Tguint64;
      bytes_out : Tguint64;
    end;


procedure glibtop_get_ppp(buf:Pglibtop_ppp; device:word);cdecl;external;
{$if GLIBTOP_SUID_PPP}

const
  glibtop_get_ppp_r = glibtop_get_ppp_p;  
{$else}

const
  glibtop_get_ppp_r = glibtop_get_ppp_s;  
{$endif}

procedure glibtop_get_ppp_l(server:Pglibtop; buf:Pglibtop_ppp; device:word);cdecl;external;
{$if GLIBTOP_SUID_PPP}

procedure _glibtop_init_ppp_p(server:Pglibtop);cdecl;external;
procedure glibtop_get_ppp_p(server:Pglibtop; buf:Pglibtop_ppp; device:word);cdecl;external;
{$else}

procedure _glibtop_init_ppp_s(server:Pglibtop);cdecl;external;
procedure glibtop_get_ppp_s(server:Pglibtop; buf:Pglibtop_ppp; device:word);cdecl;external;
{$endif}
{$endif}

implementation


end.
