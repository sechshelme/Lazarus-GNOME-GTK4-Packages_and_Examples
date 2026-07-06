unit gtkgraphicsoffload;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 *
 * Copyright (C) 2023 Red Hat, Inc.
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
 * Author:
 *      Matthias Clasen <mclasen@redhat.com>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}

{G_DECLARE_FINAL_TYPE (GtkGraphicsOffload, gtk_graphics_offload, GTK, GRAPHICS_OFFLOAD, GtkWidget) }
function gtk_graphics_offload_new(child:PGtkWidget):PGtkWidget;cdecl;external libgtk4;
procedure gtk_graphics_offload_set_child(self:PGtkGraphicsOffload; child:PGtkWidget);cdecl;external libgtk4;
function gtk_graphics_offload_get_child(self:PGtkGraphicsOffload):PGtkWidget;cdecl;external libgtk4;
{*
 * GtkGraphicsOffloadEnabled:
 * @GTK_GRAPHICS_OFFLOAD_ENABLED: Graphics offloading is enabled.
 * @GTK_GRAPHICS_OFFLOAD_DISABLED: Graphics offloading is disabled.
 *
 * Represents the state of graphics offloading.
 *
 * Since: 4.14
  }
type
  PGtkGraphicsOffloadEnabled = ^TGtkGraphicsOffloadEnabled;
  TGtkGraphicsOffloadEnabled =  Longint;
  Const
    GTK_GRAPHICS_OFFLOAD_ENABLED = 0;
    GTK_GRAPHICS_OFFLOAD_DISABLED = 1;
;

procedure gtk_graphics_offload_set_enabled(self:PGtkGraphicsOffload; enabled:TGtkGraphicsOffloadEnabled);cdecl;external libgtk4;
function gtk_graphics_offload_get_enabled(self:PGtkGraphicsOffload):TGtkGraphicsOffloadEnabled;cdecl;external libgtk4;
procedure gtk_graphics_offload_set_black_background(self:PGtkGraphicsOffload; value:Tgboolean);cdecl;external libgtk4;
function gtk_graphics_offload_get_black_background(self:PGtkGraphicsOffload):Tgboolean;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:00:30 ===

function GTK_TYPE_GRAPHICS_OFFLOAD: TGType;
function GTK_GRAPHICS_OFFLOAD(obj: Pointer): PGtkGraphicsOffload;
function GTK_IS_GRAPHICS_OFFLOAD(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_GRAPHICS_OFFLOAD: TGType;
begin
  Result := gtk_graphics_offload_get_type;
end;

function GTK_GRAPHICS_OFFLOAD(obj: Pointer): PGtkGraphicsOffload;
begin
  Result := PGtkGraphicsOffload(g_type_check_instance_cast(obj, GTK_TYPE_GRAPHICS_OFFLOAD));
end;

function GTK_IS_GRAPHICS_OFFLOAD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_GRAPHICS_OFFLOAD);
end;

type 
  PGtkGraphicsOffload = type Pointer;

  TGtkGraphicsOffloadClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkGraphicsOffloadClass = ^TGtkGraphicsOffloadClass;

function gtk_graphics_offload_get_type: TGType; cdecl; external libgxxxxxxx;



end.
