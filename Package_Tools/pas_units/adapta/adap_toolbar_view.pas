unit adap_toolbar_view;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2023 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * Author: Alice Mikhaylenko <alice.mikhaylenko@puri.sm>
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-enums.h"}

type
  PAdapToolbarStyle = ^TAdapToolbarStyle;
  TAdapToolbarStyle =  Longint;
  Const
    ADAP_TOOLBAR_FLAT = 0;
    ADAP_TOOLBAR_RAISED = 1;
    ADAP_TOOLBAR_RAISED_BORDER = 2;
;
{G_DECLARE_FINAL_TYPE (AdapToolbarView, adap_toolbar_view, ADAP, TOOLBAR_VIEW, GtkWidget) }

function adap_toolbar_view_new:PGtkWidget;cdecl;external libadapta;
function adap_toolbar_view_get_content(self:PAdapToolbarView):PGtkWidget;cdecl;external libadapta;
procedure adap_toolbar_view_set_content(self:PAdapToolbarView; content:PGtkWidget);cdecl;external libadapta;
procedure adap_toolbar_view_add_top_bar(self:PAdapToolbarView; widget:PGtkWidget);cdecl;external libadapta;
procedure adap_toolbar_view_add_bottom_bar(self:PAdapToolbarView; widget:PGtkWidget);cdecl;external libadapta;
procedure adap_toolbar_view_remove(self:PAdapToolbarView; widget:PGtkWidget);cdecl;external libadapta;
function adap_toolbar_view_get_top_bar_style(self:PAdapToolbarView):TAdapToolbarStyle;cdecl;external libadapta;
procedure adap_toolbar_view_set_top_bar_style(self:PAdapToolbarView; style:TAdapToolbarStyle);cdecl;external libadapta;
function adap_toolbar_view_get_bottom_bar_style(self:PAdapToolbarView):TAdapToolbarStyle;cdecl;external libadapta;
procedure adap_toolbar_view_set_bottom_bar_style(self:PAdapToolbarView; style:TAdapToolbarStyle);cdecl;external libadapta;
function adap_toolbar_view_get_reveal_top_bars(self:PAdapToolbarView):Tgboolean;cdecl;external libadapta;
procedure adap_toolbar_view_set_reveal_top_bars(self:PAdapToolbarView; reveal:Tgboolean);cdecl;external libadapta;
function adap_toolbar_view_get_reveal_bottom_bars(self:PAdapToolbarView):Tgboolean;cdecl;external libadapta;
procedure adap_toolbar_view_set_reveal_bottom_bars(self:PAdapToolbarView; reveal:Tgboolean);cdecl;external libadapta;
function adap_toolbar_view_get_extend_content_to_top_edge(self:PAdapToolbarView):Tgboolean;cdecl;external libadapta;
procedure adap_toolbar_view_set_extend_content_to_top_edge(self:PAdapToolbarView; extend:Tgboolean);cdecl;external libadapta;
function adap_toolbar_view_get_extend_content_to_bottom_edge(self:PAdapToolbarView):Tgboolean;cdecl;external libadapta;
procedure adap_toolbar_view_set_extend_content_to_bottom_edge(self:PAdapToolbarView; extend:Tgboolean);cdecl;external libadapta;
function adap_toolbar_view_get_top_bar_height(self:PAdapToolbarView):longint;cdecl;external libadapta;
function adap_toolbar_view_get_bottom_bar_height(self:PAdapToolbarView):longint;cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:27:39 ===

function ADAP_TYPE_TOOLBAR_VIEW: TGType;
function ADAP_TOOLBAR_VIEW(obj: Pointer): PAdapToolbarView;
function ADAP_IS_TOOLBAR_VIEW(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_TOOLBAR_VIEW: TGType;
begin
  Result := adap_toolbar_view_get_type;
end;

function ADAP_TOOLBAR_VIEW(obj: Pointer): PAdapToolbarView;
begin
  Result := PAdapToolbarView(g_type_check_instance_cast(obj, ADAP_TYPE_TOOLBAR_VIEW));
end;

function ADAP_IS_TOOLBAR_VIEW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_TOOLBAR_VIEW);
end;

type 
  TAdapToolbarView = record
  end;
  PAdapToolbarView = ^TAdapToolbarView;

  TAdapToolbarViewClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapToolbarViewClass = ^TAdapToolbarViewClass;

function adap_toolbar_view_get_type: TGType; cdecl; external libgxxxxxxx;



end.
