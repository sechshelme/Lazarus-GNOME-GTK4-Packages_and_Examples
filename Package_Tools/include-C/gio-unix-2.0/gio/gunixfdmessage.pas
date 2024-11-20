unit gunixfdmessage;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums;

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


function g_unix_fd_message_get_type:TGType;cdecl;external libgio2;
function g_unix_fd_message_new_with_fd_list(fd_list:PGUnixFDList):PGSocketControlMessage;cdecl;external libgio2;
function g_unix_fd_message_new:PGSocketControlMessage;cdecl;external libgio2;
function g_unix_fd_message_get_fd_list(message:PGUnixFDMessage):PGUnixFDList;cdecl;external libgio2;
function g_unix_fd_message_steal_fds(message:PGUnixFDMessage; length:Pgint):Pgint;cdecl;external libgio2;
function g_unix_fd_message_append_fd(message:PGUnixFDMessage; fd:Tgint; error:PPGError):Tgboolean;cdecl;external libgio2;
{$endif}
{ __G_UNIX_FD_MESSAGE_H__  }

// === Konventiert am: 20-11-24 15:19:26 ===

function G_TYPE_UNIX_FD_MESSAGE : TGType;
function G_UNIX_FD_MESSAGE(obj : Pointer) : PGUnixFDMessage;
function G_UNIX_FD_MESSAGE_CLASS(klass : Pointer) : PGUnixFDMessageClass;
function G_IS_UNIX_FD_MESSAGE(obj : Pointer) : Tgboolean;
function G_IS_UNIX_FD_MESSAGE_CLASS(klass : Pointer) : Tgboolean;
function G_UNIX_FD_MESSAGE_GET_CLASS(obj : Pointer) : PGUnixFDMessageClass;

implementation

function G_TYPE_UNIX_FD_MESSAGE : TGType;
  begin
    G_TYPE_UNIX_FD_MESSAGE:=g_unix_fd_message_get_type;
  end;

function G_UNIX_FD_MESSAGE(obj : Pointer) : PGUnixFDMessage;
begin
  Result := PGUnixFDMessage(g_type_check_instance_cast(obj, G_TYPE_UNIX_FD_MESSAGE));
end;

function G_UNIX_FD_MESSAGE_CLASS(klass : Pointer) : PGUnixFDMessageClass;
begin
  Result := PGUnixFDMessageClass(g_type_check_class_cast(klass, G_TYPE_UNIX_FD_MESSAGE));
end;

function G_IS_UNIX_FD_MESSAGE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_UNIX_FD_MESSAGE);
end;

function G_IS_UNIX_FD_MESSAGE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_UNIX_FD_MESSAGE);
end;

function G_UNIX_FD_MESSAGE_GET_CLASS(obj : Pointer) : PGUnixFDMessageClass;
begin
  Result := PGUnixFDMessageClass(PGTypeInstance(obj)^.g_class);
end;



end.
