unit gtkaccessible;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkaccessible.h: Accessible interface
 *
 * Copyright 2020  GNOME Foundation
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <glib-object.h>}
{$include <gtk/gtktypes.h>}
{$include <gtk/gtkenums.h>}

{ G_DECLARE_INTERFACE (GtkAccessible, gtk_accessible, GTK, ACCESSIBLE, GObject) }
{*
 * GtkAccessiblePlatformState:
 * @GTK_ACCESSIBLE_PLATFORM_STATE_FOCUSABLE: whether the accessible can be focused
 * @GTK_ACCESSIBLE_PLATFORM_STATE_FOCUSED: whether the accessible has focus
 * @GTK_ACCESSIBLE_PLATFORM_STATE_ACTIVE: whether the accessible is active
 *
 * The various platform states which can be queried
 * using [method@Gtk.Accessible.get_platform_state].
 *
 * Since: 4.10
  }
type
  PGtkAccessiblePlatformState = ^TGtkAccessiblePlatformState;
  TGtkAccessiblePlatformState =  Longint;
  Const
    GTK_ACCESSIBLE_PLATFORM_STATE_FOCUSABLE = 0;
    GTK_ACCESSIBLE_PLATFORM_STATE_FOCUSED = 1;
    GTK_ACCESSIBLE_PLATFORM_STATE_ACTIVE = 2;
;
{*
 * GtkAccessibleInterface:
 * @get_at_context: retrieve the platform-specific accessibility context
 *   for the accessible implementation
 * @get_platform_state: retrieve the accessible state
 *
 * The common interface for accessible objects.
 *
 * Since: 4.10
  }
{*
   * GtkAccessibleInterface::get_at_context:
   * @self: an accessible object
   *
   * Retrieves the platform-specific accessibility context for the
   * accessible implementation.
   *
   * Returns: (transfer full) (nullable): the accessibility context
   *
   * Since: 4.10
    }
{*
   * GtkAccessibleInterface::get_platform_state:
   * @self: an accessible object
   * @state: the state to query
   *
   * Checks if the given @state applies to the accessible object.
   *
   * Returns: true if the @state is set, and false otherwise
   *
   * Since: 4.10
    }
{*
   * GtkAccessibleInterface::get_accessible_parent:
   * @self: an accessible object
   *
   * Retrieves the accessible parent of an accessible object.
   *
   * This virtual function should return `NULL` for top level objects.
   *
   * Returns: (nullable) (transfer full): the accessible parent
   *
   * Since: 4.10
    }
{*
   * GtkaccessibleInterface::get_first_accessible_child:
   * @self: an accessible object
   *
   * Retrieves the first accessible child of an accessible object.
   *
   * Returns: (transfer full) (nullable): an accessible object
   *
   * Since: 4.10
    }
{*
   * GtkaccessibleInterface::get_next_accessible_sibling:
   * @self: an accessible object
   *
   * Retrieves the next accessible sibling of an accessible object.
   *
   * Returns: (transfer full) (nullable): an accessible object
   *
   * Since: 4.10
    }
{*
   * GtkAccessibleInterface::get_bounds:
   * @self: an accessible object
   * @x: (out): the horizontal coordinate of a rectangle
   * @y: (out): the vertical coordinate of a rectangle
   * @width: (out): the width of a rectangle
   * @height: (out): the height of a rectangle
   *
   * Retrieves the dimensions and position of an accessible object in its
   * parent's coordinate space, if those values can be determined.
   *
   * For top level accessible objects, the X and Y coordinates are always
   * going to be set to zero.
   *
   * Returns: true if the values are value, and false otherwise
    }
{*
   * GtkAccessibleIface::get_accessible_id:
   * @self: an accessible object
   *
   * Retrieves the accessible identifier for the accessible object.
   *
   * Returns: (transfer full) (nullable): the accessible identifier
   *
   * Since: 4.22
    }
type
  PGtkAccessibleInterface = ^TGtkAccessibleInterface;
  TGtkAccessibleInterface = record
      g_iface : TGTypeInterface;
      get_at_context : function (self:PGtkAccessible):PGtkATContext;cdecl;
      get_platform_state : function (self:PGtkAccessible; state:TGtkAccessiblePlatformState):Tgboolean;cdecl;
      get_accessible_parent : function (self:PGtkAccessible):PGtkAccessible;cdecl;
      get_first_accessible_child : function (self:PGtkAccessible):PGtkAccessible;cdecl;
      get_next_accessible_sibling : function (self:PGtkAccessible):PGtkAccessible;cdecl;
      get_bounds : function (self:PGtkAccessible; x:Plongint; y:Plongint; width:Plongint; height:Plongint):Tgboolean;cdecl;
      get_accessible_id : function (self:PGtkAccessible):Pchar;cdecl;
    end;

{*
 * GtkAccessibleList:
 *
 * Wraps a list of references to [iface@Gtk.Accessible] objects.
 *
 * Since: 4.14
  }

