unit gtkspinbutton;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
 *
 * GtkSpinButton widget for GTK+
 * Copyright (C) 1998 Lars Hamann and Stefan Jeske
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}

{*
 * GTK_INPUT_ERROR:
 *
 * Constant to return from a signal handler for the ::input
 * signal in case of conversion failure.
 *
 * See [signal@Gtk.SpinButton::input].
  }
const
  GTK_INPUT_ERROR = -(1);  
{*
 * GtkSpinButtonUpdatePolicy:
 * @GTK_UPDATE_ALWAYS: When refreshing your `GtkSpinButton`, the value is
 *   always displayed
 * @GTK_UPDATE_IF_VALID: When refreshing your `GtkSpinButton`, the value is
 *   only displayed if it is valid within the bounds of the spin button's
 *   adjustment
 *
 * Determines whether the spin button displays values outside the adjustment
 * bounds.
 *
 * See [method@Gtk.SpinButton.set_update_policy].
  }
type
  PGtkSpinButtonUpdatePolicy = ^TGtkSpinButtonUpdatePolicy;
  TGtkSpinButtonUpdatePolicy =  Longint;
  Const
    GTK_UPDATE_ALWAYS = 0;
    GTK_UPDATE_IF_VALID = 1;
;
{*
 * GtkSpinType:
 * @GTK_SPIN_STEP_FORWARD: Increment by the adjustments step increment.
 * @GTK_SPIN_STEP_BACKWARD: Decrement by the adjustments step increment.
 * @GTK_SPIN_PAGE_FORWARD: Increment by the adjustments page increment.
 * @GTK_SPIN_PAGE_BACKWARD: Decrement by the adjustments page increment.
 * @GTK_SPIN_HOME: Go to the adjustments lower bound.
 * @GTK_SPIN_END: Go to the adjustments upper bound.
 * @GTK_SPIN_USER_DEFINED: Change by a specified amount.
 *
 * The values of the GtkSpinType enumeration are used to specify the
 * change to make in gtk_spin_button_spin().
  }
type
  PGtkSpinType = ^TGtkSpinType;
  TGtkSpinType =  Longint;
  Const
    GTK_SPIN_STEP_FORWARD = 0;
    GTK_SPIN_STEP_BACKWARD = 1;
    GTK_SPIN_PAGE_FORWARD = 2;
    GTK_SPIN_PAGE_BACKWARD = 3;
    GTK_SPIN_HOME = 4;
    GTK_SPIN_END = 5;
    GTK_SPIN_USER_DEFINED = 6;
;
type

function gtk_spin_button_get_type:TGType;cdecl;external libgtk4;
procedure gtk_spin_button_configure(spin_button:PGtkSpinButton; adjustment:PGtkAdjustment; climb_rate:Tdouble; digits:Tguint);cdecl;external libgtk4;
function gtk_spin_button_new(adjustment:PGtkAdjustment; climb_rate:Tdouble; digits:Tguint):PGtkWidget;cdecl;external libgtk4;
function gtk_spin_button_new_with_range(min:Tdouble; max:Tdouble; step:Tdouble):PGtkWidget;cdecl;external libgtk4;
procedure gtk_spin_button_set_activates_default(spin_button:PGtkSpinButton; activates_default:Tgboolean);cdecl;external libgtk4;
function gtk_spin_button_get_activates_default(spin_button:PGtkSpinButton):Tgboolean;cdecl;external libgtk4;
procedure gtk_spin_button_set_adjustment(spin_button:PGtkSpinButton; adjustment:PGtkAdjustment);cdecl;external libgtk4;
function gtk_spin_button_get_adjustment(spin_button:PGtkSpinButton):PGtkAdjustment;cdecl;external libgtk4;
procedure gtk_spin_button_set_digits(spin_button:PGtkSpinButton; digits:Tguint);cdecl;external libgtk4;
function gtk_spin_button_get_digits(spin_button:PGtkSpinButton):Tguint;cdecl;external libgtk4;
procedure gtk_spin_button_set_increments(spin_button:PGtkSpinButton; step:Tdouble; page:Tdouble);cdecl;external libgtk4;
procedure gtk_spin_button_get_increments(spin_button:PGtkSpinButton; step:Pdouble; page:Pdouble);cdecl;external libgtk4;
procedure gtk_spin_button_set_range(spin_button:PGtkSpinButton; min:Tdouble; max:Tdouble);cdecl;external libgtk4;
procedure gtk_spin_button_get_range(spin_button:PGtkSpinButton; min:Pdouble; max:Pdouble);cdecl;external libgtk4;
function gtk_spin_button_get_value(spin_button:PGtkSpinButton):Tdouble;cdecl;external libgtk4;
function gtk_spin_button_get_value_as_int(spin_button:PGtkSpinButton):longint;cdecl;external libgtk4;
procedure gtk_spin_button_set_value(spin_button:PGtkSpinButton; value:Tdouble);cdecl;external libgtk4;
procedure gtk_spin_button_set_update_policy(spin_button:PGtkSpinButton; policy:TGtkSpinButtonUpdatePolicy);cdecl;external libgtk4;
function gtk_spin_button_get_update_policy(spin_button:PGtkSpinButton):TGtkSpinButtonUpdatePolicy;cdecl;external libgtk4;
procedure gtk_spin_button_set_numeric(spin_button:PGtkSpinButton; numeric:Tgboolean);cdecl;external libgtk4;
function gtk_spin_button_get_numeric(spin_button:PGtkSpinButton):Tgboolean;cdecl;external libgtk4;
procedure gtk_spin_button_spin(spin_button:PGtkSpinButton; direction:TGtkSpinType; increment:Tdouble);cdecl;external libgtk4;
procedure gtk_spin_button_set_wrap(spin_button:PGtkSpinButton; wrap:Tgboolean);cdecl;external libgtk4;
function gtk_spin_button_get_wrap(spin_button:PGtkSpinButton):Tgboolean;cdecl;external libgtk4;
procedure gtk_spin_button_set_snap_to_ticks(spin_button:PGtkSpinButton; snap_to_ticks:Tgboolean);cdecl;external libgtk4;
function gtk_spin_button_get_snap_to_ticks(spin_button:PGtkSpinButton):Tgboolean;cdecl;external libgtk4;
procedure gtk_spin_button_set_climb_rate(spin_button:PGtkSpinButton; climb_rate:Tdouble);cdecl;external libgtk4;
function gtk_spin_button_get_climb_rate(spin_button:PGtkSpinButton):Tdouble;cdecl;external libgtk4;
procedure gtk_spin_button_update(spin_button:PGtkSpinButton);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkSpinButton, g_object_unref) }

// === Konventiert am: 6-7-26 16:06:44 ===

function GTK_TYPE_SPIN_BUTTON : TGType;
function GTK_SPIN_BUTTON(obj : Pointer) : PGtkSpinButton;
function GTK_IS_SPIN_BUTTON(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_SPIN_BUTTON : TGType;
  begin
    GTK_TYPE_SPIN_BUTTON:=gtk_spin_button_get_type;
  end;

function GTK_SPIN_BUTTON(obj : Pointer) : PGtkSpinButton;
begin
  Result := PGtkSpinButton(g_type_check_instance_cast(obj, GTK_TYPE_SPIN_BUTTON));
end;

function GTK_IS_SPIN_BUTTON(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_SPIN_BUTTON);
end;



end.
