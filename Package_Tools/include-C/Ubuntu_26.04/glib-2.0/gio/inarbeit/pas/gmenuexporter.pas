unit gmenuexporter;

interface

uses
  fp_glib2;

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

function g_dbus_connection_export_menu_model(connection:PGDBusConnection; object_path:Pgchar; menu:PGMenuModel; error:PPGError):Tguint;cdecl;external libgio2;
procedure g_dbus_connection_unexport_menu_model(connection:PGDBusConnection; export_id:Tguint);cdecl;external libgio2;
{$endif}
{ __G_MENU_EXPORTER_H__  }

// === Konventiert am: 26-6-26 19:38:51 ===


implementation



end.
