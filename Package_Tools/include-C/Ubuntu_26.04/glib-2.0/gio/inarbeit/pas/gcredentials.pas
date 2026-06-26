unit gcredentials;

interface

uses
  fp_glib2;

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

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_CREDENTIALS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_CREDENTIALS_CLASS(klass : longint) : longint;

type

function g_credentials_get_type:TGType;cdecl;external libgio2;
function g_credentials_new:PGCredentials;cdecl;external libgio2;
function g_credentials_to_string(credentials:PGCredentials):Pgchar;cdecl;external libgio2;
function g_credentials_get_native(credentials:PGCredentials; native_type:TGCredentialsType):Tgpointer;cdecl;external libgio2;
procedure g_credentials_set_native(credentials:PGCredentials; native_type:TGCredentialsType; native:Tgpointer);cdecl;external libgio2;
function g_credentials_is_same_user(credentials:PGCredentials; other_credentials:PGCredentials; error:PPGError):Tgboolean;cdecl;external libgio2;
{$ifdef G_OS_UNIX}
function g_credentials_get_unix_pid(credentials:PGCredentials; error:PPGError):Tpid_t;cdecl;external libgio2;
function g_credentials_get_unix_user(credentials:PGCredentials; error:PPGError):Tuid_t;cdecl;external libgio2;
function g_credentials_set_unix_user(credentials:PGCredentials; uid:Tuid_t; error:PPGError):Tgboolean;cdecl;external libgio2;
{$endif}
{$endif}
{ __G_CREDENTIALS_H__  }

// === Konventiert am: 26-6-26 16:35:12 ===

function G_TYPE_CREDENTIALS : TGType;
function G_CREDENTIALS(obj : Pointer) : PGCredentials;
function G_CREDENTIALS_CLASS(klass : Pointer) : PGCredentialsClass;
function G_CREDENTIALS_GET_CLASS(obj : Pointer) : PGCredentialsClass;

implementation

function G_TYPE_CREDENTIALS : TGType;
  begin
    G_TYPE_CREDENTIALS:=g_credentials_get_type;
  end;

function G_CREDENTIALS(obj : Pointer) : PGCredentials;
begin
  Result := PGCredentials(g_type_check_instance_cast(obj, G_TYPE_CREDENTIALS));
end;

function G_CREDENTIALS_CLASS(klass : Pointer) : PGCredentialsClass;
begin
  Result := PGCredentialsClass(g_type_check_class_cast(klass, G_TYPE_CREDENTIALS));
end;

function G_CREDENTIALS_GET_CLASS(obj : Pointer) : PGCredentialsClass;
begin
  Result := PGCredentialsClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_CREDENTIALS(obj : longint) : longint;
begin
  G_IS_CREDENTIALS:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_CREDENTIALS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_CREDENTIALS_CLASS(klass : longint) : longint;
begin
  G_IS_CREDENTIALS_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_CREDENTIALS);
end;


end.
