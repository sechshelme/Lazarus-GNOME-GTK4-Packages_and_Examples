unit gmenu;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2011 Canonical Ltd.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Ryan Lortie <desrt@desrt.ca>
  }
{$ifndef __G_MENU_H__}
{$define __G_MENU_H__}
{$include <gio/gmenumodel.h>}

{ was #define dname def_expr }
function G_TYPE_MENU_ITEM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_MENU_ITEM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_MENU_ITEM(obj : longint) : longint;

type

function g_menu_get_type:TGType;cdecl;external libgio2;
function g_menu_new:PGMenu;cdecl;external libgio2;
procedure g_menu_freeze(menu:PGMenu);cdecl;external libgio2;
procedure g_menu_insert_item(menu:PGMenu; position:Tgint; item:PGMenuItem);cdecl;external libgio2;
procedure g_menu_prepend_item(menu:PGMenu; item:PGMenuItem);cdecl;external libgio2;
procedure g_menu_append_item(menu:PGMenu; item:PGMenuItem);cdecl;external libgio2;
procedure g_menu_remove(menu:PGMenu; position:Tgint);cdecl;external libgio2;
procedure g_menu_remove_all(menu:PGMenu);cdecl;external libgio2;
procedure g_menu_insert(menu:PGMenu; position:Tgint; _label:Pgchar; detailed_action:Pgchar);cdecl;external libgio2;
procedure g_menu_prepend(menu:PGMenu; _label:Pgchar; detailed_action:Pgchar);cdecl;external libgio2;
procedure g_menu_append(menu:PGMenu; _label:Pgchar; detailed_action:Pgchar);cdecl;external libgio2;
procedure g_menu_insert_section(menu:PGMenu; position:Tgint; _label:Pgchar; section:PGMenuModel);cdecl;external libgio2;
procedure g_menu_prepend_section(menu:PGMenu; _label:Pgchar; section:PGMenuModel);cdecl;external libgio2;
procedure g_menu_append_section(menu:PGMenu; _label:Pgchar; section:PGMenuModel);cdecl;external libgio2;
procedure g_menu_insert_submenu(menu:PGMenu; position:Tgint; _label:Pgchar; submenu:PGMenuModel);cdecl;external libgio2;
procedure g_menu_prepend_submenu(menu:PGMenu; _label:Pgchar; submenu:PGMenuModel);cdecl;external libgio2;
procedure g_menu_append_submenu(menu:PGMenu; _label:Pgchar; submenu:PGMenuModel);cdecl;external libgio2;
function g_menu_item_get_type:TGType;cdecl;external libgio2;
function g_menu_item_new(_label:Pgchar; detailed_action:Pgchar):PGMenuItem;cdecl;external libgio2;
function g_menu_item_new_from_model(model:PGMenuModel; item_index:Tgint):PGMenuItem;cdecl;external libgio2;
function g_menu_item_new_submenu(_label:Pgchar; submenu:PGMenuModel):PGMenuItem;cdecl;external libgio2;
function g_menu_item_new_section(_label:Pgchar; section:PGMenuModel):PGMenuItem;cdecl;external libgio2;
function g_menu_item_get_attribute_value(menu_item:PGMenuItem; attribute:Pgchar; expected_type:PGVariantType):PGVariant;cdecl;external libgio2;
function g_menu_item_get_attribute(menu_item:PGMenuItem; attribute:Pgchar; format_string:Pgchar; args:array of const):Tgboolean;cdecl;external libgio2;
function g_menu_item_get_attribute(menu_item:PGMenuItem; attribute:Pgchar; format_string:Pgchar):Tgboolean;cdecl;external libgio2;
function g_menu_item_get_link(menu_item:PGMenuItem; link:Pgchar):PGMenuModel;cdecl;external libgio2;
procedure g_menu_item_set_attribute_value(menu_item:PGMenuItem; attribute:Pgchar; value:PGVariant);cdecl;external libgio2;
procedure g_menu_item_set_attribute(menu_item:PGMenuItem; attribute:Pgchar; format_string:Pgchar; args:array of const);cdecl;external libgio2;
procedure g_menu_item_set_attribute(menu_item:PGMenuItem; attribute:Pgchar; format_string:Pgchar);cdecl;external libgio2;
procedure g_menu_item_set_link(menu_item:PGMenuItem; link:Pgchar; model:PGMenuModel);cdecl;external libgio2;
procedure g_menu_item_set_label(menu_item:PGMenuItem; _label:Pgchar);cdecl;external libgio2;
procedure g_menu_item_set_submenu(menu_item:PGMenuItem; submenu:PGMenuModel);cdecl;external libgio2;
procedure g_menu_item_set_section(menu_item:PGMenuItem; section:PGMenuModel);cdecl;external libgio2;
procedure g_menu_item_set_action_and_target_value(menu_item:PGMenuItem; action:Pgchar; target_value:PGVariant);cdecl;external libgio2;
procedure g_menu_item_set_action_and_target(menu_item:PGMenuItem; action:Pgchar; format_string:Pgchar; args:array of const);cdecl;external libgio2;
procedure g_menu_item_set_action_and_target(menu_item:PGMenuItem; action:Pgchar; format_string:Pgchar);cdecl;external libgio2;
procedure g_menu_item_set_detailed_action(menu_item:PGMenuItem; detailed_action:Pgchar);cdecl;external libgio2;
procedure g_menu_item_set_icon(menu_item:PGMenuItem; icon:PGIcon);cdecl;external libgio2;
{$endif}
{ __G_MENU_H__  }

// === Konventiert am: 26-6-26 19:39:14 ===

function G_TYPE_MENU : TGType;
function G_MENU(obj : Pointer) : PGMenu;
function G_IS_MENU(obj : Pointer) : Tgboolean;

implementation

function G_TYPE_MENU : TGType;
  begin
    G_TYPE_MENU:=g_menu_get_type;
  end;

function G_MENU(obj : Pointer) : PGMenu;
begin
  Result := PGMenu(g_type_check_instance_cast(obj, G_TYPE_MENU));
end;

function G_IS_MENU(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_MENU);
end;


{ was #define dname def_expr }
function G_TYPE_MENU_ITEM : longint; { return type might be wrong }
  begin
    G_TYPE_MENU_ITEM:=g_menu_item_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_MENU_ITEM(obj : longint) : longint;
begin
  G_MENU_ITEM:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_MENU_ITEM,GMenuItem);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_MENU_ITEM(obj : longint) : longint;
begin
  G_IS_MENU_ITEM:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_MENU_ITEM);
end;


end.
