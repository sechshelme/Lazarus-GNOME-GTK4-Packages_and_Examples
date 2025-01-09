
unit adw_overlay_split_view;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_overlay_split_view.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_overlay_split_view.h
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
PAdwOverlaySplitView  = ^AdwOverlaySplitView;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-length-unit.h"}

{ was #define dname def_expr }
function ADW_TYPE_OVERLAY_SPLIT_VIEW : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwOverlaySplitView, adw_overlay_split_view, ADW, OVERLAY_SPLIT_VIEW, GtkWidget) }
function adw_overlay_split_view_new:PGtkWidget;cdecl;external;
function adw_overlay_split_view_get_sidebar(self:PAdwOverlaySplitView):PGtkWidget;cdecl;external;
procedure adw_overlay_split_view_set_sidebar(self:PAdwOverlaySplitView; sidebar:PGtkWidget);cdecl;external;
function adw_overlay_split_view_get_content(self:PAdwOverlaySplitView):PGtkWidget;cdecl;external;
procedure adw_overlay_split_view_set_content(self:PAdwOverlaySplitView; content:PGtkWidget);cdecl;external;
function adw_overlay_split_view_get_collapsed(self:PAdwOverlaySplitView):Tgboolean;cdecl;external;
procedure adw_overlay_split_view_set_collapsed(self:PAdwOverlaySplitView; collapsed:Tgboolean);cdecl;external;
function adw_overlay_split_view_get_sidebar_position(self:PAdwOverlaySplitView):TGtkPackType;cdecl;external;
procedure adw_overlay_split_view_set_sidebar_position(self:PAdwOverlaySplitView; position:TGtkPackType);cdecl;external;
function adw_overlay_split_view_get_show_sidebar(self:PAdwOverlaySplitView):Tgboolean;cdecl;external;
procedure adw_overlay_split_view_set_show_sidebar(self:PAdwOverlaySplitView; show_sidebar:Tgboolean);cdecl;external;
function adw_overlay_split_view_get_pin_sidebar(self:PAdwOverlaySplitView):Tgboolean;cdecl;external;
procedure adw_overlay_split_view_set_pin_sidebar(self:PAdwOverlaySplitView; pin_sidebar:Tgboolean);cdecl;external;
function adw_overlay_split_view_get_enable_show_gesture(self:PAdwOverlaySplitView):Tgboolean;cdecl;external;
procedure adw_overlay_split_view_set_enable_show_gesture(self:PAdwOverlaySplitView; enable_show_gesture:Tgboolean);cdecl;external;
function adw_overlay_split_view_get_enable_hide_gesture(self:PAdwOverlaySplitView):Tgboolean;cdecl;external;
procedure adw_overlay_split_view_set_enable_hide_gesture(self:PAdwOverlaySplitView; enable_hide_gesture:Tgboolean);cdecl;external;
function adw_overlay_split_view_get_min_sidebar_width(self:PAdwOverlaySplitView):Tdouble;cdecl;external;
procedure adw_overlay_split_view_set_min_sidebar_width(self:PAdwOverlaySplitView; width:Tdouble);cdecl;external;
function adw_overlay_split_view_get_max_sidebar_width(self:PAdwOverlaySplitView):Tdouble;cdecl;external;
procedure adw_overlay_split_view_set_max_sidebar_width(self:PAdwOverlaySplitView; width:Tdouble);cdecl;external;
function adw_overlay_split_view_get_sidebar_width_fraction(self:PAdwOverlaySplitView):Tdouble;cdecl;external;
procedure adw_overlay_split_view_set_sidebar_width_fraction(self:PAdwOverlaySplitView; fraction:Tdouble);cdecl;external;
function adw_overlay_split_view_get_sidebar_width_unit(self:PAdwOverlaySplitView):TAdwLengthUnit;cdecl;external;
procedure adw_overlay_split_view_set_sidebar_width_unit(self:PAdwOverlaySplitView; unit:TAdwLengthUnit);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_OVERLAY_SPLIT_VIEW : longint; { return type might be wrong }
  begin
    ADW_TYPE_OVERLAY_SPLIT_VIEW:=adw_overlay_split_view_get_type;
  end;


end.
