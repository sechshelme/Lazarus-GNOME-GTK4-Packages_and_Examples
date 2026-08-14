
unit butteraugli;
interface

{
  Automatically converted by H2Pas 1.0.0 from butteraugli.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    butteraugli
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
PJxlButteraugliApi  = ^JxlButteraugliApi;
PJxlButteraugliResult  = ^JxlButteraugliResult;
PJxlMemoryManager  = ^JxlMemoryManager;
PJxlPixelFormat  = ^JxlPixelFormat;
Psingle  = ^single;
Puint32_t  = ^uint32_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (c) the JPEG XL Project Authors. All rights reserved.
 *
 * Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
  }
{* @addtogroup libjxl_butteraugli
 * @
 * @file butteraugli.h
 * @brief Butteraugli API for JPEG XL.
  }
{$ifndef JXL_BUTTERAUGLI_H_}
{$define JXL_BUTTERAUGLI_H_}
{$include "jxl/jxl_export.h"}
{$include "jxl/memory_manager.h"}
{$include "jxl/parallel_runner.h"}
{$include "jxl/types.h"}
{*
 * Opaque structure that holds a butteraugli API.
 *
 * Allocated and initialized with JxlButteraugliApiCreate().
 * Cleaned up and deallocated with JxlButteraugliApiDestroy().
  }
type
  TJxlButteraugliApiStruct = TJxlButteraugliApi;
{*
 * Opaque structure that holds intermediary butteraugli results.
 *
 * Allocated and initialized with JxlButteraugliCompute().
 * Cleaned up and deallocated with JxlButteraugliResultDestroy().
  }
  TJxlButteraugliResultStruct = TJxlButteraugliResult;
{*
 * Deinitializes and frees JxlButteraugliResult instance.
 *
 * @param result instance to be cleaned up and deallocated.
  }

procedure JxlButteraugliResultDestroy(result:PJxlButteraugliResult);cdecl;external;
{*
 * Creates an instance of JxlButteraugliApi and initializes it.
 *
 * @p memory_manager will be used for all the library dynamic allocations made
 * from this instance. The parameter may be NULL, in which case the default
 * allocator will be used. See jxl/memory_manager.h for details.
 *
 * @param memory_manager custom allocator function. It may be NULL. The memory
 *        manager will be copied internally.
 * @return @c NULL if the instance can not be allocated or initialized
 * @return pointer to initialized JxlEncoder otherwise
  }
(* Const before type ignored *)
function JxlButteraugliApiCreate(memory_manager:PJxlMemoryManager):PJxlButteraugliApi;cdecl;external;
{*
 * Set the parallel runner for multithreading.
 *
 * @param api api instance.
 * @param parallel_runner function pointer to runner for multithreading. A
 * multithreaded runner should be set to reach fast performance.
 * @param parallel_runner_opaque opaque pointer for parallel_runner.
  }
procedure JxlButteraugliApiSetParallelRunner(api:PJxlButteraugliApi; parallel_runner:TJxlParallelRunner; parallel_runner_opaque:pointer);cdecl;external;
{*
 * Set the hf_asymmetry option for butteraugli.
 *
 * @param api api instance.
 * @param v new hf_asymmetry value.
  }
procedure JxlButteraugliApiSetHFAsymmetry(api:PJxlButteraugliApi; v:single);cdecl;external;
{*
 * Set the intensity_target option for butteraugli.
 *
 * @param api api instance.
 * @param v new intensity_target value.
  }
procedure JxlButteraugliApiSetIntensityTarget(api:PJxlButteraugliApi; v:single);cdecl;external;
{*
 * Deinitializes and frees JxlButteraugliApi instance.
 *
 * @param api instance to be cleaned up and deallocated.
  }
procedure JxlButteraugliApiDestroy(api:PJxlButteraugliApi);cdecl;external;
{*
 * Computes intermediary butteraugli result between an original image and a
 * distortion.
 *
 * @param api api instance for this computation.
 * @param xsize width of the compared images.
 * @param ysize height of the compared images.
 * @param pixel_format_orig pixel format for original image.
 * @param buffer_orig pixel data for original image.
 * @param size_orig size of buffer_orig in bytes.
 * @param pixel_format_dist pixel format for distortion.
 * @param buffer_dist pixel data for distortion.
 * @param size_dist size of buffer_dist in bytes.
 * @return @c NULL if the results can not be computed or initialized.
 * @return pointer to initialized and computed intermediary result.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function JxlButteraugliCompute(api:PJxlButteraugliApi; xsize:Tuint32_t; ysize:Tuint32_t; pixel_format_orig:PJxlPixelFormat; buffer_orig:pointer; 
           size_orig:Tsize_t; pixel_format_dist:PJxlPixelFormat; buffer_dist:pointer; size_dist:Tsize_t):PJxlButteraugliResult;cdecl;external;
{*
 * Computes butteraugli max distance based on an intermediary butteraugli
 * result.
 *
 * @param result intermediary result instance.
 * @return max distance.
  }
(* Const before type ignored *)
function JxlButteraugliResultGetMaxDistance(result:PJxlButteraugliResult):single;cdecl;external;
{*
 * Computes a butteraugli distance based on an intermediary butteraugli result.
 *
 * @param result intermediary result instance.
 * @param pnorm pnorm to calculate.
 * @return distance using the given pnorm.
  }
(* Const before type ignored *)
function JxlButteraugliResultGetDistance(result:PJxlButteraugliResult; pnorm:single):single;cdecl;external;
{*
 * Get a pointer to the distmap in the result.
 *
 * @param result intermediary result instance.
 * @param buffer will be set to the distmap. The distance value for (x,y) will
 * be available at buffer + y * row_stride + x.
 * @param row_stride will be set to the row stride of the distmap.
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure JxlButteraugliResultGetDistmap(result:PJxlButteraugliResult; buffer:PPsingle; row_stride:Puint32_t);cdecl;external;
{* @ }

implementation


end.
