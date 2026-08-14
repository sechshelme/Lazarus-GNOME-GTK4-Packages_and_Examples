
unit resizable_parallel_runner;
interface

{
  Automatically converted by H2Pas 1.0.0 from resizable_parallel_runner.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    resizable_parallel_runner.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PJxlMemoryManager  = ^JxlMemoryManager;
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
 * @file resizable_parallel_runner.h
 * @brief implementation using std::thread of a resizeable ::JxlParallelRunner.
  }
{* Implementation of JxlParallelRunner than can be used to enable
 * multithreading when using the JPEG XL library. This uses std::thread
 * internally and related synchronization functions. The number of threads
 * created can be changed after creation of the thread pool; the threads
 * (including the main thread) are re-used for every
 * ResizableParallelRunner::Runner call. Only one concurrent
 * JxlResizableParallelRunner call per instance is allowed at a time.
 *
 * This is a scalable, lower-overhead thread pool runner, especially suitable
 * for data-parallel computations in the fork-join model, where clients need to
 * know when all tasks have completed.
 *
 * Compared to the implementation in @ref thread_parallel_runner.h, this
 * implementation is tuned for execution on lower-powered systems, including
 * for example ARM CPUs with big.LITTLE computation models.
  }
{$ifndef JXL_RESIZABLE_PARALLEL_RUNNER_H_}
{$define JXL_RESIZABLE_PARALLEL_RUNNER_H_}
{$include <stddef.h>}
{$include <stdint.h>}
{$include <stdio.h>}
{$include <stdlib.h>}
{$include "jxl/jxl_threads_export.h"}
{$include "jxl/memory_manager.h"}
{$include "jxl/parallel_runner.h"}
{ /usr/lib/x86_64-linux-gnu/libjxl_threads.so   ???????????????????? }
{* Parallel runner internally using std::thread. Use as JxlParallelRunner.
  }

function JxlResizableParallelRunner(runner_opaque:pointer; jpegxl_opaque:pointer; init:TJxlParallelRunInit; func:TJxlParallelRunFunction; start_range:Tuint32_t; 
           end_range:Tuint32_t):TJxlParallelRetCode;cdecl;external;
{* Creates the runner for JxlResizableParallelRunner. Use as the opaque
 * runner. The runner will execute tasks on the calling thread until
 * @ref JxlResizableParallelRunnerSetThreads is called.
  }
(* Const before type ignored *)
function JxlResizableParallelRunnerCreate(memory_manager:PJxlMemoryManager):pointer;cdecl;external;
{* Changes the number of threads for JxlResizableParallelRunner.
  }
procedure JxlResizableParallelRunnerSetThreads(runner_opaque:pointer; num_threads:Tsize_t);cdecl;external;
{* Suggests a number of threads to use for an image of given size.
  }
function JxlResizableParallelRunnerSuggestThreads(xsize:Tuint64_t; ysize:Tuint64_t):Tuint32_t;cdecl;external;
{* Destroys the runner created by JxlResizableParallelRunnerCreate.
  }
procedure JxlResizableParallelRunnerDestroy(runner_opaque:pointer);cdecl;external;
{* @ }

implementation


end.
