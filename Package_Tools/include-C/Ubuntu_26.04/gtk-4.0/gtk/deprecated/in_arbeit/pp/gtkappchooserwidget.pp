
unit gtkappchooserwidget;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkappchooserwidget.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkappchooserwidget.h
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
Pchar  = ^char;
PGtkAppChooserWidget  = ^GtkAppChooserWidget;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * gtkappchooserwidget.h: an app-chooser widget
 *
 * Copyright (C) 2004 Novell, Inc.
 * Copyright (C) 2007, 2010 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Dave Camp <dave@novell.com>
 *          Alexander Larsson <alexl@redhat.com>
 *          Cosimo Cecchi <ccecchi@redhat.com>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}
{$include <gio/gio.h>}

{ was #define dname def_expr }
function GTK_TYPE_APP_CHOOSER_WIDGET : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_APP_CHOOSER_WIDGET(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_APP_CHOOSER_WIDGET(obj : longint) : longint;

type

function gtk_app_chooser_widget_get_type:TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
(* Const before type ignored *)
function gtk_app_chooser_widget_new(content_type:Pchar):PGtkWidget;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_app_chooser_widget_set_show_default(self:PGtkAppChooserWidget; setting:Tgboolean);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_app_chooser_widget_get_show_default(self:PGtkAppChooserWidget):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_app_chooser_widget_set_show_recommended(self:PGtkAppChooserWidget; setting:Tgboolean);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_app_chooser_widget_get_show_recommended(self:PGtkAppChooserWidget):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_app_chooser_widget_set_show_fallback(self:PGtkAppChooserWidget; setting:Tgboolean);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_app_chooser_widget_get_show_fallback(self:PGtkAppChooserWidget):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_app_chooser_widget_set_show_other(self:PGtkAppChooserWidget; setting:Tgboolean);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_app_chooser_widget_get_show_other(self:PGtkAppChooserWidget):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_app_chooser_widget_set_show_all(self:PGtkAppChooserWidget; setting:Tgboolean);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_app_chooser_widget_get_show_all(self:PGtkAppChooserWidget):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
(* Const before type ignored *)
procedure gtk_app_chooser_widget_set_default_text(self:PGtkAppChooserWidget; text:Pchar);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
(* Const before type ignored *)
function gtk_app_chooser_widget_get_default_text(self:PGtkAppChooserWidget):Pchar;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkAppChooserWidget, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_APP_CHOOSER_WIDGET : longint; { return type might be wrong }
  begin
    GTK_TYPE_APP_CHOOSER_WIDGET:=gtk_app_chooser_widget_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_APP_CHOOSER_WIDGET(obj : longint) : longint;
begin
  GTK_APP_CHOOSER_WIDGET:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_APP_CHOOSER_WIDGET,GtkAppChooserWidget);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_APP_CHOOSER_WIDGET(obj : longint) : longint;
begin
  GTK_IS_APP_CHOOSER_WIDGET:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_APP_CHOOSER_WIDGET);
end;


end.
