
unit procio;
interface

{
  Automatically converted by H2Pas 1.0.0 from procio.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    procio.h
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
Pglibtop_proc_io  = ^glibtop_proc_io;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 2017 Robert Roth
   This file is part of LibGTop.

   Contributed by Robert Roth <robert.roth.off@gmail.com>, February 2017.

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
{$ifndef __GLIBTOP_PROCIO_H__}
{$define __GLIBTOP_PROCIO_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_PROC_IO_DISK_RCHAR = 0;  
  GLIBTOP_PROC_IO_DISK_WCHAR = 1;  
  GLIBTOP_PROC_IO_DISK_RBYTES = 2;  
  GLIBTOP_PROC_IO_DISK_WBYTES = 3;  
  GLIBTOP_MAX_PROC_IO = 3;  
type
{ Time section  }
{*
 * glibtop_proc_io:
 * @disk_rchar: The number of bytes which this task has caused to be read from storage. This
 * is simply the sum of bytes which this process passed to read() and pread(), also including tty IO,
 * and it is unaffected by whether or not actual physical disk IO was required.
 * @disk_wchar: The number of bytes which this task has caused, or shall cause to be written
 * to disk. Similar caveats apply here as with rchar.
 * @disk_rbytes: Attempt to count the number of bytes which this process really did cause to
 * be fetched from the storage layer. Done at the submit_bio() level, so it is
 * accurate for block-backed filesystems.
 * @disk_wbytes: Attempt to count the number of bytes which this process caused to be sent to
 * the storage layer. This is done at page-dirtying time.
 *
 * Process disk io data filled by glibtop_get_proc_io().
 *
  }
{ reserved for future extensions, e.g. per-process netio  }
  Pglibtop_proc_io = ^Tglibtop_proc_io;
  Tglibtop_proc_io = record
      flags : Tguint64;
      disk_rchar : Tguint64;
      disk_wchar : Tguint64;
      disk_rbytes : Tguint64;
      disk_wbytes : Tguint64;
      reserved : array[0..9] of Tguint64;
    end;


procedure glibtop_get_proc_io(buf:Pglibtop_proc_io; pid:Tpid_t);cdecl;external;
{$if GLIBTOP_SUID_PROC_IO}

const
  glibtop_get_proc_io_r = glibtop_get_proc_io_p;  
{$else}

const
  glibtop_get_proc_io_r = glibtop_get_proc_io_s;  
{$endif}

procedure glibtop_get_proc_io_l(server:Pglibtop; buf:Pglibtop_proc_io; pid:Tpid_t);cdecl;external;
{$if GLIBTOP_SUID_PROC_IO}

procedure _glibtop_init_proc_io_p(server:Pglibtop);cdecl;external;
procedure glibtop_get_proc_io_p(server:Pglibtop; buf:Pglibtop_proc_io; pid:Tpid_t);cdecl;external;
{$else}

procedure _glibtop_init_proc_io_s(server:Pglibtop);cdecl;external;
procedure glibtop_get_proc_io_s(server:Pglibtop; buf:Pglibtop_proc_io; pid:Tpid_t);cdecl;external;
{$endif}
{$endif}

implementation


end.
