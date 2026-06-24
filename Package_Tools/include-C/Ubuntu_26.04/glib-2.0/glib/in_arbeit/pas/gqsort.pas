unit gqsort;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure g_qsort_with_data(pbase: Tgconstpointer; total_elems: Tgint; size: Tgsize; compare_func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libglib2; deprecated;
procedure g_sort_array(arr: pointer; n_elements: Tsize_t; element_size: Tsize_t; compare_func: TGCompareDataFunc; user_data: pointer); cdecl; external libglib2;

// === Konventiert am: 22-6-26 17:16:51 ===


implementation



end.
