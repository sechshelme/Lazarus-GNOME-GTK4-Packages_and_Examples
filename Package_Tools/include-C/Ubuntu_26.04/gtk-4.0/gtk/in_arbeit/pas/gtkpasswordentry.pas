unit gtkpasswordentry;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2019 Red Hat, Inc.
 *
 * Authors:
 * - MAtthias Clasen <mclasen@redhat.com>
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
{$include <gtk/gtkentry.h>}

type

function gtk_password_entry_get_type:TGType;cdecl;external libgtk4;
function gtk_password_entry_new:PGtkWidget;cdecl;external libgtk4;
procedure gtk_password_entry_set_show_peek_icon(entry:PGtkPasswordEntry; show_peek_icon:Tgboolean);cdecl;external libgtk4;
function gtk_password_entry_get_show_peek_icon(entry:PGtkPasswordEntry):Tgboolean;cdecl;external libgtk4;
procedure gtk_password_entry_set_extra_menu(entry:PGtkPasswordEntry; model:PGMenuModel);cdecl;external libgtk4;
function gtk_password_entry_get_extra_menu(entry:PGtkPasswordEntry):PGMenuModel;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:06:58 ===

function GTK_TYPE_PASSWORD_ENTRY : TGType;
function GTK_PASSWORD_ENTRY(obj : Pointer) : PGtkPasswordEntry;
function GTK_IS_PASSWORD_ENTRY(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_PASSWORD_ENTRY : TGType;
  begin
    GTK_TYPE_PASSWORD_ENTRY:=gtk_password_entry_get_type;
  end;

function GTK_PASSWORD_ENTRY(obj : Pointer) : PGtkPasswordEntry;
begin
  Result := PGtkPasswordEntry(g_type_check_instance_cast(obj, GTK_TYPE_PASSWORD_ENTRY));
end;

function GTK_IS_PASSWORD_ENTRY(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_PASSWORD_ENTRY);
end;



end.
