
{$IFDEF read_interface}


procedure g_qsort_with_data(pbase: Tgconstpointer; total_elems: Tgint; size: Tgsize; compare_func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libglib2;

// === Konventiert am: 11-8-24 19:32:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
