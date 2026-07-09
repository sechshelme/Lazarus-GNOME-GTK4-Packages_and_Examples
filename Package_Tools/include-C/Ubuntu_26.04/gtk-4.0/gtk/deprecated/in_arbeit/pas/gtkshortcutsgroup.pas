unit gtkshortcutsgroup;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkshortcutsgroupprivate.h
 *
 * Copyright (C) 2015 Christian Hergert <christian@hergert.me>
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Library General Public License as
 *  published by the Free Software Foundation; either version 2 of the
 *  License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Library General Public License for more details.
 *
 *  You should have received a copy of the GNU Library General Public
 *  License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gdk/gdk.h>}
{$include <gtk/deprecated/gtkshortcutsshortcut.h>}

type

function gtk_shortcuts_group_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_18 }
procedure gtk_shortcuts_group_add_shortcut(self:PGtkShortcutsGroup; shortcut:PGtkShortcutsShortcut);cdecl;external libgtk4;

// === Konventiert am: 9-7-26 19:49:51 ===

function GTK_TYPE_SHORTCUTS_GROUP : TGType;
function GTK_SHORTCUTS_GROUP(obj : Pointer) : PGtkShortcutsGroup;
function GTK_IS_SHORTCUTS_GROUP(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_SHORTCUTS_GROUP : TGType;
  begin
    GTK_TYPE_SHORTCUTS_GROUP:=gtk_shortcuts_group_get_type;
  end;

function GTK_SHORTCUTS_GROUP(obj : Pointer) : PGtkShortcutsGroup;
begin
  Result := PGtkShortcutsGroup(g_type_check_instance_cast(obj, GTK_TYPE_SHORTCUTS_GROUP));
end;

function GTK_IS_SHORTCUTS_GROUP(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_SHORTCUTS_GROUP);
end;



end.
