
unit adw_view_switcher_bar;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_view_switcher_bar.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_view_switcher_bar.h
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
PAdwViewStack  = ^AdwViewStack;
PAdwViewSwitcherBar  = ^AdwViewSwitcherBar;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2019 Zander Brown <zbrown@gnome.org>
 * Copyright (C) 2019 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-view-switcher.h"}

{ was #define dname def_expr }
function ADW_TYPE_VIEW_SWITCHER_BAR : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwViewSwitcherBar, adw_view_switcher_bar, ADW, VIEW_SWITCHER_BAR, GtkWidget) }
function adw_view_switcher_bar_new:PGtkWidget;cdecl;external;
function adw_view_switcher_bar_get_stack(self:PAdwViewSwitcherBar):PAdwViewStack;cdecl;external;
procedure adw_view_switcher_bar_set_stack(self:PAdwViewSwitcherBar; stack:PAdwViewStack);cdecl;external;
function adw_view_switcher_bar_get_reveal(self:PAdwViewSwitcherBar):Tgboolean;cdecl;external;
procedure adw_view_switcher_bar_set_reveal(self:PAdwViewSwitcherBar; reveal:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_VIEW_SWITCHER_BAR : longint; { return type might be wrong }
  begin
    ADW_TYPE_VIEW_SWITCHER_BAR:=adw_view_switcher_bar_get_type;
  end;


end.
