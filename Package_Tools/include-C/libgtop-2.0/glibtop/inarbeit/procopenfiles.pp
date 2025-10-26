
unit procopenfiles;
interface

{
  Automatically converted by H2Pas 1.0.0 from procopenfiles.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    procopenfiles.h
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
Pglibtop_file_type  = ^glibtop_file_type;
Pglibtop_open_files_entry  = ^glibtop_open_files_entry;
Pglibtop_proc_open_files  = ^glibtop_proc_open_files;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 1998-99 Martin Baulig
   Copyright (C) 2004 Nicolás Lichtmaier
   This file is part of LibGTop 1.0.

   Contributed by Martin Baulig <martin@home-of-linux.org>, April 1998.

   Modified by Nicolás Lichtmaier to give open process files.

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
{$ifndef __GLIBTOP_PROC_OPEN_FILES_H__}
{$define __GLIBTOP_PROC_OPEN_FILES_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_PROC_OPEN_FILES_NUMBER = 0;  
  GLIBTOP_PROC_OPEN_FILES_TOTAL = 1;  
  GLIBTOP_PROC_OPEN_FILES_SIZE = 2;  
  GLIBTOP_MAX_PROC_OPEN_FILES = 3;  
  GLIBTOP_FILE_ENTRY_FD = 0;  
  GLIBTOP_FILE_ENTRY_NAME = 1;  
  GLIBTOP_FILE_ENTRY_TYPE = 2;  
  GLIBTOP_FILE_ENTRY_INETSOCKET_DST_HOST = 3;  
  GLIBTOP_FILE_ENTRY_INETSOCKET_DST_PORT = 4;  
  GLIBTOP_MAX_OPEN_FILE_ENTRY = 5;  
  GLIBTOP_OPEN_FILENAME_LEN = 215;  
{ ready for IPv6  }
  GLIBTOP_OPEN_DEST_HOST_LEN = 46;  
type
  Tglibtop_file_type =  Longint;
  Const
    GLIBTOP_FILE_TYPE_FILE = 1;
    GLIBTOP_FILE_TYPE_PIPE = 2;
    GLIBTOP_FILE_TYPE_INETSOCKET = 4;
    GLIBTOP_FILE_TYPE_LOCALSOCKET = 8;
    GLIBTOP_FILE_TYPE_INET6SOCKET = 16;

type
{ An "enum glibtop_file_type" value.  }
{ When type == GLIBTOP_FILE_TYPE_INETSOCKET or
		 * when type == GLIBTOP_FILE_TYPE_INET6SOCKET  }
{ When type == GLIBTOP_FILE_TYPE_FILE  }
{ When type == GLIBTOP_FILE_TYPE_LOCALSOCKET  }
  Pglibtop_open_files_entry = ^Tglibtop_open_files_entry;
  Tglibtop_open_files_entry = record
      fd : longint;
      _type : Tguint16;
      info : record
          case longint of
            0 : ( sock : record
                dest_host : array[0..(GLIBTOP_OPEN_DEST_HOST_LEN+1)-1] of char;
                dest_port : longint;
              end );
            1 : ( file : record
                name : array[0..(GLIBTOP_OPEN_FILENAME_LEN+1)-1] of char;
              end );
            2 : ( localsock : record
                name : array[0..(GLIBTOP_OPEN_FILENAME_LEN+1)-1] of char;
              end );
          end;
    end;

{ GLIBTOP_PROC_OPEN_FILES_NUMBER  }
{ GLIBTOP_PROC_OPEN_FILES_TOTAL   }
{ GLIBTOP_PROC_OPEN_FILES_SIZE    }
  Pglibtop_proc_open_files = ^Tglibtop_proc_open_files;
  Tglibtop_proc_open_files = record
      flags : Tguint64;
      number : Tguint64;
      total : Tguint64;
      size : Tguint64;
    end;

{*
 * glibtop_get_proc_open_files:
 * @buf:
 * @pid:
 *
 * Returns: (transfer full) (array zero-terminated=1):
  }

function glibtop_get_proc_open_files(buf:Pglibtop_proc_open_files; pid:Tpid_t):Pglibtop_open_files_entry;cdecl;external;
{$if GLIBTOP_SUID_PROC_OPEN_FILES}

const
  glibtop_get_proc_open_files_r = glibtop_get_proc_open_files_p;  
{$else}

const
  glibtop_get_proc_open_files_r = glibtop_get_proc_open_files_s;  
{$endif}
{*
 * glibtop_get_proc_open_files_l:
 * @server:
 * @buf: (out):
 * @pid:
 *
 * Returns: (transfer full) (array zero-terminated=1):
  }

function glibtop_get_proc_open_files_l(server:Pglibtop; buf:Pglibtop_proc_open_files; pid:Tpid_t):Pglibtop_open_files_entry;cdecl;external;
{$if GLIBTOP_SUID_PROC_OPEN_FILES}

procedure _glibtop_init_proc_open_files_p(server:Pglibtop);cdecl;external;
{*
 * glibtop_get_proc_open_files_p:
 * @server:
 * @buf: (out):
 * @pid:
 *
 * Returns: (transfer full) (array zero-terminated=1):
  }
function glibtop_get_proc_open_files_p(server:Pglibtop; buf:Pglibtop_proc_open_files; pid:Tpid_t):Pglibtop_open_files_entry;cdecl;external;
{$else}

procedure _glibtop_init_proc_open_files_s(server:Pglibtop);cdecl;external;
function glibtop_get_proc_open_files_s(server:Pglibtop; buf:Pglibtop_proc_open_files; pid:Tpid_t):Pglibtop_open_files_entry;cdecl;external;
{$endif}

function glibtop_open_files_entry_get_type:TGType;cdecl;external;
function glibtop_proc_open_files_get_type:TGType;cdecl;external;
{$endif}

implementation


end.
