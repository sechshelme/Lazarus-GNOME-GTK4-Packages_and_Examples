
unit gcredentials;
interface

{
  Automatically converted by H2Pas 1.0.0 from gcredentials.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gcredentials.h
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
Pgchar  = ^gchar;
PGCredentials  = ^GCredentials;
PGError  = ^GError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDBus - GLib D-Bus Library
 *
 * Copyright (C) 2008-2010 Red Hat, Inc.
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
 * Author: David Zeuthen <davidz@redhat.com>
  }
{$ifndef __G_CREDENTIALS_H__}
{$define __G_CREDENTIALS_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}
{$ifdef G_OS_UNIX}
{ To get the uid_t type  }
{$include <unistd.h>}
{$include <sys/types.h>}
{$endif}

{ was #define dname def_expr }
function G_TYPE_CREDENTIALS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CREDENTIALS(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CREDENTIALS_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CREDENTIALS_GET_CLASS(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_CREDENTIALS(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_CREDENTIALS_CLASS(k : longint) : longint;

type

function g_credentials_get_type:TGType;cdecl;external;
function g_credentials_new:PGCredentials;cdecl;external;
function g_credentials_to_string(credentials:PGCredentials):Pgchar;cdecl;external;
function g_credentials_get_native(credentials:PGCredentials; native_type:TGCredentialsType):Tgpointer;cdecl;external;
procedure g_credentials_set_native(credentials:PGCredentials; native_type:TGCredentialsType; native:Tgpointer);cdecl;external;
function g_credentials_is_same_user(credentials:PGCredentials; other_credentials:PGCredentials; error:PPGError):Tgboolean;cdecl;external;
{$ifdef G_OS_UNIX}
function g_credentials_get_unix_pid(credentials:PGCredentials; error:PPGError):Tpid_t;cdecl;external;
function g_credentials_get_unix_user(credentials:PGCredentials; error:PPGError):Tuid_t;cdecl;external;
function g_credentials_set_unix_user(credentials:PGCredentials; uid:Tuid_t; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{$endif}
{ __G_CREDENTIALS_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_CREDENTIALS : longint; { return type might be wrong }
  begin
    G_TYPE_CREDENTIALS:=g_credentials_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CREDENTIALS(o : longint) : longint;
begin
  G_CREDENTIALS:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_CREDENTIALS,GCredentials);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CREDENTIALS_CLASS(k : longint) : longint;
begin
  G_CREDENTIALS_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_CREDENTIALS,GCredentialsClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CREDENTIALS_GET_CLASS(o : longint) : longint;
begin
  G_CREDENTIALS_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_CREDENTIALS,GCredentialsClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_CREDENTIALS(o : longint) : longint;
begin
  G_IS_CREDENTIALS:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_CREDENTIALS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_CREDENTIALS_CLASS(k : longint) : longint;
begin
  G_IS_CREDENTIALS_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_CREDENTIALS);
end;


end.
