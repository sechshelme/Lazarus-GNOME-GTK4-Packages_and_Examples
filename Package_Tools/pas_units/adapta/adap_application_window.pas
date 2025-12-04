unit adap_application_window;

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

{////////G_DECLARE_DERIVABLE_TYPE (AdapApplicationWindow, adap_application_window, ADAP, APPLICATION_WINDOW, GtkApplicationWindow) }
{< private > }
type
  PAdapApplicationWindowClass = ^TAdapApplicationWindowClass;
  TAdapApplicationWindowClass = record
      parent_class : TGtkApplicationWindowClass;
      padding : array[0..3] of Tgpointer;
    end;


function adap_application_window_new(app:PGtkApplication):PGtkWidget;cdecl;external libadapta;
procedure adap_application_window_set_content(self:PAdapApplicationWindow; content:PGtkWidget);cdecl;external libadapta;
function adap_application_window_get_content(self:PAdapApplicationWindow):PGtkWidget;cdecl;external libadapta;
procedure adap_application_window_add_breakpoint(self:PAdapApplicationWindow; breakpoint:PAdapBreakpoint);cdecl;external libadapta;
function adap_application_window_get_current_breakpoint(self:PAdapApplicationWindow):PAdapBreakpoint;cdecl;external libadapta;
function adap_application_window_get_dialogs(self:PAdapApplicationWindow):PGListModel;cdecl;external libadapta;
function adap_application_window_get_visible_dialog(self:PAdapApplicationWindow):PAdapDialog;cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:01:02 ===

function ADAP_TYPE_APPLICATION_WINDOW: TGType;
function ADAP_APPLICATION_WINDOW(obj: Pointer): PAdapApplicationWindow;
function ADAP_IS_APPLICATION_WINDOW(obj: Pointer): Tgboolean;
function ADAP_APPLICATION_WINDOW_CLASS(klass: Pointer): PAdapApplicationWindowClass;
function ADAP_IS_APPLICATION_WINDOW_CLASS(klass: Pointer): Tgboolean;
function ADAP_APPLICATION_WINDOW_GET_CLASS(obj: Pointer): PAdapApplicationWindowClass;

implementation

function ADAP_TYPE_APPLICATION_WINDOW: TGType;
begin
  Result := adap_application_window_get_type;
end;

function ADAP_APPLICATION_WINDOW(obj: Pointer): PAdapApplicationWindow;
begin
  Result := PAdapApplicationWindow(g_type_check_instance_cast(obj, ADAP_TYPE_APPLICATION_WINDOW));
end;

function ADAP_IS_APPLICATION_WINDOW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_APPLICATION_WINDOW);
end;

function ADAP_APPLICATION_WINDOW_CLASS(klass: Pointer): PAdapApplicationWindowClass;
begin
  Result := PAdapApplicationWindowClass(g_type_check_class_cast(klass, ADAP_TYPE_APPLICATION_WINDOW));
end;

function ADAP_IS_APPLICATION_WINDOW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_APPLICATION_WINDOW);
end;

function ADAP_APPLICATION_WINDOW_GET_CLASS(obj: Pointer): PAdapApplicationWindowClass;
begin
  Result := PAdapApplicationWindowClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAdapApplicationWindow = record
    parent_instance: TGtkApplicationWindow;
  end;
  PAdapApplicationWindow = ^TAdapApplicationWindow;

  TAdapApplicationWindowClass = record
  end;
  PAdapApplicationWindowClass = ^TAdapApplicationWindowClass;

function adap_application_window_get_type: TGType; cdecl; external libgxxxxxxx;



end.
