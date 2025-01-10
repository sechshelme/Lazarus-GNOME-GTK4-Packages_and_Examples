
unit adw_button_content;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_button_content.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_button_content.h
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
PAdwButtonContent  = ^AdwButtonContent;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function ADW_TYPE_BUTTON_CONTENT : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwButtonContent, adw_button_content, ADW, BUTTON_CONTENT, GtkWidget) }
function adw_button_content_new:PGtkWidget;cdecl;external;
(* Const before type ignored *)
function adw_button_content_get_label(self:PAdwButtonContent):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_button_content_set_label(self:PAdwButtonContent; _label:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_button_content_get_icon_name(self:PAdwButtonContent):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_button_content_set_icon_name(self:PAdwButtonContent; icon_name:Pchar);cdecl;external;
function adw_button_content_get_use_underline(self:PAdwButtonContent):Tgboolean;cdecl;external;
procedure adw_button_content_set_use_underline(self:PAdwButtonContent; use_underline:Tgboolean);cdecl;external;
function adw_button_content_get_can_shrink(self:PAdwButtonContent):Tgboolean;cdecl;external;
procedure adw_button_content_set_can_shrink(self:PAdwButtonContent; can_shrink:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_BUTTON_CONTENT : longint; { return type might be wrong }
  begin
    ADW_TYPE_BUTTON_CONTENT:=adw_button_content_get_type;
  end;


end.
