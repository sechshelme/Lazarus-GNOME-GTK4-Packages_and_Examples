
unit hip_gst;
interface

{
  Automatically converted by H2Pas 1.0.0 from hip_gst.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hip_gst
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
Phip_Memcpy2D  = ^hip_Memcpy2D;
PHIP_RESOURCE_DESC  = ^HIP_RESOURCE_DESC;
PHIP_RESOURCE_VIEW_DESC  = ^HIP_RESOURCE_VIEW_DESC;
PHIP_TEXTURE_DESC  = ^HIP_TEXTURE_DESC;
PhipDeviceProp_t  = ^hipDeviceProp_t;
PhipEvent_t  = ^hipEvent_t;
PhipFunction_t  = ^hipFunction_t;
PhipGraphicsResource_t  = ^hipGraphicsResource_t;
PhipModule_t  = ^hipModule_t;
PhipStream_t  = ^hipStream_t;
PhipTextureObject_t  = ^hipTextureObject_t;
Plongint  = ^longint;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2025 Seungha Yang <seungha@centricular.com>
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
{$include <hip/hip_runtime.h>}
{$include <gst/hip/hip-prelude.h>}
{$include <gst/hip/gsthip-enums.h>}

function HipInit(vendor:TGstHipVendor; flags:dword):ThipError_t;cdecl;external;
function HipDriverGetVersion(vendor:TGstHipVendor; driverVersion:Plongint):ThipError_t;cdecl;external;
function HipRuntimeGetVersion(vendor:TGstHipVendor; runtimeVersion:Plongint):ThipError_t;cdecl;external;
(* Const before type ignored *)
function HipGetErrorName(vendor:TGstHipVendor; hip_error:ThipError_t):Pchar;cdecl;external;
(* Const before type ignored *)
function HipGetErrorString(vendor:TGstHipVendor; hipError:ThipError_t):Pchar;cdecl;external;
function HipGetDeviceCount(vendor:TGstHipVendor; count:Plongint):ThipError_t;cdecl;external;
function HipGetDeviceProperties(vendor:TGstHipVendor; prop:PhipDeviceProp_t; deviceId:longint):ThipError_t;cdecl;external;
function HipDeviceGetAttribute(vendor:TGstHipVendor; pi:Plongint; attr:ThipDeviceAttribute_t; deviceId:longint):ThipError_t;cdecl;external;
function HipSetDevice(vendor:TGstHipVendor; deviceId:longint):ThipError_t;cdecl;external;
function HipMalloc(vendor:TGstHipVendor; ptr:Ppointer; size:Tsize_t):ThipError_t;cdecl;external;
function HipFree(vendor:TGstHipVendor; ptr:pointer):ThipError_t;cdecl;external;
function HipHostMalloc(vendor:TGstHipVendor; ptr:Ppointer; size:Tsize_t; flags:dword):ThipError_t;cdecl;external;
function HipHostFree(vendor:TGstHipVendor; ptr:pointer):ThipError_t;cdecl;external;
function HipStreamCreate(vendor:TGstHipVendor; stream:PhipStream_t):ThipError_t;cdecl;external;
function HipStreamDestroy(vendor:TGstHipVendor; stream:ThipStream_t):ThipError_t;cdecl;external;
function HipStreamSynchronize(vendor:TGstHipVendor; stream:ThipStream_t):ThipError_t;cdecl;external;
function HipEventCreateWithFlags(vendor:TGstHipVendor; event:PhipEvent_t; flags:dword):ThipError_t;cdecl;external;
function HipEventRecord(vendor:TGstHipVendor; event:ThipEvent_t; stream:ThipStream_t):ThipError_t;cdecl;external;
function HipEventDestroy(vendor:TGstHipVendor; event:ThipEvent_t):ThipError_t;cdecl;external;
function HipEventSynchronize(vendor:TGstHipVendor; event:ThipEvent_t):ThipError_t;cdecl;external;
function HipEventQuery(vendor:TGstHipVendor; event:ThipEvent_t):ThipError_t;cdecl;external;
(* Const before type ignored *)
function HipModuleLoadData(vendor:TGstHipVendor; module:PhipModule_t; image:pointer):ThipError_t;cdecl;external;
function HipModuleUnload(vendor:TGstHipVendor; module:ThipModule_t):ThipError_t;cdecl;external;
(* Const before type ignored *)
function HipModuleGetFunction(vendor:TGstHipVendor; _function:PhipFunction_t; module:ThipModule_t; kname:Pchar):ThipError_t;cdecl;external;
function HipModuleLaunchKernel(vendor:TGstHipVendor; f:ThipFunction_t; gridDimX:dword; gridDimY:dword; gridDimZ:dword; 
           blockDimX:dword; blockDimY:dword; blockDimZ:dword; sharedMemBytes:dword; stream:ThipStream_t; 
           kernelParams:Ppointer; extra:Ppointer):ThipError_t;cdecl;external;
(* Const before type ignored *)
function HipMemcpyParam2DAsync(vendor:TGstHipVendor; pCopy:Phip_Memcpy2D; stream:ThipStream_t):ThipError_t;cdecl;external;
function HipMemsetD8Async(vendor:TGstHipVendor; dest:ThipDeviceptr_t; value:byte; count:Tsize_t; stream:ThipStream_t):ThipError_t;cdecl;external;
function HipMemsetD16Async(vendor:TGstHipVendor; dest:ThipDeviceptr_t; value:word; count:Tsize_t; stream:ThipStream_t):ThipError_t;cdecl;external;
function HipMemsetD32Async(vendor:TGstHipVendor; dst:ThipDeviceptr_t; value:longint; count:Tsize_t; stream:ThipStream_t):ThipError_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function HipTexObjectCreate(vendor:TGstHipVendor; pTexObject:PhipTextureObject_t; pResDesc:PHIP_RESOURCE_DESC; pTexDesc:PHIP_TEXTURE_DESC; pResViewDesc:PHIP_RESOURCE_VIEW_DESC):ThipError_t;cdecl;external;
function HipTexObjectDestroy(vendor:TGstHipVendor; texObject:ThipTextureObject_t):ThipError_t;cdecl;external;
function HipGraphicsMapResources(vendor:TGstHipVendor; count:longint; resources:PhipGraphicsResource_t; stream:ThipStream_t):ThipError_t;cdecl;external;
function HipGraphicsResourceGetMappedPointer(vendor:TGstHipVendor; devPtr:Ppointer; size:Psize_t; resource:ThipGraphicsResource_t):ThipError_t;cdecl;external;
function HipGraphicsUnmapResources(vendor:TGstHipVendor; count:longint; resources:PhipGraphicsResource_t; stream:ThipStream_t):ThipError_t;cdecl;external;
function HipGraphicsUnregisterResource(vendor:TGstHipVendor; resource:ThipGraphicsResource_t):ThipError_t;cdecl;external;

implementation


end.
