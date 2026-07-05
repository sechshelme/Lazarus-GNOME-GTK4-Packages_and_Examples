unit gtkactionbar;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2013 - 2014 Red Hat, Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
 * License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 *
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}

type

function gtk_action_bar_get_type:TGType;cdecl;external libgtk4;
function gtk_action_bar_new:PGtkWidget;cdecl;external libgtk4;
function gtk_action_bar_get_center_widget(action_bar:PGtkActionBar):PGtkWidget;cdecl;external libgtk4;
procedure gtk_action_bar_set_center_widget(action_bar:PGtkActionBar; center_widget:PGtkWidget);cdecl;external libgtk4;
procedure gtk_action_bar_pack_start(action_bar:PGtkActionBar; child:PGtkWidget);cdecl;external libgtk4;
procedure gtk_action_bar_pack_end(action_bar:PGtkActionBar; child:PGtkWidget);cdecl;external libgtk4;
procedure gtk_action_bar_remove(action_bar:PGtkActionBar; child:PGtkWidget);cdecl;external libgtk4;
procedure gtk_action_bar_set_revealed(action_bar:PGtkActionBar; revealed:Tgboolean);cdecl;external libgtk4;
function gtk_action_bar_get_revealed(action_bar:PGtkActionBar):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkActionBar, g_object_unref) }

// === Konventiert am: 5-7-26 16:28:08 ===

function GTK_TYPE_ACTION_BAR : TGType;
function GTK_ACTION_BAR(obj : Pointer) : PGtkActionBar;
function GTK_IS_ACTION_BAR(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_ACTION_BAR : TGType;
  begin
    GTK_TYPE_ACTION_BAR:=gtk_action_bar_get_type;
  end;

function GTK_ACTION_BAR(obj : Pointer) : PGtkActionBar;
begin
  Result := PGtkActionBar(g_type_check_instance_cast(obj, GTK_TYPE_ACTION_BAR));
end;

function GTK_IS_ACTION_BAR(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_ACTION_BAR);
end;



end.
