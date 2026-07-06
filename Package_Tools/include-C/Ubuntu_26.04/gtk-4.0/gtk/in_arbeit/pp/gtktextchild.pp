
unit gtktextchild;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtktextchild.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtktextchild.h
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
PGtkTextChildAnchor  = ^GtkTextChildAnchor;
PGtkTextChildAnchorClass  = ^GtkTextChildAnchorClass;
PGtkWidget  = ^GtkWidget;
Pguint  = ^guint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * gtktextchild.h Copyright (C) 2000 Red Hat, Inc.
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
{$include <gdk/gdk.h>}
{$include <glib-object.h>}
{$include <gtk/gtkwidget.h>}
{*
 * GtkTextChildAnchor:
 *
 * Marks a spot in a `GtkTextBuffer` where child widgets can be “anchored”.
 *
 * The anchor can have multiple widgets anchored, to allow for multiple views.
  }
type

{ was #define dname def_expr }
function GTK_TYPE_TEXT_CHILD_ANCHOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TEXT_CHILD_ANCHOR(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TEXT_CHILD_ANCHOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_TEXT_CHILD_ANCHOR(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_TEXT_CHILD_ANCHOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TEXT_CHILD_ANCHOR_GET_CLASS(obj : longint) : longint;

{< private > }
type
  PGtkTextChildAnchor = ^TGtkTextChildAnchor;
  TGtkTextChildAnchor = record
      parent_instance : TGObject;
      segment : Tgpointer;
    end;

{ Padding for future expansion  }
  PGtkTextChildAnchorClass = ^TGtkTextChildAnchorClass;
  TGtkTextChildAnchorClass = record
      parent_class : TGObjectClass;
      _gtk_reserved1 : procedure ;cdecl;
      _gtk_reserved2 : procedure ;cdecl;
      _gtk_reserved3 : procedure ;cdecl;
      _gtk_reserved4 : procedure ;cdecl;
    end;


function gtk_text_child_anchor_get_type:TGType;cdecl;external;
function gtk_text_child_anchor_new:PGtkTextChildAnchor;cdecl;external;
(* Const before type ignored *)
function gtk_text_child_anchor_new_with_replacement(character:Pchar):PGtkTextChildAnchor;cdecl;external;
function gtk_text_child_anchor_get_widgets(anchor:PGtkTextChildAnchor; out_len:Pguint):^PGtkWidget;cdecl;external;
function gtk_text_child_anchor_get_deleted(anchor:PGtkTextChildAnchor):Tgboolean;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkTextChildAnchor, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_TEXT_CHILD_ANCHOR : longint; { return type might be wrong }
  begin
    GTK_TYPE_TEXT_CHILD_ANCHOR:=gtk_text_child_anchor_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TEXT_CHILD_ANCHOR(object : longint) : longint;
begin
  GTK_TEXT_CHILD_ANCHOR:=G_TYPE_CHECK_INSTANCE_CAST(object,GTK_TYPE_TEXT_CHILD_ANCHOR,GtkTextChildAnchor);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TEXT_CHILD_ANCHOR_CLASS(klass : longint) : longint;
begin
  GTK_TEXT_CHILD_ANCHOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GTK_TYPE_TEXT_CHILD_ANCHOR,GtkTextChildAnchorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_TEXT_CHILD_ANCHOR(object : longint) : longint;
begin
  GTK_IS_TEXT_CHILD_ANCHOR:=G_TYPE_CHECK_INSTANCE_TYPE(object,GTK_TYPE_TEXT_CHILD_ANCHOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_TEXT_CHILD_ANCHOR_CLASS(klass : longint) : longint;
begin
  GTK_IS_TEXT_CHILD_ANCHOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GTK_TYPE_TEXT_CHILD_ANCHOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TEXT_CHILD_ANCHOR_GET_CLASS(obj : longint) : longint;
begin
  GTK_TEXT_CHILD_ANCHOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GTK_TYPE_TEXT_CHILD_ANCHOR,GtkTextChildAnchorClass);
end;


end.
