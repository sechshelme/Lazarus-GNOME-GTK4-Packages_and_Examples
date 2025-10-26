
unit parameter;
interface

{
  Automatically converted by H2Pas 1.0.0 from parameter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    parameter.h
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
{$ifndef __GLIBTOP_PARAMETER_H__}
{$define __GLIBTOP_PARAMETER_H__}
{$include <glibtop.h>}

const
  GLIBTOP_PARAM_METHOD = 1;  
  GLIBTOP_PARAM_FEATURES = 2;  
  GLIBTOP_PARAM_COMMAND = 3;  
  GLIBTOP_PARAM_HOST = 4;  
  GLIBTOP_PARAM_PORT = 5;  
  GLIBTOP_PARAM_ERROR_METHOD = 6;  
  GLIBTOP_PARAM_REQUIRED = 7;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function glibtop_get_parameter(p1,p2,p3 : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function glibtop_set_parameter(p1,p2,p3 : longint) : longint;

(* Const before type ignored *)
function glibtop_get_parameter_l(server:Pglibtop; parameter:dword; data_ptr:pointer; data_size:Tsize_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure glibtop_set_parameter_l(server:Pglibtop; parameter:dword; data_ptr:pointer; data_size:Tsize_t);cdecl;external;
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function glibtop_get_parameter(p1,p2,p3 : longint) : longint;
begin
  glibtop_get_parameter:=glibtop_get_parameter_l(glibtop_global_server,p1,p2,p3);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function glibtop_set_parameter(p1,p2,p3 : longint) : longint;
begin
  glibtop_set_parameter:=glibtop_set_parameter_l(glibtop_global_server,p1,p2,p3);
end;


end.
