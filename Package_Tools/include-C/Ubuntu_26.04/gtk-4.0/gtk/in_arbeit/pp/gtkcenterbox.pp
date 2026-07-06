
unit gtkcenterbox;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkcenterbox.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkcenterbox.h
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
PGtkCenterBox  = ^GtkCenterBox;
PGtkWidget  = ^GtkWidget;
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

{ was #define dname def_expr }
function GTK_TYPE_CENTER_BOX : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_CENTER_BOX(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_CENTER_BOX_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_CENTER_BOX(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_CENTER_BOX_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_CENTER_BOX_GET_CLASS(obj : longint) : longint;

type

function gtk_center_box_get_type:TGType;cdecl;external;
function gtk_center_box_new:PGtkWidget;cdecl;external;
procedure gtk_center_box_set_start_widget(self:PGtkCenterBox; child:PGtkWidget);cdecl;external;
procedure gtk_center_box_set_center_widget(self:PGtkCenterBox; child:PGtkWidget);cdecl;external;
procedure gtk_center_box_set_end_widget(self:PGtkCenterBox; child:PGtkWidget);cdecl;external;
function gtk_center_box_get_start_widget(self:PGtkCenterBox):PGtkWidget;cdecl;external;
function gtk_center_box_get_center_widget(self:PGtkCenterBox):PGtkWidget;cdecl;external;
function gtk_center_box_get_end_widget(self:PGtkCenterBox):PGtkWidget;cdecl;external;
procedure gtk_center_box_set_baseline_position(self:PGtkCenterBox; position:TGtkBaselinePosition);cdecl;external;
function gtk_center_box_get_baseline_position(self:PGtkCenterBox):TGtkBaselinePosition;cdecl;external;
procedure gtk_center_box_set_shrink_center_last(self:PGtkCenterBox; shrink_center_last:Tgboolean);cdecl;external;
function gtk_center_box_get_shrink_center_last(self:PGtkCenterBox):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_CENTER_BOX : longint; { return type might be wrong }
  begin
    GTK_TYPE_CENTER_BOX:=gtk_center_box_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_CENTER_BOX(obj : longint) : longint;
begin
  GTK_CENTER_BOX:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_CENTER_BOX,GtkCenterBox);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_CENTER_BOX_CLASS(klass : longint) : longint;
begin
  GTK_CENTER_BOX_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GTK_TYPE_CENTER_BOX,GtkCenterBoxClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_CENTER_BOX(obj : longint) : longint;
begin
  GTK_IS_CENTER_BOX:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_CENTER_BOX);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_CENTER_BOX_CLASS(klass : longint) : longint;
begin
  GTK_IS_CENTER_BOX_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GTK_TYPE_CENTER_BOX);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_CENTER_BOX_GET_CLASS(obj : longint) : longint;
begin
  GTK_CENTER_BOX_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GTK_TYPE_CENTER_BOX,GtkCenterBoxClass);
end;


end.
