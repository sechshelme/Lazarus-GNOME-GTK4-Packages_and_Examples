
unit cuda_gst;
interface

{
  Automatically converted by H2Pas 1.0.0 from cuda_gst.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cuda_gst.h
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
PCUarray  = ^CUarray;
PCUcontext  = ^CUcontext;
PCUDA_EXTERNAL_MEMORY_BUFFER_DESC  = ^CUDA_EXTERNAL_MEMORY_BUFFER_DESC;
PCUDA_EXTERNAL_MEMORY_HANDLE_DESC  = ^CUDA_EXTERNAL_MEMORY_HANDLE_DESC;
PCUDA_EXTERNAL_MEMORY_MIPMAPPED_ARRAY_DESC  = ^CUDA_EXTERNAL_MEMORY_MIPMAPPED_ARRAY_DESC;
PCUDA_EXTERNAL_SEMAPHORE_HANDLE_DESC  = ^CUDA_EXTERNAL_SEMAPHORE_HANDLE_DESC;
PCUDA_EXTERNAL_SEMAPHORE_SIGNAL_PARAMS  = ^CUDA_EXTERNAL_SEMAPHORE_SIGNAL_PARAMS;
PCUDA_EXTERNAL_SEMAPHORE_WAIT_PARAMS  = ^CUDA_EXTERNAL_SEMAPHORE_WAIT_PARAMS;
PCUDA_MEMCPY2D  = ^CUDA_MEMCPY2D;
PCUDA_RESOURCE_DESC  = ^CUDA_RESOURCE_DESC;
PCUDA_RESOURCE_VIEW_DESC  = ^CUDA_RESOURCE_VIEW_DESC;
PCUDA_TEXTURE_DESC  = ^CUDA_TEXTURE_DESC;
PCUdevice  = ^CUdevice;
PCUdeviceptr  = ^CUdeviceptr;
PCUevent  = ^CUevent;
PCUexternalMemory  = ^CUexternalMemory;
PCUexternalSemaphore  = ^CUexternalSemaphore;
PCUfunction  = ^CUfunction;
PCUgraphicsResource  = ^CUgraphicsResource;
PCUipcEventHandle  = ^CUipcEventHandle;
PCUipcMemHandle  = ^CUipcMemHandle;
PCUmemAccessDesc  = ^CUmemAccessDesc;
PCUmemAllocationProp  = ^CUmemAllocationProp;
PCUmemGenericAllocationHandle  = ^CUmemGenericAllocationHandle;
PCUmemLocation  = ^CUmemLocation;
PCUmemoryPool  = ^CUmemoryPool;
PCUmemPoolProps  = ^CUmemPoolProps;
PCUmipmappedArray  = ^CUmipmappedArray;
PCUmodule  = ^CUmodule;
PCUstream  = ^CUstream;
PCUtexObject  = ^CUtexObject;
PCUuuid  = ^CUuuid;
Pdword  = ^dword;
PID3D11Device  = ^ID3D11Device;
PID3D11Resource  = ^ID3D11Resource;
PIDXGIAdapter  = ^IDXGIAdapter;
Plongint  = ^longint;
Pqword  = ^qword;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


(** unsupported pragma#pragma once*)
{$include <gst/cuda/cuda-prelude.h>}
{$include <cuda.h>}
{$include <cudaGL.h>}
{$ifdef G_OS_WIN32}
{$ifndef INITGUID}
{$include <initguid.h>}
{$endif}
{ INITGUID  }
{$include <d3d11.h>}
{$include <dxgi.h>}
{$include <cudaD3D11.h>}
{$endif}
{ G_OS_WIN32  }
{ cuda.h  }

function CuInit(Flags:dword):TCUresult;cdecl;external;
(* Const before type ignored *)
function CuGetErrorName(error:TCUresult; pStr:PPchar):TCUresult;cdecl;external;
(* Const before type ignored *)
function CuGetErrorString(error:TCUresult; pStr:PPchar):TCUresult;cdecl;external;
function CuCtxCreate(pctx:PCUcontext; flags:dword; dev:TCUdevice):TCUresult;cdecl;external;
function CuCtxDestroy(ctx:TCUcontext):TCUresult;cdecl;external;
function CuCtxPopCurrent(pctx:PCUcontext):TCUresult;cdecl;external;
function CuCtxPushCurrent(ctx:TCUcontext):TCUresult;cdecl;external;
function CuCtxSynchronize:TCUresult;cdecl;external;
function CuCtxGetLimit(plimit:Psize_t; limit:TCUlimit):TCUresult;cdecl;external;
function CuCtxSetLimit(limit:TCUlimit; value:Tsize_t):TCUresult;cdecl;external;
function CuCtxEnablePeerAccess(peerContext:TCUcontext; Flags:dword):TCUresult;cdecl;external;
function CuCtxDisablePeerAccess(peerContext:TCUcontext):TCUresult;cdecl;external;
function CuGraphicsMapResources(count:dword; resources:PCUgraphicsResource; hStream:TCUstream):TCUresult;cdecl;external;
function CuGraphicsUnmapResources(count:dword; resources:PCUgraphicsResource; hStream:TCUstream):TCUresult;cdecl;external;
function CuGraphicsSubResourceGetMappedArray(pArray:PCUarray; resource:TCUgraphicsResource; arrayIndex:dword; mipLevel:dword):TCUresult;cdecl;external;
function CuGraphicsResourceGetMappedPointer(pDevPtr:PCUdeviceptr; pSize:Psize_t; resource:TCUgraphicsResource):TCUresult;cdecl;external;
function CuGraphicsUnregisterResource(resource:TCUgraphicsResource):TCUresult;cdecl;external;
function CuMemAlloc(dptr:PCUdeviceptr; bytesize:dword):TCUresult;cdecl;external;
function CuMemAllocPitch(dptr:PCUdeviceptr; pPitch:Psize_t; WidthInBytes:Tsize_t; Height:Tsize_t; ElementSizeBytes:dword):TCUresult;cdecl;external;
function CuMemAllocHost(pp:Ppointer; bytesize:dword):TCUresult;cdecl;external;
(* Const before type ignored *)
function CuMemcpy2D(pCopy:PCUDA_MEMCPY2D):TCUresult;cdecl;external;
(* Const before type ignored *)
function CuMemcpy2DAsync(pCopy:PCUDA_MEMCPY2D; hStream:TCUstream):TCUresult;cdecl;external;
function CuMemcpyDtoD(dstDevice:TCUdeviceptr; srcDevice:TCUdeviceptr; ByteCount:Tsize_t):TCUresult;cdecl;external;
function CuMemcpyDtoDAsync(dstDevice:TCUdeviceptr; srcDevice:TCUdeviceptr; ByteCount:Tsize_t; hStream:TCUstream):TCUresult;cdecl;external;
function CuMemcpyDtoH(dstHost:pointer; srcDevice:TCUdeviceptr; ByteCount:Tsize_t):TCUresult;cdecl;external;
function CuMemcpyDtoHAsync(dstHost:pointer; srcDevice:TCUdeviceptr; ByteCount:Tsize_t; hStream:TCUstream):TCUresult;cdecl;external;
(* Const before type ignored *)
function CuMemcpyHtoD(dstDevice:TCUdeviceptr; srcHost:pointer; ByteCount:Tsize_t):TCUresult;cdecl;external;
(* Const before type ignored *)
function CuMemcpyHtoDAsync(dstDevice:TCUdeviceptr; srcHost:pointer; ByteCount:Tsize_t; hStream:TCUstream):TCUresult;cdecl;external;
function CuMemFree(dptr:TCUdeviceptr):TCUresult;cdecl;external;
function CuMemFreeHost(p:pointer):TCUresult;cdecl;external;
function CuStreamCreate(phStream:PCUstream; Flags:dword):TCUresult;cdecl;external;
function CuStreamDestroy(hStream:TCUstream):TCUresult;cdecl;external;
function CuStreamSynchronize(hStream:TCUstream):TCUresult;cdecl;external;
function CuDeviceGet(device:PCUdevice; ordinal:longint):TCUresult;cdecl;external;
function CuDeviceGetCount(count:Plongint):TCUresult;cdecl;external;
function CuDeviceGetName(name:Pchar; len:longint; dev:TCUdevice):TCUresult;cdecl;external;
function CuDeviceGetAttribute(pi:Plongint; attrib:TCUdevice_attribute; dev:TCUdevice):TCUresult;cdecl;external;
function CuDeviceGetUuid(uuid:PCUuuid; dev:TCUdevice):TCUresult;cdecl;external;
function CuDeviceCanAccessPeer(canAccessPeer:Plongint; dev:TCUdevice; peerDev:TCUdevice):TCUresult;cdecl;external;
function CuDriverGetVersion(driverVersion:Plongint):TCUresult;cdecl;external;
(* Const before type ignored *)
function CuModuleLoadData(module:PCUmodule; image:pointer):TCUresult;cdecl;external;
function CuModuleUnload(module:TCUmodule):TCUresult;cdecl;external;
(* Const before type ignored *)
function CuModuleGetFunction(hfunc:PCUfunction; hmod:TCUmodule; name:Pchar):TCUresult;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function CuTexObjectCreate(pTexObject:PCUtexObject; pResDesc:PCUDA_RESOURCE_DESC; pTexDesc:PCUDA_TEXTURE_DESC; pResViewDesc:PCUDA_RESOURCE_VIEW_DESC):TCUresult;cdecl;external;
function CuTexObjectDestroy(texObject:TCUtexObject):TCUresult;cdecl;external;
function CuLaunchKernel(f:TCUfunction; gridDimX:dword; gridDimY:dword; gridDimZ:dword; blockDimX:dword; 
           blockDimY:dword; blockDimZ:dword; sharedMemBytes:dword; hStream:TCUstream; kernelParams:Ppointer; 
           extra:Ppointer):TCUresult;cdecl;external;
function CuEventCreate(phEvent:PCUevent; Flags:dword):TCUresult;cdecl;external;
function CuEventDestroy(hEvent:TCUevent):TCUresult;cdecl;external;
function CuEventRecord(hEvent:TCUevent; hStream:TCUstream):TCUresult;cdecl;external;
function CuEventSynchronize(hEvent:TCUevent):TCUresult;cdecl;external;
function CuIpcGetEventHandle(pHandle:PCUipcEventHandle; event:TCUevent):TCUresult;cdecl;external;
function CuIpcOpenEventHandle(phEvent:PCUevent; handle:TCUipcEventHandle):TCUresult;cdecl;external;
function CuIpcGetMemHandle(pHandle:PCUipcMemHandle; dptr:TCUdeviceptr):TCUresult;cdecl;external;
function CuIpcOpenMemHandle(pdptr:PCUdeviceptr; handle:TCUipcMemHandle; Flags:dword):TCUresult;cdecl;external;
function CuIpcCloseMemHandle(dptr:TCUdeviceptr):TCUresult;cdecl;external;
function CuMemAddressReserve(ptr:PCUdeviceptr; size:Tsize_t; alignment:Tsize_t; addr:TCUdeviceptr; flags:qword):TCUresult;cdecl;external;
function CuMemAddressFree(ptr:TCUdeviceptr; size:Tsize_t):TCUresult;cdecl;external;
(* Const before type ignored *)
function CuMemCreate(handle:PCUmemGenericAllocationHandle; size:Tsize_t; prop:PCUmemAllocationProp; flags:qword):TCUresult;cdecl;external;
function CuMemRelease(handle:TCUmemGenericAllocationHandle):TCUresult;cdecl;external;
function CuMemExportToShareableHandle(shareableHandle:pointer; handle:TCUmemGenericAllocationHandle; handleType:TCUmemAllocationHandleType; flags:qword):TCUresult;cdecl;external;
function CuMemImportFromShareableHandle(handle:PCUmemGenericAllocationHandle; osHandle:pointer; shHandleType:TCUmemAllocationHandleType):TCUresult;cdecl;external;
(* Const before type ignored *)
function CuMemSetAccess(ptr:TCUdeviceptr; size:Tsize_t; desc:PCUmemAccessDesc; count:Tsize_t):TCUresult;cdecl;external;
(* Const before type ignored *)
function CuMemGetAccess(flags:Pqword; location:PCUmemLocation; ptr:TCUdeviceptr):TCUresult;cdecl;external;
(* Const before type ignored *)
function CuMemGetAllocationGranularity(granularity:Psize_t; prop:PCUmemAllocationProp; option:TCUmemAllocationGranularity_flags):TCUresult;cdecl;external;
function CuMemGetAllocationPropertiesFromHandle(prop:PCUmemAllocationProp; handle:TCUmemGenericAllocationHandle):TCUresult;cdecl;external;
function CuMemMap(ptr:TCUdeviceptr; size:Tsize_t; offset:Tsize_t; handle:TCUmemGenericAllocationHandle; flags:qword):TCUresult;cdecl;external;
function CuMemUnmap(ptr:TCUdeviceptr; size:Tsize_t):TCUresult;cdecl;external;
function CuMemRetainAllocationHandle(handle:PCUmemGenericAllocationHandle; addr:pointer):TCUresult;cdecl;external;
function CuMemAllocAsync(dptr:PCUdeviceptr; bytesize:Tsize_t; hStream:TCUstream):TCUresult;cdecl;external;
function CuMemAllocFromPoolAsync(dptr:PCUdeviceptr; bytesize:Tsize_t; pool:TCUmemoryPool; hStream:TCUstream):TCUresult;cdecl;external;
function CuMemFreeAsync(dptr:TCUdeviceptr; hStream:TCUstream):TCUresult;cdecl;external;
(* Const before type ignored *)
function CuMemPoolCreate(pool:PCUmemoryPool; poolProps:PCUmemPoolProps):TCUresult;cdecl;external;
function CuMemPoolDestroy(pool:TCUmemoryPool):TCUresult;cdecl;external;
function CuMemPoolSetAttribute(pool:TCUmemoryPool; attr:TCUmemPool_attribute; value:pointer):TCUresult;cdecl;external;
function CuMemPoolGetAttribute(pool:TCUmemoryPool; attr:TCUmemPool_attribute; value:pointer):TCUresult;cdecl;external;
function CuDestroyExternalMemory(extMem:TCUexternalMemory):TCUresult;cdecl;external;
function CuDestroyExternalSemaphore(extSem:TCUexternalSemaphore):TCUresult;cdecl;external;
{*
 * CuExternalMemoryGetMappedBuffer: (skip) (attributes doc.skip=true)
  }
(* Const before type ignored *)
function CuExternalMemoryGetMappedBuffer(devPtr:PCUdeviceptr; extMem:TCUexternalMemory; bufferDesc:PCUDA_EXTERNAL_MEMORY_BUFFER_DESC):TCUresult;cdecl;external;
{*
 * CuExternalMemoryGetMappedMipmappedArray: (skip) (attributes doc.skip=true)
  }
(* Const before type ignored *)
function CuExternalMemoryGetMappedMipmappedArray(mipmap:PCUmipmappedArray; extMem:TCUexternalMemory; mipmapDesc:PCUDA_EXTERNAL_MEMORY_MIPMAPPED_ARRAY_DESC):TCUresult;cdecl;external;
{*
 * CuImportExternalMemory: (skip) (attributes doc.skip=true)
  }
(* Const before type ignored *)
function CuImportExternalMemory(extMem_out:PCUexternalMemory; memHandleDesc:PCUDA_EXTERNAL_MEMORY_HANDLE_DESC):TCUresult;cdecl;external;
{*
 * CuImportExternalSemaphore: (skip) (attributes doc.skip=true)
  }
(* Const before type ignored *)
function CuImportExternalSemaphore(extSem_out:PCUexternalSemaphore; semHandleDesc:PCUDA_EXTERNAL_SEMAPHORE_HANDLE_DESC):TCUresult;cdecl;external;
{*
 * CuSignalExternalSemaphoresAsync: (skip) (attributes doc.skip=true)
  }
(* Const before type ignored *)
(* Const before type ignored *)
function CuSignalExternalSemaphoresAsync(extSemArray:PCUexternalSemaphore; paramsArray:PCUDA_EXTERNAL_SEMAPHORE_SIGNAL_PARAMS; numExtSems:dword; stream:TCUstream):TCUresult;cdecl;external;
{*
 * CuWaitExternalSemaphoresAsync: (skip) (attributes doc.skip=true)
  }
(* Const before type ignored *)
(* Const before type ignored *)
function CuWaitExternalSemaphoresAsync(extSemArray:PCUexternalSemaphore; paramsArray:PCUDA_EXTERNAL_SEMAPHORE_WAIT_PARAMS; numExtSems:dword; stream:TCUstream):TCUresult;cdecl;external;
function CuMemsetD2D8(dstDevice:TCUdeviceptr; dstPitch:Tsize_t; uc:byte; Width:Tsize_t; Height:Tsize_t):TCUresult;cdecl;external;
function CuMemsetD2D8Async(dstDevice:TCUdeviceptr; dstPitch:Tsize_t; uc:byte; Width:Tsize_t; Height:Tsize_t; 
           hStream:TCUstream):TCUresult;cdecl;external;
function CuMemsetD2D16(dstDevice:TCUdeviceptr; dstPitch:Tsize_t; us:word; Width:Tsize_t; Height:Tsize_t):TCUresult;cdecl;external;
function CuMemsetD2D16Async(dstDevice:TCUdeviceptr; dstPitch:Tsize_t; us:word; Width:Tsize_t; Height:Tsize_t; 
           hStream:TCUstream):TCUresult;cdecl;external;
function CuMemsetD2D32(dstDevice:TCUdeviceptr; dstPitch:Tsize_t; ui:dword; Width:Tsize_t; Height:Tsize_t):TCUresult;cdecl;external;
function CuMemsetD2D32Async(dstDevice:TCUdeviceptr; dstPitch:Tsize_t; ui:dword; Width:Tsize_t; Height:Tsize_t; 
           hStream:TCUstream):TCUresult;cdecl;external;
{ cudaGL.h  }
function CuGraphicsGLRegisterImage(pCudaResource:PCUgraphicsResource; image:dword; target:dword; Flags:dword):TCUresult;cdecl;external;
function CuGraphicsGLRegisterBuffer(pCudaResource:PCUgraphicsResource; buffer:dword; Flags:dword):TCUresult;cdecl;external;
function CuGraphicsResourceSetMapFlags(resource:TCUgraphicsResource; flags:dword):TCUresult;cdecl;external;
function CuGLGetDevices(pCudaDeviceCount:Pdword; pCudaDevices:PCUdevice; cudaDeviceCount:dword; deviceList:TCUGLDeviceList):TCUresult;cdecl;external;
{$ifdef G_OS_WIN32}
{ cudaD3D11.h  }
function CuGraphicsD3D11RegisterResource(pCudaResource:PCUgraphicsResource; pD3DResource:PID3D11Resource; Flags:dword):TCUresult;cdecl;external;
function CuD3D11GetDevice(device:PCUdevice; pAdapter:PIDXGIAdapter):TCUresult;cdecl;external;
function CuD3D11GetDevices(pCudaDeviceCount:Pdword; pCudaDevices:PCUdevice; cudaDeviceCount:dword; pD3D11Device:PID3D11Device; deviceList:TCUd3d11DeviceList):TCUresult;cdecl;external;
{$endif}

implementation


end.
