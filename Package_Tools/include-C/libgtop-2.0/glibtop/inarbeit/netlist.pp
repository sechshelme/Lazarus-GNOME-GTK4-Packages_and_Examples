
unit netlist;
interface

{
  Automatically converted by H2Pas 1.0.0 from netlist.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    netlist.h
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
Pchar  = ^char;
Pglibtop  = ^glibtop;
Pglibtop_netlist  = ^glibtop_netlist;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 2004 Benoît Dejean
   This file is part of LibGTop 2.0.

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
{$ifndef __GLIBTOP_NETLIST_H__}
{$define __GLIBTOP_NETLIST_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_NETLIST_NUMBER = 0;  
  GLIBTOP_MAX_NETLIST = 1;  
type
{*
 * glibtop_netlist:
 * @number: Number of entries in the returned list.
  }
  Pglibtop_netlist = ^Tglibtop_netlist;
  Tglibtop_netlist = record
      flags : Tguint64;
      number : Tguint32;
    end;

{*
 * glibtop_get_netlist:
 * @buf: a #glibtop_netlist
 *
 * Returns: (array zero-terminated=1) (transfer full): an array of network
 *          interface names.
  }

function glibtop_get_netlist(buf:Pglibtop_netlist):^Pchar;cdecl;external;
{$if GLIBTOP_SUID_NETLIST}

const
  glibtop_get_netlist_r = glibtop_get_netlist_p;  
{$else}

const
  glibtop_get_netlist_r = glibtop_get_netlist_s;  
{$endif}
{*
 * glibtop_get_netlist_l:
 * @server: a #glibtop server
 * @buf: a #glibtop_netlist
 *
 * Returns: (array zero-terminated=1) (transfer full): an array of network
 *          interface names.
  }

function glibtop_get_netlist_l(server:Pglibtop; buf:Pglibtop_netlist):^Pchar;cdecl;external;
{$if GLIBTOP_SUID_NETLIST}

procedure _glibtop_init_netlist_p(server:Pglibtop);cdecl;external;
{*
 * glibtop_get_netlist_p:
 * @server: a #glibtop server
 * @buf: a #glibtop_netlist
 *
 * Returns: (array zero-terminated=1) (transfer full): an array of network
 *          interface names.
  }
function glibtop_get_netlist_p(server:Pglibtop; buf:Pglibtop_netlist):^Pchar;cdecl;external;
{$else}

procedure _glibtop_init_netlist_s(server:Pglibtop);cdecl;external;
{*
 * glibtop_get_netlist_s:
 * @server: a #glibtop server
 * @buf: a #glibtop_netlist
 *
 * Returns: (array zero-terminated=1) (transfer full): an array of network
 *          interface names.
  }
function glibtop_get_netlist_s(server:Pglibtop; buf:Pglibtop_netlist):^Pchar;cdecl;external;
{$endif}
{$endif}

implementation


end.
