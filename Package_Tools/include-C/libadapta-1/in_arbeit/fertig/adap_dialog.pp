
unit adap_dialog;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_dialog.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_dialog.h
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
PAdapDialogClass  = ^AdapDialogClass;
PAdapDialogPresentationMode  = ^AdapDialogPresentationMode;
Pchar  = ^char;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2023-2024 GNOME Foundation Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * Author: Alice Mikhaylenko <alicem@gnome.org>
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-breakpoint.h"}
{$include "adap-enums.h"}
type
  PAdapDialogPresentationMode = ^TAdapDialogPresentationMode;
  TAdapDialogPresentationMode =  Longint;
  Const
    ADAP_DIALOG_AUTO = 0;
    ADAP_DIALOG_FLOATING = 1;
    ADAP_DIALOG_BOTTOM_SHEET = 2;
;

{ was #define dname def_expr }
function ADAP_TYPE_DIALOG : longint; { return type might be wrong }

{////////G_DECLARE_DERIVABLE_TYPE (AdapDialog, adap_dialog, ADAP, DIALOG, GtkWidget) }
{< private > }
type
  PAdapDialogClass = ^TAdapDialogClass;
  TAdapDialogClass = record
      parent_class : TGtkWidgetClass;
      close_attempt : procedure (dialog:PAdapDialog);cdecl;
      closed : procedure (dialog:PAdapDialog);cdecl;
      padding : array[0..3] of Tgpointer;
    end;


function adap_dialog_new:PAdapDialog;cdecl;external;
function adap_dialog_get_child(self:PAdapDialog):PGtkWidget;cdecl;external;
procedure adap_dialog_set_child(self:PAdapDialog; child:PGtkWidget);cdecl;external;
(* Const before type ignored *)
function adap_dialog_get_title(self:PAdapDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_dialog_set_title(self:PAdapDialog; title:Pchar);cdecl;external;
function adap_dialog_get_can_close(self:PAdapDialog):Tgboolean;cdecl;external;
procedure adap_dialog_set_can_close(self:PAdapDialog; can_close:Tgboolean);cdecl;external;
function adap_dialog_get_content_width(self:PAdapDialog):longint;cdecl;external;
procedure adap_dialog_set_content_width(self:PAdapDialog; content_width:longint);cdecl;external;
function adap_dialog_get_content_height(self:PAdapDialog):longint;cdecl;external;
procedure adap_dialog_set_content_height(self:PAdapDialog; content_height:longint);cdecl;external;
function adap_dialog_get_follows_content_size(self:PAdapDialog):Tgboolean;cdecl;external;
procedure adap_dialog_set_follows_content_size(self:PAdapDialog; follows_content_size:Tgboolean);cdecl;external;
function adap_dialog_get_presentation_mode(self:PAdapDialog):TAdapDialogPresentationMode;cdecl;external;
procedure adap_dialog_set_presentation_mode(self:PAdapDialog; presentation_mode:TAdapDialogPresentationMode);cdecl;external;
function adap_dialog_get_focus(self:PAdapDialog):PGtkWidget;cdecl;external;
procedure adap_dialog_set_focus(self:PAdapDialog; focus:PGtkWidget);cdecl;external;
function adap_dialog_get_default_widget(self:PAdapDialog):PGtkWidget;cdecl;external;
procedure adap_dialog_set_default_widget(self:PAdapDialog; default_widget:PGtkWidget);cdecl;external;
function adap_dialog_close(self:PAdapDialog):Tgboolean;cdecl;external;
procedure adap_dialog_force_close(self:PAdapDialog);cdecl;external;
procedure adap_dialog_add_breakpoint(self:PAdapDialog; breakpoint:PAdapBreakpoint);cdecl;external;
function adap_dialog_get_current_breakpoint(self:PAdapDialog):PAdapBreakpoint;cdecl;external;
procedure adap_dialog_present(self:PAdapDialog; parent:PGtkWidget);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_DIALOG : longint; { return type might be wrong }
  begin
    ADAP_TYPE_DIALOG:=adap_dialog_get_type;
  end;


end.
