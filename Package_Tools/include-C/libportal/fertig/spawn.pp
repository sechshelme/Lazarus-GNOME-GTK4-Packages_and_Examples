
unit spawn;
interface

{
  Automatically converted by H2Pas 1.0.0 from spawn.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    spawn.h
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
Plongint  = ^longint;
PXdpPortal  = ^XdpPortal;
PXdpSpawnFlags  = ^XdpSpawnFlags;
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
 * XdpSpawnFlags:
 * @XDP_SPAWN_FLAG_NONE: No flags
 * @XDP_SPAWN_FLAG_CLEARENV: Clear the environment
 * @XDP_SPAWN_FLAG_LATEST: Spawn the latest version of the app
 * @XDP_SPAWN_FLAG_SANDBOX: Spawn in a sandbox (equivalent to the --sandbox option of flatpak run)
 * @XDP_SPAWN_FLAG_NO_NETWORK: Spawn without network (equivalent to the --unshare=network option of flatpak run)
 * @XDP_SPAWN_FLAG_WATCH: Kill the sandbox when the caller disappears from the session bus
 *
 * Flags influencing the spawn operation and how the
 * new sandbox is created.
  }
type
  PXdpSpawnFlags = ^TXdpSpawnFlags;
  TXdpSpawnFlags =  Longint;
  Const
    XDP_SPAWN_FLAG_NONE = 0;
    XDP_SPAWN_FLAG_CLEARENV = 1 shl 0;
    XDP_SPAWN_FLAG_LATEST = 1 shl 1;
    XDP_SPAWN_FLAG_SANDBOX = 1 shl 2;
    XDP_SPAWN_FLAG_NO_NETWORK = 1 shl 3;
    XDP_SPAWN_FLAG_WATCH = 1 shl 4;
;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)

procedure xdp_portal_spawn(portal:PXdpPortal; cwd:Pchar; argv:PPchar; fds:Plongint; map_to:Plongint; 
            n_fds:longint; env:PPchar; flags:TXdpSpawnFlags; sandbox_expose:PPchar; sandbox_expose_ro:PPchar; 
            cancellable:PGCancellable; callback:TGAsyncReadyCallback; data:Tgpointer);cdecl;external;
function xdp_portal_spawn_finish(portal:PXdpPortal; result:PGAsyncResult; error:PPGError):Tpid_t;cdecl;external;
procedure xdp_portal_spawn_signal(portal:PXdpPortal; pid:Tpid_t; signal:longint; to_process_group:Tgboolean);cdecl;external;

implementation


end.
