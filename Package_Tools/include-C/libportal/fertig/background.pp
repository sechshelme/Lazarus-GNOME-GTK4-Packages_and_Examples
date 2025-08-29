
unit background;
interface

{
  Automatically converted by H2Pas 1.0.0 from background.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    background.h
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
PGPtrArray  = ^GPtrArray;
PXdpBackgroundFlags  = ^XdpBackgroundFlags;
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
 * XdpBackgroundFlags:
 * @XDP_BACKGROUND_FLAG_NONE: No options
 * @XDP_BACKGROUND_FLAG_AUTOSTART: Request autostart as well
 * @XDP_BACKGROUND_FLAG_ACTIVATABLE: Whether the application is D-Bus-activatable
 *
 * Options to use when requesting background.
  }
type
  PXdpBackgroundFlags = ^TXdpBackgroundFlags;
  TXdpBackgroundFlags =  Longint;
  Const
    XDP_BACKGROUND_FLAG_NONE = 0;
    XDP_BACKGROUND_FLAG_AUTOSTART = 1 shl 0;
    XDP_BACKGROUND_FLAG_ACTIVATABLE = 1 shl 1;
;

procedure xdp_portal_request_background(portal:PXdpPortal; parent:PXdpParent; reason:Pchar; commandline:PGPtrArray; flags:TXdpBackgroundFlags; 
            cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function xdp_portal_request_background_finish(portal:PXdpPortal; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure xdp_portal_set_background_status(portal:PXdpPortal; status_message:Pchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; data:Tgpointer);cdecl;external;
function xdp_portal_set_background_status_finish(portal:PXdpPortal; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;

implementation


end.
