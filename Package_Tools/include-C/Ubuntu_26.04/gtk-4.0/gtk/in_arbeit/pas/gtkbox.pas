unit gtkbox;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
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
{
 * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}

type
  PGtkBox = ^TGtkBox;
  TGtkBox = record
      parent_instance : TGtkWidget;
    end;

{*
 * GtkBoxClass:
 * @parent_class: The parent class.
  }
{< private > }
  PGtkBoxClass = ^TGtkBoxClass;
  TGtkBoxClass = record
      parent_class : TGtkWidgetClass;
      padding : array[0..7] of Tgpointer;
    end;


function gtk_box_get_type:TGType;cdecl;external libgtk4;
function gtk_box_new(orientation:TGtkOrientation; spacing:longint):PGtkWidget;cdecl;external libgtk4;
procedure gtk_box_set_homogeneous(box:PGtkBox; homogeneous:Tgboolean);cdecl;external libgtk4;
function gtk_box_get_homogeneous(box:PGtkBox):Tgboolean;cdecl;external libgtk4;
procedure gtk_box_set_spacing(box:PGtkBox; spacing:longint);cdecl;external libgtk4;
function gtk_box_get_spacing(box:PGtkBox):longint;cdecl;external libgtk4;
procedure gtk_box_set_baseline_position(box:PGtkBox; position:TGtkBaselinePosition);cdecl;external libgtk4;
function gtk_box_get_baseline_position(box:PGtkBox):TGtkBaselinePosition;cdecl;external libgtk4;
procedure gtk_box_set_baseline_child(box:PGtkBox; child:longint);cdecl;external libgtk4;
function gtk_box_get_baseline_child(box:PGtkBox):longint;cdecl;external libgtk4;
procedure gtk_box_append(box:PGtkBox; child:PGtkWidget);cdecl;external libgtk4;
procedure gtk_box_prepend(box:PGtkBox; child:PGtkWidget);cdecl;external libgtk4;
procedure gtk_box_remove(box:PGtkBox; child:PGtkWidget);cdecl;external libgtk4;
procedure gtk_box_insert_child_after(box:PGtkBox; child:PGtkWidget; sibling:PGtkWidget);cdecl;external libgtk4;
procedure gtk_box_reorder_child_after(box:PGtkBox; child:PGtkWidget; sibling:PGtkWidget);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkBox, g_object_unref) }

// === Konventiert am: 5-7-26 19:15:17 ===

function GTK_TYPE_BOX : TGType;
function GTK_BOX(obj : Pointer) : PGtkBox;
function GTK_BOX_CLASS(klass : Pointer) : PGtkBoxClass;
function GTK_IS_BOX(obj : Pointer) : Tgboolean;
function GTK_IS_BOX_CLASS(klass : Pointer) : Tgboolean;
function GTK_BOX_GET_CLASS(obj : Pointer) : PGtkBoxClass;

implementation

function GTK_TYPE_BOX : TGType;
  begin
    GTK_TYPE_BOX:=gtk_box_get_type;
  end;

function GTK_BOX(obj : Pointer) : PGtkBox;
begin
  Result := PGtkBox(g_type_check_instance_cast(obj, GTK_TYPE_BOX));
end;

function GTK_BOX_CLASS(klass : Pointer) : PGtkBoxClass;
begin
  Result := PGtkBoxClass(g_type_check_class_cast(klass, GTK_TYPE_BOX));
end;

function GTK_IS_BOX(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_BOX);
end;

function GTK_IS_BOX_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_BOX);
end;

function GTK_BOX_GET_CLASS(obj : Pointer) : PGtkBoxClass;
begin
  Result := PGtkBoxClass(PGTypeInstance(obj)^.g_class);
end;



end.
