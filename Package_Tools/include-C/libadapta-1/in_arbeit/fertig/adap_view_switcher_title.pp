
unit adap_view_switcher_title;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_view_switcher_title.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_view_switcher_title.h
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
PAdapViewSwitcherTitle  = ^AdapViewSwitcherTitle;
Pchar  = ^char;
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
function ADAP_TYPE_VIEW_SWITCHER_TITLE : longint; { return type might be wrong }

{ADAP_DEPRECATED_IN_1_4 }
{G_DECLARE_FINAL_TYPE (AdapViewSwitcherTitle, adap_view_switcher_title, ADAP, VIEW_SWITCHER_TITLE, GtkWidget) }
{ADAP_DEPRECATED_IN_1_4 }
function adap_view_switcher_title_new:PGtkWidget;cdecl;external;
{ADAP_DEPRECATED_IN_1_4 }
function adap_view_switcher_title_get_stack(self:PAdapViewSwitcherTitle):PAdapViewStack;cdecl;external;
{ADAP_DEPRECATED_IN_1_4 }
procedure adap_view_switcher_title_set_stack(self:PAdapViewSwitcherTitle; stack:PAdapViewStack);cdecl;external;
{ADAP_DEPRECATED_IN_1_4 }
(* Const before type ignored *)
function adap_view_switcher_title_get_title(self:PAdapViewSwitcherTitle):Pchar;cdecl;external;
{ADAP_DEPRECATED_IN_1_4 }
(* Const before type ignored *)
procedure adap_view_switcher_title_set_title(self:PAdapViewSwitcherTitle; title:Pchar);cdecl;external;
{ADAP_DEPRECATED_IN_1_4 }
(* Const before type ignored *)
function adap_view_switcher_title_get_subtitle(self:PAdapViewSwitcherTitle):Pchar;cdecl;external;
{ADAP_DEPRECATED_IN_1_4 }
(* Const before type ignored *)
procedure adap_view_switcher_title_set_subtitle(self:PAdapViewSwitcherTitle; subtitle:Pchar);cdecl;external;
{ADAP_DEPRECATED_IN_1_4 }
function adap_view_switcher_title_get_view_switcher_enabled(self:PAdapViewSwitcherTitle):Tgboolean;cdecl;external;
{ADAP_DEPRECATED_IN_1_4 }
procedure adap_view_switcher_title_set_view_switcher_enabled(self:PAdapViewSwitcherTitle; enabled:Tgboolean);cdecl;external;
{ADAP_DEPRECATED_IN_1_4 }
function adap_view_switcher_title_get_title_visible(self:PAdapViewSwitcherTitle):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_VIEW_SWITCHER_TITLE : longint; { return type might be wrong }
  begin
    ADAP_TYPE_VIEW_SWITCHER_TITLE:=adap_view_switcher_title_get_type;
  end;


end.
