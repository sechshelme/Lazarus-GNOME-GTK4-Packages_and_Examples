
unit mountlist;
interface

{
  Automatically converted by H2Pas 1.0.0 from mountlist.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mountlist.h
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
Pglibtop_mountentry  = ^glibtop_mountentry;
Pglibtop_mountlist  = ^glibtop_mountlist;
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
{$ifndef __GLIBTOP_MOUNTLIST_H__}
{$define __GLIBTOP_MOUNTLIST_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_MOUNTLIST_NUMBER = 0;  
  GLIBTOP_MOUNTLIST_TOTAL = 1;  
  GLIBTOP_MOUNTLIST_SIZE = 2;  
  GLIBTOP_MAX_MOUNTLIST = 3;  
type
  Pglibtop_mountentry = ^Tglibtop_mountentry;
  Tglibtop_mountentry = record
      dev : Tguint64;
      devname : array[0..(GLIBTOP_MOUNTENTRY_LEN+1)-1] of char;
      mountdir : array[0..(GLIBTOP_MOUNTENTRY_LEN+1)-1] of char;
      _type : array[0..(GLIBTOP_MOUNTENTRY_LEN+1)-1] of char;
    end;

{ GLIBTOP_MOUNTLIST_NUMBER	 }
{ GLIBTOP_MOUNTLIST_TOTAL	 }
{ GLIBTOP_MOUNTLIST_SIZE	 }
  Pglibtop_mountlist = ^Tglibtop_mountlist;
  Tglibtop_mountlist = record
      flags : Tguint64;
      number : Tguint64;
      total : Tguint64;
      size : Tguint64;
    end;

{*
 * glibtop_get_mountlist:
 * @buf:
 * @all_fs:
 *
 * Returns: (transfer full) (array zero-terminated=1):
  }
{*
 * glibtop_get_mountlist_r:
 * @buf: (out):
 * @all_fs:
 *
 * Returns: (transfer full) (array zero-terminated=1):
  }
{*
 * glibtop_get_mountlist_s:
 * @buf: (out):
 * @all_fs:
 *
 * Returns: (transfer full) (array zero-terminated=1):
  }
{*
 * glibtop_get_mountlist_l:
 * @buf: (out):
 * @all_fs:
 *
 * Returns: (transfer full) (array zero-terminated=1):
  }

function glibtop_get_mountlist(buf:Pglibtop_mountlist; all_fs:longint):Pglibtop_mountentry;cdecl;external;
const
  glibtop_get_mountlist_r = glibtop_get_mountlist_s;  

function glibtop_get_mountlist_l(server:Pglibtop; buf:Pglibtop_mountlist; all_fs:longint):Pglibtop_mountentry;cdecl;external;
function glibtop_get_mountlist_s(server:Pglibtop; buf:Pglibtop_mountlist; all_fs:longint):Pglibtop_mountentry;cdecl;external;
function glibtop_mountlist_get_type:TGType;cdecl;external;
function glibtop_mountentry_get_type:TGType;cdecl;external;
{$endif}

implementation


end.
