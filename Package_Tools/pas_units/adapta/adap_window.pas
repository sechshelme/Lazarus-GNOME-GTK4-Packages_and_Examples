unit adap_window;

interface

uses
  fp_adapta;

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

{////////G_DECLARE_DERIVABLE_TYPE (AdapWindow, adap_window, ADAP, WINDOW, GtkWindow) }
{< private > }
type
  PAdapWindowClass = ^TAdapWindowClass;
  TAdapWindowClass = record
      parent_class : TGtkWindowClass;
      padding : array[0..3] of Tgpointer;
    end;


function adap_window_new:PGtkWidget;cdecl;external libadapta;
function adap_window_get_content(self:PAdapWindow):PGtkWidget;cdecl;external libadapta;
procedure adap_window_set_content(self:PAdapWindow; content:PGtkWidget);cdecl;external libadapta;
procedure adap_window_add_breakpoint(self:PAdapWindow; breakpoint:PAdapBreakpoint);cdecl;external libadapta;
function adap_window_get_current_breakpoint(self:PAdapWindow):PAdapBreakpoint;cdecl;external libadapta;
function adap_window_get_dialogs(self:PAdapWindow):PGListModel;cdecl;external libadapta;
function adap_window_get_visible_dialog(self:PAdapWindow):PAdapDialog;cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:27:20 ===

function ADAP_TYPE_WINDOW: TGType;
function ADAP_WINDOW(obj: Pointer): PAdapWindow;
function ADAP_IS_WINDOW(obj: Pointer): Tgboolean;
function ADAP_WINDOW_CLASS(klass: Pointer): PAdapWindowClass;
function ADAP_IS_WINDOW_CLASS(klass: Pointer): Tgboolean;
function ADAP_WINDOW_GET_CLASS(obj: Pointer): PAdapWindowClass;

implementation

function ADAP_TYPE_WINDOW: TGType;
begin
  Result := adap_window_get_type;
end;

function ADAP_WINDOW(obj: Pointer): PAdapWindow;
begin
  Result := PAdapWindow(g_type_check_instance_cast(obj, ADAP_TYPE_WINDOW));
end;

function ADAP_IS_WINDOW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_WINDOW);
end;

function ADAP_WINDOW_CLASS(klass: Pointer): PAdapWindowClass;
begin
  Result := PAdapWindowClass(g_type_check_class_cast(klass, ADAP_TYPE_WINDOW));
end;

function ADAP_IS_WINDOW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_WINDOW);
end;

function ADAP_WINDOW_GET_CLASS(obj: Pointer): PAdapWindowClass;
begin
  Result := PAdapWindowClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAdapWindow = record
    parent_instance: TGtkWindow;
  end;
  PAdapWindow = ^TAdapWindow;

  TAdapWindowClass = record
  end;
  PAdapWindowClass = ^TAdapWindowClass;

function adap_window_get_type: TGType; cdecl; external libgxxxxxxx;



end.
