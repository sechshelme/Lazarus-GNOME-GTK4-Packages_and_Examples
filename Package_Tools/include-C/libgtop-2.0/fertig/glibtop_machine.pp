
unit glibtop_machine;
interface

{
  Automatically converted by H2Pas 1.0.0 from glibtop_machine.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    glibtop_machine.h
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
Pglibtop_machine  = ^glibtop_machine;
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
{$ifndef __GLIBTOP_MACHINE_H__}
{$define __GLIBTOP_MACHINE_H__}
{$include <glib.h>}
type
  Pglibtop_machine = ^Tglibtop_machine;
  Tglibtop_machine = record
      uid : Tuid_t;
      euid : Tuid_t;
      gid : Tgid_t;
      egid : Tgid_t;
    end;

{$endif}

implementation


end.
