unit thread_parallel_runner;

interface

uses
  fp_jxl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (c) the JPEG XL Project Authors. All rights reserved.
 *
 * Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
  }
{* @addtogroup libjxl_threads
 * @
 * @file thread_parallel_runner.h
 * @brief implementation using std::thread of a ::JxlParallelRunner.
  }
{* Implementation of JxlParallelRunner than can be used to enable
 * multithreading when using the JPEG XL library. This uses std::thread
 * internally and related synchronization functions. The number of threads
 * created is fixed at construction time and the threads are re-used for every
 * ThreadParallelRunner::Runner call. Only one concurrent
 * JxlThreadParallelRunner call per instance is allowed at a time.
 *
 * This is a scalable, lower-overhead thread pool runner, especially suitable
 * for data-parallel computations in the fork-join model, where clients need to
 * know when all tasks have completed.
 *
 * This thread pool can efficiently load-balance millions of tasks using an
 * atomic counter, thus avoiding per-task virtual or system calls. With 48
 * hyperthreads and 1M tasks that add to an atomic counter, overall runtime is
 * 10-20x higher when using std::async, and ~200x for a queue-based thread
  }
{$ifndef JXL_THREAD_PARALLEL_RUNNER_H_}
{$define JXL_THREAD_PARALLEL_RUNNER_H_}
{$include <stddef.h>}
{$include <stdint.h>}
{$include <stdio.h>}
{$include <stdlib.h>}
{$include "jxl/jxl_threads_export.h"}
{$include "jxl/memory_manager.h"}
{$include "jxl/parallel_runner.h"}
{ /usr/lib/x86_64-linux-gnu/libjxl_threads.so   ???????????????????? }

function JxlThreadParallelRunner(runner_opaque:pointer; jpegxl_opaque:pointer; init:TJxlParallelRunInit; func:TJxlParallelRunFunction; start_range:Tuint32_t; 
           end_range:Tuint32_t):TJxlParallelRetCode;cdecl;external libjxl_threads;
{* Creates the runner for JxlThreadParallelRunner. Use as the opaque
 * runner.
  }
function JxlThreadParallelRunnerCreate(memory_manager:PJxlMemoryManager; num_worker_threads:Tsize_t):pointer;cdecl;external libjxl_threads;
{* Destroys the runner created by JxlThreadParallelRunnerCreate.
  }
procedure JxlThreadParallelRunnerDestroy(runner_opaque:pointer);cdecl;external libjxl_threads;
{* Returns a default num_worker_threads value for
 * JxlThreadParallelRunnerCreate.
  }
function JxlThreadParallelRunnerDefaultNumWorkerThreads:Tsize_t;cdecl;external libjxl_threads;
{* @ }

// === Konventiert am: 14-8-26 19:27:48 ===


implementation



end.
