unit gtkdroptarget;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2020 Benjamin Otte
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Benjamin Otte <otte@gnome.org>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtktypes.h>}
type

type

function gtk_drop_target_get_type:TGType;cdecl;external libgtk4;
function gtk_drop_target_new(_type:TGType; actions:TGdkDragAction):PGtkDropTarget;cdecl;external libgtk4;
procedure gtk_drop_target_set_gtypes(self:PGtkDropTarget; types:PGType; n_types:Tgsize);cdecl;external libgtk4;
function gtk_drop_target_get_gtypes(self:PGtkDropTarget; n_types:Pgsize):PGType;cdecl;external libgtk4;
function gtk_drop_target_get_formats(self:PGtkDropTarget):PGdkContentFormats;cdecl;external libgtk4;
procedure gtk_drop_target_set_actions(self:PGtkDropTarget; actions:TGdkDragAction);cdecl;external libgtk4;
function gtk_drop_target_get_actions(self:PGtkDropTarget):TGdkDragAction;cdecl;external libgtk4;
procedure gtk_drop_target_set_preload(self:PGtkDropTarget; preload:Tgboolean);cdecl;external libgtk4;
function gtk_drop_target_get_preload(self:PGtkDropTarget):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_4_FOR(gtk_drop_target_get_current_drop) }
function gtk_drop_target_get_drop(self:PGtkDropTarget):PGdkDrop;cdecl;external libgtk4;
function gtk_drop_target_get_current_drop(self:PGtkDropTarget):PGdkDrop;cdecl;external libgtk4;
function gtk_drop_target_get_value(self:PGtkDropTarget):PGValue;cdecl;external libgtk4;
procedure gtk_drop_target_reject(self:PGtkDropTarget);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:33:35 ===

function GTK_TYPE_DROP_TARGET : TGType;
function GTK_DROP_TARGET(obj : Pointer) : PGtkDropTarget;
function GTK_DROP_TARGET_CLASS(klass : Pointer) : PGtkDropTargetClass;
function GTK_IS_DROP_TARGET(obj : Pointer) : Tgboolean;
function GTK_IS_DROP_TARGET_CLASS(klass : Pointer) : Tgboolean;
function GTK_DROP_TARGET_GET_CLASS(obj : Pointer) : PGtkDropTargetClass;

implementation

function GTK_TYPE_DROP_TARGET : TGType;
  begin
    GTK_TYPE_DROP_TARGET:=gtk_drop_target_get_type;
  end;

function GTK_DROP_TARGET(obj : Pointer) : PGtkDropTarget;
begin
  Result := PGtkDropTarget(g_type_check_instance_cast(obj, GTK_TYPE_DROP_TARGET));
end;

function GTK_DROP_TARGET_CLASS(klass : Pointer) : PGtkDropTargetClass;
begin
  Result := PGtkDropTargetClass(g_type_check_class_cast(klass, GTK_TYPE_DROP_TARGET));
end;

function GTK_IS_DROP_TARGET(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_DROP_TARGET);
end;

function GTK_IS_DROP_TARGET_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_DROP_TARGET);
end;

function GTK_DROP_TARGET_GET_CLASS(obj : Pointer) : PGtkDropTargetClass;
begin
  Result := PGtkDropTargetClass(PGTypeInstance(obj)^.g_class);
end;



end.
