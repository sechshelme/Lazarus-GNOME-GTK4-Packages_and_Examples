unit gtksearchentry;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2012 Red Hat, Inc.
 *
 * Authors:
 * - Bastien Nocera <bnocera@redhat.com>
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
 * Modified by the GTK+ Team and others 2012.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkentry.h>}

type

function gtk_search_entry_get_type:TGType;cdecl;external libgtk4;
function gtk_search_entry_new:PGtkWidget;cdecl;external libgtk4;
procedure gtk_search_entry_set_key_capture_widget(entry:PGtkSearchEntry; widget:PGtkWidget);cdecl;external libgtk4;
function gtk_search_entry_get_key_capture_widget(entry:PGtkSearchEntry):PGtkWidget;cdecl;external libgtk4;
procedure gtk_search_entry_set_search_delay(entry:PGtkSearchEntry; delay:Tguint);cdecl;external libgtk4;
function gtk_search_entry_get_search_delay(entry:PGtkSearchEntry):Tguint;cdecl;external libgtk4;
procedure gtk_search_entry_set_placeholder_text(entry:PGtkSearchEntry; text:Pchar);cdecl;external libgtk4;
function gtk_search_entry_get_placeholder_text(entry:PGtkSearchEntry):Pchar;cdecl;external libgtk4;
procedure gtk_search_entry_set_input_purpose(entry:PGtkSearchEntry; purpose:TGtkInputPurpose);cdecl;external libgtk4;
function gtk_search_entry_get_input_purpose(entry:PGtkSearchEntry):TGtkInputPurpose;cdecl;external libgtk4;
procedure gtk_search_entry_set_input_hints(entry:PGtkSearchEntry; hints:TGtkInputHints);cdecl;external libgtk4;
function gtk_search_entry_get_input_hints(entry:PGtkSearchEntry):TGtkInputHints;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkSearchEntry, g_object_unref) }

// === Konventiert am: 6-7-26 16:45:21 ===

function GTK_TYPE_SEARCH_ENTRY : TGType;
function GTK_SEARCH_ENTRY(obj : Pointer) : PGtkSearchEntry;
function GTK_IS_SEARCH_ENTRY(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_SEARCH_ENTRY : TGType;
  begin
    GTK_TYPE_SEARCH_ENTRY:=gtk_search_entry_get_type;
  end;

function GTK_SEARCH_ENTRY(obj : Pointer) : PGtkSearchEntry;
begin
  Result := PGtkSearchEntry(g_type_check_instance_cast(obj, GTK_TYPE_SEARCH_ENTRY));
end;

function GTK_IS_SEARCH_ENTRY(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_SEARCH_ENTRY);
end;



end.
