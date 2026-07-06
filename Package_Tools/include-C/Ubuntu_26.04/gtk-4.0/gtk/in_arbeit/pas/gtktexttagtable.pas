unit gtktexttagtable;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
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
{$include <gtk/gtktexttag.h>}
{*
 * GtkTextTagTableForeach:
 * @tag: the `GtkTextTag`
 * @data: (closure): data passed to gtk_text_tag_table_foreach()
 *
 * A function used with gtk_text_tag_table_foreach(),
 * to iterate over every `GtkTextTag` inside a `GtkTextTagTable`.
  }
type

  TGtkTextTagTableForeach = procedure (tag:PGtkTextTag; data:Tgpointer);cdecl;

function gtk_text_tag_table_get_type:TGType;cdecl;external libgtk4;
function gtk_text_tag_table_new:PGtkTextTagTable;cdecl;external libgtk4;
function gtk_text_tag_table_add(table:PGtkTextTagTable; tag:PGtkTextTag):Tgboolean;cdecl;external libgtk4;
procedure gtk_text_tag_table_remove(table:PGtkTextTagTable; tag:PGtkTextTag);cdecl;external libgtk4;
function gtk_text_tag_table_lookup(table:PGtkTextTagTable; name:Pchar):PGtkTextTag;cdecl;external libgtk4;
procedure gtk_text_tag_table_foreach(table:PGtkTextTagTable; func:TGtkTextTagTableForeach; data:Tgpointer);cdecl;external libgtk4;
function gtk_text_tag_table_get_size(table:PGtkTextTagTable):longint;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkTextTagTable, g_object_unref) }

// === Konventiert am: 6-7-26 16:45:17 ===

function GTK_TYPE_TEXT_TAG_TABLE : TGType;
function GTK_TEXT_TAG_TABLE(obj : Pointer) : PGtkTextTagTable;
function GTK_IS_TEXT_TAG_TABLE(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_TEXT_TAG_TABLE : TGType;
  begin
    GTK_TYPE_TEXT_TAG_TABLE:=gtk_text_tag_table_get_type;
  end;

function GTK_TEXT_TAG_TABLE(obj : Pointer) : PGtkTextTagTable;
begin
  Result := PGtkTextTagTable(g_type_check_instance_cast(obj, GTK_TYPE_TEXT_TAG_TABLE));
end;

function GTK_IS_TEXT_TAG_TABLE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_TEXT_TAG_TABLE);
end;



end.
