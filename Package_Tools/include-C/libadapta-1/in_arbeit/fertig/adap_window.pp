
unit adap_window;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_window.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_window.h
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
PAdapBreakpoint  = ^AdapBreakpoint;
PAdapDialog  = ^AdapDialog;
PAdapWindow  = ^AdapWindow;
PAdapWindowClass  = ^AdapWindowClass;
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-breakpoint.h"}
{$include "adap-dialog.h"}

{ was #define dname def_expr }
function ADAP_TYPE_WINDOW : longint; { return type might be wrong }

{////////G_DECLARE_DERIVABLE_TYPE (AdapWindow, adap_window, ADAP, WINDOW, GtkWindow) }
{< private > }
type
  PAdapWindowClass = ^TAdapWindowClass;
  TAdapWindowClass = record
      parent_class : TGtkWindowClass;
      padding : array[0..3] of Tgpointer;
    end;


function adap_window_new:PGtkWidget;cdecl;external;
function adap_window_get_content(self:PAdapWindow):PGtkWidget;cdecl;external;
procedure adap_window_set_content(self:PAdapWindow; content:PGtkWidget);cdecl;external;
procedure adap_window_add_breakpoint(self:PAdapWindow; breakpoint:PAdapBreakpoint);cdecl;external;
function adap_window_get_current_breakpoint(self:PAdapWindow):PAdapBreakpoint;cdecl;external;
function adap_window_get_dialogs(self:PAdapWindow):PGListModel;cdecl;external;
function adap_window_get_visible_dialog(self:PAdapWindow):PAdapDialog;cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_WINDOW : longint; { return type might be wrong }
  begin
    ADAP_TYPE_WINDOW:=adap_window_get_type;
  end;


end.
