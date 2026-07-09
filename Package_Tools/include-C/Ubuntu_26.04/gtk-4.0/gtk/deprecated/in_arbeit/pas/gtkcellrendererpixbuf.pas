unit gtkcellrendererpixbuf;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkcellrendererpixbuf.h
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

function gtk_cell_renderer_pixbuf_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_renderer_pixbuf_new:PGtkCellRenderer;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkCellRendererPixbuf, g_object_unref) }

// === Konventiert am: 9-7-26 19:39:06 ===

function GTK_TYPE_CELL_RENDERER_PIXBUF : TGType;
function GTK_CELL_RENDERER_PIXBUF(obj : Pointer) : PGtkCellRendererPixbuf;
function GTK_IS_CELL_RENDERER_PIXBUF(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_CELL_RENDERER_PIXBUF : TGType;
  begin
    GTK_TYPE_CELL_RENDERER_PIXBUF:=gtk_cell_renderer_pixbuf_get_type;
  end;

function GTK_CELL_RENDERER_PIXBUF(obj : Pointer) : PGtkCellRendererPixbuf;
begin
  Result := PGtkCellRendererPixbuf(g_type_check_instance_cast(obj, GTK_TYPE_CELL_RENDERER_PIXBUF));
end;

function GTK_IS_CELL_RENDERER_PIXBUF(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_CELL_RENDERER_PIXBUF);
end;



end.
