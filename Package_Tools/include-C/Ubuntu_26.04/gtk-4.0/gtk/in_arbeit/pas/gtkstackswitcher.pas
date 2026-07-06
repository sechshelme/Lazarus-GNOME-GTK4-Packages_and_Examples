unit gtkstackswitcher;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2013 Red Hat, Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
 * License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 *
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkstack.h>}

type

function gtk_stack_switcher_get_type:TGType;cdecl;external libgtk4;
function gtk_stack_switcher_new:PGtkWidget;cdecl;external libgtk4;
procedure gtk_stack_switcher_set_stack(switcher:PGtkStackSwitcher; stack:PGtkStack);cdecl;external libgtk4;
function gtk_stack_switcher_get_stack(switcher:PGtkStackSwitcher):PGtkStack;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkStackSwitcher, g_object_unref) }

// === Konventiert am: 6-7-26 17:10:02 ===

function GTK_TYPE_STACK_SWITCHER : TGType;
function GTK_STACK_SWITCHER(obj : Pointer) : PGtkStackSwitcher;
function GTK_IS_STACK_SWITCHER(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_STACK_SWITCHER : TGType;
  begin
    GTK_TYPE_STACK_SWITCHER:=gtk_stack_switcher_get_type;
  end;

function GTK_STACK_SWITCHER(obj : Pointer) : PGtkStackSwitcher;
begin
  Result := PGtkStackSwitcher(g_type_check_instance_cast(obj, GTK_TYPE_STACK_SWITCHER));
end;

function GTK_IS_STACK_SWITCHER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_STACK_SWITCHER);
end;



end.
