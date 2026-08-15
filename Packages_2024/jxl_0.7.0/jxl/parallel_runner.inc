{$IFDEF read_interface}


type
  PJxlParallelRetCode = ^TJxlParallelRetCode;
  TJxlParallelRetCode = longint;
const
  JXL_PARALLEL_RET_RUNNER_ERROR = -(1);

type
  TJxlParallelRunInit = function(jpegxl_opaque: pointer; num_threads: Tsize_t): TJxlParallelRetCode; cdecl;
  TJxlParallelRunFunction = procedure(jpegxl_opaque: pointer; value: Tuint32_t; thread_id: Tsize_t); cdecl;
  TJxlParallelRunner = function(runner_opaque: pointer; jpegxl_opaque: pointer; init: TJxlParallelRunInit; func: TJxlParallelRunFunction; start_range: Tuint32_t; end_range: Tuint32_t): TJxlParallelRetCode; cdecl;

  // === Konventiert am: 14-8-26 19:28:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
