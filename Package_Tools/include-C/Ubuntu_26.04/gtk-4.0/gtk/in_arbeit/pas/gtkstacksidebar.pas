unit gtkstacksidebar;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2014 Intel Corporation
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
 * Author:
 *      Ikey Doherty <michael.i.doherty@intel.com>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkstack.h>}

type

function gtk_stack_sidebar_get_type:TGType;cdecl;external libgtk4;
function gtk_stack_sidebar_new:PGtkWidget;cdecl;external libgtk4;
procedure gtk_stack_sidebar_set_stack(self:PGtkStackSidebar; stack:PGtkStack);cdecl;external libgtk4;
function gtk_stack_sidebar_get_stack(self:PGtkStackSidebar):PGtkStack;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkStackSidebar, g_object_unref) }

// === Konventiert am: 6-7-26 17:10:06 ===

function GTK_TYPE_STACK_SIDEBAR : TGType;
function GTK_STACK_SIDEBAR(obj : Pointer) : PGtkStackSidebar;
function GTK_IS_STACK_SIDEBAR(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_STACK_SIDEBAR : TGType;
  begin
    GTK_TYPE_STACK_SIDEBAR:=gtk_stack_sidebar_get_type;
  end;

function GTK_STACK_SIDEBAR(obj : Pointer) : PGtkStackSidebar;
begin
  Result := PGtkStackSidebar(g_type_check_instance_cast(obj, GTK_TYPE_STACK_SIDEBAR));
end;

function GTK_IS_STACK_SIDEBAR(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_STACK_SIDEBAR);
end;



end.
