
unit adw_tab_button;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_tab_button.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_tab_button.h
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
PAdwTabButton  = ^AdwTabButton;
PAdwTabView  = ^AdwTabView;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1+
 *
 * Author: Alice Mikhaylenko <alice.mikhaylenko@puri.sm>
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-tab-view.h"}

{ was #define dname def_expr }
function ADW_TYPE_TAB_BUTTON : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwTabButton, adw_tab_button, ADW, TAB_BUTTON, GtkWidget) }
function adw_tab_button_new:PGtkWidget;cdecl;external;
function adw_tab_button_get_view(self:PAdwTabButton):PAdwTabView;cdecl;external;
procedure adw_tab_button_set_view(self:PAdwTabButton; view:PAdwTabView);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_TAB_BUTTON : longint; { return type might be wrong }
  begin
    ADW_TYPE_TAB_BUTTON:=adw_tab_button_get_type;
  end;


end.
