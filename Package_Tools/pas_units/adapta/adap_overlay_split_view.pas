unit adap_overlay_split_view;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2020 Felix Häcker <haeckerfelix@gnome.org>
 * Copyright (C) 2023 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-length-unit.h"}

{G_DECLARE_FINAL_TYPE (AdapOverlaySplitView, adap_overlay_split_view, ADAP, OVERLAY_SPLIT_VIEW, GtkWidget) }
function adap_overlay_split_view_new:PGtkWidget;cdecl;external libadapta;
function adap_overlay_split_view_get_sidebar(self:PAdapOverlaySplitView):PGtkWidget;cdecl;external libadapta;
procedure adap_overlay_split_view_set_sidebar(self:PAdapOverlaySplitView; sidebar:PGtkWidget);cdecl;external libadapta;
function adap_overlay_split_view_get_content(self:PAdapOverlaySplitView):PGtkWidget;cdecl;external libadapta;
procedure adap_overlay_split_view_set_content(self:PAdapOverlaySplitView; content:PGtkWidget);cdecl;external libadapta;
function adap_overlay_split_view_get_collapsed(self:PAdapOverlaySplitView):Tgboolean;cdecl;external libadapta;
procedure adap_overlay_split_view_set_collapsed(self:PAdapOverlaySplitView; collapsed:Tgboolean);cdecl;external libadapta;
function adap_overlay_split_view_get_sidebar_position(self:PAdapOverlaySplitView):TGtkPackType;cdecl;external libadapta;
procedure adap_overlay_split_view_set_sidebar_position(self:PAdapOverlaySplitView; position:TGtkPackType);cdecl;external libadapta;
function adap_overlay_split_view_get_show_sidebar(self:PAdapOverlaySplitView):Tgboolean;cdecl;external libadapta;
procedure adap_overlay_split_view_set_show_sidebar(self:PAdapOverlaySplitView; show_sidebar:Tgboolean);cdecl;external libadapta;
function adap_overlay_split_view_get_pin_sidebar(self:PAdapOverlaySplitView):Tgboolean;cdecl;external libadapta;
procedure adap_overlay_split_view_set_pin_sidebar(self:PAdapOverlaySplitView; pin_sidebar:Tgboolean);cdecl;external libadapta;
function adap_overlay_split_view_get_enable_show_gesture(self:PAdapOverlaySplitView):Tgboolean;cdecl;external libadapta;
procedure adap_overlay_split_view_set_enable_show_gesture(self:PAdapOverlaySplitView; enable_show_gesture:Tgboolean);cdecl;external libadapta;
function adap_overlay_split_view_get_enable_hide_gesture(self:PAdapOverlaySplitView):Tgboolean;cdecl;external libadapta;
procedure adap_overlay_split_view_set_enable_hide_gesture(self:PAdapOverlaySplitView; enable_hide_gesture:Tgboolean);cdecl;external libadapta;
function adap_overlay_split_view_get_min_sidebar_width(self:PAdapOverlaySplitView):Tdouble;cdecl;external libadapta;
procedure adap_overlay_split_view_set_min_sidebar_width(self:PAdapOverlaySplitView; width:Tdouble);cdecl;external libadapta;
function adap_overlay_split_view_get_max_sidebar_width(self:PAdapOverlaySplitView):Tdouble;cdecl;external libadapta;
procedure adap_overlay_split_view_set_max_sidebar_width(self:PAdapOverlaySplitView; width:Tdouble);cdecl;external libadapta;
function adap_overlay_split_view_get_sidebar_width_fraction(self:PAdapOverlaySplitView):Tdouble;cdecl;external libadapta;
procedure adap_overlay_split_view_set_sidebar_width_fraction(self:PAdapOverlaySplitView; fraction:Tdouble);cdecl;external libadapta;
function adap_overlay_split_view_get_sidebar_width_unit(self:PAdapOverlaySplitView):TAdapLengthUnit;cdecl;external libadapta;
procedure adap_overlay_split_view_set_sidebar_width_unit(self:PAdapOverlaySplitView; unit:TAdapLengthUnit);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:18:19 ===

function ADAP_TYPE_OVERLAY_SPLIT_VIEW: TGType;
function ADAP_OVERLAY_SPLIT_VIEW(obj: Pointer): PAdapOverlaySplitView;
function ADAP_IS_OVERLAY_SPLIT_VIEW(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_OVERLAY_SPLIT_VIEW: TGType;
begin
  Result := adap_overlay_split_view_get_type;
end;

function ADAP_OVERLAY_SPLIT_VIEW(obj: Pointer): PAdapOverlaySplitView;
begin
  Result := PAdapOverlaySplitView(g_type_check_instance_cast(obj, ADAP_TYPE_OVERLAY_SPLIT_VIEW));
end;

function ADAP_IS_OVERLAY_SPLIT_VIEW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_OVERLAY_SPLIT_VIEW);
end;

type 
  TAdapOverlaySplitView = record
  end;
  PAdapOverlaySplitView = ^TAdapOverlaySplitView;

  TAdapOverlaySplitViewClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapOverlaySplitViewClass = ^TAdapOverlaySplitViewClass;

function adap_overlay_split_view_get_type: TGType; cdecl; external libgxxxxxxx;



end.
