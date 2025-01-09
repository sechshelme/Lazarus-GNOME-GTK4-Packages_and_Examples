
unit adw_message_dialog;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_message_dialog.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_message_dialog.h
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
PAdwMessageDialog  = ^AdwMessageDialog;
PAdwMessageDialogClass  = ^AdwMessageDialogClass;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-alert-dialog.h"}

{ was #define dname def_expr }
function ADW_TYPE_MESSAGE_DIALOG : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AdwMessageDialog, adw_message_dialog, ADW, MESSAGE_DIALOG, GtkWindow) }
(* Const before type ignored *)
{< private > }
type
  PAdwMessageDialogClass = ^TAdwMessageDialogClass;
  TAdwMessageDialogClass = record
      parent_class : TGtkWindowClass;
      response : procedure (self:PAdwMessageDialog; response:Pchar);cdecl;
      padding : array[0..3] of Tgpointer;
    end;

(* Const before type ignored *)
(* Const before type ignored *)

function adw_message_dialog_new(parent:PGtkWindow; heading:Pchar; body:Pchar):PGtkWidget;cdecl;external;
(* Const before type ignored *)
function adw_message_dialog_get_heading(self:PAdwMessageDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_message_dialog_set_heading(self:PAdwMessageDialog; heading:Pchar);cdecl;external;
function adw_message_dialog_get_heading_use_markup(self:PAdwMessageDialog):Tgboolean;cdecl;external;
procedure adw_message_dialog_set_heading_use_markup(self:PAdwMessageDialog; use_markup:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure adw_message_dialog_format_heading(self:PAdwMessageDialog; format:Pchar; args:array of const);cdecl;external;
procedure adw_message_dialog_format_heading(self:PAdwMessageDialog; format:Pchar);cdecl;external;
(* Const before type ignored *)
procedure adw_message_dialog_format_heading_markup(self:PAdwMessageDialog; format:Pchar; args:array of const);cdecl;external;
procedure adw_message_dialog_format_heading_markup(self:PAdwMessageDialog; format:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_message_dialog_get_body(self:PAdwMessageDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_message_dialog_set_body(self:PAdwMessageDialog; body:Pchar);cdecl;external;
function adw_message_dialog_get_body_use_markup(self:PAdwMessageDialog):Tgboolean;cdecl;external;
procedure adw_message_dialog_set_body_use_markup(self:PAdwMessageDialog; use_markup:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure adw_message_dialog_format_body(self:PAdwMessageDialog; format:Pchar; args:array of const);cdecl;external;
procedure adw_message_dialog_format_body(self:PAdwMessageDialog; format:Pchar);cdecl;external;
(* Const before type ignored *)
procedure adw_message_dialog_format_body_markup(self:PAdwMessageDialog; format:Pchar; args:array of const);cdecl;external;
procedure adw_message_dialog_format_body_markup(self:PAdwMessageDialog; format:Pchar);cdecl;external;
function adw_message_dialog_get_extra_child(self:PAdwMessageDialog):PGtkWidget;cdecl;external;
procedure adw_message_dialog_set_extra_child(self:PAdwMessageDialog; child:PGtkWidget);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure adw_message_dialog_add_response(self:PAdwMessageDialog; id:Pchar; _label:Pchar);cdecl;external;
(* Const before type ignored *)
procedure adw_message_dialog_remove_response(self:PAdwMessageDialog; id:Pchar);cdecl;external;
(* Const before type ignored *)
procedure adw_message_dialog_add_responses(self:PAdwMessageDialog; first_id:Pchar; args:array of const);cdecl;external;
procedure adw_message_dialog_add_responses(self:PAdwMessageDialog; first_id:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function adw_message_dialog_get_response_label(self:PAdwMessageDialog; response:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure adw_message_dialog_set_response_label(self:PAdwMessageDialog; response:Pchar; _label:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_message_dialog_get_response_appearance(self:PAdwMessageDialog; response:Pchar):TAdwResponseAppearance;cdecl;external;
(* Const before type ignored *)
procedure adw_message_dialog_set_response_appearance(self:PAdwMessageDialog; response:Pchar; appearance:TAdwResponseAppearance);cdecl;external;
(* Const before type ignored *)
function adw_message_dialog_get_response_enabled(self:PAdwMessageDialog; response:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure adw_message_dialog_set_response_enabled(self:PAdwMessageDialog; response:Pchar; enabled:Tgboolean);cdecl;external;
(* Const before type ignored *)
function adw_message_dialog_get_default_response(self:PAdwMessageDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_message_dialog_set_default_response(self:PAdwMessageDialog; response:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_message_dialog_get_close_response(self:PAdwMessageDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_message_dialog_set_close_response(self:PAdwMessageDialog; response:Pchar);cdecl;external;
(* Const before type ignored *)
procedure adw_message_dialog_response(self:PAdwMessageDialog; response:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_message_dialog_has_response(self:PAdwMessageDialog; response:Pchar):Tgboolean;cdecl;external;
procedure adw_message_dialog_choose(self:PAdwMessageDialog; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
function adw_message_dialog_choose_finish(self:PAdwMessageDialog; result:PGAsyncResult):Pchar;cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_MESSAGE_DIALOG : longint; { return type might be wrong }
  begin
    ADW_TYPE_MESSAGE_DIALOG:=adw_message_dialog_get_type;
  end;


end.
