
unit gstcudacontext;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstcudacontext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstcudacontext.h
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
PCUcontext  = ^CUcontext;
PGstCudaContext  = ^GstCudaContext;
PGstCudaContextClass  = ^GstCudaContextClass;
PGstCudaContextPrivate  = ^GstCudaContextPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2018-2019> Seungha Yang <seungha.yang@navercorp.com>
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
{$include <gst/cuda/cuda-gst.h>}

{ was #define dname def_expr }
function GST_TYPE_CUDA_CONTEXT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CUDA_CONTEXT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CUDA_CONTEXT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CUDA_CONTEXT_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CUDA_CONTEXT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CUDA_CONTEXT_CLASS(klass : longint) : longint;

{*
 * GST_CUDA_CONTEXT_CAST:
 *
 * Since: 1.22
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CUDA_CONTEXT_CAST(obj : longint) : PGstCudaContext;

{*
 * GST_CUDA_CONTEXT_TYPE:
 *
 * Since: 1.22
  }
const
  GST_CUDA_CONTEXT_TYPE = 'gst.cuda.context';  
type
{*
 * GstCudaContext:
 *
 * Since: 1.22
  }
{< private > }
  PGstCudaContext = ^TGstCudaContext;
  TGstCudaContext = record
      object : TGstObject;
      priv : PGstCudaContextPrivate;
    end;

  PGstCudaContextClass = ^TGstCudaContextClass;
  TGstCudaContextClass = record
      parent_class : TGstObjectClass;
    end;


function gst_cuda_context_get_type:TGType;cdecl;external;
function gst_cuda_context_new(device_id:Tguint):PGstCudaContext;cdecl;external;
function gst_cuda_context_new_wrapped(handler:TCUcontext; device:TCUdevice):PGstCudaContext;cdecl;external;
function gst_cuda_context_push(ctx:PGstCudaContext):Tgboolean;cdecl;external;
function gst_cuda_context_pop(cuda_ctx:PCUcontext):Tgboolean;cdecl;external;
function gst_cuda_context_get_handle(ctx:PGstCudaContext):Tgpointer;cdecl;external;
function gst_cuda_context_get_texture_alignment(ctx:PGstCudaContext):Tgint;cdecl;external;
function gst_cuda_context_can_access_peer(ctx:PGstCudaContext; peer:PGstCudaContext):Tgboolean;cdecl;external;
function gst_cuda_context_find_dxgi_adapter_luid(cuda_device:TCUdevice):Tgint64;cdecl;external;

implementation

{ was #define dname def_expr }
function GST_TYPE_CUDA_CONTEXT : longint; { return type might be wrong }
  begin
    GST_TYPE_CUDA_CONTEXT:=gst_cuda_context_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CUDA_CONTEXT(obj : longint) : longint;
begin
  GST_CUDA_CONTEXT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_CUDA_CONTEXT,GstCudaContext);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CUDA_CONTEXT_CLASS(klass : longint) : longint;
begin
  GST_CUDA_CONTEXT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_CUDA_CONTEXT,GstCudaContextClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CUDA_CONTEXT_GET_CLASS(obj : longint) : longint;
begin
  GST_CUDA_CONTEXT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_CUDA_CONTEXT,GstCudaContextClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CUDA_CONTEXT(obj : longint) : longint;
begin
  GST_IS_CUDA_CONTEXT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_CUDA_CONTEXT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CUDA_CONTEXT_CLASS(klass : longint) : longint;
begin
  GST_IS_CUDA_CONTEXT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_CUDA_CONTEXT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CUDA_CONTEXT_CAST(obj : longint) : PGstCudaContext;
begin
  GST_CUDA_CONTEXT_CAST:=PGstCudaContext(obj);
end;


end.
