unit gstcudastream;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2022 Seungha Yang <seungha@centricular.com>
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
{$include <gst/cuda/gstcudacontext.h>}
{$include <cuda.h>}

{ was #define dname def_expr }
function GST_TYPE_CUDA_STREAM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CUDA_STREAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CUDA_STREAM(obj : longint) : PGstCudaStream;

type
{*
 * GstCudaStream:
 *
 * Since: 1.24
  }
{< private > }
  PGstCudaStream = ^TGstCudaStream;
  TGstCudaStream = record
      parent : TGstMiniObject;
      context : PGstCudaContext;
      priv : PGstCudaStreamPrivate;
    end;


function gst_cuda_stream_get_type:TGType;cdecl;external libgstcuda;
function gst_cuda_stream_new(context:PGstCudaContext):PGstCudaStream;cdecl;external libgstcuda;
function gst_cuda_stream_get_handle(stream:PGstCudaStream):TCUstream;cdecl;external libgstcuda;
function gst_cuda_stream_ref(stream:PGstCudaStream):PGstCudaStream;cdecl;external libgstcuda;
procedure gst_cuda_stream_unref(stream:PGstCudaStream);cdecl;external libgstcuda;
procedure gst_clear_cuda_stream(stream:PPGstCudaStream);cdecl;external libgstcuda;

// === Konventiert am: 24-7-26 15:39:04 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_CUDA_STREAM : longint; { return type might be wrong }
  begin
    GST_TYPE_CUDA_STREAM:=gst_cuda_stream_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CUDA_STREAM(obj : longint) : longint;
begin
  GST_IS_CUDA_STREAM:=GST_IS_MINI_OBJECT_TYPE(obj,GST_TYPE_CUDA_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CUDA_STREAM(obj : longint) : PGstCudaStream;
begin
  GST_CUDA_STREAM:=PGstCudaStream(obj);
end;


end.
