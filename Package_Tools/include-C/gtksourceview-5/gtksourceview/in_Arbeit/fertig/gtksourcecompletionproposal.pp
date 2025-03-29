
unit gtksourcecompletionproposal;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcecompletionproposal.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcecompletionproposal.h
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
PGtkSourceCompletionProposal  = ^GtkSourceCompletionProposal;
PGtkSourceCompletionProposalInterface  = ^GtkSourceCompletionProposalInterface;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2020 Christian Hergert <chergert@redhat.com>
 *
 * GtkSourceView is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * GtkSourceView is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
{$include <glib-object.h>}
{$include "gtksourcetypes.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_COMPLETION_PROPOSAL : longint; { return type might be wrong }

{G_DECLARE_INTERFACE (GtkSourceCompletionProposal, gtk_source_completion_proposal, GTK_SOURCE, COMPLETION_PROPOSAL, GObject) }
type
  PGtkSourceCompletionProposalInterface = ^TGtkSourceCompletionProposalInterface;
  TGtkSourceCompletionProposalInterface = record
      parent_iface : TGTypeInterface;
      get_typed_text : function (proposal:PGtkSourceCompletionProposal):Pchar;cdecl;
    end;


function gtk_source_completion_proposal_get_typed_text(proposal:PGtkSourceCompletionProposal):Pchar;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_COMPLETION_PROPOSAL : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_COMPLETION_PROPOSAL:=gtk_source_completion_proposal_get_type;
  end;


end.
