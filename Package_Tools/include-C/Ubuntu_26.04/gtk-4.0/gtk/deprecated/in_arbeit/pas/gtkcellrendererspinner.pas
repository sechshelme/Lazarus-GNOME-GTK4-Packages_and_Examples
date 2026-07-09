unit gtkcellrendererspinner;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 *
 * Copyright (C) 2009 Matthias Clasen <mclasen@redhat.com>
 * Copyright (C) 2008 Richard Hughes <richard@hughsie.com>
 * Copyright (C) 2009 Bastien Nocera <hadess@hadess.net>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.         See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/deprecated/gtkcellrenderer.h>}

type

function gtk_cell_renderer_spinner_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_renderer_spinner_new:PGtkCellRenderer;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkCellRendererSpinner, g_object_unref) }

// === Konventiert am: 9-7-26 19:38:52 ===

function GTK_TYPE_CELL_RENDERER_SPINNER : TGType;
function GTK_CELL_RENDERER_SPINNER(obj : Pointer) : PGtkCellRendererSpinner;
function GTK_IS_CELL_RENDERER_SPINNER(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_CELL_RENDERER_SPINNER : TGType;
  begin
    GTK_TYPE_CELL_RENDERER_SPINNER:=gtk_cell_renderer_spinner_get_type;
  end;

function GTK_CELL_RENDERER_SPINNER(obj : Pointer) : PGtkCellRendererSpinner;
begin
  Result := PGtkCellRendererSpinner(g_type_check_instance_cast(obj, GTK_TYPE_CELL_RENDERER_SPINNER));
end;

function GTK_IS_CELL_RENDERER_SPINNER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_CELL_RENDERER_SPINNER);
end;



end.
