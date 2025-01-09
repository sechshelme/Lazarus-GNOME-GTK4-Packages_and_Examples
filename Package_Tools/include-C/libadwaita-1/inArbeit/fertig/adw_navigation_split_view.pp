
unit adw_navigation_split_view;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_navigation_split_view.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_navigation_split_view.h
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
PAdwNavigationPage  = ^AdwNavigationPage;
PAdwNavigationSplitView  = ^AdwNavigationSplitView;
PGtkWidget  = ^GtkWidget;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-length-unit.h"}
{$include "adw-navigation-view.h"}

{ was #define dname def_expr }
function ADW_TYPE_NAVIGATION_SPLIT_VIEW : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwNavigationSplitView, adw_navigation_split_view, ADW, NAVIGATION_SPLIT_VIEW, GtkWidget) }
function adw_navigation_split_view_new:PGtkWidget;cdecl;external;
function adw_navigation_split_view_get_sidebar(self:PAdwNavigationSplitView):PAdwNavigationPage;cdecl;external;
procedure adw_navigation_split_view_set_sidebar(self:PAdwNavigationSplitView; sidebar:PAdwNavigationPage);cdecl;external;
function adw_navigation_split_view_get_content(self:PAdwNavigationSplitView):PAdwNavigationPage;cdecl;external;
procedure adw_navigation_split_view_set_content(self:PAdwNavigationSplitView; content:PAdwNavigationPage);cdecl;external;
function adw_navigation_split_view_get_collapsed(self:PAdwNavigationSplitView):Tgboolean;cdecl;external;
procedure adw_navigation_split_view_set_collapsed(self:PAdwNavigationSplitView; collapsed:Tgboolean);cdecl;external;
function adw_navigation_split_view_get_show_content(self:PAdwNavigationSplitView):Tgboolean;cdecl;external;
procedure adw_navigation_split_view_set_show_content(self:PAdwNavigationSplitView; show_content:Tgboolean);cdecl;external;
function adw_navigation_split_view_get_min_sidebar_width(self:PAdwNavigationSplitView):Tdouble;cdecl;external;
procedure adw_navigation_split_view_set_min_sidebar_width(self:PAdwNavigationSplitView; width:Tdouble);cdecl;external;
function adw_navigation_split_view_get_max_sidebar_width(self:PAdwNavigationSplitView):Tdouble;cdecl;external;
procedure adw_navigation_split_view_set_max_sidebar_width(self:PAdwNavigationSplitView; width:Tdouble);cdecl;external;
function adw_navigation_split_view_get_sidebar_width_fraction(self:PAdwNavigationSplitView):Tdouble;cdecl;external;
procedure adw_navigation_split_view_set_sidebar_width_fraction(self:PAdwNavigationSplitView; fraction:Tdouble);cdecl;external;
function adw_navigation_split_view_get_sidebar_width_unit(self:PAdwNavigationSplitView):TAdwLengthUnit;cdecl;external;
procedure adw_navigation_split_view_set_sidebar_width_unit(self:PAdwNavigationSplitView; unit:TAdwLengthUnit);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_NAVIGATION_SPLIT_VIEW : longint; { return type might be wrong }
  begin
    ADW_TYPE_NAVIGATION_SPLIT_VIEW:=adw_navigation_split_view_get_type;
  end;


end.
