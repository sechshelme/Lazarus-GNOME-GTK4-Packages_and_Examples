unit gtkbitset;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$IFDEF read_function}
function gtk_bitset_get_type: TGType; cdecl; external libgtk4;
function gtk_bitset_ref(self: PGtkBitset): PGtkBitset; cdecl; external libgtk4;
procedure gtk_bitset_unref(self: PGtkBitset); cdecl; external libgtk4;
function gtk_bitset_contains(self: PGtkBitset; value: Tguint): Tgboolean; cdecl; external libgtk4;
function gtk_bitset_is_empty(self: PGtkBitset): Tgboolean; cdecl; external libgtk4;
function gtk_bitset_equals(self: PGtkBitset; other: PGtkBitset): Tgboolean; cdecl; external libgtk4;
function gtk_bitset_get_size(self: PGtkBitset): Tguint64; cdecl; external libgtk4;
function gtk_bitset_get_size_in_range(self: PGtkBitset; first: Tguint; last: Tguint): Tguint64; cdecl; external libgtk4;
function gtk_bitset_get_nth(self: PGtkBitset; nth: Tguint): Tguint; cdecl; external libgtk4;
function gtk_bitset_get_minimum(self: PGtkBitset): Tguint; cdecl; external libgtk4;
function gtk_bitset_get_maximum(self: PGtkBitset): Tguint; cdecl; external libgtk4;
function gtk_bitset_new_empty: PGtkBitset; cdecl; external libgtk4;
function gtk_bitset_copy(self: PGtkBitset): PGtkBitset; cdecl; external libgtk4;
function gtk_bitset_new_range(start: Tguint; n_items: Tguint): PGtkBitset; cdecl; external libgtk4;
procedure gtk_bitset_remove_all(self: PGtkBitset); cdecl; external libgtk4;
function gtk_bitset_add(self: PGtkBitset; value: Tguint): Tgboolean; cdecl; external libgtk4;
function gtk_bitset_remove(self: PGtkBitset; value: Tguint): Tgboolean; cdecl; external libgtk4;
procedure gtk_bitset_add_range(self: PGtkBitset; start: Tguint; n_items: Tguint); cdecl; external libgtk4;
procedure gtk_bitset_remove_range(self: PGtkBitset; start: Tguint; n_items: Tguint); cdecl; external libgtk4;
procedure gtk_bitset_add_range_closed(self: PGtkBitset; first: Tguint; last: Tguint); cdecl; external libgtk4;
procedure gtk_bitset_remove_range_closed(self: PGtkBitset; first: Tguint; last: Tguint); cdecl; external libgtk4;
procedure gtk_bitset_add_rectangle(self: PGtkBitset; start: Tguint; width: Tguint; height: Tguint; stride: Tguint); cdecl; external libgtk4;
procedure gtk_bitset_remove_rectangle(self: PGtkBitset; start: Tguint; width: Tguint; height: Tguint; stride: Tguint); cdecl; external libgtk4;
procedure gtk_bitset_union(self: PGtkBitset; other: PGtkBitset); cdecl; external libgtk4;
procedure gtk_bitset_intersect(self: PGtkBitset; other: PGtkBitset); cdecl; external libgtk4;
procedure gtk_bitset_subtract(self: PGtkBitset; other: PGtkBitset); cdecl; external libgtk4;
procedure gtk_bitset_difference(self: PGtkBitset; other: PGtkBitset); cdecl; external libgtk4;
procedure gtk_bitset_shift_left(self: PGtkBitset; amount: Tguint); cdecl; external libgtk4;
procedure gtk_bitset_shift_right(self: PGtkBitset; amount: Tguint); cdecl; external libgtk4;
procedure gtk_bitset_splice(self: PGtkBitset; position: Tguint; removed: Tguint; added: Tguint); cdecl; external libgtk4;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  PGtkBitsetIter = ^TGtkBitsetIter;
  TGtkBitsetIter = record
    private_data: array[0..9] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_bitset_iter_get_type: TGType; cdecl; external libgtk4;
function gtk_bitset_iter_init_first(iter: PGtkBitsetIter; set_: PGtkBitset; value: Pguint): Tgboolean; cdecl; external libgtk4;
function gtk_bitset_iter_init_last(iter: PGtkBitsetIter; set_: PGtkBitset; value: Pguint): Tgboolean; cdecl; external libgtk4;
function gtk_bitset_iter_init_at(iter: PGtkBitsetIter; set_: PGtkBitset; target: Tguint; value: Pguint): Tgboolean; cdecl; external libgtk4;
function gtk_bitset_iter_next(iter: PGtkBitsetIter; value: Pguint): Tgboolean; cdecl; external libgtk4;
function gtk_bitset_iter_previous(iter: PGtkBitsetIter; value: Pguint): Tgboolean; cdecl; external libgtk4;
function gtk_bitset_iter_get_value(iter: PGtkBitsetIter): Tguint; cdecl; external libgtk4;
function gtk_bitset_iter_is_valid(iter: PGtkBitsetIter): Tgboolean; cdecl; external libgtk4;

function GTK_TYPE_BITSET: TGType;
{$ENDIF read_function}

// === Konventiert am: 5-7-26 19:15:48 ===


implementation


function GTK_TYPE_BITSET: TGType;
begin
  GTK_TYPE_BITSET := gtk_bitset_get_type;
end;


end.
