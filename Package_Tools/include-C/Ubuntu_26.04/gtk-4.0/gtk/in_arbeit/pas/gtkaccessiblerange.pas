unit gtkaccessiblerange;

interface

uses
  fp_glib2, fp_gtk4;

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


// === Konventiert am: 5-7-26 16:28:35 ===

function GTK_TYPE_ACCESSIBLE_RANGE: TGType;
function GTK_ACCESSIBLE_RANGE(obj: Pointer): PGtkAccessibleRange;
function GTK_IS_ACCESSIBLE_RANGE(obj: Pointer): Tgboolean;
function GTK_ACCESSIBLE_RANGE_GET_IFACE(obj: Pointer): PGtkAccessibleRangeInterface;

implementation

function GTK_TYPE_ACCESSIBLE_RANGE: TGType;
begin
  Result := gtk_accessible_range_get_type;
end;

function GTK_ACCESSIBLE_RANGE(obj: Pointer): PGtkAccessibleRange;
begin
  Result := PGtkAccessibleRange(g_type_check_instance_cast(obj, GTK_TYPE_ACCESSIBLE_RANGE));
end;

function GTK_IS_ACCESSIBLE_RANGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_ACCESSIBLE_RANGE);
end;

function GTK_ACCESSIBLE_RANGE_GET_IFACE(obj: Pointer): PGtkAccessibleRangeInterface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_ACCESSIBLE_RANGE);
end;

type 
  PGtkAccessibleRange = type Pointer;

  PGtkAccessibleRangeInterface = type Pointer

function gtk_accessible_range_get_type: TGType; cdecl; external libgxxxxxxx;



end.
