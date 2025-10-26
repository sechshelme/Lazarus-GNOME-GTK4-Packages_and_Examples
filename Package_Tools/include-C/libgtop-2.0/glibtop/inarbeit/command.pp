
unit command;
interface

{
  Automatically converted by H2Pas 1.0.0 from command.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    command.h
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
Pglibtop_command  = ^glibtop_command;
Pglibtop_response  = ^glibtop_response;
Pglibtop_response_union  = ^glibtop_response_union;
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
{$ifndef __GLIBTOP_COMMAND_H__}
{$define __GLIBTOP_COMMAND_H__}
{$include <glibtop.h>}
{$include <glibtop/sysdeps.h>}
{$include <glibtop/union.h>}

const
  GLIBTOP_CMND_QUIT = 0;  
  GLIBTOP_CMND_SYSDEPS = 1;  
  GLIBTOP_CMND_CPU = 2;  
  GLIBTOP_CMND_MEM = 3;  
  GLIBTOP_CMND_SWAP = 4;  
  GLIBTOP_CMND_UPTIME = 5;  
  GLIBTOP_CMND_LOADAVG = 6;  
  GLIBTOP_CMND_SHM_LIMITS = 7;  
  GLIBTOP_CMND_MSG_LIMITS = 8;  
  GLIBTOP_CMND_SEM_LIMITS = 9;  
  GLIBTOP_CMND_PROCLIST = 10;  
  GLIBTOP_CMND_PROC_STATE = 11;  
  GLIBTOP_CMND_PROC_UID = 12;  
  GLIBTOP_CMND_PROC_MEM = 13;  
  GLIBTOP_CMND_PROC_TIME = 14;  
  GLIBTOP_CMND_PROC_SIGNAL = 15;  
  GLIBTOP_CMND_PROC_KERNEL = 16;  
  GLIBTOP_CMND_PROC_SEGMENT = 17;  
  GLIBTOP_CMND_PROC_ARGS = 18;  
  GLIBTOP_CMND_PROC_MAP = 19;  
  GLIBTOP_CMND_MOUNTLIST = 20;  
  GLIBTOP_CMND_FSUSAGE = 21;  
  GLIBTOP_CMND_NETLOAD = 22;  
  GLIBTOP_CMND_PPP = 23;  
  GLIBTOP_CMND_NETLIST = 24;  
  GLIBTOP_CMND_PROC_OPEN_FILES = 25;  
  GLIBTOP_CMND_PROC_WD = 26;  
  GLIBTOP_CMND_PROC_AFFINITY = 27;  
  GLIBTOP_CMND_PROC_IO = 28;  
  GLIBTOP_CMND_DISK = 29;  
  GLIBTOP_MAX_CMND = 30;  
  _GLIBTOP_PARAM_SIZE = 16;  
type

  Pglibtop_response_union = ^Tglibtop_response_union;
  Tglibtop_response_union = Tglibtop_response_union;
  Pglibtop_command = ^Tglibtop_command;
  Tglibtop_command = record
      command : Tguint64;
      size : Tguint64;
      data_size : Tguint64;
      parameter : array[0..(_GLIBTOP_PARAM_SIZE)-1] of char;
    end;

  Pglibtop_response_union = ^Tglibtop_response_union;
  Tglibtop_response_union = record
      case longint of
        0 : ( data : Tglibtop_union );
        1 : ( sysdeps : Tglibtop_sysdeps );
      end;

  Pglibtop_response = ^Tglibtop_response;
  Tglibtop_response = record
      offset : Tgint64;
      size : Tguint64;
      data_size : Tguint64;
      u : Tglibtop_response_union;
    end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function glibtop_call(p1,p2,p3,p4 : longint) : longint;

(* Const before type ignored *)
function glibtop_call_l(server:Pglibtop; command:dword; send_size:Tsize_t; send_buf:pointer; recv_size:Tsize_t; 
           recv_buf:pointer):pointer;cdecl;external;
(* Const before type ignored *)
function glibtop_call_s(server:Pglibtop; command:dword; send_size:Tsize_t; send_buf:pointer; recv_size:Tsize_t; 
           recv_buf:pointer):pointer;cdecl;external;
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function glibtop_call(p1,p2,p3,p4 : longint) : longint;
begin
  glibtop_call:=glibtop_call_r(glibtop_global_server,p1,p2,p3,p4);
end;


end.
