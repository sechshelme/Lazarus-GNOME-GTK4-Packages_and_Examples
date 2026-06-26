unit gtestdbus;

interface

uses
  fp_glib2;

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

function g_test_dbus_get_type:TGType;cdecl;external libgio2;
function g_test_dbus_new(flags:TGTestDBusFlags):PGTestDBus;cdecl;external libgio2;
function g_test_dbus_get_flags(self:PGTestDBus):TGTestDBusFlags;cdecl;external libgio2;
function g_test_dbus_get_bus_address(self:PGTestDBus):Pgchar;cdecl;external libgio2;
procedure g_test_dbus_add_service_dir(self:PGTestDBus; path:Pgchar);cdecl;external libgio2;
procedure g_test_dbus_up(self:PGTestDBus);cdecl;external libgio2;
procedure g_test_dbus_stop(self:PGTestDBus);cdecl;external libgio2;
procedure g_test_dbus_down(self:PGTestDBus);cdecl;external libgio2;
procedure g_test_dbus_unset;cdecl;external libgio2;
{$endif}
{ __G_TEST_DBUS_H__  }

// === Konventiert am: 26-6-26 19:59:32 ===

function G_TYPE_TEST_DBUS : TGType;
function G_TEST_DBUS(obj : Pointer) : PGTestDBus;
function G_IS_TEST_DBUS(obj : Pointer) : Tgboolean;

implementation

function G_TYPE_TEST_DBUS : TGType;
  begin
    G_TYPE_TEST_DBUS:=g_test_dbus_get_type;
  end;

function G_TEST_DBUS(obj : Pointer) : PGTestDBus;
begin
  Result := PGTestDBus(g_type_check_instance_cast(obj, G_TYPE_TEST_DBUS));
end;

function G_IS_TEST_DBUS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_TEST_DBUS);
end;



end.
