
unit portal_helpers;
interface

{
  Automatically converted by H2Pas 1.0.0 from portal_helpers.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    portal_helpers.h
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
PGError  = ^GError;
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
{$include <gio/gio.h>}

{ was #define dname def_expr }
function XDP_TYPE_PORTAL : longint; { return type might be wrong }

{ xxxxxxxxxxxxxxxxxxxxxxxxxxx }
{G_DECLARE_FINAL_TYPE (XdpPortal, xdp_portal, XDP, PORTAL, GObject) }
function xdp_portal_new:PXdpPortal;cdecl;external;
function xdp_portal_initable_new(error:PPGError):PXdpPortal;cdecl;external;
function xdp_portal_running_under_flatpak:Tgboolean;cdecl;external;
function xdp_portal_running_under_snap(error:PPGError):Tgboolean;cdecl;external;
function xdp_portal_running_under_sandbox:Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function XDP_TYPE_PORTAL : longint; { return type might be wrong }
  begin
    XDP_TYPE_PORTAL:=xdp_portal_get_type;
  end;


end.
