unit adap_enum_list_model;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2020 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <glib-object.h>}

{G_DECLARE_FINAL_TYPE (AdapEnumListItem, adap_enum_list_item, ADAP, ENUM_LIST_ITEM, GObject) }
function adap_enum_list_item_get_value(self:PAdapEnumListItem):longint;cdecl;external libadapta;
function adap_enum_list_item_get_name(self:PAdapEnumListItem):Pchar;cdecl;external libadapta;
function adap_enum_list_item_get_nick(self:PAdapEnumListItem):Pchar;cdecl;external libadapta;
{ was #define dname def_expr }
function ADAP_TYPE_ENUM_LIST_MODEL : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapEnumListModel, adap_enum_list_model, ADAP, ENUM_LIST_MODEL, GObject) }
function adap_enum_list_model_new(enum_type:TGType):PAdapEnumListModel;cdecl;external libadapta;
function adap_enum_list_model_get_enum_type(self:PAdapEnumListModel):TGType;cdecl;external libadapta;
function adap_enum_list_model_find_position(self:PAdapEnumListModel; value:longint):Tguint;cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:09:04 ===

function ADAP_TYPE_ENUM_LIST_ITEM: TGType;
function ADAP_ENUM_LIST_ITEM(obj: Pointer): PAdapEnumListItem;
function ADAP_IS_ENUM_LIST_ITEM(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_ENUM_LIST_ITEM: TGType;
begin
  Result := adap_enum_list_item_get_type;
end;

function ADAP_ENUM_LIST_ITEM(obj: Pointer): PAdapEnumListItem;
begin
  Result := PAdapEnumListItem(g_type_check_instance_cast(obj, ADAP_TYPE_ENUM_LIST_ITEM));
end;

function ADAP_IS_ENUM_LIST_ITEM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_ENUM_LIST_ITEM);
end;

type 
  TAdapEnumListItem = record
  end;
  PAdapEnumListItem = ^TAdapEnumListItem;

  TAdapEnumListItemClass = record
    parent_class: TGObjectClass;
  end;
  PAdapEnumListItemClass = ^TAdapEnumListItemClass;

function adap_enum_list_item_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname def_expr }
function ADAP_TYPE_ENUM_LIST_MODEL : longint; { return type might be wrong }
  begin
    ADAP_TYPE_ENUM_LIST_MODEL:=adap_enum_list_model_get_type;
  end;


end.
