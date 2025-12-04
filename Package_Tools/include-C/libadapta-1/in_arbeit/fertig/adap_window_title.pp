
unit adap_window_title;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_window_title.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_window_title.h
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
PAdapWindowTitle  = ^AdapWindowTitle;
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function ADAP_TYPE_WINDOW_TITLE : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapWindowTitle, adap_window_title, ADAP, WINDOW_TITLE, GtkWidget) }
(* Const before type ignored *)
(* Const before type ignored *)
function adap_window_title_new(title:Pchar; subtitle:Pchar):PGtkWidget;cdecl;external;
(* Const before type ignored *)
function adap_window_title_get_title(self:PAdapWindowTitle):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_window_title_set_title(self:PAdapWindowTitle; title:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_window_title_get_subtitle(self:PAdapWindowTitle):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_window_title_set_subtitle(self:PAdapWindowTitle; subtitle:Pchar);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_WINDOW_TITLE : longint; { return type might be wrong }
  begin
    ADAP_TYPE_WINDOW_TITLE:=adap_window_title_get_type;
  end;


end.
