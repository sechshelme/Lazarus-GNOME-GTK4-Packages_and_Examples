
unit gtkbitset;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkbitset.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkbitset.h
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
PGtkBitset  = ^GtkBitset;
PGtkBitsetIter  = ^GtkBitsetIter;
Pguint  = ^guint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2020 Benjamin Otte
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
 * Authors: Benjamin Otte <otte@gnome.org>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtktypes.h>}

{ was #define dname def_expr }
function GTK_TYPE_BITSET : longint; { return type might be wrong }

function gtk_bitset_get_type:TGType;cdecl;external;
function gtk_bitset_ref(self:PGtkBitset):PGtkBitset;cdecl;external;
procedure gtk_bitset_unref(self:PGtkBitset);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkBitset, gtk_bitset_unref) }
(* Const before type ignored *)
function gtk_bitset_contains(self:PGtkBitset; value:Tguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_bitset_is_empty(self:PGtkBitset):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_bitset_equals(self:PGtkBitset; other:PGtkBitset):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_bitset_get_size(self:PGtkBitset):Tguint64;cdecl;external;
(* Const before type ignored *)
function gtk_bitset_get_size_in_range(self:PGtkBitset; first:Tguint; last:Tguint):Tguint64;cdecl;external;
(* Const before type ignored *)
function gtk_bitset_get_nth(self:PGtkBitset; nth:Tguint):Tguint;cdecl;external;
(* Const before type ignored *)
function gtk_bitset_get_minimum(self:PGtkBitset):Tguint;cdecl;external;
(* Const before type ignored *)
function gtk_bitset_get_maximum(self:PGtkBitset):Tguint;cdecl;external;
function gtk_bitset_new_empty:PGtkBitset;cdecl;external;
(* Const before type ignored *)
function gtk_bitset_copy(self:PGtkBitset):PGtkBitset;cdecl;external;
function gtk_bitset_new_range(start:Tguint; n_items:Tguint):PGtkBitset;cdecl;external;
procedure gtk_bitset_remove_all(self:PGtkBitset);cdecl;external;
function gtk_bitset_add(self:PGtkBitset; value:Tguint):Tgboolean;cdecl;external;
function gtk_bitset_remove(self:PGtkBitset; value:Tguint):Tgboolean;cdecl;external;
procedure gtk_bitset_add_range(self:PGtkBitset; start:Tguint; n_items:Tguint);cdecl;external;
procedure gtk_bitset_remove_range(self:PGtkBitset; start:Tguint; n_items:Tguint);cdecl;external;
procedure gtk_bitset_add_range_closed(self:PGtkBitset; first:Tguint; last:Tguint);cdecl;external;
procedure gtk_bitset_remove_range_closed(self:PGtkBitset; first:Tguint; last:Tguint);cdecl;external;
procedure gtk_bitset_add_rectangle(self:PGtkBitset; start:Tguint; width:Tguint; height:Tguint; stride:Tguint);cdecl;external;
procedure gtk_bitset_remove_rectangle(self:PGtkBitset; start:Tguint; width:Tguint; height:Tguint; stride:Tguint);cdecl;external;
(* Const before type ignored *)
procedure gtk_bitset_union(self:PGtkBitset; other:PGtkBitset);cdecl;external;
(* Const before type ignored *)
procedure gtk_bitset_intersect(self:PGtkBitset; other:PGtkBitset);cdecl;external;
(* Const before type ignored *)
procedure gtk_bitset_subtract(self:PGtkBitset; other:PGtkBitset);cdecl;external;
(* Const before type ignored *)
procedure gtk_bitset_difference(self:PGtkBitset; other:PGtkBitset);cdecl;external;
procedure gtk_bitset_shift_left(self:PGtkBitset; amount:Tguint);cdecl;external;
procedure gtk_bitset_shift_right(self:PGtkBitset; amount:Tguint);cdecl;external;
procedure gtk_bitset_splice(self:PGtkBitset; position:Tguint; removed:Tguint; added:Tguint);cdecl;external;
{*
 * GtkBitsetIter:
 *
 * Iterates over the elements of a [struct@Gtk.Bitset].
 *
 * `GtkBitSetIter is an opaque, stack-allocated struct.
 *
 * Before a `GtkBitsetIter` can be used, it needs to be initialized with
 * [func@Gtk.BitsetIter.init_first], [func@Gtk.BitsetIter.init_last]
 * or [func@Gtk.BitsetIter.init_at].
  }
type
{< private > }
  PGtkBitsetIter = ^TGtkBitsetIter;
  TGtkBitsetIter = record
      private_data : array[0..9] of Tgpointer;
    end;


function gtk_bitset_iter_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gtk_bitset_iter_init_first(iter:PGtkBitsetIter; set:PGtkBitset; value:Pguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_bitset_iter_init_last(iter:PGtkBitsetIter; set:PGtkBitset; value:Pguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_bitset_iter_init_at(iter:PGtkBitsetIter; set:PGtkBitset; target:Tguint; value:Pguint):Tgboolean;cdecl;external;
function gtk_bitset_iter_next(iter:PGtkBitsetIter; value:Pguint):Tgboolean;cdecl;external;
function gtk_bitset_iter_previous(iter:PGtkBitsetIter; value:Pguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_bitset_iter_get_value(iter:PGtkBitsetIter):Tguint;cdecl;external;
(* Const before type ignored *)
function gtk_bitset_iter_is_valid(iter:PGtkBitsetIter):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_BITSET : longint; { return type might be wrong }
  begin
    GTK_TYPE_BITSET:=gtk_bitset_get_type;
  end;


end.
