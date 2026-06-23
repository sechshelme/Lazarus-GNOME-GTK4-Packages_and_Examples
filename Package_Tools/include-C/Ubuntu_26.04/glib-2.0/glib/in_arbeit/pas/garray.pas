unit garray;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGBytes = type Pointer;

  PGArray = ^TGArray;
  TGArray = record
    data: Pgchar;
    len: Tguint;
  end;

  PGByteArray = ^TGByteArray;
  TGByteArray = record
    data: Pguint8;
    len: Tguint;
  end;

  PGPtrArray = ^TGPtrArray;
  TGPtrArray = record
    pdata: Pgpointer;
    len: Tguint;
  end;

function g_array_new(zero_terminated: Tgboolean; clear_: Tgboolean; element_size: Tguint): PGArray; cdecl; external libglib2;
function g_array_new_take(data: Tgpointer; len: Tgsize; clear: Tgboolean; element_size: Tgsize): PGArray; cdecl; external libglib2;
function g_array_new_take_zero_terminated(data: Tgpointer; clear: Tgboolean; element_size: Tgsize): PGArray; cdecl; external libglib2;
function g_array_steal(arr: PGArray; len: Pgsize): Tgpointer; cdecl; external libglib2;
function g_array_sized_new(zero_terminated: Tgboolean; clear_: Tgboolean; element_size: Tguint; reserved_size: Tguint): PGArray; cdecl; external libglib2;
function g_array_copy(arr: PGArray): PGArray; cdecl; external libglib2;
function g_array_free(arr: PGArray; free_segment: Tgboolean): Pgchar; cdecl; external libglib2;
function g_array_ref(arr: PGArray): PGArray; cdecl; external libglib2;
procedure g_array_unref(arr: PGArray); cdecl; external libglib2;
function g_array_get_element_size(arr: PGArray): Tguint; cdecl; external libglib2;
function g_array_append_vals(arr: PGArray; data: Tgconstpointer; len: Tguint): PGArray; cdecl; external libglib2;
function g_array_prepend_vals(arr: PGArray; data: Tgconstpointer; len: Tguint): PGArray; cdecl; external libglib2;
function g_array_insert_vals(arr: PGArray; index_: Tguint; data: Tgconstpointer; len: Tguint): PGArray; cdecl; external libglib2;
function g_array_set_size(arr: PGArray; length: Tguint): PGArray; cdecl; external libglib2;
function g_array_remove_index(arr: PGArray; index_: Tguint): PGArray; cdecl; external libglib2;
function g_array_remove_index_fast(arr: PGArray; index_: Tguint): PGArray; cdecl; external libglib2;
function g_array_remove_range(arr: PGArray; index_: Tguint; length: Tguint): PGArray; cdecl; external libglib2;
procedure g_array_sort(arr: PGArray; compare_func: TGCompareFunc); cdecl; external libglib2;
procedure g_array_sort_with_data(arr: PGArray; compare_func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libglib2;
function g_array_binary_search(arr: PGArray; target: Tgconstpointer; compare_func: TGCompareFunc; out_match_index: Pguint): Tgboolean; cdecl; external libglib2;
procedure g_array_set_clear_func(arr: PGArray; clear_func: TGDestroyNotify); cdecl; external libglib2;

function g_ptr_array_new: PGPtrArray; cdecl; external libglib2;
function g_ptr_array_new_with_free_func(element_free_func: TGDestroyNotify): PGPtrArray; cdecl; external libglib2;
function g_ptr_array_new_take(data: Pgpointer; len: Tgsize; element_free_func: TGDestroyNotify): PGPtrArray; cdecl; external libglib2;
function g_ptr_array_new_from_array(data: Pgpointer; len: Tgsize; copy_func: TGCopyFunc; copy_func_user_data: Tgpointer; element_free_func: TGDestroyNotify): PGPtrArray; cdecl; external libglib2;
function g_ptr_array_steal(arr: PGPtrArray; len: Pgsize): Pgpointer; cdecl; external libglib2;
function g_ptr_array_copy(arr: PGPtrArray; func: TGCopyFunc; user_data: Tgpointer): PGPtrArray; cdecl; external libglib2;
function g_ptr_array_sized_new(reserved_size: Tguint): PGPtrArray; cdecl; external libglib2;
function g_ptr_array_new_full(reserved_size: Tguint; element_free_func: TGDestroyNotify): PGPtrArray; cdecl; external libglib2;
function g_ptr_array_new_null_terminated(reserved_size: Tguint; element_free_func: TGDestroyNotify; null_terminated: Tgboolean): PGPtrArray; cdecl; external libglib2;
function g_ptr_array_new_take_null_terminated(data: Pgpointer; element_free_func: TGDestroyNotify): PGPtrArray; cdecl; external libglib2;
function g_ptr_array_new_from_null_terminated_array(data: Pgpointer; copy_func: TGCopyFunc; copy_func_user_data: Tgpointer; element_free_func: TGDestroyNotify): PGPtrArray; cdecl; external libglib2;
function g_ptr_array_free(arr: PGPtrArray; free_segment: Tgboolean): Pgpointer; cdecl; external libglib2;
function g_ptr_array_ref(arr: PGPtrArray): PGPtrArray; cdecl; external libglib2;
procedure g_ptr_array_unref(arr: PGPtrArray); cdecl; external libglib2;
procedure g_ptr_array_set_free_func(arr: PGPtrArray; element_free_func: TGDestroyNotify); cdecl; external libglib2;
procedure g_ptr_array_set_size(arr: PGPtrArray; length: Tgint); cdecl; external libglib2;
function g_ptr_array_remove_index(arr: PGPtrArray; index_: Tguint): Tgpointer; cdecl; external libglib2;
function g_ptr_array_remove_index_fast(arr: PGPtrArray; index_: Tguint): Tgpointer; cdecl; external libglib2;
function g_ptr_array_steal_index(arr: PGPtrArray; index_: Tguint): Tgpointer; cdecl; external libglib2;
function g_ptr_array_steal_index_fast(arr: PGPtrArray; index_: Tguint): Tgpointer; cdecl; external libglib2;
function g_ptr_array_remove(arr: PGPtrArray; data: Tgpointer): Tgboolean; cdecl; external libglib2;
function g_ptr_array_remove_fast(arr: PGPtrArray; data: Tgpointer): Tgboolean; cdecl; external libglib2;
function g_ptr_array_remove_range(arr: PGPtrArray; index_: Tguint; length: Tguint): PGPtrArray; cdecl; external libglib2;
procedure g_ptr_array_add(arr: PGPtrArray; data: Tgpointer); cdecl; external libglib2;
procedure g_ptr_array_extend(array_to_extend: PGPtrArray; arr: PGPtrArray; func: TGCopyFunc; user_data: Tgpointer); cdecl; external libglib2;
procedure g_ptr_array_extend_and_steal(array_to_extend: PGPtrArray; arr: PGPtrArray); cdecl; external libglib2;
procedure g_ptr_array_insert(arr: PGPtrArray; index_: Tgint; data: Tgpointer); cdecl; external libglib2;
procedure g_ptr_array_sort(arr: PGPtrArray; compare_func: TGCompareFunc); cdecl; external libglib2;
procedure g_ptr_array_sort_with_data(arr: PGPtrArray; compare_func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libglib2;
procedure g_ptr_array_sort_values(arr: PGPtrArray; compare_func: TGCompareFunc); cdecl; external libglib2;
procedure g_ptr_array_sort_values_with_data(arr: PGPtrArray; compare_func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libglib2;
procedure g_ptr_array_foreach(arr: PGPtrArray; func: TGFunc; user_data: Tgpointer); cdecl; external libglib2;
function g_ptr_array_find(haystack: PGPtrArray; needle: Tgconstpointer; index_: Pguint): Tgboolean; cdecl; external libglib2;
function g_ptr_array_find_with_equal_func(haystack: PGPtrArray; needle: Tgconstpointer; equal_func: TGEqualFunc; index_: Pguint): Tgboolean; cdecl; external libglib2;
function g_ptr_array_is_null_terminated(arr: PGPtrArray): Tgboolean; cdecl; external libglib2;

function g_byte_array_new: PGByteArray; cdecl; external libglib2;
function g_byte_array_new_take(data: Pguint8; len: Tgsize): PGByteArray; cdecl; external libglib2;
function g_byte_array_steal(arr: PGByteArray; len: Pgsize): Pguint8; cdecl; external libglib2;
function g_byte_array_sized_new(reserved_size: Tguint): PGByteArray; cdecl; external libglib2;
function g_byte_array_free(arr: PGByteArray; free_segment: Tgboolean): Pguint8; cdecl; external libglib2;
function g_byte_array_free_to_bytes(arr: PGByteArray): PGBytes; cdecl; external libglib2;
function g_byte_array_ref(arr: PGByteArray): PGByteArray; cdecl; external libglib2;
procedure g_byte_array_unref(arr: PGByteArray); cdecl; external libglib2;
function g_byte_array_append(arr: PGByteArray; data: Pguint8; len: Tguint): PGByteArray; cdecl; external libglib2;
function g_byte_array_prepend(arr: PGByteArray; data: Pguint8; len: Tguint): PGByteArray; cdecl; external libglib2;
function g_byte_array_set_size(arr: PGByteArray; length: Tguint): PGByteArray; cdecl; external libglib2;
function g_byte_array_remove_index(arr: PGByteArray; index_: Tguint): PGByteArray; cdecl; external libglib2;
function g_byte_array_remove_index_fast(arr: PGByteArray; index_: Tguint): PGByteArray; cdecl; external libglib2;
function g_byte_array_remove_range(arr: PGByteArray; index_: Tguint; length: Tguint): PGByteArray; cdecl; external libglib2;
procedure g_byte_array_sort(arr: PGByteArray; compare_func: TGCompareFunc); cdecl; external libglib2;
procedure g_byte_array_sort_with_data(arr: PGByteArray; compare_func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libglib2;

{ #define g_array_index(a,t,i)      (((t*) (void *) (a)->data) [(i)]) }
function g_array_append_val(a: PGArray; const v): PGArray;
function g_array_prepend_val(a: PGArray; const v): PGArray;
function g_array_insert_val(a: PGArray; i: Tguint; const v): PGArray;
function g_ptr_array_index(parray: PGPtrArray; index: Tguint): Tgpointer;


// === Konventiert am: 22-6-26 16:00:31 ===


implementation

function g_array_append_val(a: PGArray; const v): PGArray;
begin
  Result := g_array_append_vals(a, @v, 1);
end;

function g_array_prepend_val(a: PGArray; const v): PGArray;
begin
  Result := g_array_prepend_vals(a, @v, 1);
end;

function g_array_insert_val(a: PGArray; i: Tguint; const v): PGArray;
begin
  Result := g_array_insert_vals(a, i, @v, 1);
end;

function g_ptr_array_index(parray: PGPtrArray; index: Tguint): Tgpointer;
begin
  g_ptr_array_index := parray^.pdata[index];
end;

end.
