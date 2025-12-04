
unit adap_button_content;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_button_content.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_button_content.h
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
PAdapButtonContent  = ^AdapButtonContent;
Pchar  = ^char;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Purism SPC
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

{ was #define dname def_expr }
function ADAP_TYPE_BUTTON_CONTENT : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapButtonContent, adap_button_content, ADAP, BUTTON_CONTENT, GtkWidget) }
function adap_button_content_new:PGtkWidget;cdecl;external;
(* Const before type ignored *)
function adap_button_content_get_label(self:PAdapButtonContent):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_button_content_set_label(self:PAdapButtonContent; _label:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_button_content_get_icon_name(self:PAdapButtonContent):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_button_content_set_icon_name(self:PAdapButtonContent; icon_name:Pchar);cdecl;external;
function adap_button_content_get_use_underline(self:PAdapButtonContent):Tgboolean;cdecl;external;
procedure adap_button_content_set_use_underline(self:PAdapButtonContent; use_underline:Tgboolean);cdecl;external;
function adap_button_content_get_can_shrink(self:PAdapButtonContent):Tgboolean;cdecl;external;
procedure adap_button_content_set_can_shrink(self:PAdapButtonContent; can_shrink:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_BUTTON_CONTENT : longint; { return type might be wrong }
  begin
    ADAP_TYPE_BUTTON_CONTENT:=adap_button_content_get_type;
  end;


end.
