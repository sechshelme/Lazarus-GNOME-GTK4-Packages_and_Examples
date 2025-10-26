
unit disk;
interface

{
  Automatically converted by H2Pas 1.0.0 from disk.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    disk.h
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
Pglibtop_disk  = ^glibtop_disk;
Ppartition_info  = ^partition_info;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 1998-99 Martin Baulig
   This file is part of LibGTop 1.0.

   Contributed by James Dominic P. Guana <guana.histark@gmail.com>, May 2020.

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
{$ifndef __GLIBTOP_DISK_H__}
{$define __GLIBTOP_DISK_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_XDISK_SECTORS_READ = 0;  
  GLIBTOP_XDISK_TIME_READ = 1;  
  GLIBTOP_XDISK_SECTORS_WRITE = 2;  
  GLIBTOP_XDISK_TIME_WRITE = 3;  
  GLIBTOP_MAX_DISK = 4;  
{ Nobody should really be using more than 4 disk.
   Yes we are :)
   Nobody should really be using more than 32 disk.
 }
  GLIBTOP_NDISK = 1024;  
type
  Ppartition_info = ^Tpartition_info;
  Tpartition_info = record
      name : array[0..255] of char;
      _type : array[0..255] of char;
      raid_num : array[0..255] of char;
      max : longint;
    end;

{ NOT USED YET		 }
{ GLIBTOP_XDISK_SECTORS_READ		 }
{ GLIBTOP_XDISK_TIME_READ		 }
{ GLIBTOP_XDISK_SECTORS_WRITE		 }
{ GLIBTOP_XDISK_TIME_WRITE		 }
  Pglibtop_disk = ^Tglibtop_disk;
  Tglibtop_disk = record
      flags : Tguint64;
      xdisk_sectors_read : array[0..(GLIBTOP_NDISK)-1] of Tguint64;
      xdisk_time_read : array[0..(GLIBTOP_NDISK)-1] of Tguint64;
      xdisk_sectors_write : array[0..(GLIBTOP_NDISK)-1] of Tguint64;
      xdisk_time_write : array[0..(GLIBTOP_NDISK)-1] of Tguint64;
      xdisk_flags : Tguint64;
    end;


procedure glibtop_get_disk(buf:Pglibtop_disk);cdecl;external;
{$if GLIBTOP_SUID_DISK}

const
  glibtop_get_disk_r = glibtop_get_disk_p;  
{$else}

const
  glibtop_get_disk_r = glibtop_get_disk_s;  
{$endif}

procedure glibtop_get_disk_l(server:Pglibtop; buf:Pglibtop_disk);cdecl;external;
{$if GLIBTOP_SUID_DISK}

procedure _glibtop_init_disk_p(server:Pglibtop);cdecl;external;
procedure glibtop_get_disk_p(server:Pglibtop; buf:Pglibtop_disk);cdecl;external;
{$else}

procedure _glibtop_init_disk_s(server:Pglibtop);cdecl;external;
procedure glibtop_get_disk_s(server:Pglibtop; buf:Pglibtop_disk);cdecl;external;
{$endif}
{$endif}

implementation


end.
