
unit adw_toast;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_toast.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_toast.h
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
PAdwToast  = ^AdwToast;
PAdwToastPriority  = ^AdwToastPriority;
Pchar  = ^char;
PGtkWidget  = ^GtkWidget;
PGVariant  = ^GVariant;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Maximiliano Sandoval <msandova@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-enums.h"}
type
  PAdwToastPriority = ^TAdwToastPriority;
  TAdwToastPriority =  Longint;
  Const
    ADW_TOAST_PRIORITY_NORMAL = 0;
    ADW_TOAST_PRIORITY_HIGH = 1;
;

{ was #define dname def_expr }
function ADW_TYPE_TOAST : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwToast, adw_toast, ADW, TOAST, GObject) }
(* Const before type ignored *)
function adw_toast_new(title:Pchar):PAdwToast;cdecl;external;
(* Const before type ignored *)
function adw_toast_new_format(format:Pchar; args:array of const):PAdwToast;cdecl;external;
function adw_toast_new_format(format:Pchar):PAdwToast;cdecl;external;
(* Const before type ignored *)
function adw_toast_get_title(self:PAdwToast):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_toast_set_title(self:PAdwToast; title:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_toast_get_button_label(self:PAdwToast):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_toast_set_button_label(self:PAdwToast; button_label:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_toast_get_action_name(self:PAdwToast):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_toast_set_action_name(self:PAdwToast; action_name:Pchar);cdecl;external;
function adw_toast_get_action_target_value(self:PAdwToast):PGVariant;cdecl;external;
procedure adw_toast_set_action_target_value(self:PAdwToast; action_target:PGVariant);cdecl;external;
(* Const before type ignored *)
procedure adw_toast_set_action_target(self:PAdwToast; format_string:Pchar; args:array of const);cdecl;external;
procedure adw_toast_set_action_target(self:PAdwToast; format_string:Pchar);cdecl;external;
(* Const before type ignored *)
procedure adw_toast_set_detailed_action_name(self:PAdwToast; detailed_action_name:Pchar);cdecl;external;
function adw_toast_get_priority(self:PAdwToast):TAdwToastPriority;cdecl;external;
procedure adw_toast_set_priority(self:PAdwToast; priority:TAdwToastPriority);cdecl;external;
function adw_toast_get_timeout(self:PAdwToast):Tguint;cdecl;external;
procedure adw_toast_set_timeout(self:PAdwToast; timeout:Tguint);cdecl;external;
function adw_toast_get_custom_title(self:PAdwToast):PGtkWidget;cdecl;external;
procedure adw_toast_set_custom_title(self:PAdwToast; widget:PGtkWidget);cdecl;external;
function adw_toast_get_use_markup(self:PAdwToast):Tgboolean;cdecl;external;
procedure adw_toast_set_use_markup(self:PAdwToast; use_markup:Tgboolean);cdecl;external;
procedure adw_toast_dismiss(self:PAdwToast);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_TOAST : longint; { return type might be wrong }
  begin
    ADW_TYPE_TOAST:=adw_toast_get_type;
  end;


end.
