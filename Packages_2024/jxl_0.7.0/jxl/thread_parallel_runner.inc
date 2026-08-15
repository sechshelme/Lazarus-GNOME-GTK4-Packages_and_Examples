{$IFDEF read_interface}


function JxlThreadParallelRunner(runner_opaque: pointer; jpegxl_opaque: pointer; init: TJxlParallelRunInit; func: TJxlParallelRunFunction; start_range: Tuint32_t;
  end_range: Tuint32_t): TJxlParallelRetCode; cdecl; external libjxl_threads;
function JxlThreadParallelRunnerCreate(memory_manager: PJxlMemoryManager; num_worker_threads: Tsize_t): pointer; cdecl; external libjxl_threads;
procedure JxlThreadParallelRunnerDestroy(runner_opaque: pointer); cdecl; external libjxl_threads;
function JxlThreadParallelRunnerDefaultNumWorkerThreads: Tsize_t; cdecl; external libjxl_threads;

// === Konventiert am: 14-8-26 19:27:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
