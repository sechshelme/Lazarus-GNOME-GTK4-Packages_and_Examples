unit gtksorter;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2019 Matthias Clasen
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Matthias Clasen <mclasen@redhat.com>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gdk/gdk.h>}
{$include <gtk/gtkenums.h>}
{*
 * GtkSorterOrder:
 * @GTK_SORTER_ORDER_PARTIAL: A partial order. Any `GtkOrdering` is possible.
 * @GTK_SORTER_ORDER_NONE: No order, all elements are considered equal.
 *   gtk_sorter_compare() will only return %GTK_ORDERING_EQUAL.
 * @GTK_SORTER_ORDER_TOTAL: A total order. gtk_sorter_compare() will only
 *   return %GTK_ORDERING_EQUAL if an item is compared with itself. Two
 *   different items will never cause this value to be returned.
 *
 * Describes the type of order that a `GtkSorter` may produce.
  }
type
  PGtkSorterOrder = ^TGtkSorterOrder;
  TGtkSorterOrder =  Longint;
  Const
    GTK_SORTER_ORDER_PARTIAL = 0;
    GTK_SORTER_ORDER_NONE = 1;
    GTK_SORTER_ORDER_TOTAL = 2;
;
{*
 * GtkSorterChange:
 * @GTK_SORTER_CHANGE_DIFFERENT: The sorter change cannot be described
 *   by any of the other enumeration values
 * @GTK_SORTER_CHANGE_INVERTED: The sort order was inverted. Comparisons
 *   that returned %GTK_ORDERING_SMALLER now return %GTK_ORDERING_LARGER
 *   and vice versa. Other comparisons return the same values as before.
 * @GTK_SORTER_CHANGE_LESS_STRICT: The sorter is less strict: Comparisons
 *   may now return %GTK_ORDERING_EQUAL that did not do so before.
 * @GTK_SORTER_CHANGE_MORE_STRICT: The sorter is more strict: Comparisons
 *   that did return %GTK_ORDERING_EQUAL may not do so anymore.
 *
 * Describes changes in a sorter in more detail and allows users
 * to optimize resorting.
  }
type
  PGtkSorterChange = ^TGtkSorterChange;
  TGtkSorterChange =  Longint;
  Const
    GTK_SORTER_CHANGE_DIFFERENT = 0;
    GTK_SORTER_CHANGE_INVERTED = 1;
    GTK_SORTER_CHANGE_LESS_STRICT = 2;
    GTK_SORTER_CHANGE_MORE_STRICT = 3;
;

{G_DECLARE_DERIVABLE_TYPE (GtkSorter, gtk_sorter, GTK, SORTER, GObject) }
{*
 * GtkSorterClass
 * @compare: Compare two items. See gtk_sorter_compare() for details.
 * @get_order: Get the `GtkSorderOrder` that applies to the current sorter.
 *   If unimplemented, it returns %GTK_SORTER_ORDER_PARTIAL.
 *
 * The virtual table for `GtkSorter`.
  }
{ optional  }
{ Padding for future expansion  }
type
  PGtkSorterClass = ^TGtkSorterClass;
  TGtkSorterClass = record
      parent_class : TGObjectClass;
      compare : function (self:PGtkSorter; item1:Tgpointer; item2:Tgpointer):TGtkOrdering;cdecl;
      get_order : function (self:PGtkSorter):TGtkSorterOrder;cdecl;
      _gtk_reserved1 : procedure ;cdecl;
      _gtk_reserved2 : procedure ;cdecl;
      _gtk_reserved3 : procedure ;cdecl;
      _gtk_reserved4 : procedure ;cdecl;
      _gtk_reserved5 : procedure ;cdecl;
      _gtk_reserved6 : procedure ;cdecl;
      _gtk_reserved7 : procedure ;cdecl;
      _gtk_reserved8 : procedure ;cdecl;
    end;


function gtk_sorter_compare(self:PGtkSorter; item1:Tgpointer; item2:Tgpointer):TGtkOrdering;cdecl;external libgtk4;
function gtk_sorter_get_order(self:PGtkSorter):TGtkSorterOrder;cdecl;external libgtk4;
{ for sorter implementations  }
procedure gtk_sorter_changed(self:PGtkSorter; change:TGtkSorterChange);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:24:47 ===

function GTK_TYPE_SORTER: TGType;
function GTK_SORTER(obj: Pointer): PGtkSorter;
function GTK_IS_SORTER(obj: Pointer): Tgboolean;
function GTK_SORTER_CLASS(klass: Pointer): PGtkSorterClass;
function GTK_IS_SORTER_CLASS(klass: Pointer): Tgboolean;
function GTK_SORTER_GET_CLASS(obj: Pointer): PGtkSorterClass;

implementation

function GTK_TYPE_SORTER: TGType;
begin
  Result := gtk_sorter_get_type;
end;

function GTK_SORTER(obj: Pointer): PGtkSorter;
begin
  Result := PGtkSorter(g_type_check_instance_cast(obj, GTK_TYPE_SORTER));
end;

function GTK_IS_SORTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SORTER);
end;

function GTK_SORTER_CLASS(klass: Pointer): PGtkSorterClass;
begin
  Result := PGtkSorterClass(g_type_check_class_cast(klass, GTK_TYPE_SORTER));
end;

function GTK_IS_SORTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_SORTER);
end;

function GTK_SORTER_GET_CLASS(obj: Pointer): PGtkSorterClass;
begin
  Result := PGtkSorterClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TGtkSorter = record
    parent_instance: TGObject;
  end;
  PGtkSorter = ^TGtkSorter;

  PGtkSorterClass = type Pointer;

function gtk_sorter_get_type: TGType; cdecl; external libgxxxxxxx;



end.
