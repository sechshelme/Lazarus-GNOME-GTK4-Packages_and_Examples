
unit procmap;
interface

{
  Automatically converted by H2Pas 1.0.0 from procmap.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    procmap.h
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
Pglibtop_map_entry  = ^glibtop_map_entry;
Pglibtop_proc_map  = ^glibtop_proc_map;
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
{$ifndef __GLIBTOP_PROC_MAP_H__}
{$define __GLIBTOP_PROC_MAP_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_PROC_MAP_NUMBER = 0;  
  GLIBTOP_PROC_MAP_TOTAL = 1;  
  GLIBTOP_PROC_MAP_SIZE = 2;  
  GLIBTOP_MAX_PROC_MAP = 3;  
  GLIBTOP_MAP_ENTRY_START = 0;  
  GLIBTOP_MAP_ENTRY_END = 1;  
  GLIBTOP_MAP_ENTRY_OFFSET = 2;  
  GLIBTOP_MAP_ENTRY_PERM = 3;  
  GLIBTOP_MAP_ENTRY_INODE = 4;  
  GLIBTOP_MAP_ENTRY_DEVICE = 5;  
  GLIBTOP_MAP_ENTRY_FILENAME = 6;  
{ Smap support  }
  GLIBTOP_MAP_ENTRY_SIZE = 7;  
  GLIBTOP_MAP_ENTRY_RSS = 8;  
  GLIBTOP_MAP_ENTRY_SHARED_CLEAN = 9;  
  GLIBTOP_MAP_ENTRY_SHARED_DIRTY = 10;  
  GLIBTOP_MAP_ENTRY_PRIVATE_CLEAN = 11;  
  GLIBTOP_MAP_ENTRY_PRIVATE_DIRTY = 12;  
  GLIBTOP_MAP_ENTRY_PSS = 13;  
  GLIBTOP_MAP_ENTRY_SWAP = 14;  
  GLIBTOP_MAX_MAP_ENTRY = 15;  
  GLIBTOP_MAP_FILENAME_LEN = 215;  
  GLIBTOP_MAP_PERM_READ = 1;  
  GLIBTOP_MAP_PERM_WRITE = 2;  
  GLIBTOP_MAP_PERM_EXECUTE = 4;  
  GLIBTOP_MAP_PERM_SHARED = 8;  
  GLIBTOP_MAP_PERM_PRIVATE = 16;  
type
  Pglibtop_map_entry = ^Tglibtop_map_entry;
  Tglibtop_map_entry = record
      flags : Tguint64;
      start : Tguint64;
      end : Tguint64;
      offset : Tguint64;
      perm : Tguint64;
      inode : Tguint64;
      device : Tguint64;
      size : Tguint64;
      rss : Tguint64;
      shared_clean : Tguint64;
      shared_dirty : Tguint64;
      private_clean : Tguint64;
      private_dirty : Tguint64;
      pss : Tguint64;
      swap : Tguint64;
      filename : array[0..(GLIBTOP_MAP_FILENAME_LEN+1)-1] of char;
    end;

{ GLIBTOP_PROC_MAP_NUMBER	 }
{ GLIBTOP_PROC_MAP_TOTAL	 }
{ GLIBTOP_PROC_MAP_SIZE	 }
  Pglibtop_proc_map = ^Tglibtop_proc_map;
  Tglibtop_proc_map = record
      flags : Tguint64;
      number : Tguint64;
      total : Tguint64;
      size : Tguint64;
    end;

{*
 * glibtop_get_proc_map:
 * @buf:
 * @pid:
 *
 * Returns: (transfer full) (array zero-terminated=1):
  }

function glibtop_get_proc_map(buf:Pglibtop_proc_map; pid:Tpid_t):Pglibtop_map_entry;cdecl;external;
{*
 * glibtop_get_proc_map_l:
 * @server:
 * @buf: (out):
 * @pid:
 *
 * Returns: (transfer full) (array zero-terminated=1):
  }
{*
 * glibtop_get_proc_map_p:
 * @server:
 * @buf: (out):
 * @pid:
 *
 * Returns: (transfer full) (array zero-terminated=1):
  }
{*
 * glibtop_get_proc_map_s:
 * @server:
 * @buf: (out):
 * @pid:
 *
 * Returns: (transfer full) (array zero-terminated=1):
  }
{$if GLIBTOP_SUID_PROC_MAP}

const
  glibtop_get_proc_map_r = glibtop_get_proc_map_p;  
{$else}

const
  glibtop_get_proc_map_r = glibtop_get_proc_map_s;  
{$endif}

function glibtop_get_proc_map_l(server:Pglibtop; buf:Pglibtop_proc_map; pid:Tpid_t):Pglibtop_map_entry;cdecl;external;
{$if GLIBTOP_SUID_PROC_MAP}

procedure _glibtop_init_proc_map_p(server:Pglibtop);cdecl;external;
function glibtop_get_proc_map_p(server:Pglibtop; buf:Pglibtop_proc_map; pid:Tpid_t):Pglibtop_map_entry;cdecl;external;
{$else}

procedure _glibtop_init_proc_map_s(server:Pglibtop);cdecl;external;
function glibtop_get_proc_map_s(server:Pglibtop; buf:Pglibtop_proc_map; pid:Tpid_t):Pglibtop_map_entry;cdecl;external;
{$endif}

function glibtop_map_entry_get_type:TGType;cdecl;external;
function glibtop_proc_map_get_type:TGType;cdecl;external;
{$endif}

implementation


end.
