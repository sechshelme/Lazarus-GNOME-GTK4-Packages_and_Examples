unit gtkcellview;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkcellview.h
 * Copyright (C) 2002, 2003  Kristian Rietveld <kris@gtk.org>
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
{$include <gtk/gtkwidget.h>}
{$include <gtk/deprecated/gtkcellrenderer.h>}
{$include <gtk/deprecated/gtkcellarea.h>}
{$include <gtk/deprecated/gtkcellareacontext.h>}
{$include <gtk/deprecated/gtktreemodel.h>}

type

function gtk_cell_view_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_view_new:PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_view_new_with_context(area:PGtkCellArea; context:PGtkCellAreaContext):PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_view_new_with_text(text:Pchar):PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_view_new_with_markup(markup:Pchar):PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_view_new_with_texture(texture:PGdkTexture):PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_view_set_model(cell_view:PGtkCellView; model:PGtkTreeModel);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_view_get_model(cell_view:PGtkCellView):PGtkTreeModel;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_view_set_displayed_row(cell_view:PGtkCellView; path:PGtkTreePath);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_view_get_displayed_row(cell_view:PGtkCellView):PGtkTreePath;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_view_get_draw_sensitive(cell_view:PGtkCellView):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_view_set_draw_sensitive(cell_view:PGtkCellView; draw_sensitive:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_view_get_fit_model(cell_view:PGtkCellView):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_view_set_fit_model(cell_view:PGtkCellView; fit_model:Tgboolean);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkCellView, g_object_unref) }

// === Konventiert am: 9-7-26 19:38:29 ===

function GTK_TYPE_CELL_VIEW : TGType;
function GTK_CELL_VIEW(obj : Pointer) : PGtkCellView;
function GTK_IS_CELL_VIEW(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_CELL_VIEW : TGType;
  begin
    GTK_TYPE_CELL_VIEW:=gtk_cell_view_get_type;
  end;

function GTK_CELL_VIEW(obj : Pointer) : PGtkCellView;
begin
  Result := PGtkCellView(g_type_check_instance_cast(obj, GTK_TYPE_CELL_VIEW));
end;

function GTK_IS_CELL_VIEW(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_CELL_VIEW);
end;



end.
