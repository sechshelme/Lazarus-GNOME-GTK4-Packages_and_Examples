
unit adap_toast;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_toast.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_toast.h
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
PAdapToast  = ^AdapToast;
PAdapToastPriority  = ^AdapToastPriority;
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-enums.h"}
type
  PAdapToastPriority = ^TAdapToastPriority;
  TAdapToastPriority =  Longint;
  Const
    ADAP_TOAST_PRIORITY_NORMAL = 0;
    ADAP_TOAST_PRIORITY_HIGH = 1;
;

{ was #define dname def_expr }
function ADAP_TYPE_TOAST : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapToast, adap_toast, ADAP, TOAST, GObject) }
(* Const before type ignored *)
function adap_toast_new(title:Pchar):PAdapToast;cdecl;external;
(* Const before type ignored *)
function adap_toast_new_format(format:Pchar; args:array of const):PAdapToast;cdecl;external;
function adap_toast_new_format(format:Pchar):PAdapToast;cdecl;external;
(* Const before type ignored *)
function adap_toast_get_title(self:PAdapToast):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_toast_set_title(self:PAdapToast; title:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_toast_get_button_label(self:PAdapToast):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_toast_set_button_label(self:PAdapToast; button_label:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_toast_get_action_name(self:PAdapToast):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_toast_set_action_name(self:PAdapToast; action_name:Pchar);cdecl;external;
function adap_toast_get_action_target_value(self:PAdapToast):PGVariant;cdecl;external;
procedure adap_toast_set_action_target_value(self:PAdapToast; action_target:PGVariant);cdecl;external;
(* Const before type ignored *)
procedure adap_toast_set_action_target(self:PAdapToast; format_string:Pchar; args:array of const);cdecl;external;
procedure adap_toast_set_action_target(self:PAdapToast; format_string:Pchar);cdecl;external;
(* Const before type ignored *)
procedure adap_toast_set_detailed_action_name(self:PAdapToast; detailed_action_name:Pchar);cdecl;external;
function adap_toast_get_priority(self:PAdapToast):TAdapToastPriority;cdecl;external;
procedure adap_toast_set_priority(self:PAdapToast; priority:TAdapToastPriority);cdecl;external;
function adap_toast_get_timeout(self:PAdapToast):Tguint;cdecl;external;
procedure adap_toast_set_timeout(self:PAdapToast; timeout:Tguint);cdecl;external;
function adap_toast_get_custom_title(self:PAdapToast):PGtkWidget;cdecl;external;
procedure adap_toast_set_custom_title(self:PAdapToast; widget:PGtkWidget);cdecl;external;
function adap_toast_get_use_markup(self:PAdapToast):Tgboolean;cdecl;external;
procedure adap_toast_set_use_markup(self:PAdapToast; use_markup:Tgboolean);cdecl;external;
procedure adap_toast_dismiss(self:PAdapToast);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_TOAST : longint; { return type might be wrong }
  begin
    ADAP_TYPE_TOAST:=adap_toast_get_type;
  end;


end.
