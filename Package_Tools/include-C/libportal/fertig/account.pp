
unit account;
interface

{
  Automatically converted by H2Pas 1.0.0 from account.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    account.h
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
PGVariant  = ^GVariant;
PXdpParent  = ^XdpParent;
PXdpPortal  = ^XdpPortal;
PXdpUserInformationFlags  = ^XdpUserInformationFlags;
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
type
  PXdpUserInformationFlags = ^TXdpUserInformationFlags;
  TXdpUserInformationFlags =  Longint;
  Const
    XDP_USER_INFORMATION_FLAG_NONE = 0;
;
(* Const before type ignored *)

procedure xdp_portal_get_user_information(portal:PXdpPortal; parent:PXdpParent; reason:Pchar; flags:TXdpUserInformationFlags; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; data:Tgpointer);cdecl;external;
function xdp_portal_get_user_information_finish(portal:PXdpPortal; result:PGAsyncResult; error:PPGError):PGVariant;cdecl;external;

implementation


end.