function gtk_accessible_get_at_context(self:PGtkAccessible):PGtkATContext;cdecl;external libgtk4;
function gtk_accessible_get_platform_state(self:PGtkAccessible; state:TGtkAccessiblePlatformState):Tgboolean;cdecl;external libgtk4;
function gtk_accessible_get_accessible_parent(self:PGtkAccessible):PGtkAccessible;cdecl;external libgtk4;
procedure gtk_accessible_set_accessible_parent(self:PGtkAccessible; parent:PGtkAccessible; next_sibling:PGtkAccessible);cdecl;external libgtk4;
function gtk_accessible_get_first_accessible_child(self:PGtkAccessible):PGtkAccessible;cdecl;external libgtk4;
function gtk_accessible_get_next_accessible_sibling(self:PGtkAccessible):PGtkAccessible;cdecl;external libgtk4;
procedure gtk_accessible_update_next_accessible_sibling(self:PGtkAccessible; new_sibling:PGtkAccessible);cdecl;external libgtk4;
function gtk_accessible_get_bounds(self:PGtkAccessible; x:Plongint; y:Plongint; width:Plongint; height:Plongint):Tgboolean;cdecl;external libgtk4;
function gtk_accessible_get_accessible_id(self:PGtkAccessible):Pchar;cdecl;external libgtk4;
function gtk_accessible_get_accessible_role(self:PGtkAccessible):TGtkAccessibleRole;cdecl;external libgtk4;
procedure gtk_accessible_update_state(self:PGtkAccessible; first_state:TGtkAccessibleState; args:array of const);cdecl;external libgtk4;
procedure gtk_accessible_update_state(self:PGtkAccessible; first_state:TGtkAccessibleState);cdecl;external libgtk4;
procedure gtk_accessible_update_property(self:PGtkAccessible; first_property:TGtkAccessibleProperty; args:array of const);cdecl;external libgtk4;
procedure gtk_accessible_update_property(self:PGtkAccessible; first_property:TGtkAccessibleProperty);cdecl;external libgtk4;
procedure gtk_accessible_update_relation(self:PGtkAccessible; first_relation:TGtkAccessibleRelation; args:array of const);cdecl;external libgtk4;
procedure gtk_accessible_update_relation(self:PGtkAccessible; first_relation:TGtkAccessibleRelation);cdecl;external libgtk4;
procedure gtk_accessible_update_state_value(self:PGtkAccessible; n_states:longint; states:PGtkAccessibleState; values:PGValue);cdecl;external libgtk4;
procedure gtk_accessible_update_property_value(self:PGtkAccessible; n_properties:longint; properties:PGtkAccessibleProperty; values:PGValue);cdecl;external libgtk4;
procedure gtk_accessible_update_relation_value(self:PGtkAccessible; n_relations:longint; relations:PGtkAccessibleRelation; values:PGValue);cdecl;external libgtk4;
procedure gtk_accessible_reset_state(self:PGtkAccessible; state:TGtkAccessibleState);cdecl;external libgtk4;
procedure gtk_accessible_reset_property(self:PGtkAccessible; _property:TGtkAccessibleProperty);cdecl;external libgtk4;
procedure gtk_accessible_reset_relation(self:PGtkAccessible; relation:TGtkAccessibleRelation);cdecl;external libgtk4;
procedure gtk_accessible_state_init_value(state:TGtkAccessibleState; value:PGValue);cdecl;external libgtk4;
procedure gtk_accessible_property_init_value(_property:TGtkAccessibleProperty; value:PGValue);cdecl;external libgtk4;
procedure gtk_accessible_relation_init_value(relation:TGtkAccessibleRelation; value:PGValue);cdecl;external libgtk4;
{ was #define dname def_expr }
function GTK_ACCESSIBLE_LIST : longint; { return type might be wrong }

function gtk_accessible_list_get_type:TGType;cdecl;external libgtk4;
function gtk_accessible_list_get_objects(accessible_list:PGtkAccessibleList):PGList;cdecl;external libgtk4;
function gtk_accessible_list_new_from_list(list:PGList):PGtkAccessibleList;cdecl;external libgtk4;
function gtk_accessible_list_new_from_array(accessibles:PPGtkAccessible; n_accessibles:Tgsize):PGtkAccessibleList;cdecl;external libgtk4;
procedure gtk_accessible_announce(self:PGtkAccessible; message:Pchar; priority:TGtkAccessibleAnnouncementPriority);cdecl;external libgtk4;
procedure gtk_accessible_update_platform_state(self:PGtkAccessible; state:TGtkAccessiblePlatformState);cdecl;external libgtk4;

// === Konventiert am: 5-7-26 16:29:04 ===

function GTK_TYPE_ACCESSIBLE: TGType;
function GTK_ACCESSIBLE(obj: Pointer): PGtkAccessible;
function GTK_IS_ACCESSIBLE(obj: Pointer): Tgboolean;
function GTK_ACCESSIBLE_GET_IFACE(obj: Pointer): PGtkAccessibleInterface;

implementation

function GTK_TYPE_ACCESSIBLE: TGType;
begin
  Result := gtk_accessible_get_type;
end;

function GTK_ACCESSIBLE(obj: Pointer): PGtkAccessible;
begin
  Result := PGtkAccessible(g_type_check_instance_cast(obj, GTK_TYPE_ACCESSIBLE));
end;

function GTK_IS_ACCESSIBLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_ACCESSIBLE);
end;

function GTK_ACCESSIBLE_GET_IFACE(obj: Pointer): PGtkAccessibleInterface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_ACCESSIBLE);
end;

type 
  PGtkAccessible = type Pointer;

  PGtkAccessibleInterface = type Pointer

function gtk_accessible_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname def_expr }
function GTK_ACCESSIBLE_LIST : longint; { return type might be wrong }
  begin
    GTK_ACCESSIBLE_LIST:=gtk_accessible_list_get_type;
  end;


end.
