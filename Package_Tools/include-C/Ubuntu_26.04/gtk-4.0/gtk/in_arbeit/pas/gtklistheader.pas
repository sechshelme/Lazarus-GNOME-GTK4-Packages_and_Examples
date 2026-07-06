unit gtklistheader;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2023 Benjamin Otte
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

{GDK_DECLARE_INTERNAL_TYPE (GtkListHeader, gtk_list_header, GTK, LIST_HEADER, GObject) }
function gtk_list_header_get_item(self:PGtkListHeader):Tgpointer;cdecl;external libgtk4;
function gtk_list_header_get_start(self:PGtkListHeader):Tguint;cdecl;external libgtk4;
function gtk_list_header_get_end(self:PGtkListHeader):Tguint;cdecl;external libgtk4;
function gtk_list_header_get_n_items(self:PGtkListHeader):Tguint;cdecl;external libgtk4;
procedure gtk_list_header_set_child(self:PGtkListHeader; child:PGtkWidget);cdecl;external libgtk4;
function gtk_list_header_get_child(self:PGtkListHeader):PGtkWidget;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:10:36 ===

function GTK_TYPE_LIST_HEADER: TGType;
function GTK_LIST_HEADER(obj: Pointer): PGtkListHeader;
function GTK_IS_LIST_HEADER(obj: Pointer): Tgboolean;
function GTK_LIST_HEADER_CLASS(klass: Pointer): PGtkListHeaderClass;
function GTK_IS_LIST_HEADER_CLASS(klass: Pointer): Tgboolean;
function GTK_LIST_HEADER_GET_CLASS(obj: Pointer): PGtkListHeaderClass;

implementation

function GTK_TYPE_LIST_HEADER: TGType;
begin
  Result := gtk_list_header_get_type;
end;

function GTK_LIST_HEADER(obj: Pointer): PGtkListHeader;
begin
  Result := PGtkListHeader(g_type_check_instance_cast(obj, GTK_TYPE_LIST_HEADER));
end;

function GTK_IS_LIST_HEADER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_LIST_HEADER);
end;

function GTK_LIST_HEADER_CLASS(klass: Pointer): PGtkListHeaderClass;
begin
  Result := PGtkListHeaderClass(g_type_check_class_cast(klass, GTK_TYPE_LIST_HEADER));
end;

function GTK_IS_LIST_HEADER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_LIST_HEADER);
end;

function GTK_LIST_HEADER_GET_CLASS(obj: Pointer): PGtkListHeaderClass;
begin
  Result := PGtkListHeaderClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGtkListHeader = type Pointer;

  TGtkListHeaderClass = record
  end;
  PGtkListHeaderClass = ^TGtkListHeaderClass;

function gtk_list_header_get_type: TGType; cdecl; external libgxxxxxxx;



end.
