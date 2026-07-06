
unit gtksearchentry;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksearchentry.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksearchentry.h
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
PGtkSearchEntry  = ^GtkSearchEntry;
PGtkWidget  = ^GtkWidget;
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

{ was #define dname def_expr }
function GTK_TYPE_SEARCH_ENTRY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_SEARCH_ENTRY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_SEARCH_ENTRY(obj : longint) : longint;

type

function gtk_search_entry_get_type:TGType;cdecl;external;
function gtk_search_entry_new:PGtkWidget;cdecl;external;
procedure gtk_search_entry_set_key_capture_widget(entry:PGtkSearchEntry; widget:PGtkWidget);cdecl;external;
function gtk_search_entry_get_key_capture_widget(entry:PGtkSearchEntry):PGtkWidget;cdecl;external;
procedure gtk_search_entry_set_search_delay(entry:PGtkSearchEntry; delay:Tguint);cdecl;external;
function gtk_search_entry_get_search_delay(entry:PGtkSearchEntry):Tguint;cdecl;external;
(* Const before type ignored *)
procedure gtk_search_entry_set_placeholder_text(entry:PGtkSearchEntry; text:Pchar);cdecl;external;
(* Const before type ignored *)
function gtk_search_entry_get_placeholder_text(entry:PGtkSearchEntry):Pchar;cdecl;external;
procedure gtk_search_entry_set_input_purpose(entry:PGtkSearchEntry; purpose:TGtkInputPurpose);cdecl;external;
function gtk_search_entry_get_input_purpose(entry:PGtkSearchEntry):TGtkInputPurpose;cdecl;external;
procedure gtk_search_entry_set_input_hints(entry:PGtkSearchEntry; hints:TGtkInputHints);cdecl;external;
function gtk_search_entry_get_input_hints(entry:PGtkSearchEntry):TGtkInputHints;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkSearchEntry, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_SEARCH_ENTRY : longint; { return type might be wrong }
  begin
    GTK_TYPE_SEARCH_ENTRY:=gtk_search_entry_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_SEARCH_ENTRY(obj : longint) : longint;
begin
  GTK_SEARCH_ENTRY:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_SEARCH_ENTRY,GtkSearchEntry);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_SEARCH_ENTRY(obj : longint) : longint;
begin
  GTK_IS_SEARCH_ENTRY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_SEARCH_ENTRY);
end;


end.
