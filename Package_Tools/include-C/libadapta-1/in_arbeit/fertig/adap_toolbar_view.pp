
unit adap_toolbar_view;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_toolbar_view.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_toolbar_view.h
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
PAdapToolbarStyle  = ^AdapToolbarStyle;
PAdapToolbarView  = ^AdapToolbarView;
PGtkWidget  = ^GtkWidget;
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

{ was #define dname def_expr }
function ADAP_TYPE_TOOLBAR_VIEW : longint; { return type might be wrong }

type
  PAdapToolbarStyle = ^TAdapToolbarStyle;
  TAdapToolbarStyle =  Longint;
  Const
    ADAP_TOOLBAR_FLAT = 0;
    ADAP_TOOLBAR_RAISED = 1;
    ADAP_TOOLBAR_RAISED_BORDER = 2;
;
{G_DECLARE_FINAL_TYPE (AdapToolbarView, adap_toolbar_view, ADAP, TOOLBAR_VIEW, GtkWidget) }

function adap_toolbar_view_new:PGtkWidget;cdecl;external;
function adap_toolbar_view_get_content(self:PAdapToolbarView):PGtkWidget;cdecl;external;
procedure adap_toolbar_view_set_content(self:PAdapToolbarView; content:PGtkWidget);cdecl;external;
procedure adap_toolbar_view_add_top_bar(self:PAdapToolbarView; widget:PGtkWidget);cdecl;external;
procedure adap_toolbar_view_add_bottom_bar(self:PAdapToolbarView; widget:PGtkWidget);cdecl;external;
procedure adap_toolbar_view_remove(self:PAdapToolbarView; widget:PGtkWidget);cdecl;external;
function adap_toolbar_view_get_top_bar_style(self:PAdapToolbarView):TAdapToolbarStyle;cdecl;external;
procedure adap_toolbar_view_set_top_bar_style(self:PAdapToolbarView; style:TAdapToolbarStyle);cdecl;external;
function adap_toolbar_view_get_bottom_bar_style(self:PAdapToolbarView):TAdapToolbarStyle;cdecl;external;
procedure adap_toolbar_view_set_bottom_bar_style(self:PAdapToolbarView; style:TAdapToolbarStyle);cdecl;external;
function adap_toolbar_view_get_reveal_top_bars(self:PAdapToolbarView):Tgboolean;cdecl;external;
procedure adap_toolbar_view_set_reveal_top_bars(self:PAdapToolbarView; reveal:Tgboolean);cdecl;external;
function adap_toolbar_view_get_reveal_bottom_bars(self:PAdapToolbarView):Tgboolean;cdecl;external;
procedure adap_toolbar_view_set_reveal_bottom_bars(self:PAdapToolbarView; reveal:Tgboolean);cdecl;external;
function adap_toolbar_view_get_extend_content_to_top_edge(self:PAdapToolbarView):Tgboolean;cdecl;external;
procedure adap_toolbar_view_set_extend_content_to_top_edge(self:PAdapToolbarView; extend:Tgboolean);cdecl;external;
function adap_toolbar_view_get_extend_content_to_bottom_edge(self:PAdapToolbarView):Tgboolean;cdecl;external;
procedure adap_toolbar_view_set_extend_content_to_bottom_edge(self:PAdapToolbarView; extend:Tgboolean);cdecl;external;
function adap_toolbar_view_get_top_bar_height(self:PAdapToolbarView):longint;cdecl;external;
function adap_toolbar_view_get_bottom_bar_height(self:PAdapToolbarView):longint;cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_TOOLBAR_VIEW : longint; { return type might be wrong }
  begin
    ADAP_TYPE_TOOLBAR_VIEW:=adap_toolbar_view_get_type;
  end;


end.
