unit gskcomponenttransfer;

interface

uses
  fp_glib2, fp_gtk4;

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

function gsk_component_transfer_get_type:TGType;cdecl;external libgtk4;
function gsk_component_transfer_new_identity:PGskComponentTransfer;cdecl;external libgtk4;
function gsk_component_transfer_new_levels(n:single):PGskComponentTransfer;cdecl;external libgtk4;
function gsk_component_transfer_new_linear(m:single; b:single):PGskComponentTransfer;cdecl;external libgtk4;
function gsk_component_transfer_new_gamma(amp:single; exp:single; ofs:single):PGskComponentTransfer;cdecl;external libgtk4;
function gsk_component_transfer_new_discrete(n:Tguint; values:Psingle):PGskComponentTransfer;cdecl;external libgtk4;
function gsk_component_transfer_new_table(n:Tguint; values:Psingle):PGskComponentTransfer;cdecl;external libgtk4;
function gsk_component_transfer_copy(other:PGskComponentTransfer):PGskComponentTransfer;cdecl;external libgtk4;
procedure gsk_component_transfer_free(self:PGskComponentTransfer);cdecl;external libgtk4;
function gsk_component_transfer_equal(self:Tgconstpointer; other:Tgconstpointer):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GskComponentTransfer, gsk_component_transfer_free) }

// === Konventiert am: 4-7-26 20:08:12 ===

function GSK_TYPE_COMPONENT_TRANSFER : TGType;

implementation

function GSK_TYPE_COMPONENT_TRANSFER : TGType;
  begin
    GSK_TYPE_COMPONENT_TRANSFER:=gsk_component_transfer_get_type;
  end;



end.
