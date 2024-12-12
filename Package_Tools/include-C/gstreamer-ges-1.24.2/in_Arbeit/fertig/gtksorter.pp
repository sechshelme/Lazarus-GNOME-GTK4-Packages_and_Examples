
unit gtksorter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksorter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksorter.h
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
PGtkSorterChange  = ^GtkSorterChange;
PGtkSorterOrder  = ^GtkSorterOrder;
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

{ was #define dname def_expr }
function GTK_TYPE_SORTER : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (GtkSorter, gtk_sorter, GTK, SORTER, GObject) }
{*
 * GtkSorterClass
 * @compare: Compare two items. See gtk_sorter_compare() for details.
 * @get_order: Get the `GtkSorderOrder` that applies to the current sorter.
 *   If unimplemented, it returns %GTK_SORTER_ORDER_PARTIAL.
 *
 * The virtual table for `GtkSorter`.
  }

implementation

{ was #define dname def_expr }
function GTK_TYPE_SORTER : longint; { return type might be wrong }
  begin
    GTK_TYPE_SORTER:=gtk_sorter_get_type;
  end;


end.
