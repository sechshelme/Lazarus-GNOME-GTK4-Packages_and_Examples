
unit adap_split_button;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_split_button.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_split_button.h
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
PAdapSplitButton  = ^AdapSplitButton;
Pchar  = ^char;
PGMenuModel  = ^GMenuModel;
PGtkPopover  = ^GtkPopover;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function ADAP_TYPE_SPLIT_BUTTON : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapSplitButton, adap_split_button, ADAP, SPLIT_BUTTON, GtkWidget) }
function adap_split_button_new:PGtkWidget;cdecl;external;
(* Const before type ignored *)
function adap_split_button_get_label(self:PAdapSplitButton):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_split_button_set_label(self:PAdapSplitButton; _label:Pchar);cdecl;external;
function adap_split_button_get_use_underline(self:PAdapSplitButton):Tgboolean;cdecl;external;
procedure adap_split_button_set_use_underline(self:PAdapSplitButton; use_underline:Tgboolean);cdecl;external;
(* Const before type ignored *)
function adap_split_button_get_icon_name(self:PAdapSplitButton):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_split_button_set_icon_name(self:PAdapSplitButton; icon_name:Pchar);cdecl;external;
function adap_split_button_get_child(self:PAdapSplitButton):PGtkWidget;cdecl;external;
procedure adap_split_button_set_child(self:PAdapSplitButton; child:PGtkWidget);cdecl;external;
function adap_split_button_get_can_shrink(self:PAdapSplitButton):Tgboolean;cdecl;external;
procedure adap_split_button_set_can_shrink(self:PAdapSplitButton; can_shrink:Tgboolean);cdecl;external;
function adap_split_button_get_menu_model(self:PAdapSplitButton):PGMenuModel;cdecl;external;
procedure adap_split_button_set_menu_model(self:PAdapSplitButton; menu_model:PGMenuModel);cdecl;external;
function adap_split_button_get_popover(self:PAdapSplitButton):PGtkPopover;cdecl;external;
procedure adap_split_button_set_popover(self:PAdapSplitButton; popover:PGtkPopover);cdecl;external;
function adap_split_button_get_direction(self:PAdapSplitButton):TGtkArrowType;cdecl;external;
procedure adap_split_button_set_direction(self:PAdapSplitButton; direction:TGtkArrowType);cdecl;external;
(* Const before type ignored *)
function adap_split_button_get_dropdown_tooltip(self:PAdapSplitButton):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_split_button_set_dropdown_tooltip(self:PAdapSplitButton; tooltip:Pchar);cdecl;external;
procedure adap_split_button_popup(self:PAdapSplitButton);cdecl;external;
procedure adap_split_button_popdown(self:PAdapSplitButton);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_SPLIT_BUTTON : longint; { return type might be wrong }
  begin
    ADAP_TYPE_SPLIT_BUTTON:=adap_split_button_get_type;
  end;


end.
