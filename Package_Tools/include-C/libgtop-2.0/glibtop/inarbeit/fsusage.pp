
unit fsusage;
interface

{
  Automatically converted by H2Pas 1.0.0 from fsusage.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fsusage.h
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
Pglibtop_fsusage  = ^glibtop_fsusage;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 1998-99 Martin Baulig

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
{$ifndef __GLIBTOP_FSUSAGE_H__}
{$define __GLIBTOP_FSUSAGE_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_FSUSAGE_BLOCKS = 0;  
  GLIBTOP_FSUSAGE_BFREE = 1;  
  GLIBTOP_FSUSAGE_BAVAIL = 2;  
  GLIBTOP_FSUSAGE_FILES = 3;  
  GLIBTOP_FSUSAGE_FFREE = 4;  
  GLIBTOP_FSUSAGE_BLOCK_SIZE = 5;  
  GLIBTOP_FSUSAGE_READ = 6;  
  GLIBTOP_FSUSAGE_WRITE = 7;  
  GLIBTOP_MAX_FSUSAGE = 8;  
type
{ Total number of blocks.  }
{ Free blocks available to superuser.  }
{ Free blocks available to non-superuser.  }
{ Total file nodes.  }
{ Free file nodes.  }
{ Size of a block in bytes.  }
{ Total blocks read and written  }
  Pglibtop_fsusage = ^Tglibtop_fsusage;
  Tglibtop_fsusage = record
      flags : Tguint64;
      blocks : Tguint64;
      bfree : Tguint64;
      bavail : Tguint64;
      files : Tguint64;
      ffree : Tguint64;
      block_size : Tguint32;
      read : Tguint64;
      write : Tguint64;
    end;

(* Const before type ignored *)

procedure glibtop_get_fsusage(buf:Pglibtop_fsusage; mount_dir:Pchar);cdecl;external;
const
  glibtop_get_fsusage_r = glibtop_get_fsusage_s;  
(* Const before type ignored *)

procedure glibtop_get_fsusage_l(server:Pglibtop; buf:Pglibtop_fsusage; mount_dir:Pchar);cdecl;external;
(* Const before type ignored *)
procedure glibtop_get_fsusage_s(server:Pglibtop; buf:Pglibtop_fsusage; mount_dir:Pchar);cdecl;external;
{$endif}

implementation


end.
