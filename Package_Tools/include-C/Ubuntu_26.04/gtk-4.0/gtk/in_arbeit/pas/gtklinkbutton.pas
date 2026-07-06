unit gtklinkbutton;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * gtklinkbutton.h - a hyperlink-enabled button
 *
 * Copyright (C) 2005 Emmanuele Bassi <ebassi@gmail.com>
 * All rights reserved.
 *
 * Based on gnome-href code by:
 * 	James Henstridge <james@daa.com.au>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkbutton.h>}

type

function gtk_link_button_get_type:TGType;cdecl;external libgtk4;
function gtk_link_button_new(uri:Pchar):PGtkWidget;cdecl;external libgtk4;
function gtk_link_button_new_with_label(uri:Pchar; _label:Pchar):PGtkWidget;cdecl;external libgtk4;
function gtk_link_button_get_uri(link_button:PGtkLinkButton):Pchar;cdecl;external libgtk4;
procedure gtk_link_button_set_uri(link_button:PGtkLinkButton; uri:Pchar);cdecl;external libgtk4;
function gtk_link_button_get_visited(link_button:PGtkLinkButton):Tgboolean;cdecl;external libgtk4;
procedure gtk_link_button_set_visited(link_button:PGtkLinkButton; visited:Tgboolean);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkLinkButton, g_object_unref) }

// === Konventiert am: 6-7-26 17:03:21 ===

function GTK_TYPE_LINK_BUTTON : TGType;
function GTK_LINK_BUTTON(obj : Pointer) : PGtkLinkButton;
function GTK_IS_LINK_BUTTON(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_LINK_BUTTON : TGType;
  begin
    GTK_TYPE_LINK_BUTTON:=gtk_link_button_get_type;
  end;

function GTK_LINK_BUTTON(obj : Pointer) : PGtkLinkButton;
begin
  Result := PGtkLinkButton(g_type_check_instance_cast(obj, GTK_TYPE_LINK_BUTTON));
end;

function GTK_IS_LINK_BUTTON(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_LINK_BUTTON);
end;



end.
