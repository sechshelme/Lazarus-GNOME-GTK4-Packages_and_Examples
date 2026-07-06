unit gtkheaderbar;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2013 Red Hat, Inc.
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

function gtk_header_bar_get_type:TGType;cdecl;external libgtk4;
function gtk_header_bar_new:PGtkWidget;cdecl;external libgtk4;
procedure gtk_header_bar_set_title_widget(bar:PGtkHeaderBar; title_widget:PGtkWidget);cdecl;external libgtk4;
function gtk_header_bar_get_title_widget(bar:PGtkHeaderBar):PGtkWidget;cdecl;external libgtk4;
procedure gtk_header_bar_pack_start(bar:PGtkHeaderBar; child:PGtkWidget);cdecl;external libgtk4;
procedure gtk_header_bar_pack_end(bar:PGtkHeaderBar; child:PGtkWidget);cdecl;external libgtk4;
procedure gtk_header_bar_remove(bar:PGtkHeaderBar; child:PGtkWidget);cdecl;external libgtk4;
function gtk_header_bar_get_show_title_buttons(bar:PGtkHeaderBar):Tgboolean;cdecl;external libgtk4;
procedure gtk_header_bar_set_show_title_buttons(bar:PGtkHeaderBar; setting:Tgboolean);cdecl;external libgtk4;
procedure gtk_header_bar_set_decoration_layout(bar:PGtkHeaderBar; layout:Pchar);cdecl;external libgtk4;
function gtk_header_bar_get_decoration_layout(bar:PGtkHeaderBar):Pchar;cdecl;external libgtk4;
function gtk_header_bar_get_use_native_controls(bar:PGtkHeaderBar):Tgboolean;cdecl;external libgtk4;
procedure gtk_header_bar_set_use_native_controls(bar:PGtkHeaderBar; setting:Tgboolean);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkHeaderBar, g_object_unref) }

// === Konventiert am: 6-7-26 16:45:44 ===

function GTK_TYPE_HEADER_BAR : TGType;
function GTK_HEADER_BAR(obj : Pointer) : PGtkHeaderBar;
function GTK_IS_HEADER_BAR(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_HEADER_BAR : TGType;
  begin
    GTK_TYPE_HEADER_BAR:=gtk_header_bar_get_type;
  end;

function GTK_HEADER_BAR(obj : Pointer) : PGtkHeaderBar;
begin
  Result := PGtkHeaderBar(g_type_check_instance_cast(obj, GTK_TYPE_HEADER_BAR));
end;

function GTK_IS_HEADER_BAR(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_HEADER_BAR);
end;



end.
