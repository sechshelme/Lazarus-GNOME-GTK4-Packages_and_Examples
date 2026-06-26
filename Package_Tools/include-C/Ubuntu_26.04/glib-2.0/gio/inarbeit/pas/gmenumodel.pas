unit gmenumodel;

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
{$ifndef __G_MENU_MODEL_H__}
{$define __G_MENU_MODEL_H__}
{$include <glib-object.h>}
{$include <gio/giotypes.h>}
{*
 * G_MENU_ATTRIBUTE_ACTION:
 *
 * The menu item attribute which holds the action name of the item.  Action
 * names are namespaced with an identifier for the action group in which the
 * action resides. For example, "win." for window-specific actions and "app."
 * for application-wide actions.
 *
 * See also g_menu_model_get_item_attribute() and g_menu_item_set_attribute().
 *
 * Since: 2.32
 * }

const
  G_MENU_ATTRIBUTE_ACTION = 'action';  
{*
 * G_MENU_ATTRIBUTE_ACTION_NAMESPACE:
 *
 * The menu item attribute that holds the namespace for all action names in
 * menus that are linked from this item.
 *
 * Since: 2.36
 * }
  G_MENU_ATTRIBUTE_ACTION_NAMESPACE = 'action-namespace';  
{*
 * G_MENU_ATTRIBUTE_TARGET:
 *
 * The menu item attribute which holds the target with which the item's action
 * will be activated.
 *
 * See also g_menu_item_set_action_and_target()
 *
 * Since: 2.32
 * }
  G_MENU_ATTRIBUTE_TARGET = 'target';  
{*
 * G_MENU_ATTRIBUTE_LABEL:
 *
 * The menu item attribute which holds the label of the item.
 *
 * Since: 2.32
 * }
  G_MENU_ATTRIBUTE_LABEL = 'label';  
{*
 * G_MENU_ATTRIBUTE_ICON:
 *
 * The menu item attribute which holds the icon of the item.
 *
 * The icon is stored in the format returned by g_icon_serialize().
 *
 * This attribute is intended only to represent 'noun' icons such as
 * favicons for a webpage, or application icons.  It should not be used
 * for 'verbs' (ie: stock icons).
 *
 * Since: 2.38
 * }
  G_MENU_ATTRIBUTE_ICON = 'icon';  
{*
 * G_MENU_LINK_SUBMENU:
 *
 * The name of the link that associates a menu item with a submenu.
 *
 * See also g_menu_item_set_link().
 *
 * Since: 2.32
 * }
  G_MENU_LINK_SUBMENU = 'submenu';  
{*
 * G_MENU_LINK_SECTION:
 *
 * The name of the link that associates a menu item with a section.  The linked
 * menu will usually be shown in place of the menu item, using the item's label
 * as a header.
 *
 * See also g_menu_item_set_link().
 *
 * Since: 2.32
 * }
  G_MENU_LINK_SECTION = 'section';  

type
  PGMenuModel = ^TGMenuModel;
  TGMenuModel = record
      parent_instance : TGObject;
      priv : PGMenuModelPrivate;
    end;

{*
 * GMenuModelClass::get_item_attributes:
 * @model: the #GMenuModel to query
 * @item_index: The #GMenuItem to query
 * @attributes: (out) (element-type utf8 GLib.Variant): Attributes on the item
 *
 * Gets all the attributes associated with the item in the menu model.
  }
{*
 * GMenuModelClass::get_item_links:
 * @model: the #GMenuModel to query
 * @item_index: The #GMenuItem to query
 * @links: (out) (element-type utf8 Gio.MenuModel): Links from the item
 *
 * Gets all the links associated with the item in the menu model.
  }
  PGMenuModelClass = ^TGMenuModelClass;
  TGMenuModelClass = record
      parent_class : TGObjectClass;
      is_mutable : function (model:PGMenuModel):Tgboolean;cdecl;
      get_n_items : function (model:PGMenuModel):Tgint;cdecl;
      get_item_attributes : procedure (model:PGMenuModel; item_index:Tgint; attributes:PPGHashTable);cdecl;
      iterate_item_attributes : function (model:PGMenuModel; item_index:Tgint):PGMenuAttributeIter;cdecl;
      get_item_attribute_value : function (model:PGMenuModel; item_index:Tgint; attribute:Pgchar; expected_type:PGVariantType):PGVariant;cdecl;
      get_item_links : procedure (model:PGMenuModel; item_index:Tgint; links:PPGHashTable);cdecl;
      iterate_item_links : function (model:PGMenuModel; item_index:Tgint):PGMenuLinkIter;cdecl;
      get_item_link : function (model:PGMenuModel; item_index:Tgint; link:Pgchar):PGMenuModel;cdecl;
    end;


