unit gtktextchild;

interface

uses
  fp_glib2, fp_gtk4;

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


function gtk_text_child_anchor_get_type:TGType;cdecl;external libgtk4;
function gtk_text_child_anchor_new:PGtkTextChildAnchor;cdecl;external libgtk4;
function gtk_text_child_anchor_new_with_replacement(character:Pchar):PGtkTextChildAnchor;cdecl;external libgtk4;
function gtk_text_child_anchor_get_widgets(anchor:PGtkTextChildAnchor; out_len:Pguint):^PGtkWidget;cdecl;external libgtk4;
function gtk_text_child_anchor_get_deleted(anchor:PGtkTextChildAnchor):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkTextChildAnchor, g_object_unref) }

// === Konventiert am: 6-7-26 16:36:24 ===

function GTK_TYPE_TEXT_CHILD_ANCHOR : TGType;
function GTK_TEXT_CHILD_ANCHOR(obj : Pointer) : PGtkTextChildAnchor;
function GTK_TEXT_CHILD_ANCHOR_CLASS(klass : Pointer) : PGtkTextChildAnchorClass;
function GTK_IS_TEXT_CHILD_ANCHOR(obj : Pointer) : Tgboolean;
function GTK_IS_TEXT_CHILD_ANCHOR_CLASS(klass : Pointer) : Tgboolean;
function GTK_TEXT_CHILD_ANCHOR_GET_CLASS(obj : Pointer) : PGtkTextChildAnchorClass;

implementation

function GTK_TYPE_TEXT_CHILD_ANCHOR : TGType;
  begin
    GTK_TYPE_TEXT_CHILD_ANCHOR:=gtk_text_child_anchor_get_type;
  end;

function GTK_TEXT_CHILD_ANCHOR(obj : Pointer) : PGtkTextChildAnchor;
begin
  Result := PGtkTextChildAnchor(g_type_check_instance_cast(obj, GTK_TYPE_TEXT_CHILD_ANCHOR));
end;

function GTK_TEXT_CHILD_ANCHOR_CLASS(klass : Pointer) : PGtkTextChildAnchorClass;
begin
  Result := PGtkTextChildAnchorClass(g_type_check_class_cast(klass, GTK_TYPE_TEXT_CHILD_ANCHOR));
end;

function GTK_IS_TEXT_CHILD_ANCHOR(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_TEXT_CHILD_ANCHOR);
end;

function GTK_IS_TEXT_CHILD_ANCHOR_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_TEXT_CHILD_ANCHOR);
end;

function GTK_TEXT_CHILD_ANCHOR_GET_CLASS(obj : Pointer) : PGtkTextChildAnchorClass;
begin
  Result := PGtkTextChildAnchorClass(PGTypeInstance(obj)^.g_class);
end;



end.
