unit gtkcellrenderertoggle;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkcellrenderertoggle.h
 * Copyright (C) 2000  Red Hat, Inc.,  Jonathan Blandford <jrb@redhat.com>
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
{$include <gtk/deprecated/gtkcellrenderer.h>}

type

function gtk_cell_renderer_toggle_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_renderer_toggle_new:PGtkCellRenderer;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_renderer_toggle_get_radio(toggle:PGtkCellRendererToggle):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_toggle_set_radio(toggle:PGtkCellRendererToggle; radio:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_renderer_toggle_get_active(toggle:PGtkCellRendererToggle):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_toggle_set_active(toggle:PGtkCellRendererToggle; setting:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_renderer_toggle_get_activatable(toggle:PGtkCellRendererToggle):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_toggle_set_activatable(toggle:PGtkCellRendererToggle; setting:Tgboolean);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkCellRendererToggle, g_object_unref) }

// === Konventiert am: 9-7-26 19:38:35 ===

function GTK_TYPE_CELL_RENDERER_TOGGLE : TGType;
function GTK_CELL_RENDERER_TOGGLE(obj : Pointer) : PGtkCellRendererToggle;
function GTK_IS_CELL_RENDERER_TOGGLE(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_CELL_RENDERER_TOGGLE : TGType;
  begin
    GTK_TYPE_CELL_RENDERER_TOGGLE:=gtk_cell_renderer_toggle_get_type;
  end;

function GTK_CELL_RENDERER_TOGGLE(obj : Pointer) : PGtkCellRendererToggle;
begin
  Result := PGtkCellRendererToggle(g_type_check_instance_cast(obj, GTK_TYPE_CELL_RENDERER_TOGGLE));
end;

function GTK_IS_CELL_RENDERER_TOGGLE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_CELL_RENDERER_TOGGLE);
end;



end.
