unit signal;

interface

uses
  fp_glib2, fp_libgtop2;

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
  Pglibtop_signame = ^Tglibtop_signame;
  Tglibtop_signame = record
      number : longint;
      name : Pchar;
      _label : Pchar;
    end;

  var
    glibtop_sys_siglist : Pglibtop_signame;cvar;external libgtop2;
{$endif}

// === Konventiert am: 26-10-25 12:04:00 ===


implementation



end.
