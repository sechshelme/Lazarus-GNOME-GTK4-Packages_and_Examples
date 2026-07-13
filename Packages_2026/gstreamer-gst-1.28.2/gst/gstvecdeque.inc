

  {$IFDEF read_struct}
type
  PGstVecDeque = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_vec_deque_new(initial_size: Tgsize): PGstVecDeque; cdecl; external libgstreamer;
procedure gst_vec_deque_free(arr: PGstVecDeque); cdecl; external libgstreamer;
procedure gst_vec_deque_set_clear_func(arr: PGstVecDeque; clear_func: TGDestroyNotify); cdecl; external libgstreamer;
procedure gst_vec_deque_clear(arr: PGstVecDeque); cdecl; external libgstreamer;
function gst_vec_deque_pop_head(arr: PGstVecDeque): Tgpointer; cdecl; external libgstreamer;
function gst_vec_deque_peek_head(arr: PGstVecDeque): Tgpointer; cdecl; external libgstreamer;
function gst_vec_deque_peek_nth(arr: PGstVecDeque; idx: Tgsize): Tgpointer; cdecl; external libgstreamer;
function gst_vec_deque_pop_tail(arr: PGstVecDeque): Tgpointer; cdecl; external libgstreamer;
function gst_vec_deque_peek_tail(arr: PGstVecDeque): Tgpointer; cdecl; external libgstreamer;
procedure gst_vec_deque_push_tail(arr: PGstVecDeque; data: Tgpointer); cdecl; external libgstreamer;
function gst_vec_deque_is_empty(arr: PGstVecDeque): Tgboolean; cdecl; external libgstreamer;
function gst_vec_deque_drop_element(arr: PGstVecDeque; idx: Tgsize): Tgpointer; cdecl; external libgstreamer;
function gst_vec_deque_find(arr: PGstVecDeque; func: TGCompareFunc; data: Tgpointer): Tgsize; cdecl; external libgstreamer;
function gst_vec_deque_get_length(arr: PGstVecDeque): Tgsize; cdecl; external libgstreamer;

function gst_vec_deque_new_for_struct(struct_size: Tgsize; initial_size: Tgsize): PGstVecDeque; cdecl; external libgstreamer;
procedure gst_vec_deque_push_tail_struct(arr: PGstVecDeque; p_struct: Tgpointer); cdecl; external libgstreamer;
function gst_vec_deque_pop_head_struct(arr: PGstVecDeque): Tgpointer; cdecl; external libgstreamer;
function gst_vec_deque_peek_head_struct(arr: PGstVecDeque): Tgpointer; cdecl; external libgstreamer;
function gst_vec_deque_peek_nth_struct(arr: PGstVecDeque; idx: Tgsize): Tgpointer; cdecl; external libgstreamer;
function gst_vec_deque_drop_struct(arr: PGstVecDeque; idx: Tgsize; p_struct: Tgpointer): Tgboolean; cdecl; external libgstreamer;
function gst_vec_deque_pop_tail_struct(arr: PGstVecDeque): Tgpointer; cdecl; external libgstreamer;
function gst_vec_deque_peek_tail_struct(arr: PGstVecDeque): Tgpointer; cdecl; external libgstreamer;
procedure gst_vec_deque_push_sorted(arr: PGstVecDeque; data: Tgpointer; func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libgstreamer;
procedure gst_vec_deque_push_sorted_struct(arr: PGstVecDeque; p_struct: Tgpointer; func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libgstreamer;
procedure gst_vec_deque_sort(arr: PGstVecDeque; compare_func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libgstreamer;
{$ENDIF read_function}

// === Konventiert am: 11-7-26 15:53:53 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
