
unit gtksourcehoverprovider;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcehoverprovider.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcehoverprovider.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGtkSourceHoverContext  = ^GtkSourceHoverContext;
PGtkSourceHoverDisplay  = ^GtkSourceHoverDisplay;
PGtkSourceHoverProvider  = ^GtkSourceHoverProvider;
PGtkSourceHoverProviderInterface  = ^GtkSourceHoverProviderInterface;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2021 Christian Hergert <chergert@redhat.com>
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
{$include <gio/gio.h>}
{$include "gtksourcetypes.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_HOVER_PROVIDER : longint; { return type might be wrong }

{G_DECLARE_INTERFACE (GtkSourceHoverProvider, gtk_source_hover_provider, GTK_SOURCE, HOVER_PROVIDER, GObject) }
type
  PGtkSourceHoverProviderInterface = ^TGtkSourceHoverProviderInterface;
  TGtkSourceHoverProviderInterface = record
      parent_iface : TGTypeInterface;
      populate : function (self:PGtkSourceHoverProvider; context:PGtkSourceHoverContext; display:PGtkSourceHoverDisplay; error:PPGError):Tgboolean;cdecl;
      populate_async : procedure (self:PGtkSourceHoverProvider; context:PGtkSourceHoverContext; display:PGtkSourceHoverDisplay; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      populate_finish : function (self:PGtkSourceHoverProvider; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
    end;


procedure gtk_source_hover_provider_populate_async(self:PGtkSourceHoverProvider; context:PGtkSourceHoverContext; display:PGtkSourceHoverDisplay; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function gtk_source_hover_provider_populate_finish(self:PGtkSourceHoverProvider; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_HOVER_PROVIDER : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_HOVER_PROVIDER:=gtk_source_hover_provider_get_type;
  end;


end.
