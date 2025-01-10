
unit adw_split_button;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_split_button.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_split_button.h
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
PAdwSplitButton  = ^AdwSplitButton;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function ADW_TYPE_SPLIT_BUTTON : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwSplitButton, adw_split_button, ADW, SPLIT_BUTTON, GtkWidget) }
function adw_split_button_new:PGtkWidget;cdecl;external;
(* Const before type ignored *)
function adw_split_button_get_label(self:PAdwSplitButton):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_split_button_set_label(self:PAdwSplitButton; _label:Pchar);cdecl;external;
function adw_split_button_get_use_underline(self:PAdwSplitButton):Tgboolean;cdecl;external;
procedure adw_split_button_set_use_underline(self:PAdwSplitButton; use_underline:Tgboolean);cdecl;external;
(* Const before type ignored *)
function adw_split_button_get_icon_name(self:PAdwSplitButton):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_split_button_set_icon_name(self:PAdwSplitButton; icon_name:Pchar);cdecl;external;
function adw_split_button_get_child(self:PAdwSplitButton):PGtkWidget;cdecl;external;
procedure adw_split_button_set_child(self:PAdwSplitButton; child:PGtkWidget);cdecl;external;
function adw_split_button_get_can_shrink(self:PAdwSplitButton):Tgboolean;cdecl;external;
procedure adw_split_button_set_can_shrink(self:PAdwSplitButton; can_shrink:Tgboolean);cdecl;external;
function adw_split_button_get_menu_model(self:PAdwSplitButton):PGMenuModel;cdecl;external;
procedure adw_split_button_set_menu_model(self:PAdwSplitButton; menu_model:PGMenuModel);cdecl;external;
function adw_split_button_get_popover(self:PAdwSplitButton):PGtkPopover;cdecl;external;
procedure adw_split_button_set_popover(self:PAdwSplitButton; popover:PGtkPopover);cdecl;external;
function adw_split_button_get_direction(self:PAdwSplitButton):TGtkArrowType;cdecl;external;
procedure adw_split_button_set_direction(self:PAdwSplitButton; direction:TGtkArrowType);cdecl;external;
(* Const before type ignored *)
function adw_split_button_get_dropdown_tooltip(self:PAdwSplitButton):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_split_button_set_dropdown_tooltip(self:PAdwSplitButton; tooltip:Pchar);cdecl;external;
procedure adw_split_button_popup(self:PAdwSplitButton);cdecl;external;
procedure adw_split_button_popdown(self:PAdwSplitButton);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_SPLIT_BUTTON : longint; { return type might be wrong }
  begin
    ADW_TYPE_SPLIT_BUTTON:=adw_split_button_get_type;
  end;


end.
