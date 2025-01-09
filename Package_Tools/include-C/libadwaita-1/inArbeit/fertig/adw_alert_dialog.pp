
unit adw_alert_dialog;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_alert_dialog.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_alert_dialog.h
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
PAdwAlertDialog  = ^AdwAlertDialog;
PAdwAlertDialogClass  = ^AdwAlertDialogClass;
PAdwDialog  = ^AdwDialog;
PAdwResponseAppearance  = ^AdwResponseAppearance;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-dialog.h"}
{$include "adw-enums.h"}
type
  PAdwResponseAppearance = ^TAdwResponseAppearance;
  TAdwResponseAppearance =  Longint;
  Const
    ADW_RESPONSE_DEFAULT = 0;
    ADW_RESPONSE_SUGGESTED = 1;
    ADW_RESPONSE_DESTRUCTIVE = 2;
;

{ was #define dname def_expr }
function ADW_TYPE_ALERT_DIALOG : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AdwAlertDialog, adw_alert_dialog, ADW, ALERT_DIALOG, AdwDialog) }
(* Const before type ignored *)
{< private > }
type
  PAdwAlertDialogClass = ^TAdwAlertDialogClass;
  TAdwAlertDialogClass = record
      parent_class : TAdwDialogClass;
      response : procedure (self:PAdwAlertDialog; response:Pchar);cdecl;
      padding : array[0..3] of Tgpointer;
    end;

(* Const before type ignored *)
(* Const before type ignored *)

function adw_alert_dialog_new(heading:Pchar; body:Pchar):PAdwDialog;cdecl;external;
(* Const before type ignored *)
function adw_alert_dialog_get_heading(self:PAdwAlertDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_alert_dialog_set_heading(self:PAdwAlertDialog; heading:Pchar);cdecl;external;
function adw_alert_dialog_get_heading_use_markup(self:PAdwAlertDialog):Tgboolean;cdecl;external;
procedure adw_alert_dialog_set_heading_use_markup(self:PAdwAlertDialog; use_markup:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure adw_alert_dialog_format_heading(self:PAdwAlertDialog; format:Pchar; args:array of const);cdecl;external;
procedure adw_alert_dialog_format_heading(self:PAdwAlertDialog; format:Pchar);cdecl;external;
(* Const before type ignored *)
procedure adw_alert_dialog_format_heading_markup(self:PAdwAlertDialog; format:Pchar; args:array of const);cdecl;external;
procedure adw_alert_dialog_format_heading_markup(self:PAdwAlertDialog; format:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_alert_dialog_get_body(self:PAdwAlertDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_alert_dialog_set_body(self:PAdwAlertDialog; body:Pchar);cdecl;external;
function adw_alert_dialog_get_body_use_markup(self:PAdwAlertDialog):Tgboolean;cdecl;external;
procedure adw_alert_dialog_set_body_use_markup(self:PAdwAlertDialog; use_markup:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure adw_alert_dialog_format_body(self:PAdwAlertDialog; format:Pchar; args:array of const);cdecl;external;
procedure adw_alert_dialog_format_body(self:PAdwAlertDialog; format:Pchar);cdecl;external;
(* Const before type ignored *)
procedure adw_alert_dialog_format_body_markup(self:PAdwAlertDialog; format:Pchar; args:array of const);cdecl;external;
procedure adw_alert_dialog_format_body_markup(self:PAdwAlertDialog; format:Pchar);cdecl;external;
function adw_alert_dialog_get_extra_child(self:PAdwAlertDialog):PGtkWidget;cdecl;external;
procedure adw_alert_dialog_set_extra_child(self:PAdwAlertDialog; child:PGtkWidget);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure adw_alert_dialog_add_response(self:PAdwAlertDialog; id:Pchar; _label:Pchar);cdecl;external;
(* Const before type ignored *)
procedure adw_alert_dialog_add_responses(self:PAdwAlertDialog; first_id:Pchar; args:array of const);cdecl;external;
procedure adw_alert_dialog_add_responses(self:PAdwAlertDialog; first_id:Pchar);cdecl;external;
(* Const before type ignored *)
procedure adw_alert_dialog_remove_response(self:PAdwAlertDialog; id:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function adw_alert_dialog_get_response_label(self:PAdwAlertDialog; response:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure adw_alert_dialog_set_response_label(self:PAdwAlertDialog; response:Pchar; _label:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_alert_dialog_get_response_appearance(self:PAdwAlertDialog; response:Pchar):TAdwResponseAppearance;cdecl;external;
(* Const before type ignored *)
procedure adw_alert_dialog_set_response_appearance(self:PAdwAlertDialog; response:Pchar; appearance:TAdwResponseAppearance);cdecl;external;
(* Const before type ignored *)
function adw_alert_dialog_get_response_enabled(self:PAdwAlertDialog; response:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure adw_alert_dialog_set_response_enabled(self:PAdwAlertDialog; response:Pchar; enabled:Tgboolean);cdecl;external;
(* Const before type ignored *)
function adw_alert_dialog_get_default_response(self:PAdwAlertDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_alert_dialog_set_default_response(self:PAdwAlertDialog; response:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_alert_dialog_get_close_response(self:PAdwAlertDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_alert_dialog_set_close_response(self:PAdwAlertDialog; response:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_alert_dialog_has_response(self:PAdwAlertDialog; response:Pchar):Tgboolean;cdecl;external;
procedure adw_alert_dialog_choose(self:PAdwAlertDialog; parent:PGtkWidget; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
function adw_alert_dialog_choose_finish(self:PAdwAlertDialog; result:PGAsyncResult):Pchar;cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_ALERT_DIALOG : longint; { return type might be wrong }
  begin
    ADW_TYPE_ALERT_DIALOG:=adw_alert_dialog_get_type;
  end;


end.
