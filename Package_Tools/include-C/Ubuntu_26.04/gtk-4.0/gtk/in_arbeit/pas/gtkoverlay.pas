unit gtkoverlay;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * gtkoverlay.h
 * This file is part of gtk
 *
 * Copyright (C) 2011 - Ignacio Casal Quinteiro
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
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}

type

function gtk_overlay_get_type:TGType;cdecl;external libgtk4;
function gtk_overlay_new:PGtkWidget;cdecl;external libgtk4;
procedure gtk_overlay_add_overlay(overlay:PGtkOverlay; widget:PGtkWidget);cdecl;external libgtk4;
procedure gtk_overlay_remove_overlay(overlay:PGtkOverlay; widget:PGtkWidget);cdecl;external libgtk4;
procedure gtk_overlay_set_child(overlay:PGtkOverlay; child:PGtkWidget);cdecl;external libgtk4;
function gtk_overlay_get_child(overlay:PGtkOverlay):PGtkWidget;cdecl;external libgtk4;
function gtk_overlay_get_measure_overlay(overlay:PGtkOverlay; widget:PGtkWidget):Tgboolean;cdecl;external libgtk4;
procedure gtk_overlay_set_measure_overlay(overlay:PGtkOverlay; widget:PGtkWidget; measure:Tgboolean);cdecl;external libgtk4;
function gtk_overlay_get_clip_overlay(overlay:PGtkOverlay; widget:PGtkWidget):Tgboolean;cdecl;external libgtk4;
procedure gtk_overlay_set_clip_overlay(overlay:PGtkOverlay; widget:PGtkWidget; clip_overlay:Tgboolean);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkOverlay, g_object_unref) }

// === Konventiert am: 6-7-26 17:00:24 ===

function GTK_TYPE_OVERLAY : TGType;
function GTK_OVERLAY(obj : Pointer) : PGtkOverlay;
function GTK_IS_OVERLAY(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_OVERLAY : TGType;
  begin
    GTK_TYPE_OVERLAY:=gtk_overlay_get_type;
  end;

function GTK_OVERLAY(obj : Pointer) : PGtkOverlay;
begin
  Result := PGtkOverlay(g_type_check_instance_cast(obj, GTK_TYPE_OVERLAY));
end;

function GTK_IS_OVERLAY(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_OVERLAY);
end;



end.
