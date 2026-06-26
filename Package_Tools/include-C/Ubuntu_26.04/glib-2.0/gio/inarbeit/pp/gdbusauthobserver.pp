
unit gdbusauthobserver;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdbusauthobserver.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdbusauthobserver.h
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
PGDBusAuthObserver  = ^GDBusAuthObserver;
PGIOStream  = ^GIOStream;
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
{$ifndef __G_DBUS_AUTH_OBSERVER_H__}
{$define __G_DBUS_AUTH_OBSERVER_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_DBUS_AUTH_OBSERVER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_AUTH_OBSERVER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_AUTH_OBSERVER(o : longint) : longint;

function g_dbus_auth_observer_get_type:TGType;cdecl;external;
function g_dbus_auth_observer_new:PGDBusAuthObserver;cdecl;external;
function g_dbus_auth_observer_authorize_authenticated_peer(observer:PGDBusAuthObserver; stream:PGIOStream; credentials:PGCredentials):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_dbus_auth_observer_allow_mechanism(observer:PGDBusAuthObserver; mechanism:Pgchar):Tgboolean;cdecl;external;
{$endif}
{ _G_DBUS_AUTH_OBSERVER_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_DBUS_AUTH_OBSERVER : longint; { return type might be wrong }
  begin
    G_TYPE_DBUS_AUTH_OBSERVER:=g_dbus_auth_observer_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_AUTH_OBSERVER(o : longint) : longint;
begin
  G_DBUS_AUTH_OBSERVER:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_DBUS_AUTH_OBSERVER,GDBusAuthObserver);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_AUTH_OBSERVER(o : longint) : longint;
begin
  G_IS_DBUS_AUTH_OBSERVER:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_DBUS_AUTH_OBSERVER);
end;


end.
