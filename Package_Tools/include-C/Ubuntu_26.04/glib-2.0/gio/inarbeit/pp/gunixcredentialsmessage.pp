
unit gunixcredentialsmessage;
interface

{
  Automatically converted by H2Pas 1.0.0 from gunixcredentialsmessage.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gunixcredentialsmessage.h
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
PGCredentials  = ^GCredentials;
PGSocketControlMessage  = ^GSocketControlMessage;
PGUnixCredentialsMessage  = ^GUnixCredentialsMessage;
PGUnixCredentialsMessageClass  = ^GUnixCredentialsMessageClass;
PGUnixCredentialsMessagePrivate  = ^GUnixCredentialsMessagePrivate;
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

{ was #define dname def_expr }
function G_TYPE_UNIX_CREDENTIALS_MESSAGE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_CREDENTIALS_MESSAGE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_CREDENTIALS_MESSAGE_CLASS(c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_CREDENTIALS_MESSAGE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_CREDENTIALS_MESSAGE_CLASS(c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_CREDENTIALS_MESSAGE_GET_CLASS(o : longint) : longint;

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


function g_unix_credentials_message_get_type:TGType;cdecl;external;
function g_unix_credentials_message_new:PGSocketControlMessage;cdecl;external;
function g_unix_credentials_message_new_with_credentials(credentials:PGCredentials):PGSocketControlMessage;cdecl;external;
function g_unix_credentials_message_get_credentials(message:PGUnixCredentialsMessage):PGCredentials;cdecl;external;
function g_unix_credentials_message_is_supported:Tgboolean;cdecl;external;
{$endif}
{ __G_UNIX_CREDENTIALS_MESSAGE_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_UNIX_CREDENTIALS_MESSAGE : longint; { return type might be wrong }
  begin
    G_TYPE_UNIX_CREDENTIALS_MESSAGE:=g_unix_credentials_message_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_CREDENTIALS_MESSAGE(o : longint) : longint;
begin
  G_UNIX_CREDENTIALS_MESSAGE:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_UNIX_CREDENTIALS_MESSAGE,GUnixCredentialsMessage);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_CREDENTIALS_MESSAGE_CLASS(c : longint) : longint;
begin
  G_UNIX_CREDENTIALS_MESSAGE_CLASS:=G_TYPE_CHECK_CLASS_CAST(c,G_TYPE_UNIX_CREDENTIALS_MESSAGE,GUnixCredentialsMessageClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_CREDENTIALS_MESSAGE(o : longint) : longint;
begin
  G_IS_UNIX_CREDENTIALS_MESSAGE:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_UNIX_CREDENTIALS_MESSAGE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_CREDENTIALS_MESSAGE_CLASS(c : longint) : longint;
begin
  G_IS_UNIX_CREDENTIALS_MESSAGE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(c,G_TYPE_UNIX_CREDENTIALS_MESSAGE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_CREDENTIALS_MESSAGE_GET_CLASS(o : longint) : longint;
begin
  G_UNIX_CREDENTIALS_MESSAGE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_UNIX_CREDENTIALS_MESSAGE,GUnixCredentialsMessageClass);
end;


end.
