
unit adw_view_switcher;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_view_switcher.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_view_switcher.h
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
PAdwViewSwitcher  = ^AdwViewSwitcher;
PAdwViewSwitcherPolicy  = ^AdwViewSwitcherPolicy;
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
{$include "adw-view-stack.h"}

{ was #define dname def_expr }
function ADW_TYPE_VIEW_SWITCHER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwViewSwitcher, adw_view_switcher, ADW, VIEW_SWITCHER, GtkWidget) }
type
  PAdwViewSwitcherPolicy = ^TAdwViewSwitcherPolicy;
  TAdwViewSwitcherPolicy =  Longint;
  Const
    ADW_VIEW_SWITCHER_POLICY_NARROW = 0;
    ADW_VIEW_SWITCHER_POLICY_WIDE = 1;
;

function adw_view_switcher_new:PGtkWidget;cdecl;external;
function adw_view_switcher_get_policy(self:PAdwViewSwitcher):TAdwViewSwitcherPolicy;cdecl;external;
procedure adw_view_switcher_set_policy(self:PAdwViewSwitcher; policy:TAdwViewSwitcherPolicy);cdecl;external;
function adw_view_switcher_get_stack(self:PAdwViewSwitcher):PAdwViewStack;cdecl;external;
procedure adw_view_switcher_set_stack(self:PAdwViewSwitcher; stack:PAdwViewStack);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_VIEW_SWITCHER : longint; { return type might be wrong }
  begin
    ADW_TYPE_VIEW_SWITCHER:=adw_view_switcher_get_type;
  end;


end.
