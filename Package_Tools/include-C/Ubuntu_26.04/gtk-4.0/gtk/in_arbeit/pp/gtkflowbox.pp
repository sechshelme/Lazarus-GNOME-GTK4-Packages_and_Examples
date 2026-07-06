
unit gtkflowbox;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkflowbox.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkflowbox.h
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
PGList  = ^GList;
PGListModel  = ^GListModel;
PGtkAdjustment  = ^GtkAdjustment;
PGtkFlowBox  = ^GtkFlowBox;
PGtkFlowBoxChild  = ^GtkFlowBoxChild;
PGtkFlowBoxChildClass  = ^GtkFlowBoxChildClass;
PGtkFlowBoxCreateWidgetFunc  = ^GtkFlowBoxCreateWidgetFunc;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2010 Openismus GmbH
 * Copyright (C) 2013 Red Hat, Inc.
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
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.

 *
 * Authors:
 *      Tristan Van Berkom <tristanvb@openismus.com>
 *      Matthias Clasen <mclasen@redhat.com>
 *      William Jon McCann <jmccann@redhat.com>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}

{ was #define dname def_expr }
function GTK_TYPE_FLOW_BOX : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_FLOW_BOX(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_FLOW_BOX(obj : longint) : longint;

type

{ was #define dname def_expr }
function GTK_TYPE_FLOW_BOX_CHILD : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_FLOW_BOX_CHILD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_FLOW_BOX_CHILD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_FLOW_BOX_CHILD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_FLOW_BOX_CHILD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_FLOW_BOX_CHILD_GET_CLASS(obj : longint) : longint;

{< private > }
type
  PGtkFlowBoxChild = ^TGtkFlowBoxChild;
  TGtkFlowBoxChild = record
      parent_instance : TGtkWidget;
    end;

{< private > }
{< public > }
{< private > }
  PGtkFlowBoxChildClass = ^TGtkFlowBoxChildClass;
  TGtkFlowBoxChildClass = record
      parent_class : TGtkWidgetClass;
      activate : procedure (child:PGtkFlowBoxChild);cdecl;
      padding : array[0..7] of Tgpointer;
    end;

{*
 * GtkFlowBoxCreateWidgetFunc:
 * @item: (type GObject): the item from the model for which to create a widget for
 * @user_data: (closure): user data from gtk_flow_box_bind_model()
 *
 * Called for flow boxes that are bound to a `GListModel`.
 *
 * This function is called for each item that gets added to the model.
 *
 * Returns: (transfer full): a `GtkWidget` that represents @item
  }

  PGtkFlowBoxCreateWidgetFunc = ^TGtkFlowBoxCreateWidgetFunc;
  TGtkFlowBoxCreateWidgetFunc = function (item:Tgpointer; user_data:Tgpointer):PGtkWidget;cdecl;

function gtk_flow_box_child_get_type:TGType;cdecl;external;
function gtk_flow_box_child_new:PGtkWidget;cdecl;external;
procedure gtk_flow_box_child_set_child(self:PGtkFlowBoxChild; child:PGtkWidget);cdecl;external;
function gtk_flow_box_child_get_child(self:PGtkFlowBoxChild):PGtkWidget;cdecl;external;
function gtk_flow_box_child_get_index(child:PGtkFlowBoxChild):longint;cdecl;external;
function gtk_flow_box_child_is_selected(child:PGtkFlowBoxChild):Tgboolean;cdecl;external;
procedure gtk_flow_box_child_changed(child:PGtkFlowBoxChild);cdecl;external;
function gtk_flow_box_get_type:TGType;cdecl;external;
function gtk_flow_box_new:PGtkWidget;cdecl;external;
procedure gtk_flow_box_bind_model(box:PGtkFlowBox; model:PGListModel; create_widget_func:TGtkFlowBoxCreateWidgetFunc; user_data:Tgpointer; user_data_free_func:TGDestroyNotify);cdecl;external;
procedure gtk_flow_box_set_homogeneous(box:PGtkFlowBox; homogeneous:Tgboolean);cdecl;external;
function gtk_flow_box_get_homogeneous(box:PGtkFlowBox):Tgboolean;cdecl;external;
procedure gtk_flow_box_set_row_spacing(box:PGtkFlowBox; spacing:Tguint);cdecl;external;
function gtk_flow_box_get_row_spacing(box:PGtkFlowBox):Tguint;cdecl;external;
procedure gtk_flow_box_set_column_spacing(box:PGtkFlowBox; spacing:Tguint);cdecl;external;
function gtk_flow_box_get_column_spacing(box:PGtkFlowBox):Tguint;cdecl;external;
procedure gtk_flow_box_set_min_children_per_line(box:PGtkFlowBox; n_children:Tguint);cdecl;external;
function gtk_flow_box_get_min_children_per_line(box:PGtkFlowBox):Tguint;cdecl;external;
procedure gtk_flow_box_set_max_children_per_line(box:PGtkFlowBox; n_children:Tguint);cdecl;external;
function gtk_flow_box_get_max_children_per_line(box:PGtkFlowBox):Tguint;cdecl;external;
procedure gtk_flow_box_set_activate_on_single_click(box:PGtkFlowBox; single:Tgboolean);cdecl;external;
function gtk_flow_box_get_activate_on_single_click(box:PGtkFlowBox):Tgboolean;cdecl;external;
procedure gtk_flow_box_prepend(self:PGtkFlowBox; child:PGtkWidget);cdecl;external;
procedure gtk_flow_box_append(self:PGtkFlowBox; child:PGtkWidget);cdecl;external;
procedure gtk_flow_box_insert(box:PGtkFlowBox; widget:PGtkWidget; position:longint);cdecl;external;
procedure gtk_flow_box_remove(box:PGtkFlowBox; widget:PGtkWidget);cdecl;external;
procedure gtk_flow_box_remove_all(box:PGtkFlowBox);cdecl;external;
function gtk_flow_box_get_child_at_index(box:PGtkFlowBox; idx:longint):PGtkFlowBoxChild;cdecl;external;
function gtk_flow_box_get_child_at_pos(box:PGtkFlowBox; x:longint; y:longint):PGtkFlowBoxChild;cdecl;external;
type

  TGtkFlowBoxForeachFunc = procedure (box:PGtkFlowBox; child:PGtkFlowBoxChild; user_data:Tgpointer);cdecl;

procedure gtk_flow_box_selected_foreach(box:PGtkFlowBox; func:TGtkFlowBoxForeachFunc; data:Tgpointer);cdecl;external;
function gtk_flow_box_get_selected_children(box:PGtkFlowBox):PGList;cdecl;external;
procedure gtk_flow_box_select_child(box:PGtkFlowBox; child:PGtkFlowBoxChild);cdecl;external;
procedure gtk_flow_box_unselect_child(box:PGtkFlowBox; child:PGtkFlowBoxChild);cdecl;external;
procedure gtk_flow_box_select_all(box:PGtkFlowBox);cdecl;external;
procedure gtk_flow_box_unselect_all(box:PGtkFlowBox);cdecl;external;
procedure gtk_flow_box_set_selection_mode(box:PGtkFlowBox; mode:TGtkSelectionMode);cdecl;external;
function gtk_flow_box_get_selection_mode(box:PGtkFlowBox):TGtkSelectionMode;cdecl;external;
procedure gtk_flow_box_set_hadjustment(box:PGtkFlowBox; adjustment:PGtkAdjustment);cdecl;external;
procedure gtk_flow_box_set_vadjustment(box:PGtkFlowBox; adjustment:PGtkAdjustment);cdecl;external;
type

  TGtkFlowBoxFilterFunc = function (child:PGtkFlowBoxChild; user_data:Tgpointer):Tgboolean;cdecl;

procedure gtk_flow_box_set_filter_func(box:PGtkFlowBox; filter_func:TGtkFlowBoxFilterFunc; user_data:Tgpointer; destroy:TGDestroyNotify);cdecl;external;
procedure gtk_flow_box_invalidate_filter(box:PGtkFlowBox);cdecl;external;
type

  TGtkFlowBoxSortFunc = function (child1:PGtkFlowBoxChild; child2:PGtkFlowBoxChild; user_data:Tgpointer):longint;cdecl;

procedure gtk_flow_box_set_sort_func(box:PGtkFlowBox; sort_func:TGtkFlowBoxSortFunc; user_data:Tgpointer; destroy:TGDestroyNotify);cdecl;external;
procedure gtk_flow_box_invalidate_sort(box:PGtkFlowBox);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkFlowBox, g_object_unref) }
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkFlowBoxChild, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_FLOW_BOX : longint; { return type might be wrong }
  begin
    GTK_TYPE_FLOW_BOX:=gtk_flow_box_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_FLOW_BOX(obj : longint) : longint;
begin
  GTK_FLOW_BOX:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_FLOW_BOX,GtkFlowBox);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_FLOW_BOX(obj : longint) : longint;
