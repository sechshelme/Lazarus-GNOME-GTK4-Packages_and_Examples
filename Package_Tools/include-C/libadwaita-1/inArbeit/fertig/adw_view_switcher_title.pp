
unit adw_view_switcher_title;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_view_switcher_title.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_view_switcher_title.h
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
PAdwViewSwitcherTitle  = ^AdwViewSwitcherTitle;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-view-switcher.h"}

{ was #define dname def_expr }
function ADW_TYPE_VIEW_SWITCHER_TITLE : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwViewSwitcherTitle, adw_view_switcher_title, ADW, VIEW_SWITCHER_TITLE, GtkWidget) }
function adw_view_switcher_title_new:PGtkWidget;cdecl;external;
function adw_view_switcher_title_get_stack(self:PAdwViewSwitcherTitle):PAdwViewStack;cdecl;external;
procedure adw_view_switcher_title_set_stack(self:PAdwViewSwitcherTitle; stack:PAdwViewStack);cdecl;external;
(* Const before type ignored *)
function adw_view_switcher_title_get_title(self:PAdwViewSwitcherTitle):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_view_switcher_title_set_title(self:PAdwViewSwitcherTitle; title:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_view_switcher_title_get_subtitle(self:PAdwViewSwitcherTitle):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_view_switcher_title_set_subtitle(self:PAdwViewSwitcherTitle; subtitle:Pchar);cdecl;external;
function adw_view_switcher_title_get_view_switcher_enabled(self:PAdwViewSwitcherTitle):Tgboolean;cdecl;external;
procedure adw_view_switcher_title_set_view_switcher_enabled(self:PAdwViewSwitcherTitle; enabled:Tgboolean);cdecl;external;
function adw_view_switcher_title_get_title_visible(self:PAdwViewSwitcherTitle):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_VIEW_SWITCHER_TITLE : longint; { return type might be wrong }
  begin
    ADW_TYPE_VIEW_SWITCHER_TITLE:=adw_view_switcher_title_get_type;
  end;


end.
