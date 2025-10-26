
unit procsignal;
interface

{
  Automatically converted by H2Pas 1.0.0 from procsignal.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    procsignal.h
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
Pglibtop_proc_signal  = ^glibtop_proc_signal;
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
{$ifndef __GLIBTOP_PROCSIGNAL_H__}
{$define __GLIBTOP_PROCSIGNAL_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_PROC_SIGNAL_SIGNAL = 0;  
  GLIBTOP_PROC_SIGNAL_BLOCKED = 1;  
  GLIBTOP_PROC_SIGNAL_SIGIGNORE = 2;  
  GLIBTOP_PROC_SIGNAL_SIGCATCH = 3;  
  GLIBTOP_MAX_PROC_SIGNAL = 4;  
type
{ Signals section  }
{ mask of pending signals  }
{ mask of blocked signals  }
{ mask of ignored signals  }
{ mask of caught  signals  }
  Pglibtop_proc_signal = ^Tglibtop_proc_signal;
  Tglibtop_proc_signal = record
      flags : Tguint64;
      signal : array[0..1] of Tguint64;
      blocked : array[0..1] of Tguint64;
      sigignore : array[0..1] of Tguint64;
      sigcatch : array[0..1] of Tguint64;
    end;


procedure glibtop_get_proc_signal(buf:Pglibtop_proc_signal; pid:Tpid_t);cdecl;external;
{$if GLIBTOP_SUID_PROC_SIGNAL}

const
  glibtop_get_proc_signal_r = glibtop_get_proc_signal_p;  
{$else}

const
  glibtop_get_proc_signal_r = glibtop_get_proc_signal_s;  
{$endif}

procedure glibtop_get_proc_signal_l(server:Pglibtop; buf:Pglibtop_proc_signal; pid:Tpid_t);cdecl;external;
{$if GLIBTOP_SUID_PROC_SIGNAL}

procedure _glibtop_init_proc_signal_p(server:Pglibtop);cdecl;external;
procedure glibtop_get_proc_signal_p(server:Pglibtop; buf:Pglibtop_proc_signal; pid:Tpid_t);cdecl;external;
{$else}

procedure _glibtop_init_proc_signal_s(server:Pglibtop);cdecl;external;
procedure glibtop_get_proc_signal_s(server:Pglibtop; buf:Pglibtop_proc_signal; pid:Tpid_t);cdecl;external;
{$endif}
{$endif}

implementation


end.
