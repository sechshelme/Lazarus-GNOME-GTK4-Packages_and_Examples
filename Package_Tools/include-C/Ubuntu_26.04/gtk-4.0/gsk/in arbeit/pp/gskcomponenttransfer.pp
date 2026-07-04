
unit gskcomponenttransfer;
interface

{
  Automatically converted by H2Pas 1.0.0 from gskcomponenttransfer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gskcomponenttransfer.h
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
PGskComponentTransfer  = ^GskComponentTransfer;
Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2025 Red Hat, Inc
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Matthias Clasen <mclasen@redhat.com>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GSK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gsk/gsk.h> can be included directly."}
{$endif}
{$include <gsk/gsktypes.h>}

{ was #define dname def_expr }
function GSK_TYPE_COMPONENT_TRANSFER : longint; { return type might be wrong }

function gsk_component_transfer_get_type:TGType;cdecl;external;
function gsk_component_transfer_new_identity:PGskComponentTransfer;cdecl;external;
function gsk_component_transfer_new_levels(n:single):PGskComponentTransfer;cdecl;external;
function gsk_component_transfer_new_linear(m:single; b:single):PGskComponentTransfer;cdecl;external;
function gsk_component_transfer_new_gamma(amp:single; exp:single; ofs:single):PGskComponentTransfer;cdecl;external;
function gsk_component_transfer_new_discrete(n:Tguint; values:Psingle):PGskComponentTransfer;cdecl;external;
function gsk_component_transfer_new_table(n:Tguint; values:Psingle):PGskComponentTransfer;cdecl;external;
(* Const before type ignored *)
function gsk_component_transfer_copy(other:PGskComponentTransfer):PGskComponentTransfer;cdecl;external;
procedure gsk_component_transfer_free(self:PGskComponentTransfer);cdecl;external;
function gsk_component_transfer_equal(self:Tgconstpointer; other:Tgconstpointer):Tgboolean;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GskComponentTransfer, gsk_component_transfer_free) }

implementation

{ was #define dname def_expr }
function GSK_TYPE_COMPONENT_TRANSFER : longint; { return type might be wrong }
  begin
    GSK_TYPE_COMPONENT_TRANSFER:=gsk_component_transfer_get_type;
  end;


end.
