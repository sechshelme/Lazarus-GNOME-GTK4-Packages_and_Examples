unit gtksearchbar;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2013 Red Hat, Inc.
 *
 * Authors:
 * - Bastien Nocera <bnocera@redhat.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GTK+ Team and others 2013.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}
{$include <gtk/gtkeditable.h>}

type

function gtk_search_bar_get_type:TGType;cdecl;external libgtk4;
function gtk_search_bar_new:PGtkWidget;cdecl;external libgtk4;
procedure gtk_search_bar_connect_entry(bar:PGtkSearchBar; entry:PGtkEditable);cdecl;external libgtk4;
function gtk_search_bar_get_search_mode(bar:PGtkSearchBar):Tgboolean;cdecl;external libgtk4;
procedure gtk_search_bar_set_search_mode(bar:PGtkSearchBar; search_mode:Tgboolean);cdecl;external libgtk4;
function gtk_search_bar_get_show_close_button(bar:PGtkSearchBar):Tgboolean;cdecl;external libgtk4;
procedure gtk_search_bar_set_show_close_button(bar:PGtkSearchBar; visible:Tgboolean);cdecl;external libgtk4;
procedure gtk_search_bar_set_key_capture_widget(bar:PGtkSearchBar; widget:PGtkWidget);cdecl;external libgtk4;
function gtk_search_bar_get_key_capture_widget(bar:PGtkSearchBar):PGtkWidget;cdecl;external libgtk4;
procedure gtk_search_bar_set_child(bar:PGtkSearchBar; child:PGtkWidget);cdecl;external libgtk4;
function gtk_search_bar_get_child(bar:PGtkSearchBar):PGtkWidget;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkSearchBar, g_object_unref) }

// === Konventiert am: 6-7-26 16:45:25 ===

function GTK_TYPE_SEARCH_BAR : TGType;
function GTK_SEARCH_BAR(obj : Pointer) : PGtkSearchBar;
function GTK_IS_SEARCH_BAR(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_SEARCH_BAR : TGType;
  begin
    GTK_TYPE_SEARCH_BAR:=gtk_search_bar_get_type;
  end;

function GTK_SEARCH_BAR(obj : Pointer) : PGtkSearchBar;
begin
  Result := PGtkSearchBar(g_type_check_instance_cast(obj, GTK_TYPE_SEARCH_BAR));
end;

function GTK_IS_SEARCH_BAR(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_SEARCH_BAR);
end;



end.
