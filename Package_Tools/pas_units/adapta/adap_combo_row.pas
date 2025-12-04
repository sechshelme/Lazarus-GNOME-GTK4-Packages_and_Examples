unit adap_combo_row;

interface

uses
  fp_adapta;

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


function adap_combo_row_new:PGtkWidget;cdecl;external libadapta;
function adap_combo_row_get_model(self:PAdapComboRow):PGListModel;cdecl;external libadapta;
procedure adap_combo_row_set_model(self:PAdapComboRow; model:PGListModel);cdecl;external libadapta;
function adap_combo_row_get_selected(self:PAdapComboRow):Tguint;cdecl;external libadapta;
procedure adap_combo_row_set_selected(self:PAdapComboRow; position:Tguint);cdecl;external libadapta;
function adap_combo_row_get_selected_item(self:PAdapComboRow):Tgpointer;cdecl;external libadapta;
function adap_combo_row_get_factory(self:PAdapComboRow):PGtkListItemFactory;cdecl;external libadapta;
procedure adap_combo_row_set_factory(self:PAdapComboRow; factory:PGtkListItemFactory);cdecl;external libadapta;
function adap_combo_row_get_list_factory(self:PAdapComboRow):PGtkListItemFactory;cdecl;external libadapta;
procedure adap_combo_row_set_list_factory(self:PAdapComboRow; factory:PGtkListItemFactory);cdecl;external libadapta;
function adap_combo_row_get_expression(self:PAdapComboRow):PGtkExpression;cdecl;external libadapta;
procedure adap_combo_row_set_expression(self:PAdapComboRow; expression:PGtkExpression);cdecl;external libadapta;
function adap_combo_row_get_use_subtitle(self:PAdapComboRow):Tgboolean;cdecl;external libadapta;
procedure adap_combo_row_set_use_subtitle(self:PAdapComboRow; use_subtitle:Tgboolean);cdecl;external libadapta;
function adap_combo_row_get_enable_search(self:PAdapComboRow):Tgboolean;cdecl;external libadapta;
procedure adap_combo_row_set_enable_search(self:PAdapComboRow; enable_search:Tgboolean);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:09:17 ===

function ADAP_TYPE_COMBO_ROW: TGType;
function ADAP_COMBO_ROW(obj: Pointer): PAdapComboRow;
function ADAP_IS_COMBO_ROW(obj: Pointer): Tgboolean;
function ADAP_COMBO_ROW_CLASS(klass: Pointer): PAdapComboRowClass;
function ADAP_IS_COMBO_ROW_CLASS(klass: Pointer): Tgboolean;
function ADAP_COMBO_ROW_GET_CLASS(obj: Pointer): PAdapComboRowClass;

implementation

function ADAP_TYPE_COMBO_ROW: TGType;
begin
  Result := adap_combo_row_get_type;
end;

function ADAP_COMBO_ROW(obj: Pointer): PAdapComboRow;
begin
  Result := PAdapComboRow(g_type_check_instance_cast(obj, ADAP_TYPE_COMBO_ROW));
end;

function ADAP_IS_COMBO_ROW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_COMBO_ROW);
end;

function ADAP_COMBO_ROW_CLASS(klass: Pointer): PAdapComboRowClass;
begin
  Result := PAdapComboRowClass(g_type_check_class_cast(klass, ADAP_TYPE_COMBO_ROW));
end;

function ADAP_IS_COMBO_ROW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_COMBO_ROW);
end;

function ADAP_COMBO_ROW_GET_CLASS(obj: Pointer): PAdapComboRowClass;
begin
  Result := PAdapComboRowClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAdapComboRow = record
    parent_instance: TAdapActionRow;
  end;
  PAdapComboRow = ^TAdapComboRow;

  TAdapComboRowClass = record
  end;
  PAdapComboRowClass = ^TAdapComboRowClass;

function adap_combo_row_get_type: TGType; cdecl; external libgxxxxxxx;



end.
