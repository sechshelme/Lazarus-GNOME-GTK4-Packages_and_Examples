
unit gtksourcecompletionprovider;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcecompletionprovider.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcecompletionprovider.h
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
PGListModel  = ^GListModel;
PGPtrArray  = ^GPtrArray;
PGtkSourceCompletionCell  = ^GtkSourceCompletionCell;
PGtkSourceCompletionContext  = ^GtkSourceCompletionContext;
PGtkSourceCompletionProposal  = ^GtkSourceCompletionProposal;
PGtkSourceCompletionProvider  = ^GtkSourceCompletionProvider;
PGtkSourceCompletionProviderInterface  = ^GtkSourceCompletionProviderInterface;
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
{$include "gtksourcetypes.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_COMPLETION_PROVIDER : longint; { return type might be wrong }

{G_DECLARE_INTERFACE (GtkSourceCompletionProvider, gtk_source_completion_provider, GTK_SOURCE, COMPLETION_PROVIDER, GObject) }
(* Const before type ignored *)
type
  PGtkSourceCompletionProviderInterface = ^TGtkSourceCompletionProviderInterface;
  TGtkSourceCompletionProviderInterface = record
      parent_iface : TGTypeInterface;
      get_title : function (self:PGtkSourceCompletionProvider):Pchar;cdecl;
      get_priority : function (self:PGtkSourceCompletionProvider; context:PGtkSourceCompletionContext):longint;cdecl;
      is_trigger : function (self:PGtkSourceCompletionProvider; iter:PGtkTextIter; ch:Tgunichar):Tgboolean;cdecl;
      key_activates : function (self:PGtkSourceCompletionProvider; context:PGtkSourceCompletionContext; proposal:PGtkSourceCompletionProposal; keyval:Tguint; state:TGdkModifierType):Tgboolean;cdecl;
      populate : function (self:PGtkSourceCompletionProvider; context:PGtkSourceCompletionContext; error:PPGError):PGListModel;cdecl;
      populate_async : procedure (self:PGtkSourceCompletionProvider; context:PGtkSourceCompletionContext; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      populate_finish : function (self:PGtkSourceCompletionProvider; result:PGAsyncResult; error:PPGError):PGListModel;cdecl;
      refilter : procedure (self:PGtkSourceCompletionProvider; context:PGtkSourceCompletionContext; model:PGListModel);cdecl;
      display : procedure (self:PGtkSourceCompletionProvider; context:PGtkSourceCompletionContext; proposal:PGtkSourceCompletionProposal; cell:PGtkSourceCompletionCell);cdecl;
      activate : procedure (self:PGtkSourceCompletionProvider; context:PGtkSourceCompletionContext; proposal:PGtkSourceCompletionProposal);cdecl;
      list_alternates : function (self:PGtkSourceCompletionProvider; context:PGtkSourceCompletionContext; proposal:PGtkSourceCompletionProposal):PGPtrArray;cdecl;
    end;


function gtk_source_completion_provider_get_title(self:PGtkSourceCompletionProvider):Pchar;cdecl;external;
function gtk_source_completion_provider_get_priority(self:PGtkSourceCompletionProvider; context:PGtkSourceCompletionContext):longint;cdecl;external;
(* Const before type ignored *)
function gtk_source_completion_provider_is_trigger(self:PGtkSourceCompletionProvider; iter:PGtkTextIter; ch:Tgunichar):Tgboolean;cdecl;external;
function gtk_source_completion_provider_key_activates(self:PGtkSourceCompletionProvider; context:PGtkSourceCompletionContext; proposal:PGtkSourceCompletionProposal; keyval:Tguint; state:TGdkModifierType):Tgboolean;cdecl;external;
procedure gtk_source_completion_provider_populate_async(self:PGtkSourceCompletionProvider; context:PGtkSourceCompletionContext; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gtk_source_completion_provider_populate_finish(self:PGtkSourceCompletionProvider; result:PGAsyncResult; error:PPGError):PGListModel;cdecl;external;
procedure gtk_source_completion_provider_refilter(self:PGtkSourceCompletionProvider; context:PGtkSourceCompletionContext; model:PGListModel);cdecl;external;
procedure gtk_source_completion_provider_display(self:PGtkSourceCompletionProvider; context:PGtkSourceCompletionContext; proposal:PGtkSourceCompletionProposal; cell:PGtkSourceCompletionCell);cdecl;external;
procedure gtk_source_completion_provider_activate(self:PGtkSourceCompletionProvider; context:PGtkSourceCompletionContext; proposal:PGtkSourceCompletionProposal);cdecl;external;
function gtk_source_completion_provider_list_alternates(self:PGtkSourceCompletionProvider; context:PGtkSourceCompletionContext; proposal:PGtkSourceCompletionProposal):PGPtrArray;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_COMPLETION_PROVIDER : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_COMPLETION_PROVIDER:=gtk_source_completion_provider_get_type;
  end;


end.
