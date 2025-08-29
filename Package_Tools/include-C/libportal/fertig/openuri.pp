
unit openuri;
interface

{
  Automatically converted by H2Pas 1.0.0 from openuri.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    openuri.h
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
PXdpOpenUriFlags  = ^XdpOpenUriFlags;
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
 * XdpOpenUriFlags:
 * @XDP_OPEN_URI_FLAG_NONE: No options
 * @XDP_OPEN_URI_FLAG_ASK: Use an application chooser for the given uri
 * @XDP_OPEN_URI_FLAG_WRITABLE: Allow writing to file (if uri points to a local file that is exported in the document portal and app is sandboxed itself)
 *
 * Options for opening uris.
  }
type
  PXdpOpenUriFlags = ^TXdpOpenUriFlags;
  TXdpOpenUriFlags =  Longint;
  Const
    XDP_OPEN_URI_FLAG_NONE = 0;
    XDP_OPEN_URI_FLAG_ASK = 1 shl 0;
    XDP_OPEN_URI_FLAG_WRITABLE = 1 shl 1;
;
(* Const before type ignored *)

procedure xdp_portal_open_uri(portal:PXdpPortal; parent:PXdpParent; uri:Pchar; flags:TXdpOpenUriFlags; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; data:Tgpointer);cdecl;external;
function xdp_portal_open_uri_finish(portal:PXdpPortal; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure xdp_portal_open_directory(portal:PXdpPortal; parent:PXdpParent; uri:Pchar; flags:TXdpOpenUriFlags; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; data:Tgpointer);cdecl;external;
function xdp_portal_open_directory_finish(portal:PXdpPortal; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;

implementation


end.
