
unit adw_combo_row;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_combo_row.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_combo_row.h
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
PAdwComboRow  = ^AdwComboRow;
PAdwComboRowClass  = ^AdwComboRowClass;
PGListModel  = ^GListModel;
PGtkExpression  = ^GtkExpression;
PGtkListItemFactory  = ^GtkListItemFactory;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2018-2020 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-action-row.h"}

{ was #define dname def_expr }
function ADW_TYPE_COMBO_ROW : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AdwComboRow, adw_combo_row, ADW, COMBO_ROW, AdwActionRow) }
{*
 * AdwComboRowClass
 * @parent_class: The parent class
  }
{< private > }
type
  PAdwComboRowClass = ^TAdwComboRowClass;
  TAdwComboRowClass = record
      parent_class : TAdwActionRowClass;
      padding : array[0..3] of Tgpointer;
    end;


function adw_combo_row_new:PGtkWidget;cdecl;external;
function adw_combo_row_get_model(self:PAdwComboRow):PGListModel;cdecl;external;
procedure adw_combo_row_set_model(self:PAdwComboRow; model:PGListModel);cdecl;external;
function adw_combo_row_get_selected(self:PAdwComboRow):Tguint;cdecl;external;
procedure adw_combo_row_set_selected(self:PAdwComboRow; position:Tguint);cdecl;external;
function adw_combo_row_get_selected_item(self:PAdwComboRow):Tgpointer;cdecl;external;
function adw_combo_row_get_factory(self:PAdwComboRow):PGtkListItemFactory;cdecl;external;
procedure adw_combo_row_set_factory(self:PAdwComboRow; factory:PGtkListItemFactory);cdecl;external;
function adw_combo_row_get_list_factory(self:PAdwComboRow):PGtkListItemFactory;cdecl;external;
procedure adw_combo_row_set_list_factory(self:PAdwComboRow; factory:PGtkListItemFactory);cdecl;external;
function adw_combo_row_get_expression(self:PAdwComboRow):PGtkExpression;cdecl;external;
procedure adw_combo_row_set_expression(self:PAdwComboRow; expression:PGtkExpression);cdecl;external;
function adw_combo_row_get_use_subtitle(self:PAdwComboRow):Tgboolean;cdecl;external;
procedure adw_combo_row_set_use_subtitle(self:PAdwComboRow; use_subtitle:Tgboolean);cdecl;external;
function adw_combo_row_get_enable_search(self:PAdwComboRow):Tgboolean;cdecl;external;
procedure adw_combo_row_set_enable_search(self:PAdwComboRow; enable_search:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_COMBO_ROW : longint; { return type might be wrong }
  begin
    ADW_TYPE_COMBO_ROW:=adw_combo_row_get_type;
  end;


end.
