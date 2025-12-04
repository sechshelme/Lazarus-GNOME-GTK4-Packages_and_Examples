
unit adap_overlay_split_view;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_overlay_split_view.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_overlay_split_view.h
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
PAdapOverlaySplitView  = ^AdapOverlaySplitView;
PGtkWidget  = ^GtkWidget;
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

{ was #define dname def_expr }
function ADAP_TYPE_OVERLAY_SPLIT_VIEW : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapOverlaySplitView, adap_overlay_split_view, ADAP, OVERLAY_SPLIT_VIEW, GtkWidget) }
function adap_overlay_split_view_new:PGtkWidget;cdecl;external;
function adap_overlay_split_view_get_sidebar(self:PAdapOverlaySplitView):PGtkWidget;cdecl;external;
procedure adap_overlay_split_view_set_sidebar(self:PAdapOverlaySplitView; sidebar:PGtkWidget);cdecl;external;
function adap_overlay_split_view_get_content(self:PAdapOverlaySplitView):PGtkWidget;cdecl;external;
procedure adap_overlay_split_view_set_content(self:PAdapOverlaySplitView; content:PGtkWidget);cdecl;external;
function adap_overlay_split_view_get_collapsed(self:PAdapOverlaySplitView):Tgboolean;cdecl;external;
procedure adap_overlay_split_view_set_collapsed(self:PAdapOverlaySplitView; collapsed:Tgboolean);cdecl;external;
function adap_overlay_split_view_get_sidebar_position(self:PAdapOverlaySplitView):TGtkPackType;cdecl;external;
procedure adap_overlay_split_view_set_sidebar_position(self:PAdapOverlaySplitView; position:TGtkPackType);cdecl;external;
function adap_overlay_split_view_get_show_sidebar(self:PAdapOverlaySplitView):Tgboolean;cdecl;external;
procedure adap_overlay_split_view_set_show_sidebar(self:PAdapOverlaySplitView; show_sidebar:Tgboolean);cdecl;external;
function adap_overlay_split_view_get_pin_sidebar(self:PAdapOverlaySplitView):Tgboolean;cdecl;external;
procedure adap_overlay_split_view_set_pin_sidebar(self:PAdapOverlaySplitView; pin_sidebar:Tgboolean);cdecl;external;
function adap_overlay_split_view_get_enable_show_gesture(self:PAdapOverlaySplitView):Tgboolean;cdecl;external;
procedure adap_overlay_split_view_set_enable_show_gesture(self:PAdapOverlaySplitView; enable_show_gesture:Tgboolean);cdecl;external;
function adap_overlay_split_view_get_enable_hide_gesture(self:PAdapOverlaySplitView):Tgboolean;cdecl;external;
procedure adap_overlay_split_view_set_enable_hide_gesture(self:PAdapOverlaySplitView; enable_hide_gesture:Tgboolean);cdecl;external;
function adap_overlay_split_view_get_min_sidebar_width(self:PAdapOverlaySplitView):Tdouble;cdecl;external;
procedure adap_overlay_split_view_set_min_sidebar_width(self:PAdapOverlaySplitView; width:Tdouble);cdecl;external;
function adap_overlay_split_view_get_max_sidebar_width(self:PAdapOverlaySplitView):Tdouble;cdecl;external;
procedure adap_overlay_split_view_set_max_sidebar_width(self:PAdapOverlaySplitView; width:Tdouble);cdecl;external;
function adap_overlay_split_view_get_sidebar_width_fraction(self:PAdapOverlaySplitView):Tdouble;cdecl;external;
procedure adap_overlay_split_view_set_sidebar_width_fraction(self:PAdapOverlaySplitView; fraction:Tdouble);cdecl;external;
function adap_overlay_split_view_get_sidebar_width_unit(self:PAdapOverlaySplitView):TAdapLengthUnit;cdecl;external;
procedure adap_overlay_split_view_set_sidebar_width_unit(self:PAdapOverlaySplitView; unit:TAdapLengthUnit);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_OVERLAY_SPLIT_VIEW : longint; { return type might be wrong }
  begin
    ADAP_TYPE_OVERLAY_SPLIT_VIEW:=adap_overlay_split_view_get_type;
  end;


end.
