
unit gtkaccessiblerange;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkaccessiblerange.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkaccessiblerange.h
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
PGtkAccessibleRange  = ^GtkAccessibleRange;
PGtkAccessibleRangeInterface  = ^GtkAccessibleRangeInterface;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkaccessiblerange.h: Accessible range interface
 *
 * SPDX-FileCopyrightText: 2022 Red Hat Inc.
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkaccessible.h>}

{ was #define dname def_expr }
function GTK_TYPE_ACCESSIBLE_RANGE : longint; { return type might be wrong }

{ G_DECLARE_INTERFACE (GtkAccessibleRange, gtk_accessible_range, GTK, ACCESSIBLE_RANGE, GtkAccessible) }
{*
   * GtkAccessibleRangeInterface::set_current_value:
   * @self: a `GtkAccessibleRange`
   * @value: the value to set
   *
   * Sets the current value of the accessible range.
   *
   * This operation should behave similarly as if the user performed the
   * action.
   *
   * Returns: true if the operation was performed, false otherwise
   *
   * Since: 4.10
    }
type
  PGtkAccessibleRangeInterface = ^TGtkAccessibleRangeInterface;
  TGtkAccessibleRangeInterface = record
      g_iface : TGTypeInterface;
      set_current_value : function (self:PGtkAccessibleRange; value:Tdouble):Tgboolean;cdecl;
    end;


implementation

{ was #define dname def_expr }
function GTK_TYPE_ACCESSIBLE_RANGE : longint; { return type might be wrong }
  begin
    GTK_TYPE_ACCESSIBLE_RANGE:=gtk_accessible_range_get_type;
  end;


end.
