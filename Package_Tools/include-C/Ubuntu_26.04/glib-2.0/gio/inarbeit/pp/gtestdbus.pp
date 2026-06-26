
unit gtestdbus;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtestdbus.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtestdbus.h
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
PGTestDBus  = ^GTestDBus;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO testing utilities
 *
 * Copyright (C) 2008-2010 Red Hat, Inc.
 * Copyright (C) 2012 Collabora Ltd. <http://www.collabora.co.uk/>
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
 *          Xavier Claessens <xavier.claessens@collabora.co.uk>
  }
{$ifndef __G_TEST_DBUS_H__}
{$define __G_TEST_DBUS_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_TEST_DBUS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TEST_DBUS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TEST_DBUS(obj : longint) : longint;

function g_test_dbus_get_type:TGType;cdecl;external;
function g_test_dbus_new(flags:TGTestDBusFlags):PGTestDBus;cdecl;external;
function g_test_dbus_get_flags(self:PGTestDBus):TGTestDBusFlags;cdecl;external;
(* Const before type ignored *)
function g_test_dbus_get_bus_address(self:PGTestDBus):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure g_test_dbus_add_service_dir(self:PGTestDBus; path:Pgchar);cdecl;external;
procedure g_test_dbus_up(self:PGTestDBus);cdecl;external;
procedure g_test_dbus_stop(self:PGTestDBus);cdecl;external;
procedure g_test_dbus_down(self:PGTestDBus);cdecl;external;
procedure g_test_dbus_unset;cdecl;external;
{$endif}
{ __G_TEST_DBUS_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_TEST_DBUS : longint; { return type might be wrong }
  begin
    G_TYPE_TEST_DBUS:=g_test_dbus_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TEST_DBUS(obj : longint) : longint;
begin
  G_TEST_DBUS:=G_TYPE_CHECK_INSTANCE_CAST(obj,G_TYPE_TEST_DBUS,GTestDBus);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TEST_DBUS(obj : longint) : longint;
begin
  G_IS_TEST_DBUS:=G_TYPE_CHECK_INSTANCE_TYPE(obj,G_TYPE_TEST_DBUS);
end;


end.
