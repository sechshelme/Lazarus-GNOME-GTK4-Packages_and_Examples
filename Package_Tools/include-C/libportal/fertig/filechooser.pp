
unit filechooser;
interface

{
  Automatically converted by H2Pas 1.0.0 from filechooser.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    filechooser.h
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
PXdpOpenFileFlags  = ^XdpOpenFileFlags;
PXdpParent  = ^XdpParent;
PXdpPortal  = ^XdpPortal;
PXdpSaveFileFlags  = ^XdpSaveFileFlags;
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
 * XdpOpenFileFlags:
 * @XDP_OPEN_FILE_FLAG_NONE: No options
 * @XDP_OPEN_FILE_FLAG_MULTIPLE: Allow selecting multiple files
 *
 * Options for opening files.
  }
type
  PXdpOpenFileFlags = ^TXdpOpenFileFlags;
  TXdpOpenFileFlags =  Longint;
  Const
    XDP_OPEN_FILE_FLAG_NONE = 0;
    XDP_OPEN_FILE_FLAG_MULTIPLE = 1 shl 0;
;
(* Const before type ignored *)

procedure xdp_portal_open_file(portal:PXdpPortal; parent:PXdpParent; title:Pchar; filters:PGVariant; current_filter:PGVariant; 
            choices:PGVariant; flags:TXdpOpenFileFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; data:Tgpointer);cdecl;external;
function xdp_portal_open_file_finish(portal:PXdpPortal; result:PGAsyncResult; error:PPGError):PGVariant;cdecl;external;
type
  PXdpSaveFileFlags = ^TXdpSaveFileFlags;
  TXdpSaveFileFlags =  Longint;
  Const
    XDP_SAVE_FILE_FLAG_NONE = 0;
;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

procedure xdp_portal_save_file(portal:PXdpPortal; parent:PXdpParent; title:Pchar; current_name:Pchar; current_folder:Pchar; 
            current_file:Pchar; filters:PGVariant; current_filter:PGVariant; choices:PGVariant; flags:TXdpSaveFileFlags; 
            cancellable:PGCancellable; callback:TGAsyncReadyCallback; data:Tgpointer);cdecl;external;
function xdp_portal_save_file_finish(portal:PXdpPortal; result:PGAsyncResult; error:PPGError):PGVariant;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure xdp_portal_save_files(portal:PXdpPortal; parent:PXdpParent; title:Pchar; current_name:Pchar; current_folder:Pchar; 
            files:PGVariant; choices:PGVariant; flags:TXdpSaveFileFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            data:Tgpointer);cdecl;external;
function xdp_portal_save_files_finish(portal:PXdpPortal; result:PGAsyncResult; error:PPGError):PGVariant;cdecl;external;

implementation


end.
