
unit gbm;
interface

{
  Automatically converted by H2Pas 1.0.0 from gbm.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gbm.h
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
Pchar  = ^char;
Pgbm_bo  = ^gbm_bo;
Pgbm_bo_flags  = ^gbm_bo_flags;
Pgbm_bo_format  = ^gbm_bo_format;
Pgbm_bo_handle  = ^gbm_bo_handle;
Pgbm_bo_transfer_flags  = ^gbm_bo_transfer_flags;
Pgbm_device  = ^gbm_device;
Pgbm_format_name_desc  = ^gbm_format_name_desc;
Pgbm_import_fd_data  = ^gbm_import_fd_data;
Pgbm_import_fd_modifier_data  = ^gbm_import_fd_modifier_data;
Pgbm_surface  = ^gbm_surface;
Puint32_t  = ^uint32_t;
Puint64_t  = ^uint64_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2011 Intel Corporation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice (including the next
 * paragraph) shall be included in all copies or substantial portions of the
 * Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * Authors:
 *    Benjamin Franzke <benjaminfranzke@googlemail.com>
  }
{$ifndef _GBM_H_}
{$define _GBM_H_}

const
  __GBM__ = 1;  
{$include <stddef.h>}
{$include <stdint.h>}
{ C++ extern C conditionnal removed }
{*
 * \file gbm.h
 * \brief Generic Buffer Manager
  }
type
  Pgbm_device = ^Tgbm_device;
  Tgbm_device = record
      {undefined structure}
    end;

  Pgbm_bo = ^Tgbm_bo;
  Tgbm_bo = record
      {undefined structure}
    end;

  Pgbm_surface = ^Tgbm_surface;
  Tgbm_surface = record
      {undefined structure}
    end;

{*
 * \mainpage The Generic Buffer Manager
 *
 * This module provides an abstraction that the caller can use to request a
 * buffer from the underlying memory management system for the platform.
 *
 * This allows the creation of portable code whilst still allowing access to
 * the underlying memory manager.
  }
{*
 * Abstraction representing the handle to a buffer allocated by the
 * manager
  }
  Pgbm_bo_handle = ^Tgbm_bo_handle;
  Tgbm_bo_handle = record
      case longint of
        0 : ( ptr : pointer );
        1 : ( s32 : Tint32_t );
        2 : ( u32 : Tuint32_t );
        3 : ( s64 : Tint64_t );
        4 : ( u64 : Tuint64_t );
      end;

{* Format of the allocated buffer  }
{* RGB with 8 bits per channel in a 32 bit value  }
{* ARGB with 8 bits per channel in a 32 bit value  }
  Tgbm_bo_format =  Longint;
  Const
    GBM_BO_FORMAT_XRGB8888 = 0;
    GBM_BO_FORMAT_ARGB8888 = 1;

