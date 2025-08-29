
unit parent;
interface

{
  Automatically converted by H2Pas 1.0.0 from parent.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    parent.h
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
PXdpParent  = ^XdpParent;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021, Georges Basile Stavracas Neto
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

{ was #define dname def_expr }
function XDP_TYPE_PARENT : longint; { return type might be wrong }

function xdp_parent_get_type:TGType;cdecl;external;
function xdp_parent_copy(source:PXdpParent):PXdpParent;cdecl;external;
procedure xdp_parent_free(parent:PXdpParent);cdecl;external;

implementation

{ was #define dname def_expr }
function XDP_TYPE_PARENT : longint; { return type might be wrong }
  begin
    XDP_TYPE_PARENT:=xdp_parent_get_type;
  end;


end.
