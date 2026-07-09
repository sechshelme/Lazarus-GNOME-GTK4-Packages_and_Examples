unit gtkcellrenderertext;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkcellrenderertext.h
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
  PGtkCellRendererText = ^TGtkCellRendererText;
  TGtkCellRendererText = record
      parent : TGtkCellRenderer;
    end;

{< private > }
  PGtkCellRendererTextClass = ^TGtkCellRendererTextClass;
  TGtkCellRendererTextClass = record
      parent_class : TGtkCellRendererClass;
      edited : procedure (cell_renderer_text:PGtkCellRendererText; path:Pchar; new_text:Pchar);cdecl;
      padding : array[0..7] of Tgpointer;
    end;


function gtk_cell_renderer_text_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_renderer_text_new:PGtkCellRenderer;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_text_set_fixed_height_from_font(renderer:PGtkCellRendererText; number_of_rows:longint);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkCellRendererText, g_object_unref) }

// === Konventiert am: 9-7-26 19:38:41 ===

function GTK_TYPE_CELL_RENDERER_TEXT : TGType;
function GTK_CELL_RENDERER_TEXT(obj : Pointer) : PGtkCellRendererText;
function GTK_CELL_RENDERER_TEXT_CLASS(klass : Pointer) : PGtkCellRendererTextClass;
function GTK_IS_CELL_RENDERER_TEXT(obj : Pointer) : Tgboolean;
function GTK_IS_CELL_RENDERER_TEXT_CLASS(klass : Pointer) : Tgboolean;
function GTK_CELL_RENDERER_TEXT_GET_CLASS(obj : Pointer) : PGtkCellRendererTextClass;

implementation

function GTK_TYPE_CELL_RENDERER_TEXT : TGType;
  begin
    GTK_TYPE_CELL_RENDERER_TEXT:=gtk_cell_renderer_text_get_type;
  end;

function GTK_CELL_RENDERER_TEXT(obj : Pointer) : PGtkCellRendererText;
begin
  Result := PGtkCellRendererText(g_type_check_instance_cast(obj, GTK_TYPE_CELL_RENDERER_TEXT));
end;

function GTK_CELL_RENDERER_TEXT_CLASS(klass : Pointer) : PGtkCellRendererTextClass;
begin
  Result := PGtkCellRendererTextClass(g_type_check_class_cast(klass, GTK_TYPE_CELL_RENDERER_TEXT));
end;

function GTK_IS_CELL_RENDERER_TEXT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_CELL_RENDERER_TEXT);
end;

function GTK_IS_CELL_RENDERER_TEXT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_CELL_RENDERER_TEXT);
end;

function GTK_CELL_RENDERER_TEXT_GET_CLASS(obj : Pointer) : PGtkCellRendererTextClass;
begin
  Result := PGtkCellRendererTextClass(PGTypeInstance(obj)^.g_class);
end;



end.
