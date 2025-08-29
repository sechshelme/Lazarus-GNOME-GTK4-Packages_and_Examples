
unit updates;
interface

{
  Automatically converted by H2Pas 1.0.0 from updates.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    updates.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PXdpParent  = ^XdpParent;
PXdpPortal  = ^XdpPortal;
PXdpUpdateInstallFlags  = ^XdpUpdateInstallFlags;
PXdpUpdateMonitorFlags  = ^XdpUpdateMonitorFlags;
PXdpUpdateStatus  = ^XdpUpdateStatus;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2018, Matthias Clasen
 *
 * This file is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation, version 3.0 of the
 * License.
 *
 * This file is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: LGPL-3.0-only
  }
(** unsupported pragma#pragma once*)
{$include <libportal/types.h>}
{*
 * XdpUpdateStatus:
 * @XDP_UPDATE_STATUS_RUNNING: Installation in progress
 * @XDP_UPDATE_STATUS_EMPTY: Nothing to install
 * @XDP_UPDATE_STATUS_DONE: Installation finished successfully
 * @XDP_UPDATE_STATUS_FAILED: Installation failed
 *
 * The values of this enum are returned in the
 * [signal@Portal::update-progress] signal to indicate
 * the current progress of an installation.
  }
type
  PXdpUpdateStatus = ^TXdpUpdateStatus;
  TXdpUpdateStatus =  Longint;
  Const
    XDP_UPDATE_STATUS_RUNNING = 0;
    XDP_UPDATE_STATUS_EMPTY = 1;
    XDP_UPDATE_STATUS_DONE = 2;
    XDP_UPDATE_STATUS_FAILED = 3;
;
type
  PXdpUpdateMonitorFlags = ^TXdpUpdateMonitorFlags;
  TXdpUpdateMonitorFlags =  Longint;
  Const
    XDP_UPDATE_MONITOR_FLAG_NONE = 0;
;

procedure xdp_portal_update_monitor_start(portal:PXdpPortal; flags:TXdpUpdateMonitorFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; data:Tgpointer);cdecl;external;
function xdp_portal_update_monitor_start_finish(portal:PXdpPortal; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure xdp_portal_update_monitor_stop(portal:PXdpPortal);cdecl;external;
type
  PXdpUpdateInstallFlags = ^TXdpUpdateInstallFlags;
  TXdpUpdateInstallFlags =  Longint;
  Const
    XDP_UPDATE_INSTALL_FLAG_NONE = 0;
;

procedure xdp_portal_update_install(portal:PXdpPortal; parent:PXdpParent; flags:TXdpUpdateInstallFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            data:Tgpointer);cdecl;external;
function xdp_portal_update_install_finish(portal:PXdpPortal; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;

implementation


end.
