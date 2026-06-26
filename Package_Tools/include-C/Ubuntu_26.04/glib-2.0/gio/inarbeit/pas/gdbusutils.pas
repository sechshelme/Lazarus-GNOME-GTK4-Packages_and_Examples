unit gdbusutils;

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
{$ifndef __G_DBUS_UTILS_H__}
{$define __G_DBUS_UTILS_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

function g_dbus_is_guid(_string:Pgchar):Tgboolean;cdecl;external libgio2;
function g_dbus_generate_guid:Pgchar;cdecl;external libgio2;
function g_dbus_is_name(_string:Pgchar):Tgboolean;cdecl;external libgio2;
function g_dbus_is_unique_name(_string:Pgchar):Tgboolean;cdecl;external libgio2;
function g_dbus_is_member_name(_string:Pgchar):Tgboolean;cdecl;external libgio2;
function g_dbus_is_interface_name(_string:Pgchar):Tgboolean;cdecl;external libgio2;
function g_dbus_is_error_name(_string:Pgchar):Tgboolean;cdecl;external libgio2;
procedure g_dbus_gvariant_to_gvalue(value:PGVariant; out_gvalue:PGValue);cdecl;external libgio2;
function g_dbus_gvalue_to_gvariant(gvalue:PGValue; _type:PGVariantType):PGVariant;cdecl;external libgio2;
function g_dbus_escape_object_path_bytestring(bytes:Pguint8):Pgchar;cdecl;external libgio2;
function g_dbus_escape_object_path(s:Pgchar):Pgchar;cdecl;external libgio2;
function g_dbus_unescape_object_path(s:Pgchar):Pguint8;cdecl;external libgio2;
{$endif}
{ __G_DBUS_UTILS_H__  }

// === Konventiert am: 26-6-26 19:18:07 ===


implementation



end.
