{$IFDEF read_interface}


procedure g_qsort_with_data(pbase: Tgconstpointer; total_elems: Tgint; size: Tgsize; compare_func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libglib2; deprecated;
procedure g_sort_array(arr: pointer; n_elements: Tsize_t; element_size: Tsize_t; compare_func: TGCompareDataFunc; user_data: pointer); cdecl; external libglib2;

// === Konventiert am: 22-6-26 17:16:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