function g_menu_model_get_type:TGType;cdecl;external libgio2;
function g_menu_model_is_mutable(model:PGMenuModel):Tgboolean;cdecl;external libgio2;
function g_menu_model_get_n_items(model:PGMenuModel):Tgint;cdecl;external libgio2;
function g_menu_model_iterate_item_attributes(model:PGMenuModel; item_index:Tgint):PGMenuAttributeIter;cdecl;external libgio2;
function g_menu_model_get_item_attribute_value(model:PGMenuModel; item_index:Tgint; attribute:Pgchar; expected_type:PGVariantType):PGVariant;cdecl;external libgio2;
function g_menu_model_get_item_attribute(model:PGMenuModel; item_index:Tgint; attribute:Pgchar; format_string:Pgchar; args:array of const):Tgboolean;cdecl;external libgio2;
function g_menu_model_get_item_attribute(model:PGMenuModel; item_index:Tgint; attribute:Pgchar; format_string:Pgchar):Tgboolean;cdecl;external libgio2;
function g_menu_model_iterate_item_links(model:PGMenuModel; item_index:Tgint):PGMenuLinkIter;cdecl;external libgio2;
function g_menu_model_get_item_link(model:PGMenuModel; item_index:Tgint; link:Pgchar):PGMenuModel;cdecl;external libgio2;
procedure g_menu_model_items_changed(model:PGMenuModel; position:Tgint; removed:Tgint; added:Tgint);cdecl;external libgio2;
{ was #define dname def_expr }
function G_TYPE_MENU_ATTRIBUTE_ITER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_MENU_ATTRIBUTE_ITER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_MENU_ATTRIBUTE_ITER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_MENU_ATTRIBUTE_ITER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_MENU_ATTRIBUTE_ITER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_MENU_ATTRIBUTE_ITER_GET_CLASS(obj : longint) : longint;

type
  PGMenuAttributeIter = ^TGMenuAttributeIter;
  TGMenuAttributeIter = record
      parent_instance : TGObject;
      priv : PGMenuAttributeIterPrivate;
    end;

  PGMenuAttributeIterClass = ^TGMenuAttributeIterClass;
  TGMenuAttributeIterClass = record
      parent_class : TGObjectClass;
      get_next : function (iter:PGMenuAttributeIter; out_name:PPgchar; value:PPGVariant):Tgboolean;cdecl;
    end;


function g_menu_attribute_iter_get_type:TGType;cdecl;external libgio2;
function g_menu_attribute_iter_get_next(iter:PGMenuAttributeIter; out_name:PPgchar; value:PPGVariant):Tgboolean;cdecl;external libgio2;
function g_menu_attribute_iter_next(iter:PGMenuAttributeIter):Tgboolean;cdecl;external libgio2;
function g_menu_attribute_iter_get_name(iter:PGMenuAttributeIter):Pgchar;cdecl;external libgio2;
function g_menu_attribute_iter_get_value(iter:PGMenuAttributeIter):PGVariant;cdecl;external libgio2;
{ was #define dname def_expr }
function G_TYPE_MENU_LINK_ITER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_MENU_LINK_ITER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_MENU_LINK_ITER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_MENU_LINK_ITER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_MENU_LINK_ITER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_MENU_LINK_ITER_GET_CLASS(obj : longint) : longint;

type
  PGMenuLinkIter = ^TGMenuLinkIter;
  TGMenuLinkIter = record
      parent_instance : TGObject;
      priv : PGMenuLinkIterPrivate;
    end;

  PGMenuLinkIterClass = ^TGMenuLinkIterClass;
  TGMenuLinkIterClass = record
      parent_class : TGObjectClass;
      get_next : function (iter:PGMenuLinkIter; out_link:PPgchar; value:PPGMenuModel):Tgboolean;cdecl;
    end;


function g_menu_link_iter_get_type:TGType;cdecl;external libgio2;
function g_menu_link_iter_get_next(iter:PGMenuLinkIter; out_link:PPgchar; value:PPGMenuModel):Tgboolean;cdecl;external libgio2;
function g_menu_link_iter_next(iter:PGMenuLinkIter):Tgboolean;cdecl;external libgio2;
function g_menu_link_iter_get_name(iter:PGMenuLinkIter):Pgchar;cdecl;external libgio2;
function g_menu_link_iter_get_value(iter:PGMenuLinkIter):PGMenuModel;cdecl;external libgio2;
{$endif}
{ __G_MENU_MODEL_H__  }

// === Konventiert am: 26-6-26 19:38:30 ===

function G_TYPE_MENU_MODEL : TGType;
function G_MENU_MODEL(obj : Pointer) : PGMenuModel;
function G_MENU_MODEL_CLASS(klass : Pointer) : PGMenuModelClass;
function G_IS_MENU_MODEL(obj : Pointer) : Tgboolean;
function G_IS_MENU_MODEL_CLASS(klass : Pointer) : Tgboolean;
function G_MENU_MODEL_GET_CLASS(obj : Pointer) : PGMenuModelClass;

implementation

function G_TYPE_MENU_MODEL : TGType;
  begin
    G_TYPE_MENU_MODEL:=g_menu_model_get_type;
  end;

function G_MENU_MODEL(obj : Pointer) : PGMenuModel;
begin
  Result := PGMenuModel(g_type_check_instance_cast(obj, G_TYPE_MENU_MODEL));
end;

function G_MENU_MODEL_CLASS(klass : Pointer) : PGMenuModelClass;
begin
  Result := PGMenuModelClass(g_type_check_class_cast(klass, G_TYPE_MENU_MODEL));
end;

function G_IS_MENU_MODEL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_MENU_MODEL);
end;

function G_IS_MENU_MODEL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_MENU_MODEL);
end;

