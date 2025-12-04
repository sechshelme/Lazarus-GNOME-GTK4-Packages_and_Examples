
unit adap_combo_row;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_combo_row.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_combo_row.h
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
PAdapComboRow  = ^AdapComboRow;
PAdapComboRowClass  = ^AdapComboRowClass;
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-action-row.h"}

{ was #define dname def_expr }
function ADAP_TYPE_COMBO_ROW : longint; { return type might be wrong }

{////////G_DECLARE_DERIVABLE_TYPE (AdapComboRow, adap_combo_row, ADAP, COMBO_ROW, AdapActionRow) }
{*
 * AdapComboRowClass
 * @parent_class: The parent class
  }
{< private > }
type
  PAdapComboRowClass = ^TAdapComboRowClass;
  TAdapComboRowClass = record
      parent_class : TAdapActionRowClass;
      padding : array[0..3] of Tgpointer;
    end;


function adap_combo_row_new:PGtkWidget;cdecl;external;
function adap_combo_row_get_model(self:PAdapComboRow):PGListModel;cdecl;external;
procedure adap_combo_row_set_model(self:PAdapComboRow; model:PGListModel);cdecl;external;
function adap_combo_row_get_selected(self:PAdapComboRow):Tguint;cdecl;external;
procedure adap_combo_row_set_selected(self:PAdapComboRow; position:Tguint);cdecl;external;
function adap_combo_row_get_selected_item(self:PAdapComboRow):Tgpointer;cdecl;external;
function adap_combo_row_get_factory(self:PAdapComboRow):PGtkListItemFactory;cdecl;external;
procedure adap_combo_row_set_factory(self:PAdapComboRow; factory:PGtkListItemFactory);cdecl;external;
function adap_combo_row_get_list_factory(self:PAdapComboRow):PGtkListItemFactory;cdecl;external;
procedure adap_combo_row_set_list_factory(self:PAdapComboRow; factory:PGtkListItemFactory);cdecl;external;
function adap_combo_row_get_expression(self:PAdapComboRow):PGtkExpression;cdecl;external;
procedure adap_combo_row_set_expression(self:PAdapComboRow; expression:PGtkExpression);cdecl;external;
function adap_combo_row_get_use_subtitle(self:PAdapComboRow):Tgboolean;cdecl;external;
procedure adap_combo_row_set_use_subtitle(self:PAdapComboRow; use_subtitle:Tgboolean);cdecl;external;
function adap_combo_row_get_enable_search(self:PAdapComboRow):Tgboolean;cdecl;external;
procedure adap_combo_row_set_enable_search(self:PAdapComboRow; enable_search:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_COMBO_ROW : longint; { return type might be wrong }
  begin
    ADAP_TYPE_COMBO_ROW:=adap_combo_row_get_type;
  end;


end.
