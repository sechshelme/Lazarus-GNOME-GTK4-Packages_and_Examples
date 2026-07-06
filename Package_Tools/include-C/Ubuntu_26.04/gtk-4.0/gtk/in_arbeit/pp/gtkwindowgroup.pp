
unit gtkwindowgroup;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkwindowgroup.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkwindowgroup.h
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
PGtkWindow  = ^GtkWindow;
PGtkWindowGroup  = ^GtkWindowGroup;
PGtkWindowGroupClass  = ^GtkWindowGroupClass;
PGtkWindowGroupPrivate  = ^GtkWindowGroupPrivate;
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
{$include "gtkwindow.h"}

{ was #define dname def_expr }
function GTK_TYPE_WINDOW_GROUP : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_WINDOW_GROUP(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_WINDOW_GROUP_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_WINDOW_GROUP(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_WINDOW_GROUP_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_WINDOW_GROUP_GET_CLASS(obj : longint) : longint;

type
  PGtkWindowGroup = ^TGtkWindowGroup;
  TGtkWindowGroup = record
      parent_instance : TGObject;
      priv : PGtkWindowGroupPrivate;
    end;

{ Padding for future expansion  }
  PGtkWindowGroupClass = ^TGtkWindowGroupClass;
  TGtkWindowGroupClass = record
      parent_class : TGObjectClass;
      _gtk_reserved1 : procedure ;cdecl;
      _gtk_reserved2 : procedure ;cdecl;
      _gtk_reserved3 : procedure ;cdecl;
      _gtk_reserved4 : procedure ;cdecl;
    end;

{ Window groups
  }

function gtk_window_group_get_type:TGType;cdecl;external;
function gtk_window_group_new:PGtkWindowGroup;cdecl;external;
procedure gtk_window_group_add_window(window_group:PGtkWindowGroup; window:PGtkWindow);cdecl;external;
procedure gtk_window_group_remove_window(window_group:PGtkWindowGroup; window:PGtkWindow);cdecl;external;
function gtk_window_group_list_windows(window_group:PGtkWindowGroup):PGList;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_WINDOW_GROUP : longint; { return type might be wrong }
  begin
    GTK_TYPE_WINDOW_GROUP:=gtk_window_group_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_WINDOW_GROUP(object : longint) : longint;
begin
  GTK_WINDOW_GROUP:=G_TYPE_CHECK_INSTANCE_CAST(object,GTK_TYPE_WINDOW_GROUP,GtkWindowGroup);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_WINDOW_GROUP_CLASS(klass : longint) : longint;
begin
  GTK_WINDOW_GROUP_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GTK_TYPE_WINDOW_GROUP,GtkWindowGroupClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_WINDOW_GROUP(object : longint) : longint;
begin
  GTK_IS_WINDOW_GROUP:=G_TYPE_CHECK_INSTANCE_TYPE(object,GTK_TYPE_WINDOW_GROUP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_WINDOW_GROUP_CLASS(klass : longint) : longint;
begin
  GTK_IS_WINDOW_GROUP_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GTK_TYPE_WINDOW_GROUP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_WINDOW_GROUP_GET_CLASS(obj : longint) : longint;
begin
  GTK_WINDOW_GROUP_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GTK_TYPE_WINDOW_GROUP,GtkWindowGroupClass);
end;


end.
