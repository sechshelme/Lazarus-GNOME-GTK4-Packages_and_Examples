
unit procaffinity;
interface

{
  Automatically converted by H2Pas 1.0.0 from procaffinity.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    procaffinity.h
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
Pglibtop_proc_affinity  = ^glibtop_proc_affinity;
Pguint16  = ^guint16;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 2007 Benoît Dejean
   This file is part of LibGTop 2.

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
{$ifndef __GLIBTOP_PROCAFFINITY_H__}
{$define __GLIBTOP_PROCAFFINITY_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}
type

const
  GLIBTOP_PROC_AFFINITY_NUMBER = 0;  
  GLIBTOP_PROC_AFFINITY_ALL = 1;  
  GLIBTOP_MAX_PROC_AFFINITY = 2;  
type
  Pglibtop_proc_affinity = ^Tglibtop_proc_affinity;
  Tglibtop_proc_affinity = record
      flags : Tguint64;
      number : Tguint32;
      all : Tgboolean;
    end;


function glibtop_get_proc_affinity(buf:Pglibtop_proc_affinity; pid:Tpid_t):Pguint16;cdecl;external;
function glibtop_get_proc_affinity_l(server:Pglibtop; buf:Pglibtop_proc_affinity; pid:Tpid_t):Pguint16;cdecl;external;
{$if GLIBTOP_SUID_PROC_AFFINITY}

const
  glibtop_get_proc_affinity_r = glibtop_get_proc_affinity_p;  

procedure _glibtop_init_proc_affinity_p(server:Pglibtop);cdecl;external;
function glibtop_get_proc_affinity_p(server:Pglibtop; buf:Pglibtop_proc_affinity; pid:Tpid_t):Pguint16;cdecl;external;
{$else}

const
  glibtop_get_proc_affinity_r = glibtop_get_proc_affinity_s;  

procedure _glibtop_init_proc_affinity_s(server:Pglibtop);cdecl;external;
function glibtop_get_proc_affinity_s(server:Pglibtop; buf:Pglibtop_proc_affinity; pid:Tpid_t):Pguint16;cdecl;external;
{$endif}
{$endif}

implementation


end.
