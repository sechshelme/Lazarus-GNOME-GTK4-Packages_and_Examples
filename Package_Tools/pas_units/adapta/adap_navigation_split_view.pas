unit adap_navigation_split_view;

interface

uses
  fp_adapta;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2022-2023 Purism SPC
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
{$include "adap-length-unit.h"}
{$include "adap-navigation-view.h"}

{G_DECLARE_FINAL_TYPE (AdapNavigationSplitView, adap_navigation_split_view, ADAP, NAVIGATION_SPLIT_VIEW, GtkWidget) }
function adap_navigation_split_view_new:PGtkWidget;cdecl;external libadapta;
function adap_navigation_split_view_get_sidebar(self:PAdapNavigationSplitView):PAdapNavigationPage;cdecl;external libadapta;
procedure adap_navigation_split_view_set_sidebar(self:PAdapNavigationSplitView; sidebar:PAdapNavigationPage);cdecl;external libadapta;
function adap_navigation_split_view_get_content(self:PAdapNavigationSplitView):PAdapNavigationPage;cdecl;external libadapta;
procedure adap_navigation_split_view_set_content(self:PAdapNavigationSplitView; content:PAdapNavigationPage);cdecl;external libadapta;
function adap_navigation_split_view_get_collapsed(self:PAdapNavigationSplitView):Tgboolean;cdecl;external libadapta;
procedure adap_navigation_split_view_set_collapsed(self:PAdapNavigationSplitView; collapsed:Tgboolean);cdecl;external libadapta;
function adap_navigation_split_view_get_show_content(self:PAdapNavigationSplitView):Tgboolean;cdecl;external libadapta;
procedure adap_navigation_split_view_set_show_content(self:PAdapNavigationSplitView; show_content:Tgboolean);cdecl;external libadapta;
function adap_navigation_split_view_get_min_sidebar_width(self:PAdapNavigationSplitView):Tdouble;cdecl;external libadapta;
procedure adap_navigation_split_view_set_min_sidebar_width(self:PAdapNavigationSplitView; width:Tdouble);cdecl;external libadapta;
function adap_navigation_split_view_get_max_sidebar_width(self:PAdapNavigationSplitView):Tdouble;cdecl;external libadapta;
procedure adap_navigation_split_view_set_max_sidebar_width(self:PAdapNavigationSplitView; width:Tdouble);cdecl;external libadapta;
function adap_navigation_split_view_get_sidebar_width_fraction(self:PAdapNavigationSplitView):Tdouble;cdecl;external libadapta;
procedure adap_navigation_split_view_set_sidebar_width_fraction(self:PAdapNavigationSplitView; fraction:Tdouble);cdecl;external libadapta;
function adap_navigation_split_view_get_sidebar_width_unit(self:PAdapNavigationSplitView):TAdapLengthUnit;cdecl;external libadapta;
procedure adap_navigation_split_view_set_sidebar_width_unit(self:PAdapNavigationSplitView; unit:TAdapLengthUnit);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:18:13 ===

function ADAP_TYPE_NAVIGATION_SPLIT_VIEW: TGType;
function ADAP_NAVIGATION_SPLIT_VIEW(obj: Pointer): PAdapNavigationSplitView;
function ADAP_IS_NAVIGATION_SPLIT_VIEW(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_NAVIGATION_SPLIT_VIEW: TGType;
begin
  Result := adap_navigation_split_view_get_type;
end;

function ADAP_NAVIGATION_SPLIT_VIEW(obj: Pointer): PAdapNavigationSplitView;
begin
  Result := PAdapNavigationSplitView(g_type_check_instance_cast(obj, ADAP_TYPE_NAVIGATION_SPLIT_VIEW));
end;

function ADAP_IS_NAVIGATION_SPLIT_VIEW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_NAVIGATION_SPLIT_VIEW);
end;

type 
  TAdapNavigationSplitView = record
  end;
  PAdapNavigationSplitView = ^TAdapNavigationSplitView;

  TAdapNavigationSplitViewClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapNavigationSplitViewClass = ^TAdapNavigationSplitViewClass;

function adap_navigation_split_view_get_type: TGType; cdecl; external libgxxxxxxx;



end.
