
unit adap_alert_dialog;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_alert_dialog.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_alert_dialog.h
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
PAdapAlertDialog  = ^AdapAlertDialog;
PAdapAlertDialogClass  = ^AdapAlertDialogClass;
PAdapDialog  = ^AdapDialog;
PAdapResponseAppearance  = ^AdapResponseAppearance;
Pchar  = ^char;
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2022 Purism SPC
 * Copyright (C) 2024 GNOME Foundation Inc.
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
{$include "adap-dialog.h"}
{$include "adap-enums.h"}
type
  PAdapResponseAppearance = ^TAdapResponseAppearance;
  TAdapResponseAppearance =  Longint;
  Const
    ADAP_RESPONSE_DEFAULT = 0;
    ADAP_RESPONSE_SUGGESTED = 1;
    ADAP_RESPONSE_DESTRUCTIVE = 2;
;

{ was #define dname def_expr }
function ADAP_TYPE_ALERT_DIALOG : longint; { return type might be wrong }

{////////G_DECLARE_DERIVABLE_TYPE (AdapAlertDialog, adap_alert_dialog, ADAP, ALERT_DIALOG, AdapDialog) }
(* Const before type ignored *)
{< private > }
type
  PAdapAlertDialogClass = ^TAdapAlertDialogClass;
  TAdapAlertDialogClass = record
      parent_class : TAdapDialogClass;
      response : procedure (self:PAdapAlertDialog; response:Pchar);cdecl;
      padding : array[0..3] of Tgpointer;
    end;

(* Const before type ignored *)
(* Const before type ignored *)

function adap_alert_dialog_new(heading:Pchar; body:Pchar):PAdapDialog;cdecl;external;
(* Const before type ignored *)
function adap_alert_dialog_get_heading(self:PAdapAlertDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_alert_dialog_set_heading(self:PAdapAlertDialog; heading:Pchar);cdecl;external;
function adap_alert_dialog_get_heading_use_markup(self:PAdapAlertDialog):Tgboolean;cdecl;external;
procedure adap_alert_dialog_set_heading_use_markup(self:PAdapAlertDialog; use_markup:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure adap_alert_dialog_format_heading(self:PAdapAlertDialog; format:Pchar; args:array of const);cdecl;external;
procedure adap_alert_dialog_format_heading(self:PAdapAlertDialog; format:Pchar);cdecl;external;
(* Const before type ignored *)
procedure adap_alert_dialog_format_heading_markup(self:PAdapAlertDialog; format:Pchar; args:array of const);cdecl;external;
procedure adap_alert_dialog_format_heading_markup(self:PAdapAlertDialog; format:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_alert_dialog_get_body(self:PAdapAlertDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_alert_dialog_set_body(self:PAdapAlertDialog; body:Pchar);cdecl;external;
function adap_alert_dialog_get_body_use_markup(self:PAdapAlertDialog):Tgboolean;cdecl;external;
procedure adap_alert_dialog_set_body_use_markup(self:PAdapAlertDialog; use_markup:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure adap_alert_dialog_format_body(self:PAdapAlertDialog; format:Pchar; args:array of const);cdecl;external;
procedure adap_alert_dialog_format_body(self:PAdapAlertDialog; format:Pchar);cdecl;external;
(* Const before type ignored *)
procedure adap_alert_dialog_format_body_markup(self:PAdapAlertDialog; format:Pchar; args:array of const);cdecl;external;
procedure adap_alert_dialog_format_body_markup(self:PAdapAlertDialog; format:Pchar);cdecl;external;
function adap_alert_dialog_get_extra_child(self:PAdapAlertDialog):PGtkWidget;cdecl;external;
procedure adap_alert_dialog_set_extra_child(self:PAdapAlertDialog; child:PGtkWidget);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure adap_alert_dialog_add_response(self:PAdapAlertDialog; id:Pchar; _label:Pchar);cdecl;external;
(* Const before type ignored *)
procedure adap_alert_dialog_add_responses(self:PAdapAlertDialog; first_id:Pchar; args:array of const);cdecl;external;
procedure adap_alert_dialog_add_responses(self:PAdapAlertDialog; first_id:Pchar);cdecl;external;
(* Const before type ignored *)
procedure adap_alert_dialog_remove_response(self:PAdapAlertDialog; id:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function adap_alert_dialog_get_response_label(self:PAdapAlertDialog; response:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure adap_alert_dialog_set_response_label(self:PAdapAlertDialog; response:Pchar; _label:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_alert_dialog_get_response_appearance(self:PAdapAlertDialog; response:Pchar):TAdapResponseAppearance;cdecl;external;
(* Const before type ignored *)
procedure adap_alert_dialog_set_response_appearance(self:PAdapAlertDialog; response:Pchar; appearance:TAdapResponseAppearance);cdecl;external;
(* Const before type ignored *)
function adap_alert_dialog_get_response_enabled(self:PAdapAlertDialog; response:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure adap_alert_dialog_set_response_enabled(self:PAdapAlertDialog; response:Pchar; enabled:Tgboolean);cdecl;external;
(* Const before type ignored *)
function adap_alert_dialog_get_default_response(self:PAdapAlertDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_alert_dialog_set_default_response(self:PAdapAlertDialog; response:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_alert_dialog_get_close_response(self:PAdapAlertDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_alert_dialog_set_close_response(self:PAdapAlertDialog; response:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_alert_dialog_has_response(self:PAdapAlertDialog; response:Pchar):Tgboolean;cdecl;external;
procedure adap_alert_dialog_choose(self:PAdapAlertDialog; parent:PGtkWidget; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
function adap_alert_dialog_choose_finish(self:PAdapAlertDialog; result:PGAsyncResult):Pchar;cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_ALERT_DIALOG : longint; { return type might be wrong }
  begin
    ADAP_TYPE_ALERT_DIALOG:=adap_alert_dialog_get_type;
  end;


end.
