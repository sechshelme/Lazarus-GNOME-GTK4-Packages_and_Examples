
unit email;
interface

{
  Automatically converted by H2Pas 1.0.0 from email.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    email.h
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
PXdpEmailFlags  = ^XdpEmailFlags;
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
type
  PXdpEmailFlags = ^TXdpEmailFlags;
  TXdpEmailFlags =  Longint;
  Const
    XDP_EMAIL_FLAG_NONE = 0;
;
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)

procedure xdp_portal_compose_email(portal:PXdpPortal; parent:PXdpParent; addresses:PPchar; cc:PPchar; bcc:PPchar; 
            subject:Pchar; body:Pchar; attachments:PPchar; flags:TXdpEmailFlags; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; data:Tgpointer);cdecl;external;
function xdp_portal_compose_email_finish(portal:PXdpPortal; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;

implementation


end.
