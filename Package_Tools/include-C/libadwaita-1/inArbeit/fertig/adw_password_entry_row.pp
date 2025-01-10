
unit adw_password_entry_row;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_password_entry_row.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_password_entry_row.h
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
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Maximiliano Sandoval <msandova@protonmail.com>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-entry-row.h"}

{ was #define dname def_expr }
function ADW_TYPE_PASSWORD_ENTRY_ROW : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwPasswordEntryRow, adw_password_entry_row, ADW, PASSWORD_ENTRY_ROW, AdwEntryRow) }
function adw_password_entry_row_new:PGtkWidget;cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_PASSWORD_ENTRY_ROW : longint; { return type might be wrong }
  begin
    ADW_TYPE_PASSWORD_ENTRY_ROW:=adw_password_entry_row_get_type;
  end;


end.
