unit gtkactionable;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2012 Canonical Limited
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * licence or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Ryan Lortie <desrt@desrt.ca>
  }
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include <gdk/gdk.h>}

type
{< private > }
{< public > }
  PGtkActionableInterface = ^TGtkActionableInterface;
  TGtkActionableInterface = record
      g_iface : TGTypeInterface;
      get_action_name : function (actionable:PGtkActionable):Pchar;cdecl;
      set_action_name : procedure (actionable:PGtkActionable; action_name:Pchar);cdecl;
      get_action_target_value : function (actionable:PGtkActionable):PGVariant;cdecl;
      set_action_target_value : procedure (actionable:PGtkActionable; target_value:PGVariant);cdecl;
    end;


function gtk_actionable_get_type:TGType;cdecl;external libgtk4;
function gtk_actionable_get_action_name(actionable:PGtkActionable):Pchar;cdecl;external libgtk4;
procedure gtk_actionable_set_action_name(actionable:PGtkActionable; action_name:Pchar);cdecl;external libgtk4;
function gtk_actionable_get_action_target_value(actionable:PGtkActionable):PGVariant;cdecl;external libgtk4;
procedure gtk_actionable_set_action_target_value(actionable:PGtkActionable; target_value:PGVariant);cdecl;external libgtk4;
procedure gtk_actionable_set_action_target(actionable:PGtkActionable; format_string:Pchar; args:array of const);cdecl;external libgtk4;
procedure gtk_actionable_set_action_target(actionable:PGtkActionable; format_string:Pchar);cdecl;external libgtk4;
procedure gtk_actionable_set_detailed_action_name(actionable:PGtkActionable; detailed_action_name:Pchar);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkActionable, g_object_unref) }

// === Konventiert am: 5-7-26 16:28:19 ===

function GTK_TYPE_ACTIONABLE : TGType;
function GTK_ACTIONABLE(obj : Pointer) : PGtkActionable;
function GTK_IS_ACTIONABLE(obj : Pointer) : Tgboolean;
function GTK_ACTIONABLE_GET_IFACE(obj : Pointer) : PGtkActionableInterface;

implementation

function GTK_TYPE_ACTIONABLE : TGType;
  begin
    GTK_TYPE_ACTIONABLE:=gtk_actionable_get_type;
  end;

function GTK_ACTIONABLE(obj : Pointer) : PGtkActionable;
begin
  Result := PGtkActionable(g_type_check_instance_cast(obj, GTK_TYPE_ACTIONABLE));
end;

function GTK_IS_ACTIONABLE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_ACTIONABLE);
end;

function GTK_ACTIONABLE_GET_IFACE(obj : Pointer) : PGtkActionableInterface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_ACTIONABLE);
end;



end.
