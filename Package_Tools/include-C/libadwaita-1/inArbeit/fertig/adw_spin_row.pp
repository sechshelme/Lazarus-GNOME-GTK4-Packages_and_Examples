
unit adw_spin_row;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_spin_row.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_spin_row.h
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
PAdwSpinRow  = ^AdwSpinRow;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-action-row.h"}

{ was #define dname def_expr }
function ADW_TYPE_SPIN_ROW : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwSpinRow, adw_spin_row, ADW, SPIN_ROW, AdwActionRow) }
function adw_spin_row_new(adjustment:PGtkAdjustment; climb_rate:Tdouble; digits:Tguint):PGtkWidget;cdecl;external;
function adw_spin_row_new_with_range(min:Tdouble; max:Tdouble; step:Tdouble):PGtkWidget;cdecl;external;
procedure adw_spin_row_configure(self:PAdwSpinRow; adjustment:PGtkAdjustment; climb_rate:Tdouble; digits:Tguint);cdecl;external;
function adw_spin_row_get_adjustment(self:PAdwSpinRow):PGtkAdjustment;cdecl;external;
procedure adw_spin_row_set_adjustment(self:PAdwSpinRow; adjustment:PGtkAdjustment);cdecl;external;
function adw_spin_row_get_climb_rate(self:PAdwSpinRow):Tdouble;cdecl;external;
procedure adw_spin_row_set_climb_rate(self:PAdwSpinRow; climb_rate:Tdouble);cdecl;external;
function adw_spin_row_get_digits(self:PAdwSpinRow):Tguint;cdecl;external;
procedure adw_spin_row_set_digits(self:PAdwSpinRow; digits:Tguint);cdecl;external;
function adw_spin_row_get_numeric(self:PAdwSpinRow):Tgboolean;cdecl;external;
procedure adw_spin_row_set_numeric(self:PAdwSpinRow; numeric:Tgboolean);cdecl;external;
function adw_spin_row_get_snap_to_ticks(self:PAdwSpinRow):Tgboolean;cdecl;external;
procedure adw_spin_row_set_snap_to_ticks(self:PAdwSpinRow; snap_to_ticks:Tgboolean);cdecl;external;
function adw_spin_row_get_update_policy(self:PAdwSpinRow):TGtkSpinButtonUpdatePolicy;cdecl;external;
procedure adw_spin_row_set_update_policy(self:PAdwSpinRow; policy:TGtkSpinButtonUpdatePolicy);cdecl;external;
function adw_spin_row_get_value(self:PAdwSpinRow):Tdouble;cdecl;external;
procedure adw_spin_row_set_value(self:PAdwSpinRow; value:Tdouble);cdecl;external;
function adw_spin_row_get_wrap(self:PAdwSpinRow):Tgboolean;cdecl;external;
procedure adw_spin_row_set_wrap(self:PAdwSpinRow; wrap:Tgboolean);cdecl;external;
procedure adw_spin_row_update(self:PAdwSpinRow);cdecl;external;
procedure adw_spin_row_set_range(self:PAdwSpinRow; min:Tdouble; max:Tdouble);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_SPIN_ROW : longint; { return type might be wrong }
  begin
    ADW_TYPE_SPIN_ROW:=adw_spin_row_get_type;
  end;


end.
