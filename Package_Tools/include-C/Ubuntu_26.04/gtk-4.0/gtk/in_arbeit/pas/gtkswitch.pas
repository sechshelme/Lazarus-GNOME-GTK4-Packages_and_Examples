unit gtkswitch;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 *
 * Copyright (C) 2010  Intel Corporation
 * Copyright (C) 2010  RedHat, Inc.
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
 *
 * Author:
 *      Emmanuele Bassi <ebassi@linux.intel.com>
 *      Matthias Clasen <mclasen@redhat.com>
 *
 * Based on similar code from Mx.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}

type

function gtk_switch_get_type:TGType;cdecl;external libgtk4;
function gtk_switch_new:PGtkWidget;cdecl;external libgtk4;
procedure gtk_switch_set_active(self:PGtkSwitch; is_active:Tgboolean);cdecl;external libgtk4;
function gtk_switch_get_active(self:PGtkSwitch):Tgboolean;cdecl;external libgtk4;
procedure gtk_switch_set_state(self:PGtkSwitch; state:Tgboolean);cdecl;external libgtk4;
function gtk_switch_get_state(self:PGtkSwitch):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkSwitch, g_object_unref) }

// === Konventiert am: 6-7-26 17:06:36 ===

function GTK_TYPE_SWITCH : TGType;
function GTK_SWITCH(obj : Pointer) : PGtkSwitch;
function GTK_IS_SWITCH(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_SWITCH : TGType;
  begin
    GTK_TYPE_SWITCH:=gtk_switch_get_type;
  end;

function GTK_SWITCH(obj : Pointer) : PGtkSwitch;
begin
  Result := PGtkSwitch(g_type_check_instance_cast(obj, GTK_TYPE_SWITCH));
end;

function GTK_IS_SWITCH(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_SWITCH);
end;



end.
