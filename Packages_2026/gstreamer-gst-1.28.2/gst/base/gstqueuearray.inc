{$IFDEF read_interface}


type
  PGstQueueArray = type Pointer;

function gst_queue_array_new(initial_size: Tguint): PGstQueueArray; cdecl; external libgstbase; deprecated;
procedure gst_queue_array_free(arr: PGstQueueArray); cdecl; external libgstbase; deprecated;
procedure gst_queue_array_set_clear_func(arr: PGstQueueArray; clear_func: TGDestroyNotify); cdecl; external libgstbase; deprecated;
procedure gst_queue_array_clear(arr: PGstQueueArray); cdecl; external libgstbase; deprecated;
function gst_queue_array_pop_head(arr: PGstQueueArray): Tgpointer; cdecl; external libgstbase; deprecated;
function gst_queue_array_peek_head(arr: PGstQueueArray): Tgpointer; cdecl; external libgstbase; deprecated;
function gst_queue_array_peek_nth(arr: PGstQueueArray; idx: Tguint): Tgpointer; cdecl; external libgstbase; deprecated;
function gst_queue_array_pop_tail(arr: PGstQueueArray): Tgpointer; cdecl; external libgstbase; deprecated;
function gst_queue_array_peek_tail(arr: PGstQueueArray): Tgpointer; cdecl; external libgstbase; deprecated;
procedure gst_queue_array_push_tail(arr: PGstQueueArray; data: Tgpointer); cdecl; external libgstbase; deprecated;
function gst_queue_array_is_empty(arr: PGstQueueArray): Tgboolean; cdecl; external libgstbase; deprecated;
function gst_queue_array_drop_element(arr: PGstQueueArray; idx: Tguint): Tgpointer; cdecl; external libgstbase; deprecated;
function gst_queue_array_find(arr: PGstQueueArray; func: TGCompareFunc; data: Tgpointer): Tguint; cdecl; external libgstbase; deprecated;
function gst_queue_array_get_length(arr: PGstQueueArray): Tguint; cdecl; external libgstbase; deprecated;
function gst_queue_array_new_for_struct(struct_size: Tgsize; initial_size: Tguint): PGstQueueArray; cdecl; external libgstbase; deprecated;
procedure gst_queue_array_push_tail_struct(arr: PGstQueueArray; p_struct: Tgpointer); cdecl; external libgstbase; deprecated;
function gst_queue_array_pop_head_struct(arr: PGstQueueArray): Tgpointer; cdecl; external libgstbase; deprecated;
function gst_queue_array_peek_head_struct(arr: PGstQueueArray): Tgpointer; cdecl; external libgstbase; deprecated;
function gst_queue_array_peek_nth_struct(arr: PGstQueueArray; idx: Tguint): Tgpointer; cdecl; external libgstbase; deprecated;
function gst_queue_array_drop_struct(arr: PGstQueueArray; idx: Tguint; p_struct: Tgpointer): Tgboolean; cdecl; external libgstbase; deprecated;
function gst_queue_array_pop_tail_struct(arr: PGstQueueArray): Tgpointer; cdecl; external libgstbase; deprecated;
function gst_queue_array_peek_tail_struct(arr: PGstQueueArray): Tgpointer; cdecl; external libgstbase; deprecated;
procedure gst_queue_array_push_sorted(arr: PGstQueueArray; data: Tgpointer; func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libgstbase; deprecated;
procedure gst_queue_array_push_sorted_struct(arr: PGstQueueArray; p_struct: Tgpointer; func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libgstbase; deprecated;
procedure gst_queue_array_sort(arr: PGstQueueArray; compare_func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libgstbase; deprecated;

// === Konventiert am: 13-7-26 19:20:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
