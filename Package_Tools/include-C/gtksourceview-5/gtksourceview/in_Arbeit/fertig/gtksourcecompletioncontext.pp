
unit gtksourcecompletioncontext;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcecompletioncontext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcecompletioncontext.h
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
PGListModel  = ^GListModel;
PGtkSourceBuffer  = ^GtkSourceBuffer;
PGtkSourceCompletion  = ^GtkSourceCompletion;
PGtkSourceCompletionActivation  = ^GtkSourceCompletionActivation;
PGtkSourceCompletionContext  = ^GtkSourceCompletionContext;
PGtkSourceCompletionProvider  = ^GtkSourceCompletionProvider;
PGtkSourceLanguage  = ^GtkSourceLanguage;
PGtkSourceView  = ^GtkSourceView;
PGtkTextIter  = ^GtkTextIter;
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
(** unsupported pragma#pragma once*)
{$include <gtk/gtk.h>}
{$include "gtksourcetypes.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_COMPLETION_CONTEXT : longint; { return type might be wrong }

type
  PGtkSourceCompletionActivation = ^TGtkSourceCompletionActivation;
  TGtkSourceCompletionActivation =  Longint;
  Const
    GTK_SOURCE_COMPLETION_ACTIVATION_NONE = 0;
    GTK_SOURCE_COMPLETION_ACTIVATION_INTERACTIVE = 1;
    GTK_SOURCE_COMPLETION_ACTIVATION_USER_REQUESTED = 2;
;
{G_DECLARE_FINAL_TYPE (GtkSourceCompletionContext, gtk_source_completion_context, GTK_SOURCE, COMPLETION_CONTEXT, GObject) }

function gtk_source_completion_context_get_completion(self:PGtkSourceCompletionContext):PGtkSourceCompletion;cdecl;external;
function gtk_source_completion_context_get_activation(self:PGtkSourceCompletionContext):TGtkSourceCompletionActivation;cdecl;external;
function gtk_source_completion_context_get_bounds(self:PGtkSourceCompletionContext; begin:PGtkTextIter; end:PGtkTextIter):Tgboolean;cdecl;external;
function gtk_source_completion_context_get_empty(self:PGtkSourceCompletionContext):Tgboolean;cdecl;external;
function gtk_source_completion_context_get_word(self:PGtkSourceCompletionContext):Pchar;cdecl;external;
function gtk_source_completion_context_get_busy(self:PGtkSourceCompletionContext):Tgboolean;cdecl;external;
function gtk_source_completion_context_get_view(self:PGtkSourceCompletionContext):PGtkSourceView;cdecl;external;
function gtk_source_completion_context_get_buffer(self:PGtkSourceCompletionContext):PGtkSourceBuffer;cdecl;external;
function gtk_source_completion_context_get_language(self:PGtkSourceCompletionContext):PGtkSourceLanguage;cdecl;external;
procedure gtk_source_completion_context_set_proposals_for_provider(self:PGtkSourceCompletionContext; provider:PGtkSourceCompletionProvider; results:PGListModel);cdecl;external;
function gtk_source_completion_context_get_proposals_for_provider(self:PGtkSourceCompletionContext; provider:PGtkSourceCompletionProvider):PGListModel;cdecl;external;
function gtk_source_completion_context_list_providers(self:PGtkSourceCompletionContext):PGListModel;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_COMPLETION_CONTEXT : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_COMPLETION_CONTEXT:=gtk_source_completion_context_get_type;
  end;


end.
