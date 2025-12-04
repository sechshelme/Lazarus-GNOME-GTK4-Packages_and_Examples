
unit adap_password_entry_row;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_password_entry_row.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_password_entry_row.h
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-entry-row.h"}

{ was #define dname def_expr }
function ADAP_TYPE_PASSWORD_ENTRY_ROW : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapPasswordEntryRow, adap_password_entry_row, ADAP, PASSWORD_ENTRY_ROW, AdapEntryRow) }
function adap_password_entry_row_new:PGtkWidget;cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_PASSWORD_ENTRY_ROW : longint; { return type might be wrong }
  begin
    ADAP_TYPE_PASSWORD_ENTRY_ROW:=adap_password_entry_row_get_type;
  end;


end.
