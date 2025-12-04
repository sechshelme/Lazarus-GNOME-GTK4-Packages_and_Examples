unit adap_header_bar;

interface

uses
  fp_adapta;

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

{G_DECLARE_FINAL_TYPE (AdapHeaderBar, adap_header_bar, ADAP, HEADER_BAR, GtkWidget) }
type
  PAdapCenteringPolicy = ^TAdapCenteringPolicy;
  TAdapCenteringPolicy =  Longint;
  Const
    ADAP_CENTERING_POLICY_LOOSE = 0;
    ADAP_CENTERING_POLICY_STRICT = 1;
;

function adap_header_bar_new:PGtkWidget;cdecl;external libadapta;
procedure adap_header_bar_pack_start(self:PAdapHeaderBar; child:PGtkWidget);cdecl;external libadapta;
procedure adap_header_bar_pack_end(self:PAdapHeaderBar; child:PGtkWidget);cdecl;external libadapta;
procedure adap_header_bar_remove(self:PAdapHeaderBar; child:PGtkWidget);cdecl;external libadapta;
function adap_header_bar_get_title_widget(self:PAdapHeaderBar):PGtkWidget;cdecl;external libadapta;
procedure adap_header_bar_set_title_widget(self:PAdapHeaderBar; title_widget:PGtkWidget);cdecl;external libadapta;
function adap_header_bar_get_show_start_title_buttons(self:PAdapHeaderBar):Tgboolean;cdecl;external libadapta;
procedure adap_header_bar_set_show_start_title_buttons(self:PAdapHeaderBar; setting:Tgboolean);cdecl;external libadapta;
function adap_header_bar_get_show_end_title_buttons(self:PAdapHeaderBar):Tgboolean;cdecl;external libadapta;
procedure adap_header_bar_set_show_end_title_buttons(self:PAdapHeaderBar; setting:Tgboolean);cdecl;external libadapta;
function adap_header_bar_get_show_back_button(self:PAdapHeaderBar):Tgboolean;cdecl;external libadapta;
procedure adap_header_bar_set_show_back_button(self:PAdapHeaderBar; show_back_button:Tgboolean);cdecl;external libadapta;
function adap_header_bar_get_decoration_layout(self:PAdapHeaderBar):Pchar;cdecl;external libadapta;
procedure adap_header_bar_set_decoration_layout(self:PAdapHeaderBar; layout:Pchar);cdecl;external libadapta;
function adap_header_bar_get_centering_policy(self:PAdapHeaderBar):TAdapCenteringPolicy;cdecl;external libadapta;
procedure adap_header_bar_set_centering_policy(self:PAdapHeaderBar; centering_policy:TAdapCenteringPolicy);cdecl;external libadapta;
function adap_header_bar_get_show_title(self:PAdapHeaderBar):Tgboolean;cdecl;external libadapta;
procedure adap_header_bar_set_show_title(self:PAdapHeaderBar; show_title:Tgboolean);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:08:48 ===

function ADAP_TYPE_HEADER_BAR: TGType;
function ADAP_HEADER_BAR(obj: Pointer): PAdapHeaderBar;
function ADAP_IS_HEADER_BAR(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_HEADER_BAR: TGType;
begin
  Result := adap_header_bar_get_type;
end;

function ADAP_HEADER_BAR(obj: Pointer): PAdapHeaderBar;
begin
  Result := PAdapHeaderBar(g_type_check_instance_cast(obj, ADAP_TYPE_HEADER_BAR));
end;

function ADAP_IS_HEADER_BAR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_HEADER_BAR);
end;

type 
  TAdapHeaderBar = record
  end;
  PAdapHeaderBar = ^TAdapHeaderBar;

  TAdapHeaderBarClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapHeaderBarClass = ^TAdapHeaderBarClass;

function adap_header_bar_get_type: TGType; cdecl; external libgxxxxxxx;



end.
