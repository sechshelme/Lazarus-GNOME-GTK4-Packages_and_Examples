unit adap_spin_row;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2022 Christopher Davis <christopherdavis@gnome.org>
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

{G_DECLARE_FINAL_TYPE (AdapSpinRow, adap_spin_row, ADAP, SPIN_ROW, AdapActionRow) }
function adap_spin_row_new(adjustment:PGtkAdjustment; climb_rate:Tdouble; digits:Tguint):PGtkWidget;cdecl;external libadapta;
function adap_spin_row_new_with_range(min:Tdouble; max:Tdouble; step:Tdouble):PGtkWidget;cdecl;external libadapta;
procedure adap_spin_row_configure(self:PAdapSpinRow; adjustment:PGtkAdjustment; climb_rate:Tdouble; digits:Tguint);cdecl;external libadapta;
function adap_spin_row_get_adjustment(self:PAdapSpinRow):PGtkAdjustment;cdecl;external libadapta;
procedure adap_spin_row_set_adjustment(self:PAdapSpinRow; adjustment:PGtkAdjustment);cdecl;external libadapta;
function adap_spin_row_get_climb_rate(self:PAdapSpinRow):Tdouble;cdecl;external libadapta;
procedure adap_spin_row_set_climb_rate(self:PAdapSpinRow; climb_rate:Tdouble);cdecl;external libadapta;
function adap_spin_row_get_digits(self:PAdapSpinRow):Tguint;cdecl;external libadapta;
procedure adap_spin_row_set_digits(self:PAdapSpinRow; digits:Tguint);cdecl;external libadapta;
function adap_spin_row_get_numeric(self:PAdapSpinRow):Tgboolean;cdecl;external libadapta;
procedure adap_spin_row_set_numeric(self:PAdapSpinRow; numeric:Tgboolean);cdecl;external libadapta;
function adap_spin_row_get_snap_to_ticks(self:PAdapSpinRow):Tgboolean;cdecl;external libadapta;
procedure adap_spin_row_set_snap_to_ticks(self:PAdapSpinRow; snap_to_ticks:Tgboolean);cdecl;external libadapta;
function adap_spin_row_get_update_policy(self:PAdapSpinRow):TGtkSpinButtonUpdatePolicy;cdecl;external libadapta;
procedure adap_spin_row_set_update_policy(self:PAdapSpinRow; policy:TGtkSpinButtonUpdatePolicy);cdecl;external libadapta;
function adap_spin_row_get_value(self:PAdapSpinRow):Tdouble;cdecl;external libadapta;
procedure adap_spin_row_set_value(self:PAdapSpinRow; value:Tdouble);cdecl;external libadapta;
function adap_spin_row_get_wrap(self:PAdapSpinRow):Tgboolean;cdecl;external libadapta;
procedure adap_spin_row_set_wrap(self:PAdapSpinRow; wrap:Tgboolean);cdecl;external libadapta;
procedure adap_spin_row_update(self:PAdapSpinRow);cdecl;external libadapta;
procedure adap_spin_row_set_range(self:PAdapSpinRow; min:Tdouble; max:Tdouble);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:18:37 ===

function ADAP_TYPE_SPIN_ROW: TGType;
function ADAP_SPIN_ROW(obj: Pointer): PAdapSpinRow;
function ADAP_IS_SPIN_ROW(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_SPIN_ROW: TGType;
begin
  Result := adap_spin_row_get_type;
end;

function ADAP_SPIN_ROW(obj: Pointer): PAdapSpinRow;
begin
  Result := PAdapSpinRow(g_type_check_instance_cast(obj, ADAP_TYPE_SPIN_ROW));
end;

function ADAP_IS_SPIN_ROW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_SPIN_ROW);
end;

type 
  TAdapSpinRow = record
  end;
  PAdapSpinRow = ^TAdapSpinRow;

  TAdapSpinRowClass = record
    parent_class: TAdapActionRowClass;
  end;
  PAdapSpinRowClass = ^TAdapSpinRowClass;

function adap_spin_row_get_type: TGType; cdecl; external libgxxxxxxx;



end.
