unit gtkmountoperation;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) Christian Kellner <gicmo@gnome.org>
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

type
  PGtkMountOperation = ^TGtkMountOperation;
  TGtkMountOperation = record
      parent_instance : TGMountOperation;
      priv : PGtkMountOperationPrivate;
    end;

{*
 * GtkMountOperationClass:
 * @parent_class: The parent class.
  }
{< private > }
{ Padding for future expansion  }
  PGtkMountOperationClass = ^TGtkMountOperationClass;
  TGtkMountOperationClass = record
      parent_class : TGMountOperationClass;
      _gtk_reserved1 : procedure ;cdecl;
      _gtk_reserved2 : procedure ;cdecl;
      _gtk_reserved3 : procedure ;cdecl;
      _gtk_reserved4 : procedure ;cdecl;
    end;


function gtk_mount_operation_get_type:TGType;cdecl;external libgtk4;
function gtk_mount_operation_new(parent:PGtkWindow):PGMountOperation;cdecl;external libgtk4;
function gtk_mount_operation_is_showing(op:PGtkMountOperation):Tgboolean;cdecl;external libgtk4;
procedure gtk_mount_operation_set_parent(op:PGtkMountOperation; parent:PGtkWindow);cdecl;external libgtk4;
function gtk_mount_operation_get_parent(op:PGtkMountOperation):PGtkWindow;cdecl;external libgtk4;
procedure gtk_mount_operation_set_display(op:PGtkMountOperation; display:PGdkDisplay);cdecl;external libgtk4;
function gtk_mount_operation_get_display(op:PGtkMountOperation):PGdkDisplay;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkMountOperation, g_object_unref) }

// === Konventiert am: 6-7-26 16:36:56 ===

function GTK_TYPE_MOUNT_OPERATION : TGType;
function GTK_MOUNT_OPERATION(obj : Pointer) : PGtkMountOperation;
function GTK_MOUNT_OPERATION_CLASS(klass : Pointer) : PGtkMountOperationClass;
function GTK_IS_MOUNT_OPERATION(obj : Pointer) : Tgboolean;
function GTK_IS_MOUNT_OPERATION_CLASS(klass : Pointer) : Tgboolean;
function GTK_MOUNT_OPERATION_GET_CLASS(obj : Pointer) : PGtkMountOperationClass;

implementation

function GTK_TYPE_MOUNT_OPERATION : TGType;
  begin
    GTK_TYPE_MOUNT_OPERATION:=gtk_mount_operation_get_type;
  end;

function GTK_MOUNT_OPERATION(obj : Pointer) : PGtkMountOperation;
begin
  Result := PGtkMountOperation(g_type_check_instance_cast(obj, GTK_TYPE_MOUNT_OPERATION));
end;

function GTK_MOUNT_OPERATION_CLASS(klass : Pointer) : PGtkMountOperationClass;
begin
  Result := PGtkMountOperationClass(g_type_check_class_cast(klass, GTK_TYPE_MOUNT_OPERATION));
end;

function GTK_IS_MOUNT_OPERATION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_MOUNT_OPERATION);
end;

function GTK_IS_MOUNT_OPERATION_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_MOUNT_OPERATION);
end;

function GTK_MOUNT_OPERATION_GET_CLASS(obj : Pointer) : PGtkMountOperationClass;
begin
  Result := PGtkMountOperationClass(PGTypeInstance(obj)^.g_class);
end;



end.
