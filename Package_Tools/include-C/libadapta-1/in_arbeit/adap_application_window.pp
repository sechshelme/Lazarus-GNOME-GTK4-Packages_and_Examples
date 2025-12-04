
unit adap_application_window;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_application_window.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_application_window.h
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
PAdapApplicationWindow  = ^AdapApplicationWindow;
PAdapApplicationWindowClass  = ^AdapApplicationWindowClass;
PAdapBreakpoint  = ^AdapBreakpoint;
PAdapDialog  = ^AdapDialog;
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-breakpoint.h"}
{$include "adap-dialog.h"}

{ was #define dname def_expr }
function ADAP_TYPE_APPLICATION_WINDOW : longint; { return type might be wrong }

{////////G_DECLARE_DERIVABLE_TYPE (AdapApplicationWindow, adap_application_window, ADAP, APPLICATION_WINDOW, GtkApplicationWindow) }
{< private > }
type
  PAdapApplicationWindowClass = ^TAdapApplicationWindowClass;
  TAdapApplicationWindowClass = record
      parent_class : TGtkApplicationWindowClass;
      padding : array[0..3] of Tgpointer;
    end;


function adap_application_window_new(app:PGtkApplication):PGtkWidget;cdecl;external;
procedure adap_application_window_set_content(self:PAdapApplicationWindow; content:PGtkWidget);cdecl;external;
function adap_application_window_get_content(self:PAdapApplicationWindow):PGtkWidget;cdecl;external;
procedure adap_application_window_add_breakpoint(self:PAdapApplicationWindow; breakpoint:PAdapBreakpoint);cdecl;external;
function adap_application_window_get_current_breakpoint(self:PAdapApplicationWindow):PAdapBreakpoint;cdecl;external;
function adap_application_window_get_dialogs(self:PAdapApplicationWindow):PGListModel;cdecl;external;
function adap_application_window_get_visible_dialog(self:PAdapApplicationWindow):PAdapDialog;cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_APPLICATION_WINDOW : longint; { return type might be wrong }
  begin
    ADAP_TYPE_APPLICATION_WINDOW:=adap_application_window_get_type;
  end;


end.
