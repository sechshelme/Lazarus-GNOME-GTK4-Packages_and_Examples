unit gpowerprofilemonitor;

interface

uses
  fp_glib2;

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

{G_DECLARE_INTERFACE (GPowerProfileMonitor, g_power_profile_monitor, g, power_profile_monitor, GObject) }
{< private > }
type
  PGPowerProfileMonitorInterface = ^TGPowerProfileMonitorInterface;
  TGPowerProfileMonitorInterface = record
      g_iface : TGTypeInterface;
    end;


function g_power_profile_monitor_dup_default:PGPowerProfileMonitor;cdecl;external libgio2;
function g_power_profile_monitor_get_power_saver_enabled(monitor:PGPowerProfileMonitor):Tgboolean;cdecl;external libgio2;
{$endif}
{ __G_POWER_PROFILE_MONITOR_H__  }

// === Konventiert am: 26-6-26 19:48:39 ===

function g_TYPE_power_profile_monitor: TGType;
function g_power_profile_monitor(obj: Pointer): PGPowerProfileMonitor;
function g_IS_power_profile_monitor(obj: Pointer): Tgboolean;
function g_power_profile_monitor_GET_IFACE(obj: Pointer): PGPowerProfileMonitorInterface;

implementation

function g_TYPE_power_profile_monitor: TGType;
begin
  Result := g_power_profile_monitor_get_type;
end;

function g_power_profile_monitor(obj: Pointer): PGPowerProfileMonitor;
begin
  Result := PGPowerProfileMonitor(g_type_check_instance_cast(obj, g_TYPE_power_profile_monitor));
end;

function g_IS_power_profile_monitor(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, g_TYPE_power_profile_monitor);
end;

function g_power_profile_monitor_GET_IFACE(obj: Pointer): PGPowerProfileMonitorInterface;
begin
  Result := g_type_interface_peek(obj, g_TYPE_power_profile_monitor);
end;

type 
  TGPowerProfileMonitor = record
  end;
  PGPowerProfileMonitor = ^TGPowerProfileMonitor;

  TGPowerProfileMonitorInterface = record
  end;
  PGPowerProfileMonitorInterface = ^TGPowerProfileMonitorInterface;

function g_power_profile_monitor_get_type: TGType; cdecl; external libgxxxxxxx;



end.
