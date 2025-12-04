
unit adap_preferences_row;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_preferences_row.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_preferences_row.h
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
PAdapPreferencesRow  = ^AdapPreferencesRow;
PAdapPreferencesRowClass  = ^AdapPreferencesRowClass;
Pchar  = ^char;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2019 Purism SPC
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
function ADAP_TYPE_PREFERENCES_ROW : longint; { return type might be wrong }

{////////G_DECLARE_DERIVABLE_TYPE (AdapPreferencesRow, adap_preferences_row, ADAP, PREFERENCES_ROW, GtkListBoxRow) }
{*
 * AdapPreferencesRowClass
 * @parent_class: The parent class
  }
{< private > }
type
  PAdapPreferencesRowClass = ^TAdapPreferencesRowClass;
  TAdapPreferencesRowClass = record
      parent_class : TGtkListBoxRowClass;
      padding : array[0..3] of Tgpointer;
    end;


function adap_preferences_row_new:PGtkWidget;cdecl;external;
(* Const before type ignored *)
function adap_preferences_row_get_title(self:PAdapPreferencesRow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_preferences_row_set_title(self:PAdapPreferencesRow; title:Pchar);cdecl;external;
function adap_preferences_row_get_use_underline(self:PAdapPreferencesRow):Tgboolean;cdecl;external;
procedure adap_preferences_row_set_use_underline(self:PAdapPreferencesRow; use_underline:Tgboolean);cdecl;external;
function adap_preferences_row_get_title_selectable(self:PAdapPreferencesRow):Tgboolean;cdecl;external;
procedure adap_preferences_row_set_title_selectable(self:PAdapPreferencesRow; title_selectable:Tgboolean);cdecl;external;
function adap_preferences_row_get_use_markup(self:PAdapPreferencesRow):Tgboolean;cdecl;external;
procedure adap_preferences_row_set_use_markup(self:PAdapPreferencesRow; use_markup:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_PREFERENCES_ROW : longint; { return type might be wrong }
  begin
    ADAP_TYPE_PREFERENCES_ROW:=adap_preferences_row_get_type;
  end;


end.
