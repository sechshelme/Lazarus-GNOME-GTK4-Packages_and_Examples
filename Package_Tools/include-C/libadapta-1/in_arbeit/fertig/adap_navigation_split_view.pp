
unit adap_navigation_split_view;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_navigation_split_view.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_navigation_split_view.h
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
PAdapNavigationPage  = ^AdapNavigationPage;
PAdapNavigationSplitView  = ^AdapNavigationSplitView;
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-length-unit.h"}
{$include "adap-navigation-view.h"}

{ was #define dname def_expr }
function ADAP_TYPE_NAVIGATION_SPLIT_VIEW : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapNavigationSplitView, adap_navigation_split_view, ADAP, NAVIGATION_SPLIT_VIEW, GtkWidget) }
function adap_navigation_split_view_new:PGtkWidget;cdecl;external;
function adap_navigation_split_view_get_sidebar(self:PAdapNavigationSplitView):PAdapNavigationPage;cdecl;external;
procedure adap_navigation_split_view_set_sidebar(self:PAdapNavigationSplitView; sidebar:PAdapNavigationPage);cdecl;external;
function adap_navigation_split_view_get_content(self:PAdapNavigationSplitView):PAdapNavigationPage;cdecl;external;
procedure adap_navigation_split_view_set_content(self:PAdapNavigationSplitView; content:PAdapNavigationPage);cdecl;external;
function adap_navigation_split_view_get_collapsed(self:PAdapNavigationSplitView):Tgboolean;cdecl;external;
procedure adap_navigation_split_view_set_collapsed(self:PAdapNavigationSplitView; collapsed:Tgboolean);cdecl;external;
function adap_navigation_split_view_get_show_content(self:PAdapNavigationSplitView):Tgboolean;cdecl;external;
procedure adap_navigation_split_view_set_show_content(self:PAdapNavigationSplitView; show_content:Tgboolean);cdecl;external;
function adap_navigation_split_view_get_min_sidebar_width(self:PAdapNavigationSplitView):Tdouble;cdecl;external;
procedure adap_navigation_split_view_set_min_sidebar_width(self:PAdapNavigationSplitView; width:Tdouble);cdecl;external;
function adap_navigation_split_view_get_max_sidebar_width(self:PAdapNavigationSplitView):Tdouble;cdecl;external;
procedure adap_navigation_split_view_set_max_sidebar_width(self:PAdapNavigationSplitView; width:Tdouble);cdecl;external;
function adap_navigation_split_view_get_sidebar_width_fraction(self:PAdapNavigationSplitView):Tdouble;cdecl;external;
procedure adap_navigation_split_view_set_sidebar_width_fraction(self:PAdapNavigationSplitView; fraction:Tdouble);cdecl;external;
function adap_navigation_split_view_get_sidebar_width_unit(self:PAdapNavigationSplitView):TAdapLengthUnit;cdecl;external;
procedure adap_navigation_split_view_set_sidebar_width_unit(self:PAdapNavigationSplitView; unit:TAdapLengthUnit);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_NAVIGATION_SPLIT_VIEW : longint; { return type might be wrong }
  begin
    ADAP_TYPE_NAVIGATION_SPLIT_VIEW:=adap_navigation_split_view_get_type;
  end;


end.
