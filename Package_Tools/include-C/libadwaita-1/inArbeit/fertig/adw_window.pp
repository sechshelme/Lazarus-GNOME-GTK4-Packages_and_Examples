
unit adw_window;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_window.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_window.h
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
PAdwBreakpoint  = ^AdwBreakpoint;
PAdwDialog  = ^AdwDialog;
PAdwWindow  = ^AdwWindow;
PAdwWindowClass  = ^AdwWindowClass;
PGListModel  = ^GListModel;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2020 Alice Mikhaylenko <alicem@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-breakpoint.h"}
{$include "adw-dialog.h"}

{ was #define dname def_expr }
function ADW_TYPE_WINDOW : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AdwWindow, adw_window, ADW, WINDOW, GtkWindow) }
{< private > }
type
  PAdwWindowClass = ^TAdwWindowClass;
  TAdwWindowClass = record
      parent_class : TGtkWindowClass;
      padding : array[0..3] of Tgpointer;
    end;


function adw_window_new:PGtkWidget;cdecl;external;
function adw_window_get_content(self:PAdwWindow):PGtkWidget;cdecl;external;
procedure adw_window_set_content(self:PAdwWindow; content:PGtkWidget);cdecl;external;
procedure adw_window_add_breakpoint(self:PAdwWindow; breakpoint:PAdwBreakpoint);cdecl;external;
function adw_window_get_current_breakpoint(self:PAdwWindow):PAdwBreakpoint;cdecl;external;
function adw_window_get_dialogs(self:PAdwWindow):PGListModel;cdecl;external;
function adw_window_get_visible_dialog(self:PAdwWindow):PAdwDialog;cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_WINDOW : longint; { return type might be wrong }
  begin
    ADW_TYPE_WINDOW:=adw_window_get_type;
  end;


end.
