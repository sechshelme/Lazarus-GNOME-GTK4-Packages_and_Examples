
unit adap_view_switcher_bar;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_view_switcher_bar.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_view_switcher_bar.h
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
PAdapViewStack  = ^AdapViewStack;
PAdapViewSwitcherBar  = ^AdapViewSwitcherBar;
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-view-switcher.h"}

{ was #define dname def_expr }
function ADAP_TYPE_VIEW_SWITCHER_BAR : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapViewSwitcherBar, adap_view_switcher_bar, ADAP, VIEW_SWITCHER_BAR, GtkWidget) }
function adap_view_switcher_bar_new:PGtkWidget;cdecl;external;
function adap_view_switcher_bar_get_stack(self:PAdapViewSwitcherBar):PAdapViewStack;cdecl;external;
procedure adap_view_switcher_bar_set_stack(self:PAdapViewSwitcherBar; stack:PAdapViewStack);cdecl;external;
function adap_view_switcher_bar_get_reveal(self:PAdapViewSwitcherBar):Tgboolean;cdecl;external;
procedure adap_view_switcher_bar_set_reveal(self:PAdapViewSwitcherBar; reveal:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_VIEW_SWITCHER_BAR : longint; { return type might be wrong }
  begin
    ADAP_TYPE_VIEW_SWITCHER_BAR:=adap_view_switcher_bar_get_type;
  end;


end.
