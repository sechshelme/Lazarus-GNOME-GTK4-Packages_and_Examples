unit gtkfilefilter;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * gtkfilefilter.h: Filters for selecting a file subset
 * Copyright (C) 2003, Red Hat, Inc.
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
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <glib-object.h>}
{$include <gdk/gdk.h>}

type

function gtk_file_filter_get_type:TGType;cdecl;external libgtk4;
function gtk_file_filter_new:PGtkFileFilter;cdecl;external libgtk4;
procedure gtk_file_filter_set_name(filter:PGtkFileFilter; name:Pchar);cdecl;external libgtk4;
function gtk_file_filter_get_name(filter:PGtkFileFilter):Pchar;cdecl;external libgtk4;
procedure gtk_file_filter_add_mime_type(filter:PGtkFileFilter; mime_type:Pchar);cdecl;external libgtk4;
procedure gtk_file_filter_add_mime_types(filter:PGtkFileFilter; mime_types:PPchar);cdecl;external libgtk4;
procedure gtk_file_filter_add_pattern(filter:PGtkFileFilter; pattern:Pchar);cdecl;external libgtk4;
procedure gtk_file_filter_add_suffix(filter:PGtkFileFilter; suffix:Pchar);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_20 }
procedure gtk_file_filter_add_pixbuf_formats(filter:PGtkFileFilter);cdecl;external libgtk4;
function gtk_file_filter_get_attributes(filter:PGtkFileFilter):^Pchar;cdecl;external libgtk4;
function gtk_file_filter_to_gvariant(filter:PGtkFileFilter):PGVariant;cdecl;external libgtk4;
function gtk_file_filter_new_from_gvariant(variant:PGVariant):PGtkFileFilter;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkFileFilter, g_object_unref) }

// === Konventiert am: 6-7-26 16:45:55 ===

function GTK_TYPE_FILE_FILTER : TGType;
function GTK_FILE_FILTER(obj : Pointer) : PGtkFileFilter;
function GTK_IS_FILE_FILTER(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_FILE_FILTER : TGType;
  begin
    GTK_TYPE_FILE_FILTER:=gtk_file_filter_get_type;
  end;

function GTK_FILE_FILTER(obj : Pointer) : PGtkFileFilter;
begin
  Result := PGtkFileFilter(g_type_check_instance_cast(obj, GTK_TYPE_FILE_FILTER));
end;

function GTK_IS_FILE_FILTER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_FILE_FILTER);
end;



end.
