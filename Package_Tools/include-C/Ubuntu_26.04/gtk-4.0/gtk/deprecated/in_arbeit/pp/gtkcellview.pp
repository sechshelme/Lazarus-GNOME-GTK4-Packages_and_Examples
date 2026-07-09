
unit gtkcellview;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkcellview.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkcellview.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PGdkTexture  = ^GdkTexture;
PGtkCellArea  = ^GtkCellArea;
PGtkCellAreaContext  = ^GtkCellAreaContext;
PGtkCellView  = ^GtkCellView;
PGtkTreeModel  = ^GtkTreeModel;
PGtkTreePath  = ^GtkTreePath;
PGtkWidget  = ^GtkWidget;
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

{ was #define dname def_expr }
function GTK_TYPE_CELL_VIEW : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_CELL_VIEW(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_CELL_VIEW(obj : longint) : longint;

type

function gtk_cell_view_get_type:TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_view_new:PGtkWidget;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_view_new_with_context(area:PGtkCellArea; context:PGtkCellAreaContext):PGtkWidget;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
(* Const before type ignored *)
function gtk_cell_view_new_with_text(text:Pchar):PGtkWidget;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
(* Const before type ignored *)
function gtk_cell_view_new_with_markup(markup:Pchar):PGtkWidget;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_view_new_with_texture(texture:PGdkTexture):PGtkWidget;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_view_set_model(cell_view:PGtkCellView; model:PGtkTreeModel);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_view_get_model(cell_view:PGtkCellView):PGtkTreeModel;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_view_set_displayed_row(cell_view:PGtkCellView; path:PGtkTreePath);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_view_get_displayed_row(cell_view:PGtkCellView):PGtkTreePath;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_view_get_draw_sensitive(cell_view:PGtkCellView):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_view_set_draw_sensitive(cell_view:PGtkCellView; draw_sensitive:Tgboolean);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_view_get_fit_model(cell_view:PGtkCellView):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_view_set_fit_model(cell_view:PGtkCellView; fit_model:Tgboolean);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkCellView, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_CELL_VIEW : longint; { return type might be wrong }
  begin
    GTK_TYPE_CELL_VIEW:=gtk_cell_view_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_CELL_VIEW(obj : longint) : longint;
begin
  GTK_CELL_VIEW:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_CELL_VIEW,GtkCellView);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_CELL_VIEW(obj : longint) : longint;
begin
  GTK_IS_CELL_VIEW:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_CELL_VIEW);
end;


end.
