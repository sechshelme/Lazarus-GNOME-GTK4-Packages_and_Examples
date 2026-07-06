unit gtkdroptargetasync;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; c-file-style: "gnu"; tab-width: 8 -*-  }
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

function gtk_drop_target_async_get_type:TGType;cdecl;external libgtk4;
function gtk_drop_target_async_new(formats:PGdkContentFormats; actions:TGdkDragAction):PGtkDropTargetAsync;cdecl;external libgtk4;
procedure gtk_drop_target_async_set_formats(self:PGtkDropTargetAsync; formats:PGdkContentFormats);cdecl;external libgtk4;
function gtk_drop_target_async_get_formats(self:PGtkDropTargetAsync):PGdkContentFormats;cdecl;external libgtk4;
procedure gtk_drop_target_async_set_actions(self:PGtkDropTargetAsync; actions:TGdkDragAction);cdecl;external libgtk4;
function gtk_drop_target_async_get_actions(self:PGtkDropTargetAsync):TGdkDragAction;cdecl;external libgtk4;
procedure gtk_drop_target_async_reject_drop(self:PGtkDropTargetAsync; drop:PGdkDrop);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:37:20 ===

function GTK_TYPE_DROP_TARGET_ASYNC : TGType;
function GTK_DROP_TARGET_ASYNC(obj : Pointer) : PGtkDropTargetAsync;
function GTK_DROP_TARGET_ASYNC_CLASS(klass : Pointer) : PGtkDropTargetAsyncClass;
function GTK_IS_DROP_TARGET_ASYNC(obj : Pointer) : Tgboolean;
function GTK_IS_DROP_TARGET_ASYNC_CLASS(klass : Pointer) : Tgboolean;
function GTK_DROP_TARGET_ASYNC_GET_CLASS(obj : Pointer) : PGtkDropTargetAsyncClass;

implementation

function GTK_TYPE_DROP_TARGET_ASYNC : TGType;
  begin
    GTK_TYPE_DROP_TARGET_ASYNC:=gtk_drop_target_async_get_type;
  end;

function GTK_DROP_TARGET_ASYNC(obj : Pointer) : PGtkDropTargetAsync;
begin
  Result := PGtkDropTargetAsync(g_type_check_instance_cast(obj, GTK_TYPE_DROP_TARGET_ASYNC));
end;

function GTK_DROP_TARGET_ASYNC_CLASS(klass : Pointer) : PGtkDropTargetAsyncClass;
begin
  Result := PGtkDropTargetAsyncClass(g_type_check_class_cast(klass, GTK_TYPE_DROP_TARGET_ASYNC));
end;

function GTK_IS_DROP_TARGET_ASYNC(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_DROP_TARGET_ASYNC);
end;

function GTK_IS_DROP_TARGET_ASYNC_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_DROP_TARGET_ASYNC);
end;

function GTK_DROP_TARGET_ASYNC_GET_CLASS(obj : Pointer) : PGtkDropTargetAsyncClass;
begin
  Result := PGtkDropTargetAsyncClass(PGTypeInstance(obj)^.g_class);
end;



end.
