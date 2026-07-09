
unit gtkcolorchooserwidget;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkcolorchooserwidget.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkcolorchooserwidget.h
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
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2012 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
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

{ was #define dname def_expr }
function GTK_TYPE_COLOR_CHOOSER_WIDGET : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_COLOR_CHOOSER_WIDGET(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_COLOR_CHOOSER_WIDGET(obj : longint) : longint;

type

function gtk_color_chooser_widget_get_type:TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_color_chooser_widget_new:PGtkWidget;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkColorChooserWidget, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_COLOR_CHOOSER_WIDGET : longint; { return type might be wrong }
  begin
    GTK_TYPE_COLOR_CHOOSER_WIDGET:=gtk_color_chooser_widget_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_COLOR_CHOOSER_WIDGET(obj : longint) : longint;
begin
  GTK_COLOR_CHOOSER_WIDGET:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_COLOR_CHOOSER_WIDGET,GtkColorChooserWidget);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_COLOR_CHOOSER_WIDGET(obj : longint) : longint;
begin
  GTK_IS_COLOR_CHOOSER_WIDGET:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_COLOR_CHOOSER_WIDGET);
end;


end.
