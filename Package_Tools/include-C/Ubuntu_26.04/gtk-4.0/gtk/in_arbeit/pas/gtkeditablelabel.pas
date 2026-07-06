unit gtkeditablelabel;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2020 Red Hat, Inc.
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
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}

{G_DECLARE_FINAL_TYPE (GtkEditableLabel, gtk_editable_label, GTK, EDITABLE_LABEL, GtkWidget) }
function gtk_editable_label_new(str:Pchar):PGtkWidget;cdecl;external libgtk4;
function gtk_editable_label_get_editing(self:PGtkEditableLabel):Tgboolean;cdecl;external libgtk4;
procedure gtk_editable_label_start_editing(self:PGtkEditableLabel);cdecl;external libgtk4;
procedure gtk_editable_label_stop_editing(self:PGtkEditableLabel; commit:Tgboolean);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:18:34 ===

function GTK_TYPE_EDITABLE_LABEL: TGType;
function GTK_EDITABLE_LABEL(obj: Pointer): PGtkEditableLabel;
function GTK_IS_EDITABLE_LABEL(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_EDITABLE_LABEL: TGType;
begin
  Result := gtk_editable_label_get_type;
end;

function GTK_EDITABLE_LABEL(obj: Pointer): PGtkEditableLabel;
begin
  Result := PGtkEditableLabel(g_type_check_instance_cast(obj, GTK_TYPE_EDITABLE_LABEL));
end;

function GTK_IS_EDITABLE_LABEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_EDITABLE_LABEL);
end;

type 
  PGtkEditableLabel = type Pointer;

  TGtkEditableLabelClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkEditableLabelClass = ^TGtkEditableLabelClass;

function gtk_editable_label_get_type: TGType; cdecl; external libgxxxxxxx;



end.
