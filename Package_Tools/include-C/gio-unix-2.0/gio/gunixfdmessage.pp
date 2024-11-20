
unit gunixfdmessage;
interface

{
  Automatically converted by H2Pas 1.0.0 from gunixfdmessage.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gunixfdmessage.h
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
PGError  = ^GError;
Pgint  = ^gint;
PGSocketControlMessage  = ^GSocketControlMessage;
PGUnixFDList  = ^GUnixFDList;
PGUnixFDMessage  = ^GUnixFDMessage;
PGUnixFDMessageClass  = ^GUnixFDMessageClass;
PGUnixFDMessagePrivate  = ^GUnixFDMessagePrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright © 2009 Codethink Limited
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Ryan Lortie <desrt@desrt.ca>
  }
{$ifndef __G_UNIX_FD_MESSAGE_H__}
{$define __G_UNIX_FD_MESSAGE_H__}
{$include <gio/gio.h>}
{$include <gio/gunixfdlist.h>}

{ was #define dname def_expr }
function G_TYPE_UNIX_FD_MESSAGE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_FD_MESSAGE(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_FD_MESSAGE_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_FD_MESSAGE(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_FD_MESSAGE_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_FD_MESSAGE_GET_CLASS(inst : longint) : longint;

type
{< private > }
{ Padding for future expansion  }
  PGUnixFDMessageClass = ^TGUnixFDMessageClass;
  TGUnixFDMessageClass = record
      parent_class : TGSocketControlMessageClass;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
    end;

  PGUnixFDMessage = ^TGUnixFDMessage;
  TGUnixFDMessage = record
      parent_instance : TGSocketControlMessage;
      priv : PGUnixFDMessagePrivate;
    end;


function g_unix_fd_message_get_type:TGType;cdecl;external;
function g_unix_fd_message_new_with_fd_list(fd_list:PGUnixFDList):PGSocketControlMessage;cdecl;external;
function g_unix_fd_message_new:PGSocketControlMessage;cdecl;external;
function g_unix_fd_message_get_fd_list(message:PGUnixFDMessage):PGUnixFDList;cdecl;external;
function g_unix_fd_message_steal_fds(message:PGUnixFDMessage; length:Pgint):Pgint;cdecl;external;
function g_unix_fd_message_append_fd(message:PGUnixFDMessage; fd:Tgint; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __G_UNIX_FD_MESSAGE_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_UNIX_FD_MESSAGE : longint; { return type might be wrong }
  begin
    G_TYPE_UNIX_FD_MESSAGE:=g_unix_fd_message_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_FD_MESSAGE(inst : longint) : longint;
begin
  G_UNIX_FD_MESSAGE:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_UNIX_FD_MESSAGE,GUnixFDMessage);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_FD_MESSAGE_CLASS(_class : longint) : longint;
begin
  G_UNIX_FD_MESSAGE_CLASS:=G_TYPE_CHECK_CLASS_CAST(_class,G_TYPE_UNIX_FD_MESSAGE,GUnixFDMessageClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_FD_MESSAGE(inst : longint) : longint;
begin
  G_IS_UNIX_FD_MESSAGE:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_UNIX_FD_MESSAGE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_FD_MESSAGE_CLASS(_class : longint) : longint;
begin
  G_IS_UNIX_FD_MESSAGE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(_class,G_TYPE_UNIX_FD_MESSAGE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_FD_MESSAGE_GET_CLASS(inst : longint) : longint;
begin
  G_UNIX_FD_MESSAGE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(inst,G_TYPE_UNIX_FD_MESSAGE,GUnixFDMessageClass);
end;


end.
