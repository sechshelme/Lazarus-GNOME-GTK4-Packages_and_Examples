unit gtklevelbar;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright © 2012 Red Hat, Inc.
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
 *
 * Author: Cosimo Cecchi <cosimoc@gnome.org>
 *
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}

{*
 * GTK_LEVEL_BAR_OFFSET_LOW:
 *
 * The name used for the stock low offset included by `GtkLevelBar`.
  }
const
  GTK_LEVEL_BAR_OFFSET_LOW = 'low';  
{*
 * GTK_LEVEL_BAR_OFFSET_HIGH:
 *
 * The name used for the stock high offset included by `GtkLevelBar`.
  }
  GTK_LEVEL_BAR_OFFSET_HIGH = 'high';  
{*
 * GTK_LEVEL_BAR_OFFSET_FULL:
 *
 * The name used for the stock full offset included by `GtkLevelBar`.
  }
  GTK_LEVEL_BAR_OFFSET_FULL = 'full';  
type

function gtk_level_bar_get_type:TGType;cdecl;external libgtk4;
function gtk_level_bar_new:PGtkWidget;cdecl;external libgtk4;
function gtk_level_bar_new_for_interval(min_value:Tdouble; max_value:Tdouble):PGtkWidget;cdecl;external libgtk4;
procedure gtk_level_bar_set_mode(self:PGtkLevelBar; mode:TGtkLevelBarMode);cdecl;external libgtk4;
function gtk_level_bar_get_mode(self:PGtkLevelBar):TGtkLevelBarMode;cdecl;external libgtk4;
procedure gtk_level_bar_set_value(self:PGtkLevelBar; value:Tdouble);cdecl;external libgtk4;
function gtk_level_bar_get_value(self:PGtkLevelBar):Tdouble;cdecl;external libgtk4;
procedure gtk_level_bar_set_min_value(self:PGtkLevelBar; value:Tdouble);cdecl;external libgtk4;
function gtk_level_bar_get_min_value(self:PGtkLevelBar):Tdouble;cdecl;external libgtk4;
procedure gtk_level_bar_set_max_value(self:PGtkLevelBar; value:Tdouble);cdecl;external libgtk4;
function gtk_level_bar_get_max_value(self:PGtkLevelBar):Tdouble;cdecl;external libgtk4;
procedure gtk_level_bar_set_inverted(self:PGtkLevelBar; inverted:Tgboolean);cdecl;external libgtk4;
function gtk_level_bar_get_inverted(self:PGtkLevelBar):Tgboolean;cdecl;external libgtk4;
procedure gtk_level_bar_add_offset_value(self:PGtkLevelBar; name:Pchar; value:Tdouble);cdecl;external libgtk4;
procedure gtk_level_bar_remove_offset_value(self:PGtkLevelBar; name:Pchar);cdecl;external libgtk4;
function gtk_level_bar_get_offset_value(self:PGtkLevelBar; name:Pchar; value:Pdouble):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkLevelBar, g_object_unref) }

// === Konventiert am: 6-7-26 16:29:16 ===

function GTK_TYPE_LEVEL_BAR : TGType;
function GTK_LEVEL_BAR(obj : Pointer) : PGtkLevelBar;
function GTK_IS_LEVEL_BAR(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_LEVEL_BAR : TGType;
  begin
    GTK_TYPE_LEVEL_BAR:=gtk_level_bar_get_type;
  end;

function GTK_LEVEL_BAR(obj : Pointer) : PGtkLevelBar;
begin
  Result := PGtkLevelBar(g_type_check_instance_cast(obj, GTK_TYPE_LEVEL_BAR));
end;

function GTK_IS_LEVEL_BAR(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_LEVEL_BAR);
end;



end.
