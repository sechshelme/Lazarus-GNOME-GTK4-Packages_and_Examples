
unit adw_header_bar;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_header_bar.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_header_bar.h
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
PAdwCenteringPolicy  = ^AdwCenteringPolicy;
PAdwHeaderBar  = ^AdwHeaderBar;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function ADW_TYPE_HEADER_BAR : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwHeaderBar, adw_header_bar, ADW, HEADER_BAR, GtkWidget) }
type
  PAdwCenteringPolicy = ^TAdwCenteringPolicy;
  TAdwCenteringPolicy =  Longint;
  Const
    ADW_CENTERING_POLICY_LOOSE = 0;
    ADW_CENTERING_POLICY_STRICT = 1;
;

function adw_header_bar_new:PGtkWidget;cdecl;external;
procedure adw_header_bar_pack_start(self:PAdwHeaderBar; child:PGtkWidget);cdecl;external;
procedure adw_header_bar_pack_end(self:PAdwHeaderBar; child:PGtkWidget);cdecl;external;
procedure adw_header_bar_remove(self:PAdwHeaderBar; child:PGtkWidget);cdecl;external;
function adw_header_bar_get_title_widget(self:PAdwHeaderBar):PGtkWidget;cdecl;external;
procedure adw_header_bar_set_title_widget(self:PAdwHeaderBar; title_widget:PGtkWidget);cdecl;external;
function adw_header_bar_get_show_start_title_buttons(self:PAdwHeaderBar):Tgboolean;cdecl;external;
procedure adw_header_bar_set_show_start_title_buttons(self:PAdwHeaderBar; setting:Tgboolean);cdecl;external;
function adw_header_bar_get_show_end_title_buttons(self:PAdwHeaderBar):Tgboolean;cdecl;external;
procedure adw_header_bar_set_show_end_title_buttons(self:PAdwHeaderBar; setting:Tgboolean);cdecl;external;
function adw_header_bar_get_show_back_button(self:PAdwHeaderBar):Tgboolean;cdecl;external;
procedure adw_header_bar_set_show_back_button(self:PAdwHeaderBar; show_back_button:Tgboolean);cdecl;external;
(* Const before type ignored *)
function adw_header_bar_get_decoration_layout(self:PAdwHeaderBar):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_header_bar_set_decoration_layout(self:PAdwHeaderBar; layout:Pchar);cdecl;external;
function adw_header_bar_get_centering_policy(self:PAdwHeaderBar):TAdwCenteringPolicy;cdecl;external;
procedure adw_header_bar_set_centering_policy(self:PAdwHeaderBar; centering_policy:TAdwCenteringPolicy);cdecl;external;
function adw_header_bar_get_show_title(self:PAdwHeaderBar):Tgboolean;cdecl;external;
procedure adw_header_bar_set_show_title(self:PAdwHeaderBar; show_title:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_HEADER_BAR : longint; { return type might be wrong }
  begin
    ADW_TYPE_HEADER_BAR:=adw_header_bar_get_type;
  end;


end.
