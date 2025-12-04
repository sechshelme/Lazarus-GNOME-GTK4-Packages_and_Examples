
unit adap_message_dialog;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_message_dialog.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_message_dialog.h
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
PAdapMessageDialog  = ^AdapMessageDialog;
PAdapMessageDialogClass  = ^AdapMessageDialogClass;
Pchar  = ^char;
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGtkWidget  = ^GtkWidget;
PGtkWindow  = ^GtkWindow;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2022 Purism SPC
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
{$include "adap-alert-dialog.h"}

{ was #define dname def_expr }
function ADAP_TYPE_MESSAGE_DIALOG : longint; { return type might be wrong }

{////////G_DECLARE_DERIVABLE_TYPE (AdapMessageDialog, adap_message_dialog, ADAP, MESSAGE_DIALOG, GtkWindow) }
(* Const before type ignored *)
{< private > }
type
  PAdapMessageDialogClass = ^TAdapMessageDialogClass;
  TAdapMessageDialogClass = record
      parent_class : TGtkWindowClass;
      response : procedure (self:PAdapMessageDialog; response:Pchar);cdecl;
      padding : array[0..3] of Tgpointer;
    end;

(* Const before type ignored *)
(* Const before type ignored *)

function adap_message_dialog_new(parent:PGtkWindow; heading:Pchar; body:Pchar):PGtkWidget;cdecl;external;
(* Const before type ignored *)
function adap_message_dialog_get_heading(self:PAdapMessageDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_message_dialog_set_heading(self:PAdapMessageDialog; heading:Pchar);cdecl;external;
function adap_message_dialog_get_heading_use_markup(self:PAdapMessageDialog):Tgboolean;cdecl;external;
procedure adap_message_dialog_set_heading_use_markup(self:PAdapMessageDialog; use_markup:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure adap_message_dialog_format_heading(self:PAdapMessageDialog; format:Pchar; args:array of const);cdecl;external;
procedure adap_message_dialog_format_heading(self:PAdapMessageDialog; format:Pchar);cdecl;external;
(* Const before type ignored *)
procedure adap_message_dialog_format_heading_markup(self:PAdapMessageDialog; format:Pchar; args:array of const);cdecl;external;
procedure adap_message_dialog_format_heading_markup(self:PAdapMessageDialog; format:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_message_dialog_get_body(self:PAdapMessageDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_message_dialog_set_body(self:PAdapMessageDialog; body:Pchar);cdecl;external;
function adap_message_dialog_get_body_use_markup(self:PAdapMessageDialog):Tgboolean;cdecl;external;
procedure adap_message_dialog_set_body_use_markup(self:PAdapMessageDialog; use_markup:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure adap_message_dialog_format_body(self:PAdapMessageDialog; format:Pchar; args:array of const);cdecl;external;
procedure adap_message_dialog_format_body(self:PAdapMessageDialog; format:Pchar);cdecl;external;
(* Const before type ignored *)
procedure adap_message_dialog_format_body_markup(self:PAdapMessageDialog; format:Pchar; args:array of const);cdecl;external;
procedure adap_message_dialog_format_body_markup(self:PAdapMessageDialog; format:Pchar);cdecl;external;
function adap_message_dialog_get_extra_child(self:PAdapMessageDialog):PGtkWidget;cdecl;external;
procedure adap_message_dialog_set_extra_child(self:PAdapMessageDialog; child:PGtkWidget);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure adap_message_dialog_add_response(self:PAdapMessageDialog; id:Pchar; _label:Pchar);cdecl;external;
(* Const before type ignored *)
procedure adap_message_dialog_remove_response(self:PAdapMessageDialog; id:Pchar);cdecl;external;
(* Const before type ignored *)
procedure adap_message_dialog_add_responses(self:PAdapMessageDialog; first_id:Pchar; args:array of const);cdecl;external;
procedure adap_message_dialog_add_responses(self:PAdapMessageDialog; first_id:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function adap_message_dialog_get_response_label(self:PAdapMessageDialog; response:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure adap_message_dialog_set_response_label(self:PAdapMessageDialog; response:Pchar; _label:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_message_dialog_get_response_appearance(self:PAdapMessageDialog; response:Pchar):TAdapResponseAppearance;cdecl;external;
(* Const before type ignored *)
procedure adap_message_dialog_set_response_appearance(self:PAdapMessageDialog; response:Pchar; appearance:TAdapResponseAppearance);cdecl;external;
(* Const before type ignored *)
function adap_message_dialog_get_response_enabled(self:PAdapMessageDialog; response:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure adap_message_dialog_set_response_enabled(self:PAdapMessageDialog; response:Pchar; enabled:Tgboolean);cdecl;external;
(* Const before type ignored *)
function adap_message_dialog_get_default_response(self:PAdapMessageDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_message_dialog_set_default_response(self:PAdapMessageDialog; response:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_message_dialog_get_close_response(self:PAdapMessageDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_message_dialog_set_close_response(self:PAdapMessageDialog; response:Pchar);cdecl;external;
(* Const before type ignored *)
procedure adap_message_dialog_response(self:PAdapMessageDialog; response:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_message_dialog_has_response(self:PAdapMessageDialog; response:Pchar):Tgboolean;cdecl;external;
procedure adap_message_dialog_choose(self:PAdapMessageDialog; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
function adap_message_dialog_choose_finish(self:PAdapMessageDialog; result:PGAsyncResult):Pchar;cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_MESSAGE_DIALOG : longint; { return type might be wrong }
  begin
    ADAP_TYPE_MESSAGE_DIALOG:=adap_message_dialog_get_type;
  end;


end.
