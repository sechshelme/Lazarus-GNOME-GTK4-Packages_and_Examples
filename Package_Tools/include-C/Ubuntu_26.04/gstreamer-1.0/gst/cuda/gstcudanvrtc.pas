unit gstcudanvrtc;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2019 Seungha Yang <seungha.yang@navercorp.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
(** unsupported pragma#pragma once*)
{$include <gst/gst.h>}
{$include <gst/cuda/cuda-prelude.h>}

function gst_cuda_nvrtc_load_library:Tgboolean;cdecl;external libgstcuda;
function gst_cuda_nvrtc_compile(source:Pgchar):Pgchar;cdecl;external libgstcuda;
function gst_cuda_nvrtc_compile_cubin(source:Pgchar; device:Tgint):Pgchar;cdecl;external libgstcuda;

// === Konventiert am: 24-7-26 15:39:08 ===


implementation



end.
