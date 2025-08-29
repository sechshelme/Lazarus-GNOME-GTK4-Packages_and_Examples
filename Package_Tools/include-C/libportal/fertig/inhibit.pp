
unit inhibit;
interface

{
  Automatically converted by H2Pas 1.0.0 from inhibit.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    inhibit.h
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
Pchar  = ^char;
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PXdpInhibitFlags  = ^XdpInhibitFlags;
PXdpLoginSessionState  = ^XdpLoginSessionState;
PXdpParent  = ^XdpParent;
PXdpPortal  = ^XdpPortal;
PXdpSessionMonitorFlags  = ^XdpSessionMonitorFlags;
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
 * XdpInhibitFlags:
 * @XDP_INHIBIT_FLAG_LOGOUT: Inhibit logout
 * @XDP_INHIBIT_FLAG_USER_SWITCH: Inhibit user switching
 * @XDP_INHIBIT_FLAG_SUSPEND: Inhibit suspend
 * @XDP_INHIBIT_FLAG_IDLE: Inhibit the session going idle
 *
 * Flags that determine what session status changes are inhibited.
  }
type
  PXdpInhibitFlags = ^TXdpInhibitFlags;
  TXdpInhibitFlags =  Longint;
  Const
    XDP_INHIBIT_FLAG_LOGOUT = 1 shl 0;
    XDP_INHIBIT_FLAG_USER_SWITCH = 1 shl 1;
    XDP_INHIBIT_FLAG_SUSPEND = 1 shl 2;
    XDP_INHIBIT_FLAG_IDLE = 1 shl 3;
;
(* Const before type ignored *)

procedure xdp_portal_session_inhibit(portal:PXdpPortal; parent:PXdpParent; reason:Pchar; flags:TXdpInhibitFlags; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; data:Tgpointer);cdecl;external;
function xdp_portal_session_inhibit_finish(portal:PXdpPortal; result:PGAsyncResult; error:PPGError):longint;cdecl;external;
procedure xdp_portal_session_uninhibit(portal:PXdpPortal; id:longint);cdecl;external;
{*
 * XdpLoginSessionState:
 * @XDP_LOGIN_SESSION_RUNNING: the session is running
 * @XDP_LOGIN_SESSION_QUERY_END: the session is in the query end phase,
 *     during which applications can save their state or inhibit the
 *     session from ending
 * @XDP_LOGIN_SESSION_ENDING: the session is about to end
 *
 * The values of this enum are returned in the [signal@Portal::session-state-changed] signal
 * to indicate the current state of the user session.
  }
type
  PXdpLoginSessionState = ^TXdpLoginSessionState;
  TXdpLoginSessionState =  Longint;
  Const
    XDP_LOGIN_SESSION_RUNNING = 1;
    XDP_LOGIN_SESSION_QUERY_END = 2;
    XDP_LOGIN_SESSION_ENDING = 3;
;
type
  PXdpSessionMonitorFlags = ^TXdpSessionMonitorFlags;
  TXdpSessionMonitorFlags =  Longint;
  Const
    XDP_SESSION_MONITOR_FLAG_NONE = 0;
;

procedure xdp_portal_session_monitor_start(portal:PXdpPortal; parent:PXdpParent; flags:TXdpSessionMonitorFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            data:Tgpointer);cdecl;external;
function xdp_portal_session_monitor_start_finish(portal:PXdpPortal; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure xdp_portal_session_monitor_stop(portal:PXdpPortal);cdecl;external;
procedure xdp_portal_session_monitor_query_end_response(portal:PXdpPortal);cdecl;external;

implementation


end.
