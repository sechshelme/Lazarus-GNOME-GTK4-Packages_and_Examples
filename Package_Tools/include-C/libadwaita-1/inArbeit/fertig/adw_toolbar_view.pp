
unit adw_toolbar_view;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_toolbar_view.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_toolbar_view.h
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
PAdwToolbarStyle  = ^AdwToolbarStyle;
PAdwToolbarView  = ^AdwToolbarView;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-enums.h"}

{ was #define dname def_expr }
function ADW_TYPE_TOOLBAR_VIEW : longint; { return type might be wrong }

type
  PAdwToolbarStyle = ^TAdwToolbarStyle;
  TAdwToolbarStyle =  Longint;
  Const
    ADW_TOOLBAR_FLAT = 0;
    ADW_TOOLBAR_RAISED = 1;
    ADW_TOOLBAR_RAISED_BORDER = 2;
;
{G_DECLARE_FINAL_TYPE (AdwToolbarView, adw_toolbar_view, ADW, TOOLBAR_VIEW, GtkWidget) }

function adw_toolbar_view_new:PGtkWidget;cdecl;external;
function adw_toolbar_view_get_content(self:PAdwToolbarView):PGtkWidget;cdecl;external;
procedure adw_toolbar_view_set_content(self:PAdwToolbarView; content:PGtkWidget);cdecl;external;
procedure adw_toolbar_view_add_top_bar(self:PAdwToolbarView; widget:PGtkWidget);cdecl;external;
procedure adw_toolbar_view_add_bottom_bar(self:PAdwToolbarView; widget:PGtkWidget);cdecl;external;
procedure adw_toolbar_view_remove(self:PAdwToolbarView; widget:PGtkWidget);cdecl;external;
function adw_toolbar_view_get_top_bar_style(self:PAdwToolbarView):TAdwToolbarStyle;cdecl;external;
procedure adw_toolbar_view_set_top_bar_style(self:PAdwToolbarView; style:TAdwToolbarStyle);cdecl;external;
function adw_toolbar_view_get_bottom_bar_style(self:PAdwToolbarView):TAdwToolbarStyle;cdecl;external;
procedure adw_toolbar_view_set_bottom_bar_style(self:PAdwToolbarView; style:TAdwToolbarStyle);cdecl;external;
function adw_toolbar_view_get_reveal_top_bars(self:PAdwToolbarView):Tgboolean;cdecl;external;
procedure adw_toolbar_view_set_reveal_top_bars(self:PAdwToolbarView; reveal:Tgboolean);cdecl;external;
function adw_toolbar_view_get_reveal_bottom_bars(self:PAdwToolbarView):Tgboolean;cdecl;external;
procedure adw_toolbar_view_set_reveal_bottom_bars(self:PAdwToolbarView; reveal:Tgboolean);cdecl;external;
function adw_toolbar_view_get_extend_content_to_top_edge(self:PAdwToolbarView):Tgboolean;cdecl;external;
procedure adw_toolbar_view_set_extend_content_to_top_edge(self:PAdwToolbarView; extend:Tgboolean);cdecl;external;
function adw_toolbar_view_get_extend_content_to_bottom_edge(self:PAdwToolbarView):Tgboolean;cdecl;external;
procedure adw_toolbar_view_set_extend_content_to_bottom_edge(self:PAdwToolbarView; extend:Tgboolean);cdecl;external;
function adw_toolbar_view_get_top_bar_height(self:PAdwToolbarView):longint;cdecl;external;
function adw_toolbar_view_get_bottom_bar_height(self:PAdwToolbarView):longint;cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_TOOLBAR_VIEW : longint; { return type might be wrong }
  begin
    ADW_TYPE_TOOLBAR_VIEW:=adw_toolbar_view_get_type;
  end;


end.
