unit adap_expander_row;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2018 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-preferences-row.h"}

{////////G_DECLARE_DERIVABLE_TYPE (AdapExpanderRow, adap_expander_row, ADAP, EXPANDER_ROW, AdapPreferencesRow) }
{*
 * AdapExpanderRowClass
 * @parent_class: The parent class
  }
{< private > }
type
  PAdapExpanderRowClass = ^TAdapExpanderRowClass;
  TAdapExpanderRowClass = record
      parent_class : TAdapPreferencesRowClass;
      padding : array[0..3] of Tgpointer;
    end;


function adap_expander_row_new:PGtkWidget;cdecl;external libadapta;
{xxxxxxxxADAP_DEPRECATED_IN_1_4_FOR (adap_expander_row_add_suffix) }
procedure adap_expander_row_add_action(self:PAdapExpanderRow; widget:PGtkWidget);cdecl;external libadapta;
procedure adap_expander_row_add_prefix(self:PAdapExpanderRow; widget:PGtkWidget);cdecl;external libadapta;
procedure adap_expander_row_add_suffix(self:PAdapExpanderRow; widget:PGtkWidget);cdecl;external libadapta;
procedure adap_expander_row_add_row(self:PAdapExpanderRow; child:PGtkWidget);cdecl;external libadapta;
procedure adap_expander_row_remove(self:PAdapExpanderRow; child:PGtkWidget);cdecl;external libadapta;
function adap_expander_row_get_subtitle(self:PAdapExpanderRow):Pchar;cdecl;external libadapta;
procedure adap_expander_row_set_subtitle(self:PAdapExpanderRow; subtitle:Pchar);cdecl;external libadapta;
{xxxxADAP_DEPRECATED_IN_1_3_FOR (adap_expander_row_add_prefix) }
function adap_expander_row_get_icon_name(self:PAdapExpanderRow):Pchar;cdecl;external libadapta;
{xxxxxxADAP_DEPRECATED_IN_1_3_FOR (adap_expander_row_add_prefix) }
procedure adap_expander_row_set_icon_name(self:PAdapExpanderRow; icon_name:Pchar);cdecl;external libadapta;
function adap_expander_row_get_expanded(self:PAdapExpanderRow):Tgboolean;cdecl;external libadapta;
procedure adap_expander_row_set_expanded(self:PAdapExpanderRow; expanded:Tgboolean);cdecl;external libadapta;
function adap_expander_row_get_enable_expansion(self:PAdapExpanderRow):Tgboolean;cdecl;external libadapta;
procedure adap_expander_row_set_enable_expansion(self:PAdapExpanderRow; enable_expansion:Tgboolean);cdecl;external libadapta;
function adap_expander_row_get_show_enable_switch(self:PAdapExpanderRow):Tgboolean;cdecl;external libadapta;
procedure adap_expander_row_set_show_enable_switch(self:PAdapExpanderRow; show_enable_switch:Tgboolean);cdecl;external libadapta;
function adap_expander_row_get_title_lines(self:PAdapExpanderRow):longint;cdecl;external libadapta;
procedure adap_expander_row_set_title_lines(self:PAdapExpanderRow; title_lines:longint);cdecl;external libadapta;
function adap_expander_row_get_subtitle_lines(self:PAdapExpanderRow):longint;cdecl;external libadapta;
procedure adap_expander_row_set_subtitle_lines(self:PAdapExpanderRow; subtitle_lines:longint);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:08:58 ===

function ADAP_TYPE_EXPANDER_ROW: TGType;
function ADAP_EXPANDER_ROW(obj: Pointer): PAdapExpanderRow;
function ADAP_IS_EXPANDER_ROW(obj: Pointer): Tgboolean;
function ADAP_EXPANDER_ROW_CLASS(klass: Pointer): PAdapExpanderRowClass;
function ADAP_IS_EXPANDER_ROW_CLASS(klass: Pointer): Tgboolean;
function ADAP_EXPANDER_ROW_GET_CLASS(obj: Pointer): PAdapExpanderRowClass;

implementation

function ADAP_TYPE_EXPANDER_ROW: TGType;
begin
  Result := adap_expander_row_get_type;
end;

function ADAP_EXPANDER_ROW(obj: Pointer): PAdapExpanderRow;
begin
  Result := PAdapExpanderRow(g_type_check_instance_cast(obj, ADAP_TYPE_EXPANDER_ROW));
end;

function ADAP_IS_EXPANDER_ROW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_EXPANDER_ROW);
end;

function ADAP_EXPANDER_ROW_CLASS(klass: Pointer): PAdapExpanderRowClass;
begin
  Result := PAdapExpanderRowClass(g_type_check_class_cast(klass, ADAP_TYPE_EXPANDER_ROW));
end;

function ADAP_IS_EXPANDER_ROW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_EXPANDER_ROW);
end;

function ADAP_EXPANDER_ROW_GET_CLASS(obj: Pointer): PAdapExpanderRowClass;
begin
  Result := PAdapExpanderRowClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAdapExpanderRow = record
    parent_instance: TAdapPreferencesRow;
  end;
  PAdapExpanderRow = ^TAdapExpanderRow;

  TAdapExpanderRowClass = record
  end;
  PAdapExpanderRowClass = ^TAdapExpanderRowClass;

function adap_expander_row_get_type: TGType; cdecl; external libgxxxxxxx;



end.
