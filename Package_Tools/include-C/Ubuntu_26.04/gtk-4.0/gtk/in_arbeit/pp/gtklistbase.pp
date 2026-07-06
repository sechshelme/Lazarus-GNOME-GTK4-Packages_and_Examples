
unit gtklistbase;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtklistbase.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtklistbase.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2019 Benjamin Otte
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
{$include <gtk/gtkwidget.h>}
{$include <gtk/gtkselectionmodel.h>}

{ was #define dname def_expr }
function GTK_TYPE_LIST_BASE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_LIST_BASE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_LIST_BASE_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_LIST_BASE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_LIST_BASE_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_LIST_BASE_GET_CLASS(o : longint) : longint;

{*
 * GtkListBase:
 *
 * The abstract base class for GTK's list widgets.
 *
 * # Shortcuts and Gestures
 *
 * `GtkListBase` supports the following keyboard shortcuts:
 *
 * - <kbd>Ctrl</kbd>+<kbd>A</kbd> or <kbd>Ctrl</kbd>+<kbd>&sol;</kbd>
 *   selects all items.
 * - <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>A</kbd> or
 *   <kbd>Ctrl</kbd>+<kbd>&bsol;</kbd> unselects all items.
 *
 * The focused item is controlled by the navigation keys below, combined
 * with the <kbd>Ctrl</kbd> modifier to prevent moving the selection,
 * and the <kbd>Shift</kbd> modifier to extend the current selection.
 *
 * - <kbd>←</kbd>, <kbd>→</kbd>, <kbd>↑</kbd>, <kbd>↓</kbd> move the focus
 *   on the next item in the designed direction.
 * - <kbd>Home</kbd> and <kbd>End</kbd> focus the first or last item.
 * - <kbd>PgUp</kbd> and <kbd>PgDn</kbd> move the focus one page up or down.
 *
 * List item widgets support the following keyboard shortcuts:
 *
 * - <kbd>Enter</kbd> activates the item.
 * - <kbd>␣</kbd> selects the item, with the same <kbd>Ctrl</kbd> and
 *   <kbd>Shift</kbd> modifiers combinations as the navigation keys.
 *
 * # Actions
 *
 * `GtkListBase` defines a set of built-in actions:
 *
 * - `list.scroll-to-item` moves the visible area to the item at given position
 *   with the minimum amount of scrolling required. If the item is already
 *   visible, nothing happens.
 * - `list.select-item` changes the selection.
 * - `list.select-all` selects all items in the model, if the selection model
 *   supports it.
 * - `list.unselect-all` unselects all items in the model, if the selection
 *   model supports it.
 *
 * List item widgets install the following actions:
 *
 * - `listitem.select` changes selection if the item is selectable.
 * - `listitem.scroll-to` moves the visible area of the list to this item with
 *   the minimum amount of scrolling required.
  }
type

function gtk_list_base_get_type:TGType;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_LIST_BASE : longint; { return type might be wrong }
  begin
    GTK_TYPE_LIST_BASE:=gtk_list_base_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_LIST_BASE(o : longint) : longint;
begin
  GTK_LIST_BASE:=G_TYPE_CHECK_INSTANCE_CAST(o,GTK_TYPE_LIST_BASE,GtkListBase);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_LIST_BASE_CLASS(k : longint) : longint;
begin
  GTK_LIST_BASE_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,GTK_TYPE_LIST_BASE,GtkListBaseClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_LIST_BASE(o : longint) : longint;
begin
  GTK_IS_LIST_BASE:=G_TYPE_CHECK_INSTANCE_TYPE(o,GTK_TYPE_LIST_BASE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_LIST_BASE_CLASS(k : longint) : longint;
begin
  GTK_IS_LIST_BASE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,GTK_TYPE_LIST_BASE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_LIST_BASE_GET_CLASS(o : longint) : longint;
begin
  GTK_LIST_BASE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GTK_TYPE_LIST_BASE,GtkListBaseClass);
end;


end.
