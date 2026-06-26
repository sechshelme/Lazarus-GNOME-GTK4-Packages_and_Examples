
unit gpowerprofilemonitor;
interface

{
  Automatically converted by H2Pas 1.0.0 from gpowerprofilemonitor.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gpowerprofilemonitor.h
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
PGPowerProfileMonitor  = ^GPowerProfileMonitor;
PGPowerProfileMonitorInterface  = ^GPowerProfileMonitorInterface;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright 2019 Red Hat, Inc.
 * Copyright 2021 Igalia S.L.
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
  }
{$ifndef __G_POWER_PROFILE_MONITOR_H__}
{$define __G_POWER_PROFILE_MONITOR_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}
{*
 * G_POWER_PROFILE_MONITOR_EXTENSION_POINT_NAME:
 *
 * Extension point for power profile usage monitoring functionality.
 * See [Extending GIO](overview.html#extending-gio).
 *
 * Since: 2.70
  }

const
  G_POWER_PROFILE_MONITOR_EXTENSION_POINT_NAME = 'gio-power-profile-monitor';  

{ was #define dname def_expr }
function G_TYPE_POWER_PROFILE_MONITOR : longint; { return type might be wrong }

{G_DECLARE_INTERFACE (GPowerProfileMonitor, g_power_profile_monitor, g, power_profile_monitor, GObject) }
{< private > }
type
  PGPowerProfileMonitorInterface = ^TGPowerProfileMonitorInterface;
  TGPowerProfileMonitorInterface = record
      g_iface : TGTypeInterface;
    end;


function g_power_profile_monitor_dup_default:PGPowerProfileMonitor;cdecl;external;
function g_power_profile_monitor_get_power_saver_enabled(monitor:PGPowerProfileMonitor):Tgboolean;cdecl;external;
{$endif}
{ __G_POWER_PROFILE_MONITOR_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_POWER_PROFILE_MONITOR : longint; { return type might be wrong }
  begin
    G_TYPE_POWER_PROFILE_MONITOR:=g_power_profile_monitor_get_type;
  end;


end.
