
unit adw_preferences_row;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_preferences_row.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_preferences_row.h
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
PAdwPreferencesRow  = ^AdwPreferencesRow;
PAdwPreferencesRowClass  = ^AdwPreferencesRowClass;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function ADW_TYPE_PREFERENCES_ROW : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AdwPreferencesRow, adw_preferences_row, ADW, PREFERENCES_ROW, GtkListBoxRow) }
{*
 * AdwPreferencesRowClass
 * @parent_class: The parent class
  }
{< private > }
type
  PAdwPreferencesRowClass = ^TAdwPreferencesRowClass;
  TAdwPreferencesRowClass = record
      parent_class : TGtkListBoxRowClass;
      padding : array[0..3] of Tgpointer;
    end;


function adw_preferences_row_new:PGtkWidget;cdecl;external;
(* Const before type ignored *)
function adw_preferences_row_get_title(self:PAdwPreferencesRow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_preferences_row_set_title(self:PAdwPreferencesRow; title:Pchar);cdecl;external;
function adw_preferences_row_get_use_underline(self:PAdwPreferencesRow):Tgboolean;cdecl;external;
procedure adw_preferences_row_set_use_underline(self:PAdwPreferencesRow; use_underline:Tgboolean);cdecl;external;
function adw_preferences_row_get_title_selectable(self:PAdwPreferencesRow):Tgboolean;cdecl;external;
procedure adw_preferences_row_set_title_selectable(self:PAdwPreferencesRow; title_selectable:Tgboolean);cdecl;external;
function adw_preferences_row_get_use_markup(self:PAdwPreferencesRow):Tgboolean;cdecl;external;
procedure adw_preferences_row_set_use_markup(self:PAdwPreferencesRow; use_markup:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_PREFERENCES_ROW : longint; { return type might be wrong }
  begin
    ADW_TYPE_PREFERENCES_ROW:=adw_preferences_row_get_type;
  end;


end.
