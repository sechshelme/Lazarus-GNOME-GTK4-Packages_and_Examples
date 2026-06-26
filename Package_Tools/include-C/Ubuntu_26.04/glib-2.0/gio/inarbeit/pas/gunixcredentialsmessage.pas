unit gunixcredentialsmessage;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2010 Red Hat, Inc.
 * Copyright (C) 2009 Codethink Limited
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
 * Authors: David Zeuthen <davidz@redhat.com>
  }
{$ifndef __G_UNIX_CREDENTIALS_MESSAGE_H__}
{$define __G_UNIX_CREDENTIALS_MESSAGE_H__}
{$include <gio/gio.h>}

type
{*
 * GUnixCredentialsMessageClass:
 *
 * Class structure for #GUnixCredentialsMessage.
 *
 * Since: 2.26
  }
{< private > }
{ Padding for future expansion  }
  PGUnixCredentialsMessageClass = ^TGUnixCredentialsMessageClass;
  TGUnixCredentialsMessageClass = record
      parent_class : TGSocketControlMessageClass;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
    end;

  PGUnixCredentialsMessage = ^TGUnixCredentialsMessage;
  TGUnixCredentialsMessage = record
      parent_instance : TGSocketControlMessage;
      priv : PGUnixCredentialsMessagePrivate;
    end;


function g_unix_credentials_message_get_type:TGType;cdecl;external libgio2;
function g_unix_credentials_message_new:PGSocketControlMessage;cdecl;external libgio2;
function g_unix_credentials_message_new_with_credentials(credentials:PGCredentials):PGSocketControlMessage;cdecl;external libgio2;
function g_unix_credentials_message_get_credentials(message:PGUnixCredentialsMessage):PGCredentials;cdecl;external libgio2;
function g_unix_credentials_message_is_supported:Tgboolean;cdecl;external libgio2;
{$endif}
{ __G_UNIX_CREDENTIALS_MESSAGE_H__  }

// === Konventiert am: 26-6-26 20:03:27 ===

function G_TYPE_UNIX_CREDENTIALS_MESSAGE : TGType;
function G_UNIX_CREDENTIALS_MESSAGE(obj : Pointer) : PGUnixCredentialsMessage;
function G_UNIX_CREDENTIALS_MESSAGE_CLASS(klass : Pointer) : PGUnixCredentialsMessageClass;
function G_IS_UNIX_CREDENTIALS_MESSAGE(obj : Pointer) : Tgboolean;
function G_IS_UNIX_CREDENTIALS_MESSAGE_CLASS(klass : Pointer) : Tgboolean;
function G_UNIX_CREDENTIALS_MESSAGE_GET_CLASS(obj : Pointer) : PGUnixCredentialsMessageClass;

implementation

function G_TYPE_UNIX_CREDENTIALS_MESSAGE : TGType;
  begin
    G_TYPE_UNIX_CREDENTIALS_MESSAGE:=g_unix_credentials_message_get_type;
  end;

function G_UNIX_CREDENTIALS_MESSAGE(obj : Pointer) : PGUnixCredentialsMessage;
begin
  Result := PGUnixCredentialsMessage(g_type_check_instance_cast(obj, G_TYPE_UNIX_CREDENTIALS_MESSAGE));
end;

function G_UNIX_CREDENTIALS_MESSAGE_CLASS(klass : Pointer) : PGUnixCredentialsMessageClass;
begin
  Result := PGUnixCredentialsMessageClass(g_type_check_class_cast(klass, G_TYPE_UNIX_CREDENTIALS_MESSAGE));
end;

function G_IS_UNIX_CREDENTIALS_MESSAGE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_UNIX_CREDENTIALS_MESSAGE);
end;

function G_IS_UNIX_CREDENTIALS_MESSAGE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_UNIX_CREDENTIALS_MESSAGE);
end;

function G_UNIX_CREDENTIALS_MESSAGE_GET_CLASS(obj : Pointer) : PGUnixCredentialsMessageClass;
begin
  Result := PGUnixCredentialsMessageClass(PGTypeInstance(obj)^.g_class);
end;



end.
