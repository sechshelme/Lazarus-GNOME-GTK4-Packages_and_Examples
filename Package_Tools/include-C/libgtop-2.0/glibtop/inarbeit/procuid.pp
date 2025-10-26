
unit procuid;
interface

{
  Automatically converted by H2Pas 1.0.0 from procuid.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    procuid.h
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
Pglibtop_proc_uid  = ^glibtop_proc_uid;
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
{$ifndef __GLIBTOP_PROCUID_H__}
{$define __GLIBTOP_PROCUID_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_PROC_UID_UID = 0;  
  GLIBTOP_PROC_UID_EUID = 1;  
  GLIBTOP_PROC_UID_GID = 2;  
  GLIBTOP_PROC_UID_EGID = 3;  
  GLIBTOP_PROC_UID_SUID = 4;  
  GLIBTOP_PROC_UID_SGID = 5;  
  GLIBTOP_PROC_UID_FSUID = 6;  
  GLIBTOP_PROC_UID_FSGID = 7;  
  GLIBTOP_PROC_UID_PID = 8;  
  GLIBTOP_PROC_UID_PPID = 9;  
  GLIBTOP_PROC_UID_PGRP = 10;  
  GLIBTOP_PROC_UID_SESSION = 11;  
  GLIBTOP_PROC_UID_TTY = 12;  
  GLIBTOP_PROC_UID_TPGID = 13;  
  GLIBTOP_PROC_UID_PRIORITY = 14;  
  GLIBTOP_PROC_UID_NICE = 15;  
  GLIBTOP_PROC_UID_NGROUPS = 16;  
  GLIBTOP_PROC_UID_GROUPS = 17;  
  GLIBTOP_MAX_PROC_UID = 18;  
type

const
  GLIBTOP_MAX_GROUPS = 64;  
{ User, Group, Terminal and session  }
{ user id  }
{ effective user id  }
{ group id  }
{ effective group id  }
{ set user id  }
{ set group id  }
{ ??? user id  }
{ ??? group id  }
{ process id  }
{ pid of parent process  }
{ process group id  }
{ session id  }
{ full device number of controlling terminal  }
{ terminal process group id  }
{ kernel scheduling priority  }
{ standard unix nice level of process  }
type
  Pglibtop_proc_uid = ^Tglibtop_proc_uid;
  Tglibtop_proc_uid = record
      flags : Tguint64;
      uid : Tgint32;
      euid : Tgint32;
      gid : Tgint32;
      egid : Tgint32;
      suid : Tgint32;
      sgid : Tgint32;
      fsuid : Tgint32;
      fsgid : Tgint32;
      pid : Tgint32;
      ppid : Tgint32;
      pgrp : Tgint32;
      session : Tgint32;
      tty : Tgint32;
      tpgid : Tgint32;
      priority : Tgint32;
      nice : Tgint32;
      ngroups : Tgint32;
      groups : array[0..(GLIBTOP_MAX_GROUPS)-1] of Tgint32;
    end;


procedure glibtop_get_proc_uid(buf:Pglibtop_proc_uid; pid:Tpid_t);cdecl;external;
{$if GLIBTOP_SUID_PROC_UID}

const
  glibtop_get_proc_uid_r = glibtop_get_proc_uid_p;  
{$else}

const
  glibtop_get_proc_uid_r = glibtop_get_proc_uid_s;  
{$endif}

procedure glibtop_get_proc_uid_l(server:Pglibtop; buf:Pglibtop_proc_uid; pid:Tpid_t);cdecl;external;
{$if GLIBTOP_SUID_PROC_UID}

procedure _glibtop_init_proc_uid_p(server:Pglibtop);cdecl;external;
procedure glibtop_get_proc_uid_p(server:Pglibtop; buf:Pglibtop_proc_uid; pid:Tpid_t);cdecl;external;
{$else}

procedure _glibtop_init_proc_uid_s(server:Pglibtop);cdecl;external;
procedure glibtop_get_proc_uid_s(server:Pglibtop; buf:Pglibtop_proc_uid; pid:Tpid_t);cdecl;external;
{$endif}
{$endif}

implementation


end.
