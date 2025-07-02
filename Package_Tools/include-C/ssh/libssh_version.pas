unit libssh_version;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of the SSH Library
 *
 * Copyright (c) 2020 by Heiko Thiery
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  }
{$ifndef _LIBSSH_VERSION_H}
{$define _LIBSSH_VERSION_H}
{ libssh version macros  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function SSH_VERSION_INT(a,b,c : longint) : longint;

{#define SSH_VERSION_DOT(a, b, c) a ##.## b ##.## c }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SSH_VERSION(a,b,c : longint) : longint;

{ libssh version  }
const
  LIBSSH_VERSION_MAJOR = 0;  
  LIBSSH_VERSION_MINOR = 10;  
  LIBSSH_VERSION_MICRO = 6;  

{ was #define dname def_expr }
function LIBSSH_VERSION_INT : longint; { return type might be wrong }

{ was #define dname def_expr }
function LIBSSH_VERSION : longint; { return type might be wrong }

{$endif}
{ _LIBSSH_VERSION_H  }

// === Konventiert am: 2-7-25 17:32:26 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SSH_VERSION_INT(a,b,c : longint) : longint;
begin
  SSH_VERSION_INT:=((a shl 16) or (b shl 8)) or c;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SSH_VERSION(a,b,c : longint) : longint;
begin
  SSH_VERSION:=SSH_VERSION_DOT(a,b,c);
end;

{ was #define dname def_expr }
function LIBSSH_VERSION_INT : longint; { return type might be wrong }
  begin
    LIBSSH_VERSION_INT:=SSH_VERSION_INT(LIBSSH_VERSION_MAJOR,LIBSSH_VERSION_MINOR,LIBSSH_VERSION_MICRO);
  end;

{ was #define dname def_expr }
function LIBSSH_VERSION : longint; { return type might be wrong }
  begin
    LIBSSH_VERSION:=SSH_VERSION(LIBSSH_VERSION_MAJOR,LIBSSH_VERSION_MINOR,LIBSSH_VERSION_MICRO);
  end;


end.
