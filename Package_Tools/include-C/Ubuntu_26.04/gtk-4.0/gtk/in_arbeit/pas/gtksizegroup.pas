unit gtksizegroup;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * gtksizegroup.h:
 * Copyright (C) 2000 Red Hat Software
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

type
  PGtkSizeGroup = ^TGtkSizeGroup;
  TGtkSizeGroup = record
      parent_instance : TGObject;
    end;


function gtk_size_group_get_type:TGType;cdecl;external libgtk4;
function gtk_size_group_new(mode:TGtkSizeGroupMode):PGtkSizeGroup;cdecl;external libgtk4;
procedure gtk_size_group_set_mode(size_group:PGtkSizeGroup; mode:TGtkSizeGroupMode);cdecl;external libgtk4;
function gtk_size_group_get_mode(size_group:PGtkSizeGroup):TGtkSizeGroupMode;cdecl;external libgtk4;
procedure gtk_size_group_add_widget(size_group:PGtkSizeGroup; widget:PGtkWidget);cdecl;external libgtk4;
procedure gtk_size_group_remove_widget(size_group:PGtkSizeGroup; widget:PGtkWidget);cdecl;external libgtk4;
function gtk_size_group_get_widgets(size_group:PGtkSizeGroup):PGSList;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkSizeGroup, g_object_unref) }

// === Konventiert am: 6-7-26 17:03:02 ===

function GTK_TYPE_SIZE_GROUP : TGType;
function GTK_SIZE_GROUP(obj : Pointer) : PGtkSizeGroup;
function GTK_IS_SIZE_GROUP(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_SIZE_GROUP : TGType;
  begin
    GTK_TYPE_SIZE_GROUP:=gtk_size_group_get_type;
  end;

function GTK_SIZE_GROUP(obj : Pointer) : PGtkSizeGroup;
begin
  Result := PGtkSizeGroup(g_type_check_instance_cast(obj, GTK_TYPE_SIZE_GROUP));
end;

function GTK_IS_SIZE_GROUP(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_SIZE_GROUP);
end;



end.
