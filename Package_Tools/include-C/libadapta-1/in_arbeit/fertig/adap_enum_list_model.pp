
unit adap_enum_list_model;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_enum_list_model.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_enum_list_model.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PAdapEnumListItem  = ^AdapEnumListItem;
PAdapEnumListModel  = ^AdapEnumListModel;
Pchar  = ^char;
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

{ was #define dname def_expr }
function ADAP_TYPE_ENUM_LIST_ITEM : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapEnumListItem, adap_enum_list_item, ADAP, ENUM_LIST_ITEM, GObject) }
function adap_enum_list_item_get_value(self:PAdapEnumListItem):longint;cdecl;external;
(* Const before type ignored *)
function adap_enum_list_item_get_name(self:PAdapEnumListItem):Pchar;cdecl;external;
(* Const before type ignored *)
function adap_enum_list_item_get_nick(self:PAdapEnumListItem):Pchar;cdecl;external;
{ was #define dname def_expr }
function ADAP_TYPE_ENUM_LIST_MODEL : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapEnumListModel, adap_enum_list_model, ADAP, ENUM_LIST_MODEL, GObject) }
function adap_enum_list_model_new(enum_type:TGType):PAdapEnumListModel;cdecl;external;
function adap_enum_list_model_get_enum_type(self:PAdapEnumListModel):TGType;cdecl;external;
function adap_enum_list_model_find_position(self:PAdapEnumListModel; value:longint):Tguint;cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_ENUM_LIST_ITEM : longint; { return type might be wrong }
  begin
    ADAP_TYPE_ENUM_LIST_ITEM:=adap_enum_list_item_get_type;
  end;

{ was #define dname def_expr }
function ADAP_TYPE_ENUM_LIST_MODEL : longint; { return type might be wrong }
  begin
    ADAP_TYPE_ENUM_LIST_MODEL:=adap_enum_list_model_get_type;
  end;


end.
