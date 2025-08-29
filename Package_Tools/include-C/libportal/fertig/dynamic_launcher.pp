
unit dynamic_launcher;
interface

{
  Automatically converted by H2Pas 1.0.0 from dynamic_launcher.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    dynamic_launcher.h
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
Pguint  = ^guint;
PGVariant  = ^GVariant;
PXdpLauncherType  = ^XdpLauncherType;
PXdpParent  = ^XdpParent;
PXdpPortal  = ^XdpPortal;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2022, Matthew Leeds
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
 * XdpLauncherType:
 * @XDP_LAUNCHER_APPLICATION: a launcher for a regular application
 * @XDP_LAUNCHER_WEBAPP: a launcher for a web app
 *
 * The type of a launcher.
  }
type
  PXdpLauncherType = ^TXdpLauncherType;
  TXdpLauncherType =  Longint;
  Const
    XDP_LAUNCHER_APPLICATION = 1 shl 0;
    XDP_LAUNCHER_WEBAPP = 1 shl 1;
;
(* Const before type ignored *)
(* Const before type ignored *)

procedure xdp_portal_dynamic_launcher_prepare_install(portal:PXdpPortal; parent:PXdpParent; name:Pchar; icon_v:PGVariant; launcher_type:TXdpLauncherType; 
            target:Pchar; editable_name:Tgboolean; editable_icon:Tgboolean; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            data:Tgpointer);cdecl;external;
function xdp_portal_dynamic_launcher_prepare_install_finish(portal:PXdpPortal; result:PGAsyncResult; error:PPGError):PGVariant;cdecl;external;
(* Const before type ignored *)
function xdp_portal_dynamic_launcher_request_install_token(portal:PXdpPortal; name:Pchar; icon_v:PGVariant; error:PPGError):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xdp_portal_dynamic_launcher_install(portal:PXdpPortal; token:Pchar; desktop_file_id:Pchar; desktop_entry:Pchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function xdp_portal_dynamic_launcher_uninstall(portal:PXdpPortal; desktop_file_id:Pchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function xdp_portal_dynamic_launcher_get_desktop_entry(portal:PXdpPortal; desktop_file_id:Pchar; error:PPGError):Pchar;cdecl;external;
(* Const before type ignored *)
function xdp_portal_dynamic_launcher_get_icon(portal:PXdpPortal; desktop_file_id:Pchar; out_icon_format:PPchar; out_icon_size:Pguint; error:PPGError):PGVariant;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xdp_portal_dynamic_launcher_launch(portal:PXdpPortal; desktop_file_id:Pchar; activation_token:Pchar; error:PPGError):Tgboolean;cdecl;external;

implementation


end.
