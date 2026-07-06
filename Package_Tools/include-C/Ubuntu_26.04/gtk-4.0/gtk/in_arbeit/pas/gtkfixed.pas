unit gtkfixed;

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
  PGtkFixed = ^TGtkFixed;
  TGtkFixed = record
      parent_instance : TGtkWidget;
    end;

{< private > }
  PGtkFixedClass = ^TGtkFixedClass;
  TGtkFixedClass = record
      parent_class : TGtkWidgetClass;
      padding : array[0..7] of Tgpointer;
    end;


function gtk_fixed_get_type:TGType;cdecl;external libgtk4;
function gtk_fixed_new:PGtkWidget;cdecl;external libgtk4;
procedure gtk_fixed_put(fixed:PGtkFixed; widget:PGtkWidget; x:Tdouble; y:Tdouble);cdecl;external libgtk4;
procedure gtk_fixed_remove(fixed:PGtkFixed; widget:PGtkWidget);cdecl;external libgtk4;
procedure gtk_fixed_move(fixed:PGtkFixed; widget:PGtkWidget; x:Tdouble; y:Tdouble);cdecl;external libgtk4;
procedure gtk_fixed_get_child_position(fixed:PGtkFixed; widget:PGtkWidget; x:Pdouble; y:Pdouble);cdecl;external libgtk4;
procedure gtk_fixed_set_child_transform(fixed:PGtkFixed; widget:PGtkWidget; transform:PGskTransform);cdecl;external libgtk4;
function gtk_fixed_get_child_transform(fixed:PGtkFixed; widget:PGtkWidget):PGskTransform;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkFixed, g_object_unref) }

// === Konventiert am: 6-7-26 16:33:23 ===

function GTK_TYPE_FIXED : TGType;
function GTK_FIXED(obj : Pointer) : PGtkFixed;
function GTK_FIXED_CLASS(klass : Pointer) : PGtkFixedClass;
function GTK_IS_FIXED(obj : Pointer) : Tgboolean;
function GTK_IS_FIXED_CLASS(klass : Pointer) : Tgboolean;
function GTK_FIXED_GET_CLASS(obj : Pointer) : PGtkFixedClass;

implementation

function GTK_TYPE_FIXED : TGType;
  begin
    GTK_TYPE_FIXED:=gtk_fixed_get_type;
  end;

function GTK_FIXED(obj : Pointer) : PGtkFixed;
begin
  Result := PGtkFixed(g_type_check_instance_cast(obj, GTK_TYPE_FIXED));
end;

function GTK_FIXED_CLASS(klass : Pointer) : PGtkFixedClass;
begin
  Result := PGtkFixedClass(g_type_check_class_cast(klass, GTK_TYPE_FIXED));
end;

function GTK_IS_FIXED(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_FIXED);
end;

function GTK_IS_FIXED_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_FIXED);
end;

function GTK_FIXED_GET_CLASS(obj : Pointer) : PGtkFixedClass;
begin
  Result := PGtkFixedClass(PGTypeInstance(obj)^.g_class);
end;



end.
