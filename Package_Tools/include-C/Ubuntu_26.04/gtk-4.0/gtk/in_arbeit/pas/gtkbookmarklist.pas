unit gtkbookmarklist;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2020 Red Hat, Inc.
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
 * Authors: Matthias Clasen <mclasen@redhat.com>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gio/gio.h>}
{ for extern  }
{$include <gdk/gdk.h>}

{G_DECLARE_FINAL_TYPE (GtkBookmarkList, gtk_bookmark_list, GTK, BOOKMARK_LIST, GObject) }
function gtk_bookmark_list_new(filename:Pchar; attributes:Pchar):PGtkBookmarkList;cdecl;external libgtk4;
function gtk_bookmark_list_get_filename(self:PGtkBookmarkList):Pchar;cdecl;external libgtk4;
procedure gtk_bookmark_list_set_attributes(self:PGtkBookmarkList; attributes:Pchar);cdecl;external libgtk4;
function gtk_bookmark_list_get_attributes(self:PGtkBookmarkList):Pchar;cdecl;external libgtk4;
procedure gtk_bookmark_list_set_io_priority(self:PGtkBookmarkList; io_priority:longint);cdecl;external libgtk4;
function gtk_bookmark_list_get_io_priority(self:PGtkBookmarkList):longint;cdecl;external libgtk4;
function gtk_bookmark_list_is_loading(self:PGtkBookmarkList):Tgboolean;cdecl;external libgtk4;

// === Konventiert am: 5-7-26 19:15:43 ===

function GTK_TYPE_BOOKMARK_LIST: TGType;
function GTK_BOOKMARK_LIST(obj: Pointer): PGtkBookmarkList;
function GTK_IS_BOOKMARK_LIST(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_BOOKMARK_LIST: TGType;
begin
  Result := gtk_bookmark_list_get_type;
end;

function GTK_BOOKMARK_LIST(obj: Pointer): PGtkBookmarkList;
begin
  Result := PGtkBookmarkList(g_type_check_instance_cast(obj, GTK_TYPE_BOOKMARK_LIST));
end;

function GTK_IS_BOOKMARK_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_BOOKMARK_LIST);
end;

type 
  PGtkBookmarkList = type Pointer;

  TGtkBookmarkListClass = record
    parent_class: TGObjectClass;
  end;
  PGtkBookmarkListClass = ^TGtkBookmarkListClass;

function gtk_bookmark_list_get_type: TGType; cdecl; external libgxxxxxxx;



end.
