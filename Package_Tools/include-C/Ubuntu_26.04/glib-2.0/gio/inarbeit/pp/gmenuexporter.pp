
unit gmenuexporter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmenuexporter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmenuexporter.h
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
PGDBusConnection  = ^GDBusConnection;
PGError  = ^GError;
PGMenuModel  = ^GMenuModel;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2011 Canonical Ltd.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public
 *  License as published by the Free Software Foundation; either
 *  version 2.1 of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful, but
 *  WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Ryan Lortie <desrt@desrt.ca>
  }
{$ifndef __G_MENU_EXPORTER_H__}
{$define __G_MENU_EXPORTER_H__}
{$include <gio/gdbusconnection.h>}
{$include <gio/gmenumodel.h>}
{*
 * G_MENU_EXPORTER_MAX_SECTION_SIZE:
 *
 * The maximum number of entries in a menu section supported by
 * g_dbus_connection_export_menu_model().
 *
 * The exact value of the limit may change in future GLib versions.
 *
 * Since: 2.76
  }

const
  G_MENU_EXPORTER_MAX_SECTION_SIZE = 1000;  
(* Const before type ignored *)

function g_dbus_connection_export_menu_model(connection:PGDBusConnection; object_path:Pgchar; menu:PGMenuModel; error:PPGError):Tguint;cdecl;external;
procedure g_dbus_connection_unexport_menu_model(connection:PGDBusConnection; export_id:Tguint);cdecl;external;
{$endif}
{ __G_MENU_EXPORTER_H__  }

implementation


end.
