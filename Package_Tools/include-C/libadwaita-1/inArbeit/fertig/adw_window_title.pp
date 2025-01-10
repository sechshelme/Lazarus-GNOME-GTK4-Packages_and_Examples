
unit adw_window_title;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_window_title.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_window_title.h
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
PAdwWindowTitle  = ^AdwWindowTitle;
Pchar  = ^char;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Christopher Davis <christopherdavis@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function ADW_TYPE_WINDOW_TITLE : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwWindowTitle, adw_window_title, ADW, WINDOW_TITLE, GtkWidget) }
(* Const before type ignored *)
(* Const before type ignored *)
function adw_window_title_new(title:Pchar; subtitle:Pchar):PGtkWidget;cdecl;external;
(* Const before type ignored *)
function adw_window_title_get_title(self:PAdwWindowTitle):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_window_title_set_title(self:PAdwWindowTitle; title:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_window_title_get_subtitle(self:PAdwWindowTitle):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_window_title_set_subtitle(self:PAdwWindowTitle; subtitle:Pchar);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_WINDOW_TITLE : longint; { return type might be wrong }
  begin
    ADW_TYPE_WINDOW_TITLE:=adw_window_title_get_type;
  end;


end.
