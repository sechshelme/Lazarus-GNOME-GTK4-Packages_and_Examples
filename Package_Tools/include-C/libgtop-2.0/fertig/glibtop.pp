
unit glibtop;
interface

{
  Automatically converted by H2Pas 1.0.0 from glibtop.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    glibtop.h
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
{$ifndef __GLIBTOP_H__}
{$define __GLIBTOP_H__}
{ for pid_t, uid_t, gid_t  }
{$include <sys/types.h>}
{$include <glib.h>}
{$include <glib-object.h>}
type
{*
 *  LIBGTOP_CHECK_VERSION
 *  @major: Major version number
 *  @minor: Minor version number
 *  @micro: Micro version number
 *
 *  Checks if the version given is compatable with this version of the
 *  library.  For example, LIBGTOP_CHECK_VERSION(1.2.3) would return TRUE
 *  if the version is 1.2.5, and FALSE if 1.1.0.  This can be used in
 *  build tests.
 *
 * }
{$include <libgtopconfig.h>}
{ xxxxxxxxxxxxx
#define LIBGTOP_CHECK_VERSION(major, minor, micro)    \
(LIBGTOP_MAJOR_VERSION > (major) || \
(LIBGTOP_MAJOR_VERSION == (major) && LIBGTOP_MINOR_VERSION > (minor)) || \
(LIBGTOP_MAJOR_VERSION == (major) && LIBGTOP_MINOR_VERSION == (minor) && \
LIBGTOP_MICRO_VERSION >= (micro)))
 }
{$include <glibtop/global.h>}
{$include <glibtop_server.h>}
{$ifndef GLIBTOP_MOUNTENTRY_LEN}

const
  GLIBTOP_MOUNTENTRY_LEN = 79;  
{$endif}
{$include <glibtop/sysdeps.h>}
{$include <glibtop/close.h>}
{ Server Method  }
{ Error Method  }
{ Pipe client <- server  }
{ Pipe client -> server  }
{ Accepted connection of a socket  }
{ Number of CPUs, zero if single-processor  }
{ Real number of CPUs. Only ncpu are monitored  }
{ Version code of the operating system  }
(* Const before type ignored *)
{ Program name for error messages  }
(* Const before type ignored *)
{ Command used to invoke server  }
(* Const before type ignored *)
{ Host the server should run on  }
(* Const before type ignored *)
{ Name of the user on the target host  }
(* Const before type ignored *)
{ Command used to connect to the target host  }
{ Server is required for this features  }
{ Port on which daemon is listening  }
{ Detailed feature list  }
{ Required feature list  }
{ PID of the server  }
{ Machine dependent data  }
{ Number of DISKs,  zero if single-disk. This pertains to disk volumes  }
{ Number of PHYSICAL DISKs. Only ndisk is monitored for now  }
type
  Pglibtop = ^Tglibtop;
  Tglibtop = record
      flags : dword;
      method : dword;
      error_method : dword;
      input : array[0..1] of longint;
      output : array[0..1] of longint;
      socket : longint;
      ncpu : longint;
      real_ncpu : longint;
      os_version_code : dword;
      name : Pchar;
      server_command : Pchar;
      server_host : Pchar;
      server_user : Pchar;
      server_rsh : Pchar;
      features : dword;
      server_port : dword;
      sysdeps : Tglibtop_sysdeps;
      required : Tglibtop_sysdeps;
      pid : Tpid_t;
      uid : Tuid_t;
      euid : Tuid_t;
      gid : Tgid_t;
      egid : Tgid_t;
      machine : Pglibtop_machine;
      ndisk : longint;
      real_ndisk : longint;
    end;

  var
    glibtop_global_server : Pglibtop;cvar;external;
(* Const before type ignored *)
    glibtop_server_features : dword;cvar;external;
{*
 * glibtop_init:
 *
 * Returns: (transfer none):
  }

function glibtop_init:Pglibtop;cdecl;external;
{*
 * glibtop_init_r:
 * @server_ptr: (out):
 * @features:
 * @flags:
 *
 * Returns: (transfer none):
  }
function glibtop_init_r(server_ptr:PPglibtop; features:dword; flags:dword):Pglibtop;cdecl;external;
{*
 * glibtop_init_s: (skip)
 * @server_ptr: (out):
 * @features:
 * @flags:
 *
 * Returns: (transfer none):
  }
function glibtop_init_s(server_ptr:PPglibtop; features:dword; flags:dword):Pglibtop;cdecl;external;
function glibtop_get_type:TGType;cdecl;external;
{$endif}

implementation


end.