{*
 * The FourCC format codes are taken from the drm_fourcc.h definition, and
 * re-namespaced. New GBM formats must not be added, unless they are
 * identical ports from drm_fourcc.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function __gbm_fourcc_code(a,b,c,d : longint) : longint;

{ format is big endian instead of little endian  }
const
  GBM_FORMAT_BIG_ENDIAN = 1 shl 31;  
{ color index  }
{ [7:0] C  }

{ was #define dname def_expr }
function GBM_FORMAT_C8 : longint; { return type might be wrong }

{ 8 bpp Red  }
{ [7:0] R  }
{ was #define dname def_expr }
function GBM_FORMAT_R8 : longint; { return type might be wrong }

{ 16 bpp Red  }
{ [15:0] R little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_R16 : longint; { return type might be wrong }

{ 16 bpp RG  }
{ [15:0] G:R 8:8 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_GR88 : longint; { return type might be wrong }

{ 32 bpp RG  }
{ [31:0] R:G 16:16 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_RG1616 : longint; { return type might be wrong }

{ [31:0] G:R 16:16 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_GR1616 : longint; { return type might be wrong }

{ 8 bpp RGB  }
{ [7:0] R:G:B 3:3:2  }
{ was #define dname def_expr }
function GBM_FORMAT_RGB332 : longint; { return type might be wrong }

{ [7:0] B:G:R 2:3:3  }
{ was #define dname def_expr }
function GBM_FORMAT_BGR233 : longint; { return type might be wrong }

{ 16 bpp RGB  }
{ [15:0] x:R:G:B 4:4:4:4 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_XRGB4444 : longint; { return type might be wrong }

{ [15:0] x:B:G:R 4:4:4:4 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_XBGR4444 : longint; { return type might be wrong }

{ [15:0] R:G:B:x 4:4:4:4 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_RGBX4444 : longint; { return type might be wrong }

{ [15:0] B:G:R:x 4:4:4:4 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_BGRX4444 : longint; { return type might be wrong }

{ [15:0] A:R:G:B 4:4:4:4 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_ARGB4444 : longint; { return type might be wrong }

{ [15:0] A:B:G:R 4:4:4:4 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_ABGR4444 : longint; { return type might be wrong }

{ [15:0] R:G:B:A 4:4:4:4 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_RGBA4444 : longint; { return type might be wrong }

{ [15:0] B:G:R:A 4:4:4:4 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_BGRA4444 : longint; { return type might be wrong }

{ [15:0] x:R:G:B 1:5:5:5 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_XRGB1555 : longint; { return type might be wrong }

{ [15:0] x:B:G:R 1:5:5:5 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_XBGR1555 : longint; { return type might be wrong }

{ [15:0] R:G:B:x 5:5:5:1 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_RGBX5551 : longint; { return type might be wrong }

{ [15:0] B:G:R:x 5:5:5:1 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_BGRX5551 : longint; { return type might be wrong }

{ [15:0] A:R:G:B 1:5:5:5 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_ARGB1555 : longint; { return type might be wrong }

{ [15:0] A:B:G:R 1:5:5:5 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_ABGR1555 : longint; { return type might be wrong }

{ [15:0] R:G:B:A 5:5:5:1 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_RGBA5551 : longint; { return type might be wrong }

{ [15:0] B:G:R:A 5:5:5:1 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_BGRA5551 : longint; { return type might be wrong }

{ [15:0] R:G:B 5:6:5 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_RGB565 : longint; { return type might be wrong }

{ [15:0] B:G:R 5:6:5 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_BGR565 : longint; { return type might be wrong }

{ 24 bpp RGB  }
{ [23:0] R:G:B little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_RGB888 : longint; { return type might be wrong }

{ [23:0] B:G:R little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_BGR888 : longint; { return type might be wrong }

{ 32 bpp RGB  }
{ [31:0] x:R:G:B 8:8:8:8 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_XRGB8888 : longint; { return type might be wrong }

{ [31:0] x:B:G:R 8:8:8:8 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_XBGR8888 : longint; { return type might be wrong }

{ [31:0] R:G:B:x 8:8:8:8 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_RGBX8888 : longint; { return type might be wrong }

{ [31:0] B:G:R:x 8:8:8:8 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_BGRX8888 : longint; { return type might be wrong }

{ [31:0] A:R:G:B 8:8:8:8 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_ARGB8888 : longint; { return type might be wrong }

{ [31:0] A:B:G:R 8:8:8:8 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_ABGR8888 : longint; { return type might be wrong }

{ [31:0] R:G:B:A 8:8:8:8 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_RGBA8888 : longint; { return type might be wrong }

{ [31:0] B:G:R:A 8:8:8:8 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_BGRA8888 : longint; { return type might be wrong }

{ [31:0] x:R:G:B 2:10:10:10 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_XRGB2101010 : longint; { return type might be wrong }

{ [31:0] x:B:G:R 2:10:10:10 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_XBGR2101010 : longint; { return type might be wrong }

{ [31:0] R:G:B:x 10:10:10:2 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_RGBX1010102 : longint; { return type might be wrong }

{ [31:0] B:G:R:x 10:10:10:2 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_BGRX1010102 : longint; { return type might be wrong }

{ [31:0] A:R:G:B 2:10:10:10 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_ARGB2101010 : longint; { return type might be wrong }

{ [31:0] A:B:G:R 2:10:10:10 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_ABGR2101010 : longint; { return type might be wrong }

{ [31:0] R:G:B:A 10:10:10:2 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_RGBA1010102 : longint; { return type might be wrong }

{ [31:0] B:G:R:A 10:10:10:2 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_BGRA1010102 : longint; { return type might be wrong }

{ 64 bpp RGB  }
{ [63:0] x:B:G:R 16:16:16:16 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_XBGR16161616 : longint; { return type might be wrong }

{ [63:0] A:B:G:R 16:16:16:16 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_ABGR16161616 : longint; { return type might be wrong }

{
 * Floating point 64bpp RGB
 * IEEE 754-2008 binary16 half-precision float
 * [15:0] sign:exponent:mantissa 1:5:10
  }
{ [63:0] x:B:G:R 16:16:16:16 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_XBGR16161616F : longint; { return type might be wrong }

{ [63:0] A:B:G:R 16:16:16:16 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_ABGR16161616F : longint; { return type might be wrong }

{ packed YCbCr  }
{ [31:0] Cr0:Y1:Cb0:Y0 8:8:8:8 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_YUYV : longint; { return type might be wrong }

{ [31:0] Cb0:Y1:Cr0:Y0 8:8:8:8 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_YVYU : longint; { return type might be wrong }

{ [31:0] Y1:Cr0:Y0:Cb0 8:8:8:8 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_UYVY : longint; { return type might be wrong }

{ [31:0] Y1:Cb0:Y0:Cr0 8:8:8:8 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_VYUY : longint; { return type might be wrong }

{ [31:0] A:Y:Cb:Cr 8:8:8:8 little endian  }
{ was #define dname def_expr }
function GBM_FORMAT_AYUV : longint; { return type might be wrong }

{
 * 2 plane YCbCr
 * index 0 = Y plane, [7:0] Y
 * index 1 = Cr:Cb plane, [15:0] Cr:Cb little endian
 * or
 * index 1 = Cb:Cr plane, [15:0] Cb:Cr little endian
  }
{ 2x2 subsampled Cr:Cb plane  }
{ was #define dname def_expr }
function GBM_FORMAT_NV12 : longint; { return type might be wrong }

{ 2x2 subsampled Cb:Cr plane  }
{ was #define dname def_expr }
function GBM_FORMAT_NV21 : longint; { return type might be wrong }

{ 2x1 subsampled Cr:Cb plane  }
{ was #define dname def_expr }
function GBM_FORMAT_NV16 : longint; { return type might be wrong }

{ 2x1 subsampled Cb:Cr plane  }
{ was #define dname def_expr }
function GBM_FORMAT_NV61 : longint; { return type might be wrong }

{
 * 3 plane YCbCr
 * index 0: Y plane, [7:0] Y
 * index 1: Cb plane, [7:0] Cb
 * index 2: Cr plane, [7:0] Cr
 * or
 * index 1: Cr plane, [7:0] Cr
 * index 2: Cb plane, [7:0] Cb
  }
{ 4x4 subsampled Cb (1) and Cr (2) planes  }
{ was #define dname def_expr }
function GBM_FORMAT_YUV410 : longint; { return type might be wrong }

{ 4x4 subsampled Cr (1) and Cb (2) planes  }
{ was #define dname def_expr }
function GBM_FORMAT_YVU410 : longint; { return type might be wrong }

{ 4x1 subsampled Cb (1) and Cr (2) planes  }
{ was #define dname def_expr }
function GBM_FORMAT_YUV411 : longint; { return type might be wrong }

{ 4x1 subsampled Cr (1) and Cb (2) planes  }
{ was #define dname def_expr }
function GBM_FORMAT_YVU411 : longint; { return type might be wrong }

{ 2x2 subsampled Cb (1) and Cr (2) planes  }
{ was #define dname def_expr }
function GBM_FORMAT_YUV420 : longint; { return type might be wrong }

{ 2x2 subsampled Cr (1) and Cb (2) planes  }
{ was #define dname def_expr }
function GBM_FORMAT_YVU420 : longint; { return type might be wrong }

{ 2x1 subsampled Cb (1) and Cr (2) planes  }
{ was #define dname def_expr }
function GBM_FORMAT_YUV422 : longint; { return type might be wrong }

{ 2x1 subsampled Cr (1) and Cb (2) planes  }
{ was #define dname def_expr }
function GBM_FORMAT_YVU422 : longint; { return type might be wrong }

{ non-subsampled Cb (1) and Cr (2) planes  }
{ was #define dname def_expr }
function GBM_FORMAT_YUV444 : longint; { return type might be wrong }

{ non-subsampled Cr (1) and Cb (2) planes  }
{ was #define dname def_expr }
function GBM_FORMAT_YVU444 : longint; { return type might be wrong }

type
  Pgbm_format_name_desc = ^Tgbm_format_name_desc;
  Tgbm_format_name_desc = record
      name : array[0..4] of char;
    end;

{*
 * Flags to indicate the intended use for the buffer - these are passed into
 * gbm_bo_create(). The caller must set the union of all the flags that are
 * appropriate
 *
 * \sa Use gbm_device_is_format_supported() to check if the combination of format
 * and use flags are supported
  }
{*
    * Buffer is going to be presented to the screen using an API such as KMS
     }
{*
    * Buffer is going to be used as cursor
     }
{*
    * Deprecated
     }
{*
    * Buffer is to be used for rendering - for example it is going to be used
    * as the storage for a color buffer
     }
{*
    * Buffer can be used for gbm_bo_write.  This is guaranteed to work
    * with GBM_BO_USE_CURSOR, but may not work for other combinations.
     }
{*
    * Buffer is linear, i.e. not tiled.
     }
{*
    * Buffer is protected, i.e. encrypted and not readable by CPU or any
    * other non-secure / non-trusted components nor by non-trusted OpenGL,
    * OpenCL, and Vulkan applications.
     }
{*
    * The buffer will be used for front buffer rendering.  On some
    * platforms this may (for example) disable framebuffer compression
    * to avoid problems with compression flags data being out of sync
    * with pixel data.
     }
{*
    * Allow the driver to select fixed-rate compression parameters.
     }
{*
    * Fixed-rate compression: at least 1bpc, less than 2bpc
     }
{*
    * Fixed-rate compression: at least 2bpc, less than 3bpc
     }
{*
    * Fixed-rate compression: at least 3bpc, less than 4bpc
     }
{*
    * Fixed-rate compression: at least 4bpc, less than 5bpc
     }
{*
    * Fixed-rate compression: at least 5bpc, less than 6bpc
     }
{*
    * Fixed-rate compression: at least 6bpc, less than 7bpc
     }
{*
    * Fixed-rate compression: at least 7bpc, less than 8bpc
     }
{*
    * Fixed-rate compression: at least 8bpc, less than 9bpc
     }
{*
    * Fixed-rate compression: at least 9bpc, less than 10bpc
     }
{*
    * Fixed-rate compression: at least 10bpc, less than 11bpc
     }
{*
    * Fixed-rate compression: at least 11bpc, less than 12bpc
     }
{*
    * Fixed-rate compression: at least 12bpc, no maximum rate
     }
{ next available value is (1 << 11)  }
  Tgbm_bo_flags =  Longint;
  Const
    GBM_BO_USE_SCANOUT = 1 shl 0;
    GBM_BO_USE_CURSOR = 1 shl 1;
    GBM_BO_USE_CURSOR_64X64 = GBM_BO_USE_CURSOR;
    GBM_BO_USE_RENDERING = 1 shl 2;
    GBM_BO_USE_WRITE = 1 shl 3;
    GBM_BO_USE_LINEAR = 1 shl 4;
    GBM_BO_USE_PROTECTED = 1 shl 5;
    GBM_BO_USE_FRONT_RENDERING = 1 shl 6;
    GBM_BO_FIXED_COMPRESSION_DEFAULT = 1 shl 7;
    GBM_BO_FIXED_COMPRESSION_1BPC = 2 shl 7;
    GBM_BO_FIXED_COMPRESSION_2BPC = 3 shl 7;
    GBM_BO_FIXED_COMPRESSION_3BPC = 4 shl 7;
    GBM_BO_FIXED_COMPRESSION_4BPC = 5 shl 7;
    GBM_BO_FIXED_COMPRESSION_5BPC = 6 shl 7;
    GBM_BO_FIXED_COMPRESSION_6BPC = 7 shl 7;
    GBM_BO_FIXED_COMPRESSION_7BPC = 8 shl 7;
    GBM_BO_FIXED_COMPRESSION_8BPC = 9 shl 7;
    GBM_BO_FIXED_COMPRESSION_9BPC = 10 shl 7;
    GBM_BO_FIXED_COMPRESSION_10BPC = 11 shl 7;
    GBM_BO_FIXED_COMPRESSION_11BPC = 12 shl 7;
    GBM_BO_FIXED_COMPRESSION_12BPC = 13 shl 7;

  GBM_BO_FIXED_COMPRESSION_MASK = ((1 shl 11)-1) and ( not ((1 shl 7)-1));  

function gbm_device_get_fd(gbm:Pgbm_device):longint;cdecl;external;
(* Const before type ignored *)
function gbm_device_get_backend_name(gbm:Pgbm_device):Pchar;cdecl;external;
function gbm_device_is_format_supported(gbm:Pgbm_device; format:Tuint32_t; flags:Tuint32_t):longint;cdecl;external;
function gbm_device_get_format_modifier_plane_count(gbm:Pgbm_device; format:Tuint32_t; modifier:Tuint64_t):longint;cdecl;external;
procedure gbm_device_destroy(gbm:Pgbm_device);cdecl;external;
function gbm_create_device(fd:longint):Pgbm_device;cdecl;external;
function gbm_bo_create(gbm:Pgbm_device; width:Tuint32_t; height:Tuint32_t; format:Tuint32_t; flags:Tuint32_t):Pgbm_bo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gbm_bo_create_with_modifiers(gbm:Pgbm_device; width:Tuint32_t; height:Tuint32_t; format:Tuint32_t; modifiers:Puint64_t; 
           count:dword):Pgbm_bo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gbm_bo_create_with_modifiers2(gbm:Pgbm_device; width:Tuint32_t; height:Tuint32_t; format:Tuint32_t; modifiers:Puint64_t; 
           count:dword; flags:Tuint32_t):Pgbm_bo;cdecl;external;
const
  GBM_BO_IMPORT_WL_BUFFER = $5501;  
  GBM_BO_IMPORT_EGL_IMAGE = $5502;  
  GBM_BO_IMPORT_FD = $5503;  
  GBM_BO_IMPORT_FD_MODIFIER = $5504;  
type
  Pgbm_import_fd_data = ^Tgbm_import_fd_data;
  Tgbm_import_fd_data = record
      fd : longint;
      width : Tuint32_t;
      height : Tuint32_t;
      stride : Tuint32_t;
      format : Tuint32_t;
    end;


const
  GBM_MAX_PLANES = 4;  
type
  Pgbm_import_fd_modifier_data = ^Tgbm_import_fd_modifier_data;
  Tgbm_import_fd_modifier_data = record
      width : Tuint32_t;
      height : Tuint32_t;
      format : Tuint32_t;
      num_fds : Tuint32_t;
      fds : array[0..(GBM_MAX_PLANES)-1] of longint;
      strides : array[0..(GBM_MAX_PLANES)-1] of longint;
      offsets : array[0..(GBM_MAX_PLANES)-1] of longint;
      modifier : Tuint64_t;
    end;


function gbm_bo_import(gbm:Pgbm_device; _type:Tuint32_t; buffer:pointer; flags:Tuint32_t):Pgbm_bo;cdecl;external;
{*
 * Flags to indicate the type of mapping for the buffer - these are
 * passed into gbm_bo_map(). The caller must set the union of all the
 * flags that are appropriate.
 *
 * These flags are independent of the GBM_BO_USE_* creation flags. However,
 * mapping the buffer may require copying to/from a staging buffer.
 *
 * See also: pipe_map_flags
  }
{*
    * Buffer contents read back (or accessed directly) at transfer
    * create time.
     }
{*
    * Buffer contents will be written back at unmap time
    * (or modified as a result of being accessed directly).
     }
{*
    * Read/modify/write
     }
type
  Tgbm_bo_transfer_flags =  Longint;
  Const
    GBM_BO_TRANSFER_READ = 1 shl 0;
    GBM_BO_TRANSFER_WRITE = 1 shl 1;
    GBM_BO_TRANSFER_READ_WRITE = GBM_BO_TRANSFER_READ or GBM_BO_TRANSFER_WRITE;


function gbm_bo_map(bo:Pgbm_bo; x:Tuint32_t; y:Tuint32_t; width:Tuint32_t; height:Tuint32_t; 
           flags:Tuint32_t; stride:Puint32_t; map_data:Ppointer):pointer;cdecl;external;
procedure gbm_bo_unmap(bo:Pgbm_bo; map_data:pointer);cdecl;external;
function gbm_bo_get_width(bo:Pgbm_bo):Tuint32_t;cdecl;external;
function gbm_bo_get_height(bo:Pgbm_bo):Tuint32_t;cdecl;external;
function gbm_bo_get_stride(bo:Pgbm_bo):Tuint32_t;cdecl;external;
function gbm_bo_get_stride_for_plane(bo:Pgbm_bo; plane:longint):Tuint32_t;cdecl;external;
function gbm_bo_get_format(bo:Pgbm_bo):Tuint32_t;cdecl;external;
function gbm_bo_get_bpp(bo:Pgbm_bo):Tuint32_t;cdecl;external;
function gbm_bo_get_offset(bo:Pgbm_bo; plane:longint):Tuint32_t;cdecl;external;
function gbm_bo_get_device(bo:Pgbm_bo):Pgbm_device;cdecl;external;
function gbm_bo_get_handle(bo:Pgbm_bo):Tgbm_bo_handle;cdecl;external;
function gbm_bo_get_fd(bo:Pgbm_bo):longint;cdecl;external;
function gbm_bo_get_modifier(bo:Pgbm_bo):Tuint64_t;cdecl;external;
function gbm_bo_get_plane_count(bo:Pgbm_bo):longint;cdecl;external;
function gbm_bo_get_handle_for_plane(bo:Pgbm_bo; plane:longint):Tgbm_bo_handle;cdecl;external;
function gbm_bo_get_fd_for_plane(bo:Pgbm_bo; plane:longint):longint;cdecl;external;
(* Const before type ignored *)
function gbm_bo_write(bo:Pgbm_bo; buf:pointer; count:Tsize_t):longint;cdecl;external;
procedure gbm_bo_set_user_data(bo:Pgbm_bo; data:pointer; destroy_user_data:procedure (para1:Pgbm_bo; para2:pointer));cdecl;external;
function gbm_bo_get_user_data(bo:Pgbm_bo):pointer;cdecl;external;
procedure gbm_bo_destroy(bo:Pgbm_bo);cdecl;external;
function gbm_surface_create(gbm:Pgbm_device; width:Tuint32_t; height:Tuint32_t; format:Tuint32_t; flags:Tuint32_t):Pgbm_surface;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gbm_surface_create_with_modifiers(gbm:Pgbm_device; width:Tuint32_t; height:Tuint32_t; format:Tuint32_t; modifiers:Puint64_t; 
           count:dword):Pgbm_surface;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gbm_surface_create_with_modifiers2(gbm:Pgbm_device; width:Tuint32_t; height:Tuint32_t; format:Tuint32_t; modifiers:Puint64_t; 
           count:dword; flags:Tuint32_t):Pgbm_surface;cdecl;external;
function gbm_surface_lock_front_buffer(surface:Pgbm_surface):Pgbm_bo;cdecl;external;
procedure gbm_surface_release_buffer(surface:Pgbm_surface; bo:Pgbm_bo);cdecl;external;
function gbm_surface_has_free_buffers(surface:Pgbm_surface):longint;cdecl;external;
procedure gbm_surface_destroy(surface:Pgbm_surface);cdecl;external;
function gbm_format_get_name(gbm_format:Tuint32_t; desc:Pgbm_format_name_desc):Pchar;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function __gbm_fourcc_code(a,b,c,d : longint) : longint;
begin
  __gbm_fourcc_code:=(((Tuint32_t(a)) or ((Tuint32_t(b)) shl 8)) or ((Tuint32_t(c)) shl 16)) or ((Tuint32_t(d)) shl 24);
end;

{ was #define dname def_expr }
function GBM_FORMAT_C8 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_C8:=__gbm_fourcc_code('C','8',' ',' ');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_R8 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_R8:=__gbm_fourcc_code('R','8',' ',' ');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_R16 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_R16:=__gbm_fourcc_code('R','1','6',' ');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_GR88 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_GR88:=__gbm_fourcc_code('G','R','8','8');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_RG1616 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_RG1616:=__gbm_fourcc_code('R','G','3','2');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_GR1616 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_GR1616:=__gbm_fourcc_code('G','R','3','2');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_RGB332 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_RGB332:=__gbm_fourcc_code('R','G','B','8');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_BGR233 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_BGR233:=__gbm_fourcc_code('B','G','R','8');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_XRGB4444 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_XRGB4444:=__gbm_fourcc_code('X','R','1','2');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_XBGR4444 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_XBGR4444:=__gbm_fourcc_code('X','B','1','2');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_RGBX4444 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_RGBX4444:=__gbm_fourcc_code('R','X','1','2');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_BGRX4444 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_BGRX4444:=__gbm_fourcc_code('B','X','1','2');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_ARGB4444 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_ARGB4444:=__gbm_fourcc_code('A','R','1','2');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_ABGR4444 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_ABGR4444:=__gbm_fourcc_code('A','B','1','2');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_RGBA4444 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_RGBA4444:=__gbm_fourcc_code('R','A','1','2');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_BGRA4444 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_BGRA4444:=__gbm_fourcc_code('B','A','1','2');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_XRGB1555 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_XRGB1555:=__gbm_fourcc_code('X','R','1','5');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_XBGR1555 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_XBGR1555:=__gbm_fourcc_code('X','B','1','5');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_RGBX5551 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_RGBX5551:=__gbm_fourcc_code('R','X','1','5');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_BGRX5551 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_BGRX5551:=__gbm_fourcc_code('B','X','1','5');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_ARGB1555 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_ARGB1555:=__gbm_fourcc_code('A','R','1','5');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_ABGR1555 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_ABGR1555:=__gbm_fourcc_code('A','B','1','5');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_RGBA5551 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_RGBA5551:=__gbm_fourcc_code('R','A','1','5');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_BGRA5551 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_BGRA5551:=__gbm_fourcc_code('B','A','1','5');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_RGB565 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_RGB565:=__gbm_fourcc_code('R','G','1','6');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_BGR565 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_BGR565:=__gbm_fourcc_code('B','G','1','6');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_RGB888 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_RGB888:=__gbm_fourcc_code('R','G','2','4');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_BGR888 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_BGR888:=__gbm_fourcc_code('B','G','2','4');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_XRGB8888 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_XRGB8888:=__gbm_fourcc_code('X','R','2','4');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_XBGR8888 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_XBGR8888:=__gbm_fourcc_code('X','B','2','4');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_RGBX8888 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_RGBX8888:=__gbm_fourcc_code('R','X','2','4');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_BGRX8888 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_BGRX8888:=__gbm_fourcc_code('B','X','2','4');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_ARGB8888 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_ARGB8888:=__gbm_fourcc_code('A','R','2','4');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_ABGR8888 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_ABGR8888:=__gbm_fourcc_code('A','B','2','4');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_RGBA8888 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_RGBA8888:=__gbm_fourcc_code('R','A','2','4');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_BGRA8888 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_BGRA8888:=__gbm_fourcc_code('B','A','2','4');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_XRGB2101010 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_XRGB2101010:=__gbm_fourcc_code('X','R','3','0');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_XBGR2101010 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_XBGR2101010:=__gbm_fourcc_code('X','B','3','0');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_RGBX1010102 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_RGBX1010102:=__gbm_fourcc_code('R','X','3','0');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_BGRX1010102 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_BGRX1010102:=__gbm_fourcc_code('B','X','3','0');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_ARGB2101010 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_ARGB2101010:=__gbm_fourcc_code('A','R','3','0');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_ABGR2101010 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_ABGR2101010:=__gbm_fourcc_code('A','B','3','0');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_RGBA1010102 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_RGBA1010102:=__gbm_fourcc_code('R','A','3','0');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_BGRA1010102 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_BGRA1010102:=__gbm_fourcc_code('B','A','3','0');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_XBGR16161616 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_XBGR16161616:=__gbm_fourcc_code('X','B','4','8');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_ABGR16161616 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_ABGR16161616:=__gbm_fourcc_code('A','B','4','8');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_XBGR16161616F : longint; { return type might be wrong }
  begin
    GBM_FORMAT_XBGR16161616F:=__gbm_fourcc_code('X','B','4','H');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_ABGR16161616F : longint; { return type might be wrong }
  begin
    GBM_FORMAT_ABGR16161616F:=__gbm_fourcc_code('A','B','4','H');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_YUYV : longint; { return type might be wrong }
  begin
    GBM_FORMAT_YUYV:=__gbm_fourcc_code('Y','U','Y','V');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_YVYU : longint; { return type might be wrong }
  begin
    GBM_FORMAT_YVYU:=__gbm_fourcc_code('Y','V','Y','U');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_UYVY : longint; { return type might be wrong }
  begin
    GBM_FORMAT_UYVY:=__gbm_fourcc_code('U','Y','V','Y');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_VYUY : longint; { return type might be wrong }
  begin
    GBM_FORMAT_VYUY:=__gbm_fourcc_code('V','Y','U','Y');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_AYUV : longint; { return type might be wrong }
  begin
    GBM_FORMAT_AYUV:=__gbm_fourcc_code('A','Y','U','V');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_NV12 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_NV12:=__gbm_fourcc_code('N','V','1','2');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_NV21 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_NV21:=__gbm_fourcc_code('N','V','2','1');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_NV16 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_NV16:=__gbm_fourcc_code('N','V','1','6');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_NV61 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_NV61:=__gbm_fourcc_code('N','V','6','1');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_YUV410 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_YUV410:=__gbm_fourcc_code('Y','U','V','9');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_YVU410 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_YVU410:=__gbm_fourcc_code('Y','V','U','9');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_YUV411 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_YUV411:=__gbm_fourcc_code('Y','U','1','1');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_YVU411 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_YVU411:=__gbm_fourcc_code('Y','V','1','1');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_YUV420 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_YUV420:=__gbm_fourcc_code('Y','U','1','2');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_YVU420 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_YVU420:=__gbm_fourcc_code('Y','V','1','2');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_YUV422 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_YUV422:=__gbm_fourcc_code('Y','U','1','6');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_YVU422 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_YVU422:=__gbm_fourcc_code('Y','V','1','6');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_YUV444 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_YUV444:=__gbm_fourcc_code('Y','U','2','4');
  end;

{ was #define dname def_expr }
function GBM_FORMAT_YVU444 : longint; { return type might be wrong }
  begin
    GBM_FORMAT_YVU444:=__gbm_fourcc_code('Y','V','2','4');
  end;


end.
