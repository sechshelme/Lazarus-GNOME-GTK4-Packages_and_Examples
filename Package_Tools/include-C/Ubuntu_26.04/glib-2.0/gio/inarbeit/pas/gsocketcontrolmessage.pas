unit gsocketcontrolmessage;

interface

uses
  fp_glib2;

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
{$ifndef __G_SOCKET_CONTROL_MESSAGE_H__}
{$define __G_SOCKET_CONTROL_MESSAGE_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

type
{*
 * GSocketControlMessageClass:
 * @get_size: gets the size of the message.
 * @get_level: gets the protocol of the message.
 * @get_type: gets the protocol specific type of the message.
 * @serialize: Writes out the message data.
 * @deserialize: Tries to deserialize a message.
 *
 * Class structure for #GSocketControlMessage.
 * }
{< private > }
{ Padding for future expansion  }
  PGSocketControlMessageClass = ^TGSocketControlMessageClass;
  TGSocketControlMessageClass = record
      parent_class : TGObjectClass;
      get_size : function (message:PGSocketControlMessage):Tgsize;cdecl;
      get_level : function (message:PGSocketControlMessage):longint;cdecl;
      get_type : function (message:PGSocketControlMessage):longint;cdecl;
      serialize : procedure (message:PGSocketControlMessage; data:Tgpointer);cdecl;
      deserialize : function (level:longint; _type:longint; size:Tgsize; data:Tgpointer):PGSocketControlMessage;cdecl;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
    end;

  PGSocketControlMessage = ^TGSocketControlMessage;
  TGSocketControlMessage = record
      parent_instance : TGObject;
      priv : PGSocketControlMessagePrivate;
    end;


function g_socket_control_message_get_type:TGType;cdecl;external libgio2;
function g_socket_control_message_get_size(message:PGSocketControlMessage):Tgsize;cdecl;external libgio2;
function g_socket_control_message_get_level(message:PGSocketControlMessage):longint;cdecl;external libgio2;
function g_socket_control_message_get_msg_type(message:PGSocketControlMessage):longint;cdecl;external libgio2;
procedure g_socket_control_message_serialize(message:PGSocketControlMessage; data:Tgpointer);cdecl;external libgio2;
function g_socket_control_message_deserialize(level:longint; _type:longint; size:Tgsize; data:Tgpointer):PGSocketControlMessage;cdecl;external libgio2;
{$endif}
{ __G_SOCKET_CONTROL_MESSAGE_H__  }

// === Konventiert am: 26-6-26 19:55:21 ===

function G_TYPE_SOCKET_CONTROL_MESSAGE : TGType;
function G_SOCKET_CONTROL_MESSAGE(obj : Pointer) : PGSocketControlMessage;
function G_SOCKET_CONTROL_MESSAGE_CLASS(klass : Pointer) : PGSocketControlMessageClass;
function G_IS_SOCKET_CONTROL_MESSAGE(obj : Pointer) : Tgboolean;
function G_IS_SOCKET_CONTROL_MESSAGE_CLASS(klass : Pointer) : Tgboolean;
function G_SOCKET_CONTROL_MESSAGE_GET_CLASS(obj : Pointer) : PGSocketControlMessageClass;

implementation

function G_TYPE_SOCKET_CONTROL_MESSAGE : TGType;
  begin
    G_TYPE_SOCKET_CONTROL_MESSAGE:=g_socket_control_message_get_type;
  end;

function G_SOCKET_CONTROL_MESSAGE(obj : Pointer) : PGSocketControlMessage;
begin
  Result := PGSocketControlMessage(g_type_check_instance_cast(obj, G_TYPE_SOCKET_CONTROL_MESSAGE));
end;

function G_SOCKET_CONTROL_MESSAGE_CLASS(klass : Pointer) : PGSocketControlMessageClass;
begin
  Result := PGSocketControlMessageClass(g_type_check_class_cast(klass, G_TYPE_SOCKET_CONTROL_MESSAGE));
end;

function G_IS_SOCKET_CONTROL_MESSAGE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_SOCKET_CONTROL_MESSAGE);
end;

function G_IS_SOCKET_CONTROL_MESSAGE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_SOCKET_CONTROL_MESSAGE);
end;

function G_SOCKET_CONTROL_MESSAGE_GET_CLASS(obj : Pointer) : PGSocketControlMessageClass;
begin
  Result := PGSocketControlMessageClass(PGTypeInstance(obj)^.g_class);
end;



end.
