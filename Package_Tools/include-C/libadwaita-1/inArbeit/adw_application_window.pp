
unit adw_application_window;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_application_window.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_application_window.h
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
PAdwApplicationWindow  = ^AdwApplicationWindow;
PAdwApplicationWindowClass  = ^AdwApplicationWindowClass;
PAdwBreakpoint  = ^AdwBreakpoint;
PAdwDialog  = ^AdwDialog;
PGListModel  = ^GListModel;
PGtkApplication  = ^GtkApplication;
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
function ADW_TYPE_APPLICATION_WINDOW : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AdwApplicationWindow, adw_application_window, ADW, APPLICATION_WINDOW, GtkApplicationWindow) }
{< private > }
type
  PAdwApplicationWindowClass = ^TAdwApplicationWindowClass;
  TAdwApplicationWindowClass = record
      parent_class : TGtkApplicationWindowClass;
      padding : array[0..3] of Tgpointer;
    end;


function adw_application_window_new(app:PGtkApplication):PGtkWidget;cdecl;external;
procedure adw_application_window_set_content(self:PAdwApplicationWindow; content:PGtkWidget);cdecl;external;
function adw_application_window_get_content(self:PAdwApplicationWindow):PGtkWidget;cdecl;external;
procedure adw_application_window_add_breakpoint(self:PAdwApplicationWindow; breakpoint:PAdwBreakpoint);cdecl;external;
function adw_application_window_get_current_breakpoint(self:PAdwApplicationWindow):PAdwBreakpoint;cdecl;external;
function adw_application_window_get_dialogs(self:PAdwApplicationWindow):PGListModel;cdecl;external;
function adw_application_window_get_visible_dialog(self:PAdwApplicationWindow):PAdwDialog;cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_APPLICATION_WINDOW : longint; { return type might be wrong }
  begin
    ADW_TYPE_APPLICATION_WINDOW:=adw_application_window_get_type;
  end;


end.
