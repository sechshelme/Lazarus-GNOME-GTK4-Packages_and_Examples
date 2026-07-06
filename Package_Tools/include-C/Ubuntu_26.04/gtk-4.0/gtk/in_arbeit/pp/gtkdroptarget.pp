
unit gtkdroptarget;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkdroptarget.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkdroptarget.h
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
PGdkContentFormats  = ^GdkContentFormats;
PGdkDrop  = ^GdkDrop;
Pgsize  = ^gsize;
PGtkDropTarget  = ^GtkDropTarget;
PGType  = ^GType;
PGValue  = ^GValue;
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

{ was #define dname def_expr }
function GTK_TYPE_DROP_TARGET : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_DROP_TARGET(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_DROP_TARGET_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_DROP_TARGET(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_DROP_TARGET_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_DROP_TARGET_GET_CLASS(o : longint) : longint;

type

function gtk_drop_target_get_type:TGType;cdecl;external;
function gtk_drop_target_new(_type:TGType; actions:TGdkDragAction):PGtkDropTarget;cdecl;external;
procedure gtk_drop_target_set_gtypes(self:PGtkDropTarget; types:PGType; n_types:Tgsize);cdecl;external;
(* Const before type ignored *)
function gtk_drop_target_get_gtypes(self:PGtkDropTarget; n_types:Pgsize):PGType;cdecl;external;
function gtk_drop_target_get_formats(self:PGtkDropTarget):PGdkContentFormats;cdecl;external;
procedure gtk_drop_target_set_actions(self:PGtkDropTarget; actions:TGdkDragAction);cdecl;external;
function gtk_drop_target_get_actions(self:PGtkDropTarget):TGdkDragAction;cdecl;external;
procedure gtk_drop_target_set_preload(self:PGtkDropTarget; preload:Tgboolean);cdecl;external;
function gtk_drop_target_get_preload(self:PGtkDropTarget):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_4_FOR(gtk_drop_target_get_current_drop) }
function gtk_drop_target_get_drop(self:PGtkDropTarget):PGdkDrop;cdecl;external;
function gtk_drop_target_get_current_drop(self:PGtkDropTarget):PGdkDrop;cdecl;external;
(* Const before type ignored *)
function gtk_drop_target_get_value(self:PGtkDropTarget):PGValue;cdecl;external;
procedure gtk_drop_target_reject(self:PGtkDropTarget);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_DROP_TARGET : longint; { return type might be wrong }
  begin
    GTK_TYPE_DROP_TARGET:=gtk_drop_target_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_DROP_TARGET(o : longint) : longint;
begin
  GTK_DROP_TARGET:=G_TYPE_CHECK_INSTANCE_CAST(o,GTK_TYPE_DROP_TARGET,GtkDropTarget);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_DROP_TARGET_CLASS(k : longint) : longint;
begin
  GTK_DROP_TARGET_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,GTK_TYPE_DROP_TARGET,GtkDropTargetClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_DROP_TARGET(o : longint) : longint;
begin
  GTK_IS_DROP_TARGET:=G_TYPE_CHECK_INSTANCE_TYPE(o,GTK_TYPE_DROP_TARGET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_DROP_TARGET_CLASS(k : longint) : longint;
begin
  GTK_IS_DROP_TARGET_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,GTK_TYPE_DROP_TARGET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_DROP_TARGET_GET_CLASS(o : longint) : longint;
begin
  GTK_DROP_TARGET_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GTK_TYPE_DROP_TARGET,GtkDropTargetClass);
end;


end.