function G_MENU_MODEL_GET_CLASS(obj : Pointer) : PGMenuModelClass;
begin
  Result := PGMenuModelClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname def_expr }
function G_TYPE_MENU_ATTRIBUTE_ITER : longint; { return type might be wrong }
  begin
    G_TYPE_MENU_ATTRIBUTE_ITER:=g_menu_attribute_iter_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_MENU_ATTRIBUTE_ITER(obj : longint) : longint;
begin
  G_MENU_ATTRIBUTE_ITER:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_MENU_ATTRIBUTE_ITER,GMenuAttributeIter);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_MENU_ATTRIBUTE_ITER_CLASS(klass : longint) : longint;
begin
  G_MENU_ATTRIBUTE_ITER_CLASS:=G_TYPE_CHECK_CLASS_CAST(_class,G_TYPE_MENU_ATTRIBUTE_ITER,GMenuAttributeIterClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_MENU_ATTRIBUTE_ITER(obj : longint) : longint;
begin
  G_IS_MENU_ATTRIBUTE_ITER:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_MENU_ATTRIBUTE_ITER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_MENU_ATTRIBUTE_ITER_CLASS(klass : longint) : longint;
begin
  G_IS_MENU_ATTRIBUTE_ITER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(_class,G_TYPE_MENU_ATTRIBUTE_ITER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_MENU_ATTRIBUTE_ITER_GET_CLASS(obj : longint) : longint;
begin
  G_MENU_ATTRIBUTE_ITER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(inst,G_TYPE_MENU_ATTRIBUTE_ITER,GMenuAttributeIterClass);
end;

{ was #define dname def_expr }
function G_TYPE_MENU_LINK_ITER : longint; { return type might be wrong }
  begin
    G_TYPE_MENU_LINK_ITER:=g_menu_link_iter_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_MENU_LINK_ITER(obj : longint) : longint;
begin
  G_MENU_LINK_ITER:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_MENU_LINK_ITER,GMenuLinkIter);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_MENU_LINK_ITER_CLASS(klass : longint) : longint;
begin
  G_MENU_LINK_ITER_CLASS:=G_TYPE_CHECK_CLASS_CAST(_class,G_TYPE_MENU_LINK_ITER,GMenuLinkIterClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_MENU_LINK_ITER(obj : longint) : longint;
begin
  G_IS_MENU_LINK_ITER:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_MENU_LINK_ITER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_MENU_LINK_ITER_CLASS(klass : longint) : longint;
begin
  G_IS_MENU_LINK_ITER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(_class,G_TYPE_MENU_LINK_ITER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_MENU_LINK_ITER_GET_CLASS(obj : longint) : longint;
begin
  G_MENU_LINK_ITER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(inst,G_TYPE_MENU_LINK_ITER,GMenuLinkIterClass);
end;


end.
