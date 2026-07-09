
unit gtkappchooser;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkappchooser.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkappchooser.h
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
PGAppInfo  = ^GAppInfo;
PGtkAppChooser  = ^GtkAppChooser;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * gtkappchooser.h: app-chooser interface
 *
 * Copyright (C) 2010 Red Hat, Inc.
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
 * Authors: Cosimo Cecchi <ccecchi@redhat.com>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <glib.h>}
{$include <gio/gio.h>}
{$include <gdk/gdk.h>}

{ was #define dname def_expr }
function GTK_TYPE_APP_CHOOSER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_APP_CHOOSER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_APP_CHOOSER(obj : longint) : longint;

type

function gtk_app_chooser_get_type:TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_app_chooser_get_app_info(self:PGtkAppChooser):PGAppInfo;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_app_chooser_get_content_type(self:PGtkAppChooser):Pchar;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_app_chooser_refresh(self:PGtkAppChooser);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkAppChooser, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_APP_CHOOSER : longint; { return type might be wrong }
  begin
    GTK_TYPE_APP_CHOOSER:=gtk_app_chooser_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_APP_CHOOSER(obj : longint) : longint;
begin
  GTK_APP_CHOOSER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_APP_CHOOSER,GtkAppChooser);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_APP_CHOOSER(obj : longint) : longint;
begin
  GTK_IS_APP_CHOOSER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_APP_CHOOSER);
end;


end.
