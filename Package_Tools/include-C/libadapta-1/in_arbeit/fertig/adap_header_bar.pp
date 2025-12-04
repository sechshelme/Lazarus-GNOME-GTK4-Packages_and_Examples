
unit adap_header_bar;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_header_bar.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_header_bar.h
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
PAdapCenteringPolicy  = ^AdapCenteringPolicy;
PAdapHeaderBar  = ^AdapHeaderBar;
Pchar  = ^char;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2013 Red Hat, Inc.
 * Copyright (C) 2019 Purism SPC
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
 * License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function ADAP_TYPE_HEADER_BAR : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapHeaderBar, adap_header_bar, ADAP, HEADER_BAR, GtkWidget) }
type
  PAdapCenteringPolicy = ^TAdapCenteringPolicy;
  TAdapCenteringPolicy =  Longint;
  Const
    ADAP_CENTERING_POLICY_LOOSE = 0;
    ADAP_CENTERING_POLICY_STRICT = 1;
;

function adap_header_bar_new:PGtkWidget;cdecl;external;
procedure adap_header_bar_pack_start(self:PAdapHeaderBar; child:PGtkWidget);cdecl;external;
procedure adap_header_bar_pack_end(self:PAdapHeaderBar; child:PGtkWidget);cdecl;external;
procedure adap_header_bar_remove(self:PAdapHeaderBar; child:PGtkWidget);cdecl;external;
function adap_header_bar_get_title_widget(self:PAdapHeaderBar):PGtkWidget;cdecl;external;
procedure adap_header_bar_set_title_widget(self:PAdapHeaderBar; title_widget:PGtkWidget);cdecl;external;
function adap_header_bar_get_show_start_title_buttons(self:PAdapHeaderBar):Tgboolean;cdecl;external;
procedure adap_header_bar_set_show_start_title_buttons(self:PAdapHeaderBar; setting:Tgboolean);cdecl;external;
function adap_header_bar_get_show_end_title_buttons(self:PAdapHeaderBar):Tgboolean;cdecl;external;
procedure adap_header_bar_set_show_end_title_buttons(self:PAdapHeaderBar; setting:Tgboolean);cdecl;external;
function adap_header_bar_get_show_back_button(self:PAdapHeaderBar):Tgboolean;cdecl;external;
procedure adap_header_bar_set_show_back_button(self:PAdapHeaderBar; show_back_button:Tgboolean);cdecl;external;
(* Const before type ignored *)
function adap_header_bar_get_decoration_layout(self:PAdapHeaderBar):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_header_bar_set_decoration_layout(self:PAdapHeaderBar; layout:Pchar);cdecl;external;
function adap_header_bar_get_centering_policy(self:PAdapHeaderBar):TAdapCenteringPolicy;cdecl;external;
procedure adap_header_bar_set_centering_policy(self:PAdapHeaderBar; centering_policy:TAdapCenteringPolicy);cdecl;external;
function adap_header_bar_get_show_title(self:PAdapHeaderBar):Tgboolean;cdecl;external;
procedure adap_header_bar_set_show_title(self:PAdapHeaderBar; show_title:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_HEADER_BAR : longint; { return type might be wrong }
  begin
    ADAP_TYPE_HEADER_BAR:=adap_header_bar_get_type;
  end;


end.
