unit gtkshortcutlabel;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkshortcutlabelprivate.h
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
{$include <gtk/gtkwidget.h>}

type

function gtk_shortcut_label_get_type:TGType;cdecl;external libgtk4;
function gtk_shortcut_label_new(accelerator:Pchar):PGtkWidget;cdecl;external libgtk4;
function gtk_shortcut_label_get_accelerator(self:PGtkShortcutLabel):Pchar;cdecl;external libgtk4;
procedure gtk_shortcut_label_set_accelerator(self:PGtkShortcutLabel; accelerator:Pchar);cdecl;external libgtk4;
function gtk_shortcut_label_get_disabled_text(self:PGtkShortcutLabel):Pchar;cdecl;external libgtk4;
procedure gtk_shortcut_label_set_disabled_text(self:PGtkShortcutLabel; disabled_text:Pchar);cdecl;external libgtk4;

// === Konventiert am: 9-7-26 19:49:55 ===

function GTK_TYPE_SHORTCUT_LABEL : TGType;
function GTK_SHORTCUT_LABEL(obj : Pointer) : PGtkShortcutLabel;
function GTK_IS_SHORTCUT_LABEL(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_SHORTCUT_LABEL : TGType;
  begin
    GTK_TYPE_SHORTCUT_LABEL:=gtk_shortcut_label_get_type;
  end;

function GTK_SHORTCUT_LABEL(obj : Pointer) : PGtkShortcutLabel;
begin
  Result := PGtkShortcutLabel(g_type_check_instance_cast(obj, GTK_TYPE_SHORTCUT_LABEL));
end;

function GTK_IS_SHORTCUT_LABEL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_SHORTCUT_LABEL);
end;



end.
