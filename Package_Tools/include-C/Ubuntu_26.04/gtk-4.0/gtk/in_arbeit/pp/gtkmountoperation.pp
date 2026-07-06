
unit gtkmountoperation;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkmountoperation.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkmountoperation.h
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
PGdkDisplay  = ^GdkDisplay;
PGMountOperation  = ^GMountOperation;
PGtkMountOperation  = ^GtkMountOperation;
PGtkMountOperationClass  = ^GtkMountOperationClass;
PGtkMountOperationPrivate  = ^GtkMountOperationPrivate;
PGtkWindow  = ^GtkWindow;
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

{ was #define dname def_expr }
function GTK_TYPE_MOUNT_OPERATION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_MOUNT_OPERATION(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_MOUNT_OPERATION_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_MOUNT_OPERATION(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_MOUNT_OPERATION_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_MOUNT_OPERATION_GET_CLASS(o : longint) : longint;

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


function gtk_mount_operation_get_type:TGType;cdecl;external;
function gtk_mount_operation_new(parent:PGtkWindow):PGMountOperation;cdecl;external;
function gtk_mount_operation_is_showing(op:PGtkMountOperation):Tgboolean;cdecl;external;
procedure gtk_mount_operation_set_parent(op:PGtkMountOperation; parent:PGtkWindow);cdecl;external;
function gtk_mount_operation_get_parent(op:PGtkMountOperation):PGtkWindow;cdecl;external;
procedure gtk_mount_operation_set_display(op:PGtkMountOperation; display:PGdkDisplay);cdecl;external;
function gtk_mount_operation_get_display(op:PGtkMountOperation):PGdkDisplay;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkMountOperation, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_MOUNT_OPERATION : longint; { return type might be wrong }
  begin
    GTK_TYPE_MOUNT_OPERATION:=gtk_mount_operation_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_MOUNT_OPERATION(o : longint) : longint;
begin
  GTK_MOUNT_OPERATION:=G_TYPE_CHECK_INSTANCE_CAST(o,GTK_TYPE_MOUNT_OPERATION,GtkMountOperation);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_MOUNT_OPERATION_CLASS(k : longint) : longint;
begin
  GTK_MOUNT_OPERATION_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,GTK_TYPE_MOUNT_OPERATION,GtkMountOperationClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_MOUNT_OPERATION(o : longint) : longint;
begin
  GTK_IS_MOUNT_OPERATION:=G_TYPE_CHECK_INSTANCE_TYPE(o,GTK_TYPE_MOUNT_OPERATION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_MOUNT_OPERATION_CLASS(k : longint) : longint;
begin
  GTK_IS_MOUNT_OPERATION_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,GTK_TYPE_MOUNT_OPERATION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_MOUNT_OPERATION_GET_CLASS(o : longint) : longint;
begin
  GTK_MOUNT_OPERATION_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GTK_TYPE_MOUNT_OPERATION,GtkMountOperationClass);
end;


end.
