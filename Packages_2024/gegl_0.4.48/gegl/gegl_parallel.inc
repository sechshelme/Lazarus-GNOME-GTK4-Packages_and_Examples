

  {$IFDEF read_struct}
type
  TGeglParallelDistributeFunc = procedure(i: Tgint; n: Tgint; user_data: Tgpointer); cdecl;
  TGeglParallelDistributeRangeFunc = procedure(offset: Tgsize; size: Tgsize; user_data: Tgpointer); cdecl;
  TGeglParallelDistributeAreaFunc = procedure(area: PGeglRectangle; user_data: Tgpointer); cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
procedure gegl_parallel_distribute(max_n: Tgint; func: TGeglParallelDistributeFunc; user_data: Tgpointer); cdecl; external libgegl;
procedure gegl_parallel_distribute_range(size: Tgsize; thread_cost: Tgdouble; func: TGeglParallelDistributeRangeFunc; user_data: Tgpointer); cdecl; external libgegl;
procedure gegl_parallel_distribute_area(area: PGeglRectangle; thread_cost: Tgdouble; split_strategy: TGeglSplitStrategy; func: TGeglParallelDistributeAreaFunc; user_data: Tgpointer); cdecl; external libgegl;
{$ENDIF read_function}

// === Konventiert am: 12-8-26 15:25:20 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
