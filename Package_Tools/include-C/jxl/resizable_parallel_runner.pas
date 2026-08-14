unit resizable_parallel_runner;

interface

uses
  fp_jxl, parallel_runner, memory_manager;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function JxlResizableParallelRunner(runner_opaque: pointer; jpegxl_opaque: pointer; init: TJxlParallelRunInit; func: TJxlParallelRunFunction; start_range: Tuint32_t;
  end_range: Tuint32_t): TJxlParallelRetCode; cdecl; external libjxl_threads;
function JxlResizableParallelRunnerCreate(memory_manager: PJxlMemoryManager): pointer; cdecl; external libjxl_threads;
procedure JxlResizableParallelRunnerSetThreads(runner_opaque: pointer; num_threads: Tsize_t); cdecl; external libjxl_threads;
function JxlResizableParallelRunnerSuggestThreads(xsize: Tuint64_t; ysize: Tuint64_t): Tuint32_t; cdecl; external libjxl_threads;
procedure JxlResizableParallelRunnerDestroy(runner_opaque: pointer); cdecl; external libjxl_threads;

// === Konventiert am: 14-8-26 19:27:52 ===


implementation



end.
