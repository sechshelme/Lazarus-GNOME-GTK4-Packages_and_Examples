unit gtkwindowcontrols;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2020 Alexander Mikhaylenko <alexm@gnome.org>
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
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}

{G_DECLARE_FINAL_TYPE (GtkWindowControls, gtk_window_controls, GTK, WINDOW_CONTROLS, GtkWidget) }
function gtk_window_controls_new(side:TGtkPackType):PGtkWidget;cdecl;external libgtk4;
function gtk_window_controls_get_side(self:PGtkWindowControls):TGtkPackType;cdecl;external libgtk4;
procedure gtk_window_controls_set_side(self:PGtkWindowControls; side:TGtkPackType);cdecl;external libgtk4;
function gtk_window_controls_get_decoration_layout(self:PGtkWindowControls):Pchar;cdecl;external libgtk4;
procedure gtk_window_controls_set_decoration_layout(self:PGtkWindowControls; layout:Pchar);cdecl;external libgtk4;
function gtk_window_controls_get_use_native_controls(self:PGtkWindowControls):Tgboolean;cdecl;external libgtk4;
procedure gtk_window_controls_set_use_native_controls(self:PGtkWindowControls; setting:Tgboolean);cdecl;external libgtk4;
function gtk_window_controls_get_empty(self:PGtkWindowControls):Tgboolean;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:02:57 ===

function GTK_TYPE_WINDOW_CONTROLS: TGType;
function GTK_WINDOW_CONTROLS(obj: Pointer): PGtkWindowControls;
function GTK_IS_WINDOW_CONTROLS(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_WINDOW_CONTROLS: TGType;
begin
  Result := gtk_window_controls_get_type;
end;

function GTK_WINDOW_CONTROLS(obj: Pointer): PGtkWindowControls;
begin
  Result := PGtkWindowControls(g_type_check_instance_cast(obj, GTK_TYPE_WINDOW_CONTROLS));
end;

function GTK_IS_WINDOW_CONTROLS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_WINDOW_CONTROLS);
end;

type 
  PGtkWindowControls = type Pointer;

  TGtkWindowControlsClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkWindowControlsClass = ^TGtkWindowControlsClass;

function gtk_window_controls_get_type: TGType; cdecl; external libgxxxxxxx;



end.
