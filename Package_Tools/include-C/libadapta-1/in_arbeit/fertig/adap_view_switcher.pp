
unit adap_view_switcher;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_view_switcher.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_view_switcher.h
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
PAdapViewSwitcher  = ^AdapViewSwitcher;
PAdapViewSwitcherPolicy  = ^AdapViewSwitcherPolicy;
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
{$include "adap-view-stack.h"}

{ was #define dname def_expr }
function ADAP_TYPE_VIEW_SWITCHER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapViewSwitcher, adap_view_switcher, ADAP, VIEW_SWITCHER, GtkWidget) }
type
  PAdapViewSwitcherPolicy = ^TAdapViewSwitcherPolicy;
  TAdapViewSwitcherPolicy =  Longint;
  Const
    ADAP_VIEW_SWITCHER_POLICY_NARROW = 0;
    ADAP_VIEW_SWITCHER_POLICY_WIDE = 1;
;

function adap_view_switcher_new:PGtkWidget;cdecl;external;
function adap_view_switcher_get_policy(self:PAdapViewSwitcher):TAdapViewSwitcherPolicy;cdecl;external;
procedure adap_view_switcher_set_policy(self:PAdapViewSwitcher; policy:TAdapViewSwitcherPolicy);cdecl;external;
function adap_view_switcher_get_stack(self:PAdapViewSwitcher):PAdapViewStack;cdecl;external;
procedure adap_view_switcher_set_stack(self:PAdapViewSwitcher; stack:PAdapViewStack);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_VIEW_SWITCHER : longint; { return type might be wrong }
  begin
    ADAP_TYPE_VIEW_SWITCHER:=adap_view_switcher_get_type;
  end;


end.