begin
  GTK_IS_FLOW_BOX:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_FLOW_BOX);
end;

{ was #define dname def_expr }
function GTK_TYPE_FLOW_BOX_CHILD : longint; { return type might be wrong }
  begin
    GTK_TYPE_FLOW_BOX_CHILD:=gtk_flow_box_child_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_FLOW_BOX_CHILD(obj : longint) : longint;
begin
  GTK_FLOW_BOX_CHILD:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_FLOW_BOX_CHILD,GtkFlowBoxChild);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_FLOW_BOX_CHILD_CLASS(klass : longint) : longint;
begin
  GTK_FLOW_BOX_CHILD_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GTK_TYPE_FLOW_BOX_CHILD,GtkFlowBoxChildClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_FLOW_BOX_CHILD(obj : longint) : longint;
begin
  GTK_IS_FLOW_BOX_CHILD:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_FLOW_BOX_CHILD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_FLOW_BOX_CHILD_CLASS(klass : longint) : longint;
begin
  GTK_IS_FLOW_BOX_CHILD_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GTK_TYPE_FLOW_BOX_CHILD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_FLOW_BOX_CHILD_GET_CLASS(obj : longint) : longint;
begin
  GTK_FLOW_BOX_CHILD_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,EG_TYPE_FLOW_BOX_CHILD,GtkFlowBoxChildClass);
end;


end.
