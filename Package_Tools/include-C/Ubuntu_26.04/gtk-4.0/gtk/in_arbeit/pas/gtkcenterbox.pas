unit gtkcenterbox;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2017 Timm Bäder <mail@baedert.org>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
 * License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 *
 * Author: Timm Bäder <mail@baedert.org>
 *
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include "gtkwidget.h"}

type

function gtk_center_box_get_type:TGType;cdecl;external libgtk4;
function gtk_center_box_new:PGtkWidget;cdecl;external libgtk4;
procedure gtk_center_box_set_start_widget(self:PGtkCenterBox; child:PGtkWidget);cdecl;external libgtk4;
procedure gtk_center_box_set_center_widget(self:PGtkCenterBox; child:PGtkWidget);cdecl;external libgtk4;
procedure gtk_center_box_set_end_widget(self:PGtkCenterBox; child:PGtkWidget);cdecl;external libgtk4;
function gtk_center_box_get_start_widget(self:PGtkCenterBox):PGtkWidget;cdecl;external libgtk4;
function gtk_center_box_get_center_widget(self:PGtkCenterBox):PGtkWidget;cdecl;external libgtk4;
function gtk_center_box_get_end_widget(self:PGtkCenterBox):PGtkWidget;cdecl;external libgtk4;
procedure gtk_center_box_set_baseline_position(self:PGtkCenterBox; position:TGtkBaselinePosition);cdecl;external libgtk4;
function gtk_center_box_get_baseline_position(self:PGtkCenterBox):TGtkBaselinePosition;cdecl;external libgtk4;
procedure gtk_center_box_set_shrink_center_last(self:PGtkCenterBox; shrink_center_last:Tgboolean);cdecl;external libgtk4;
function gtk_center_box_get_shrink_center_last(self:PGtkCenterBox):Tgboolean;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 13:52:57 ===

function GTK_TYPE_CENTER_BOX : TGType;
function GTK_CENTER_BOX(obj : Pointer) : PGtkCenterBox;
function GTK_CENTER_BOX_CLASS(klass : Pointer) : PGtkCenterBoxClass;
function GTK_IS_CENTER_BOX(obj : Pointer) : Tgboolean;
function GTK_IS_CENTER_BOX_CLASS(klass : Pointer) : Tgboolean;
function GTK_CENTER_BOX_GET_CLASS(obj : Pointer) : PGtkCenterBoxClass;

implementation

function GTK_TYPE_CENTER_BOX : TGType;
  begin
    GTK_TYPE_CENTER_BOX:=gtk_center_box_get_type;
  end;

function GTK_CENTER_BOX(obj : Pointer) : PGtkCenterBox;
begin
  Result := PGtkCenterBox(g_type_check_instance_cast(obj, GTK_TYPE_CENTER_BOX));
end;

function GTK_CENTER_BOX_CLASS(klass : Pointer) : PGtkCenterBoxClass;
begin
  Result := PGtkCenterBoxClass(g_type_check_class_cast(klass, GTK_TYPE_CENTER_BOX));
end;

function GTK_IS_CENTER_BOX(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_CENTER_BOX);
end;

function GTK_IS_CENTER_BOX_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_CENTER_BOX);
end;

function GTK_CENTER_BOX_GET_CLASS(obj : Pointer) : PGtkCenterBoxClass;
begin
  Result := PGtkCenterBoxClass(PGTypeInstance(obj)^.g_class);
end;



end.
