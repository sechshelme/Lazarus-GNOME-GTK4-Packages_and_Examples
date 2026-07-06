unit gtkwindowgroup;

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
{$include "gtkwindow.h"}

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

function gtk_window_group_get_type:TGType;cdecl;external libgtk4;
function gtk_window_group_new:PGtkWindowGroup;cdecl;external libgtk4;
procedure gtk_window_group_add_window(window_group:PGtkWindowGroup; window:PGtkWindow);cdecl;external libgtk4;
procedure gtk_window_group_remove_window(window_group:PGtkWindowGroup; window:PGtkWindow);cdecl;external libgtk4;
function gtk_window_group_list_windows(window_group:PGtkWindowGroup):PGList;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:55:13 ===

function GTK_TYPE_WINDOW_GROUP : TGType;
function GTK_WINDOW_GROUP(obj : Pointer) : PGtkWindowGroup;
function GTK_WINDOW_GROUP_CLASS(klass : Pointer) : PGtkWindowGroupClass;
function GTK_IS_WINDOW_GROUP(obj : Pointer) : Tgboolean;
function GTK_IS_WINDOW_GROUP_CLASS(klass : Pointer) : Tgboolean;
function GTK_WINDOW_GROUP_GET_CLASS(obj : Pointer) : PGtkWindowGroupClass;

implementation

function GTK_TYPE_WINDOW_GROUP : TGType;
  begin
    GTK_TYPE_WINDOW_GROUP:=gtk_window_group_get_type;
  end;

function GTK_WINDOW_GROUP(obj : Pointer) : PGtkWindowGroup;
begin
  Result := PGtkWindowGroup(g_type_check_instance_cast(obj, GTK_TYPE_WINDOW_GROUP));
end;

function GTK_WINDOW_GROUP_CLASS(klass : Pointer) : PGtkWindowGroupClass;
begin
  Result := PGtkWindowGroupClass(g_type_check_class_cast(klass, GTK_TYPE_WINDOW_GROUP));
end;

function GTK_IS_WINDOW_GROUP(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_WINDOW_GROUP);
end;

function GTK_IS_WINDOW_GROUP_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_WINDOW_GROUP);
end;

function GTK_WINDOW_GROUP_GET_CLASS(obj : Pointer) : PGtkWindowGroupClass;
begin
  Result := PGtkWindowGroupClass(PGTypeInstance(obj)^.g_class);
end;



end.
