unit gtkcellrendereraccel;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkcellrendereraccel.h
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
{$include <gtk/deprecated/gtkcellrenderertext.h>}

type
{*
 * GtkCellRendererAccelMode:
 * @GTK_CELL_RENDERER_ACCEL_MODE_GTK: GTK accelerators mode
 * @GTK_CELL_RENDERER_ACCEL_MODE_OTHER: Other accelerator mode
 *
 * The available modes for [property@Gtk.CellRendererAccel:accel-mode].
 *
 * Deprecated: 4.20: There is no replacement
  }

  PGtkCellRendererAccelMode = ^TGtkCellRendererAccelMode;
  TGtkCellRendererAccelMode =  Longint;
  Const
    GTK_CELL_RENDERER_ACCEL_MODE_GTK = 0;
    GTK_CELL_RENDERER_ACCEL_MODE_OTHER = 1;
;

function gtk_cell_renderer_accel_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_renderer_accel_new:PGtkCellRenderer;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkCellRendererAccel, g_object_unref) }

// === Konventiert am: 9-7-26 19:39:14 ===

function GTK_TYPE_CELL_RENDERER_ACCEL : TGType;
function GTK_CELL_RENDERER_ACCEL(obj : Pointer) : PGtkCellRendererAccel;
function GTK_IS_CELL_RENDERER_ACCEL(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_CELL_RENDERER_ACCEL : TGType;
  begin
    GTK_TYPE_CELL_RENDERER_ACCEL:=gtk_cell_renderer_accel_get_type;
  end;

function GTK_CELL_RENDERER_ACCEL(obj : Pointer) : PGtkCellRendererAccel;
begin
  Result := PGtkCellRendererAccel(g_type_check_instance_cast(obj, GTK_TYPE_CELL_RENDERER_ACCEL));
end;

function GTK_IS_CELL_RENDERER_ACCEL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_CELL_RENDERER_ACCEL);
end;



end.
