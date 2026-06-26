unit gactiongroupexporter;

interface

uses
  fp_glib2;

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

function g_dbus_connection_export_action_group(connection:PGDBusConnection; object_path:Pgchar; action_group:PGActionGroup; error:PPGError):Tguint;cdecl;external libgio2;
procedure g_dbus_connection_unexport_action_group(connection:PGDBusConnection; export_id:Tguint);cdecl;external libgio2;
{$endif}
{ __G_ACTION_GROUP_EXPORTER_H__  }

// === Konventiert am: 26-6-26 16:29:12 ===


implementation



end.
