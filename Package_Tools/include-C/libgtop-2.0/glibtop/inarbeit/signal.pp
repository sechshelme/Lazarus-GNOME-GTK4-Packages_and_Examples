
unit signal;
interface

{
  Automatically converted by H2Pas 1.0.0 from signal.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    signal.h
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
Pglibtop_signame  = ^glibtop_signame;
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
{$ifndef __GLIBTOP_SIGNAL_H__}
{$define __GLIBTOP_SIGNAL_H__}
{$include <glibtop.h>}
{$ifdef HAVE_SYS_SIGNAL_H}
{$include <sys/signal.h>}
{$endif}
type
(* Const before type ignored *)
(* Const before type ignored *)
  Pglibtop_signame = ^Tglibtop_signame;
  Tglibtop_signame = record
      number : longint;
      name : Pchar;
      _label : Pchar;
    end;

(* Const before type ignored *)
  var
    glibtop_sys_siglist : Pglibtop_signame;cvar;external;
{$endif}

implementation


end.
