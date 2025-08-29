
unit camera;
interface

{
  Automatically converted by H2Pas 1.0.0 from camera.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    camera.h
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
PXdpCameraFlags  = ^XdpCameraFlags;
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

function xdp_portal_is_camera_present(portal:PXdpPortal):Tgboolean;cdecl;external;
type
  PXdpCameraFlags = ^TXdpCameraFlags;
  TXdpCameraFlags =  Longint;
  Const
    XDP_CAMERA_FLAG_NONE = 0;
;

procedure xdp_portal_access_camera(portal:PXdpPortal; parent:PXdpParent; flags:TXdpCameraFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            data:Tgpointer);cdecl;external;
function xdp_portal_access_camera_finish(portal:PXdpPortal; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function xdp_portal_open_pipewire_remote_for_camera(portal:PXdpPortal):longint;cdecl;external;

implementation


end.
