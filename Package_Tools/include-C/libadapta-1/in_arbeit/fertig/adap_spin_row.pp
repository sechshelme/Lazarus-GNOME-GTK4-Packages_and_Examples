
unit adap_spin_row;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_spin_row.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_spin_row.h
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
PAdapSpinRow  = ^AdapSpinRow;
PGtkAdjustment  = ^GtkAdjustment;
PGtkWidget  = ^GtkWidget;
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

{ was #define dname def_expr }
function ADAP_TYPE_SPIN_ROW : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapSpinRow, adap_spin_row, ADAP, SPIN_ROW, AdapActionRow) }
function adap_spin_row_new(adjustment:PGtkAdjustment; climb_rate:Tdouble; digits:Tguint):PGtkWidget;cdecl;external;
function adap_spin_row_new_with_range(min:Tdouble; max:Tdouble; step:Tdouble):PGtkWidget;cdecl;external;
procedure adap_spin_row_configure(self:PAdapSpinRow; adjustment:PGtkAdjustment; climb_rate:Tdouble; digits:Tguint);cdecl;external;
function adap_spin_row_get_adjustment(self:PAdapSpinRow):PGtkAdjustment;cdecl;external;
procedure adap_spin_row_set_adjustment(self:PAdapSpinRow; adjustment:PGtkAdjustment);cdecl;external;
function adap_spin_row_get_climb_rate(self:PAdapSpinRow):Tdouble;cdecl;external;
procedure adap_spin_row_set_climb_rate(self:PAdapSpinRow; climb_rate:Tdouble);cdecl;external;
function adap_spin_row_get_digits(self:PAdapSpinRow):Tguint;cdecl;external;
procedure adap_spin_row_set_digits(self:PAdapSpinRow; digits:Tguint);cdecl;external;
function adap_spin_row_get_numeric(self:PAdapSpinRow):Tgboolean;cdecl;external;
procedure adap_spin_row_set_numeric(self:PAdapSpinRow; numeric:Tgboolean);cdecl;external;
function adap_spin_row_get_snap_to_ticks(self:PAdapSpinRow):Tgboolean;cdecl;external;
procedure adap_spin_row_set_snap_to_ticks(self:PAdapSpinRow; snap_to_ticks:Tgboolean);cdecl;external;
function adap_spin_row_get_update_policy(self:PAdapSpinRow):TGtkSpinButtonUpdatePolicy;cdecl;external;
procedure adap_spin_row_set_update_policy(self:PAdapSpinRow; policy:TGtkSpinButtonUpdatePolicy);cdecl;external;
function adap_spin_row_get_value(self:PAdapSpinRow):Tdouble;cdecl;external;
procedure adap_spin_row_set_value(self:PAdapSpinRow; value:Tdouble);cdecl;external;
function adap_spin_row_get_wrap(self:PAdapSpinRow):Tgboolean;cdecl;external;
procedure adap_spin_row_set_wrap(self:PAdapSpinRow; wrap:Tgboolean);cdecl;external;
procedure adap_spin_row_update(self:PAdapSpinRow);cdecl;external;
procedure adap_spin_row_set_range(self:PAdapSpinRow; min:Tdouble; max:Tdouble);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_SPIN_ROW : longint; { return type might be wrong }
  begin
    ADAP_TYPE_SPIN_ROW:=adap_spin_row_get_type;
  end;


end.
