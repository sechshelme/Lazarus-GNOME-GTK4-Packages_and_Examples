
unit gactiongroupexporter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gactiongroupexporter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gactiongroupexporter.h
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
PGActionGroup  = ^GActionGroup;
Pgchar  = ^gchar;
PGDBusConnection  = ^GDBusConnection;
PGError  = ^GError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2010 Codethink Limited
 * Copyright © 2011 Canonical Limited
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
{$ifndef __G_ACTION_GROUP_EXPORTER_H__}
{$define __G_ACTION_GROUP_EXPORTER_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}
(* Const before type ignored *)

function g_dbus_connection_export_action_group(connection:PGDBusConnection; object_path:Pgchar; action_group:PGActionGroup; error:PPGError):Tguint;cdecl;external;
procedure g_dbus_connection_unexport_action_group(connection:PGDBusConnection; export_id:Tguint);cdecl;external;
{$endif}
{ __G_ACTION_GROUP_EXPORTER_H__  }

implementation


end.
