unit gtkapplicationwindow;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2011 Canonical Limited
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the licence, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Ryan Lortie <desrt@desrt.ca>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwindow.h>}
{$include <gtk/deprecated/gtkshortcutswindow.h>}

type
  PGtkApplicationWindow = ^TGtkApplicationWindow;
  TGtkApplicationWindow = record
      parent_instance : TGtkWindow;
    end;

{*
 * GtkApplicationWindowClass:
 * @parent_class: The parent class.
  }
{< private > }
  PGtkApplicationWindowClass = ^TGtkApplicationWindowClass;
  TGtkApplicationWindowClass = record
      parent_class : TGtkWindowClass;
      padding : array[0..7] of Tgpointer;
    end;


function gtk_application_window_get_type:TGType;cdecl;external libgtk4;
function gtk_application_window_new(application:PGtkApplication):PGtkWidget;cdecl;external libgtk4;
procedure gtk_application_window_set_show_menubar(window:PGtkApplicationWindow; show_menubar:Tgboolean);cdecl;external libgtk4;
function gtk_application_window_get_show_menubar(window:PGtkApplicationWindow):Tgboolean;cdecl;external libgtk4;
function gtk_application_window_get_id(window:PGtkApplicationWindow):Tguint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_18 }
procedure gtk_application_window_set_help_overlay(window:PGtkApplicationWindow; help_overlay:PGtkShortcutsWindow);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_18 }
function gtk_application_window_get_help_overlay(window:PGtkApplicationWindow):PGtkShortcutsWindow;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkApplicationWindow, g_object_unref) }

// === Konventiert am: 5-7-26 19:16:15 ===

function GTK_TYPE_APPLICATION_WINDOW : TGType;
function GTK_APPLICATION_WINDOW(obj : Pointer) : PGtkApplicationWindow;
function GTK_APPLICATION_WINDOW_CLASS(klass : Pointer) : PGtkApplicationWindowClass;
function GTK_IS_APPLICATION_WINDOW(obj : Pointer) : Tgboolean;
function GTK_IS_APPLICATION_WINDOW_CLASS(klass : Pointer) : Tgboolean;
function GTK_APPLICATION_WINDOW_GET_CLASS(obj : Pointer) : PGtkApplicationWindowClass;

implementation

function GTK_TYPE_APPLICATION_WINDOW : TGType;
  begin
    GTK_TYPE_APPLICATION_WINDOW:=gtk_application_window_get_type;
  end;

function GTK_APPLICATION_WINDOW(obj : Pointer) : PGtkApplicationWindow;
begin
  Result := PGtkApplicationWindow(g_type_check_instance_cast(obj, GTK_TYPE_APPLICATION_WINDOW));
end;

function GTK_APPLICATION_WINDOW_CLASS(klass : Pointer) : PGtkApplicationWindowClass;
begin
  Result := PGtkApplicationWindowClass(g_type_check_class_cast(klass, GTK_TYPE_APPLICATION_WINDOW));
end;

function GTK_IS_APPLICATION_WINDOW(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_APPLICATION_WINDOW);
end;

function GTK_IS_APPLICATION_WINDOW_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_APPLICATION_WINDOW);
end;

function GTK_APPLICATION_WINDOW_GET_CLASS(obj : Pointer) : PGtkApplicationWindowClass;
begin
  Result := PGtkApplicationWindowClass(PGTypeInstance(obj)^.g_class);
end;



end.
