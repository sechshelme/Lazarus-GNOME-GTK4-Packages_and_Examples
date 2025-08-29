
unit location;
interface

{
  Automatically converted by H2Pas 1.0.0 from location.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    location.h
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
PXdpLocationAccuracy  = ^XdpLocationAccuracy;
PXdpLocationMonitorFlags  = ^XdpLocationMonitorFlags;
PXdpParent  = ^XdpParent;
PXdpPortal  = ^XdpPortal;
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
 * XdpLocationAccuracy:
 * @XDP_LOCATION_ACCURACY_NONE: No particular accuracy
 * @XDP_LOCATION_ACCURACY_COUNTRY: Country-level accuracy
 * @XDP_LOCATION_ACCURACY_CITY: City-level accuracy
 * @XDP_LOCATION_ACCURACY_NEIGHBORHOOD: Neighborhood-level accuracy
 * @XDP_LOCATION_ACCURACY_STREET: Street-level accuracy
 * @XDP_LOCATION_ACCURACY_EXACT: Maximum accuracy
 *
 * The values of this enum indicate the desired level
 * of accuracy for location information.
  }
type
  PXdpLocationAccuracy = ^TXdpLocationAccuracy;
  TXdpLocationAccuracy =  Longint;
  Const
    XDP_LOCATION_ACCURACY_NONE = 0;
    XDP_LOCATION_ACCURACY_COUNTRY = 1;
    XDP_LOCATION_ACCURACY_CITY = 2;
    XDP_LOCATION_ACCURACY_NEIGHBORHOOD = 3;
    XDP_LOCATION_ACCURACY_STREET = 4;
    XDP_LOCATION_ACCURACY_EXACT = 5;
;
type
  PXdpLocationMonitorFlags = ^TXdpLocationMonitorFlags;
  TXdpLocationMonitorFlags =  Longint;
  Const
    XDP_LOCATION_MONITOR_FLAG_NONE = 0;
;

procedure xdp_portal_location_monitor_start(portal:PXdpPortal; parent:PXdpParent; distance_threshold:Tguint; time_threshold:Tguint; accuracy:TXdpLocationAccuracy; 
            flags:TXdpLocationMonitorFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; data:Tgpointer);cdecl;external;
function xdp_portal_location_monitor_start_finish(portal:PXdpPortal; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure xdp_portal_location_monitor_stop(portal:PXdpPortal);cdecl;external;

implementation


end.
