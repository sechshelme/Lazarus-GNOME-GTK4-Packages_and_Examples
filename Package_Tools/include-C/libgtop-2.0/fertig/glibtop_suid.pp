
unit glibtop_suid;
interface

{
  Automatically converted by H2Pas 1.0.0 from glibtop_suid.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    glibtop_suid.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 2018 Benoît Dejean

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
{$ifndef __GLIBTOP_SUID_H__}
{$define __GLIBTOP_SUID_H__}
{$include <glibtop_machine.h>}
{********* xxxxxxxxxxxxxxx
static inline void glibtop_suid_enter (glibtop *server) 
	glibtop_debug ("uid=%d euid=%d gid=%d egid=%d", getuid(), geteuid(), getgid(), getegid());
	setreuid (server->machine->uid, server->machine->euid);
	glibtop_debug ("uid=%d euid=%d gid=%d egid=%d", getuid(), geteuid(), getgid(), getegid());
;

static inline void glibtop_suid_leave (glibtop *server) 
	glibtop_debug ("uid=%d euid=%d gid=%d egid=%d", getuid(), geteuid(), getgid(), getegid());
	if (setreuid (server->machine->euid, server->machine->uid))
		_exit (1);
	glibtop_debug ("uid=%d euid=%d gid=%d egid=%d", getuid(), geteuid(), getgid(), getegid());
;
 }
(* Const before type ignored *)
(* Const before type ignored *)

procedure glibtop_init_p(server:Pglibtop; features:dword; flags:dword);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure glibtop_open_p(server:Pglibtop; program_name:Pchar; features:dword; flags:dword);cdecl;external;
{$endif}

implementation


end.
