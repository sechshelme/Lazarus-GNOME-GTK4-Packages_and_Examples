
unit adw_enum_list_model;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_enum_list_model.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_enum_list_model.h
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
PAdwEnumListItem  = ^AdwEnumListItem;
PAdwEnumListModel  = ^AdwEnumListModel;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <glib-object.h>}

{ was #define dname def_expr }
function ADW_TYPE_ENUM_LIST_ITEM : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwEnumListItem, adw_enum_list_item, ADW, ENUM_LIST_ITEM, GObject) }
function adw_enum_list_item_get_value(self:PAdwEnumListItem):longint;cdecl;external;
(* Const before type ignored *)
function adw_enum_list_item_get_name(self:PAdwEnumListItem):Pchar;cdecl;external;
(* Const before type ignored *)
function adw_enum_list_item_get_nick(self:PAdwEnumListItem):Pchar;cdecl;external;
{ was #define dname def_expr }
function ADW_TYPE_ENUM_LIST_MODEL : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwEnumListModel, adw_enum_list_model, ADW, ENUM_LIST_MODEL, GObject) }
function adw_enum_list_model_new(enum_type:TGType):PAdwEnumListModel;cdecl;external;
function adw_enum_list_model_get_enum_type(self:PAdwEnumListModel):TGType;cdecl;external;
function adw_enum_list_model_find_position(self:PAdwEnumListModel; value:longint):Tguint;cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_ENUM_LIST_ITEM : longint; { return type might be wrong }
  begin
    ADW_TYPE_ENUM_LIST_ITEM:=adw_enum_list_item_get_type;
  end;

{ was #define dname def_expr }
function ADW_TYPE_ENUM_LIST_MODEL : longint; { return type might be wrong }
  begin
    ADW_TYPE_ENUM_LIST_MODEL:=adw_enum_list_model_get_type;
  end;


end.
