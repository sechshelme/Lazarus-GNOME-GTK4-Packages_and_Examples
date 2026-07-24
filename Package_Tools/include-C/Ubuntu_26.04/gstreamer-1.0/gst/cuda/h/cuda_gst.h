#pragma once

#include <gst/cuda/cuda-prelude.h>
#include <cuda.h>
#include <cudaGL.h>

#ifdef G_OS_WIN32
#ifndef INITGUID
#include <initguid.h>
#endif /* INITGUID */

#include <d3d11.h>
#include <dxgi.h>
#include <cudaD3D11.h>
#endif /* G_OS_WIN32 */



/* cuda.h */
extern
CUresult  CuInit             (unsigned int Flags);

extern
CUresult  CuGetErrorName     (CUresult error,
                                     const char **pStr);

extern
CUresult  CuGetErrorString   (CUresult error,
                                     const char **pStr);

extern
CUresult  CuCtxCreate        (CUcontext * pctx,
                                     unsigned int flags,
                                     CUdevice dev);

extern
CUresult  CuCtxDestroy       (CUcontext ctx);

extern
CUresult  CuCtxPopCurrent    (CUcontext * pctx);

extern
CUresult  CuCtxPushCurrent   (CUcontext ctx);

extern
CUresult  CuCtxSynchronize   (void);

extern
CUresult  CuCtxGetLimit      (size_t *plimit, CUlimit limit);

extern
CUresult  CuCtxSetLimit      (CUlimit limit, size_t value);

extern
CUresult  CuCtxEnablePeerAccess (CUcontext peerContext,
                                             unsigned int Flags);

extern
CUresult  CuCtxDisablePeerAccess (CUcontext peerContext);

extern
CUresult  CuGraphicsMapResources     (unsigned int count,
                                             CUgraphicsResource * resources,
                                             CUstream hStream);

extern
CUresult  CuGraphicsUnmapResources   (unsigned int count,
                                             CUgraphicsResource * resources,
                                             CUstream hStream);

extern
CUresult  CuGraphicsSubResourceGetMappedArray    (CUarray * pArray,
                                                         CUgraphicsResource resource,
                                                         unsigned int arrayIndex,
                                                         unsigned int mipLevel);

extern
CUresult  CuGraphicsResourceGetMappedPointer     (CUdeviceptr * pDevPtr,
                                                         size_t * pSize,
                                                         CUgraphicsResource resource);

extern
CUresult  CuGraphicsUnregisterResource           (CUgraphicsResource resource);

extern
CUresult  CuMemAlloc         (CUdeviceptr * dptr,
                                     unsigned int bytesize);

extern
CUresult  CuMemAllocPitch    (CUdeviceptr * dptr,
                                     size_t * pPitch,
                                     size_t WidthInBytes,
                                     size_t Height,
                                     unsigned int ElementSizeBytes);

extern
CUresult  CuMemAllocHost     (void **pp,
                                     unsigned int bytesize);

extern
CUresult  CuMemcpy2D         (const CUDA_MEMCPY2D * pCopy);

extern
CUresult  CuMemcpy2DAsync    (const CUDA_MEMCPY2D *pCopy, CUstream hStream);

extern
CUresult  CuMemcpyDtoD       (CUdeviceptr dstDevice,
                                     CUdeviceptr srcDevice,
                                     size_t ByteCount);

extern
CUresult  CuMemcpyDtoDAsync  (CUdeviceptr dstDevice,
                                     CUdeviceptr srcDevice,
                                     size_t ByteCount,
                                     CUstream hStream);

extern
CUresult  CuMemcpyDtoH       (void *dstHost,
                                     CUdeviceptr srcDevice,
                                     size_t ByteCount);

extern
CUresult  CuMemcpyDtoHAsync  (void *dstHost,
                                     CUdeviceptr srcDevice,
                                     size_t ByteCount,
                                     CUstream hStream);

extern
CUresult  CuMemcpyHtoD       (CUdeviceptr dstDevice,
                                     const void *srcHost,
                                     size_t ByteCount);

extern
CUresult  CuMemcpyHtoDAsync  (CUdeviceptr dstDevice,
                                     const void *srcHost,
                                     size_t ByteCount,
                                     CUstream hStream);

extern
CUresult  CuMemFree          (CUdeviceptr dptr);

extern
CUresult  CuMemFreeHost      (void *p);

extern
CUresult  CuStreamCreate     (CUstream *phStream,
                                     unsigned int Flags);

extern
CUresult  CuStreamDestroy    (CUstream hStream);

extern
CUresult  CuStreamSynchronize (CUstream hStream);

extern
CUresult  CuDeviceGet        (CUdevice * device,
                                     int ordinal);

extern
CUresult  CuDeviceGetCount   (int *count);

extern
CUresult  CuDeviceGetName    (char *name,
                                     int len,
                                     CUdevice dev);

extern
CUresult  CuDeviceGetAttribute (int *pi,
                                       CUdevice_attribute attrib,
                                       CUdevice dev);

extern
CUresult  CuDeviceGetUuid (CUuuid *uuid,
                                  CUdevice dev);

extern
CUresult  CuDeviceCanAccessPeer (int *canAccessPeer,
                                        CUdevice dev,
                                        CUdevice peerDev);

extern
CUresult  CuDriverGetVersion   (int * driverVersion);

extern
CUresult  CuModuleLoadData     (CUmodule* module,
                                       const void *image);

extern
CUresult  CuModuleUnload      (CUmodule module);

extern
CUresult  CuModuleGetFunction  (CUfunction* hfunc,
                                       CUmodule hmod,
                                       const char* name);

extern
CUresult  CuTexObjectCreate    (CUtexObject *pTexObject,
                                       const CUDA_RESOURCE_DESC *pResDesc,
                                       const CUDA_TEXTURE_DESC *pTexDesc,
                                       const CUDA_RESOURCE_VIEW_DESC *pResViewDesc);

extern
CUresult  CuTexObjectDestroy   (CUtexObject texObject);

extern
CUresult  CuLaunchKernel       (CUfunction f,
                                       unsigned int gridDimX,
                                       unsigned int gridDimY,
                                       unsigned int gridDimZ,
                                       unsigned int blockDimX,
                                       unsigned int blockDimY,
                                       unsigned int blockDimZ,
                                       unsigned int sharedMemBytes,
                                       CUstream hStream,
                                       void **kernelParams,
                                       void **extra);

extern
CUresult  CuEventCreate       (CUevent *phEvent,
                                      unsigned int Flags);

extern
CUresult  CuEventDestroy      (CUevent hEvent);

extern
CUresult  CuEventRecord       (CUevent hEvent,
                                      CUstream hStream);

extern
CUresult  CuEventSynchronize  (CUevent hEvent);

extern
CUresult  CuIpcGetEventHandle (CUipcEventHandle *pHandle,
                                      CUevent event);

extern
CUresult  CuIpcOpenEventHandle (CUevent* phEvent,
                                       CUipcEventHandle handle);

extern
CUresult  CuIpcGetMemHandle   (CUipcMemHandle *pHandle,
                                      CUdeviceptr dptr);

extern
CUresult  CuIpcOpenMemHandle  (CUdeviceptr *pdptr,
                                      CUipcMemHandle handle,
                                      unsigned int Flags);

extern
CUresult  CuIpcCloseMemHandle (CUdeviceptr dptr);

extern
CUresult  CuMemAddressReserve (CUdeviceptr *ptr,
                                      size_t size,
                                      size_t alignment,
                                      CUdeviceptr addr,
                                      unsigned long long flags);

extern
CUresult  CuMemAddressFree    (CUdeviceptr ptr,
                                      size_t size);


extern
CUresult  CuMemCreate         (CUmemGenericAllocationHandle *handle,
                                      size_t size,
                                      const CUmemAllocationProp *prop,
                                      unsigned long long flags);

extern
CUresult  CuMemRelease        (CUmemGenericAllocationHandle handle);

extern
CUresult  CuMemExportToShareableHandle (void *shareableHandle,
                                               CUmemGenericAllocationHandle handle,
                                               CUmemAllocationHandleType handleType,
                                               unsigned long long flags);

extern
CUresult  CuMemImportFromShareableHandle (CUmemGenericAllocationHandle *handle,
                                                 void *osHandle,
                                                 CUmemAllocationHandleType shHandleType);

extern
CUresult  CuMemSetAccess (CUdeviceptr ptr,
                                 size_t size,
                                 const CUmemAccessDesc *desc,
                                 size_t count);

extern
CUresult  CuMemGetAccess (unsigned long long *flags,
                                 const CUmemLocation *location,
                                 CUdeviceptr ptr);

extern
CUresult  CuMemGetAllocationGranularity (size_t *granularity,
                                                const CUmemAllocationProp *prop,
                                                CUmemAllocationGranularity_flags option);

extern
CUresult  CuMemGetAllocationPropertiesFromHandle (CUmemAllocationProp *prop,
                                                         CUmemGenericAllocationHandle handle);


extern
CUresult  CuMemMap (CUdeviceptr ptr,
                           size_t size,
                           size_t offset,
                           CUmemGenericAllocationHandle handle,
                           unsigned long long flags);

extern
CUresult  CuMemUnmap (CUdeviceptr ptr,
                             size_t size);

extern
CUresult  CuMemRetainAllocationHandle (CUmemGenericAllocationHandle *handle,
                                              void *addr);

extern
CUresult  CuMemAllocAsync (CUdeviceptr *dptr,
                                  size_t bytesize,
                                  CUstream hStream);

extern
CUresult  CuMemAllocFromPoolAsync (CUdeviceptr *dptr,
                                          size_t bytesize,
                                          CUmemoryPool pool,
                                          CUstream hStream);

extern
CUresult  CuMemFreeAsync (CUdeviceptr dptr,
                                 CUstream hStream);

extern
CUresult  CuMemPoolCreate (CUmemoryPool *pool,
                                  const CUmemPoolProps *poolProps);

extern
CUresult  CuMemPoolDestroy (CUmemoryPool pool);

extern
CUresult  CuMemPoolSetAttribute (CUmemoryPool pool,
                                        CUmemPool_attribute attr,
                                        void *value);

extern
CUresult  CuMemPoolGetAttribute (CUmemoryPool pool,
                                        CUmemPool_attribute attr,
                                        void *value);

extern
CUresult  CuDestroyExternalMemory (CUexternalMemory extMem);

extern
CUresult  CuDestroyExternalSemaphore (CUexternalSemaphore extSem);

/**
 * CuExternalMemoryGetMappedBuffer: (skip) (attributes doc.skip=true)
 */
extern
CUresult  CuExternalMemoryGetMappedBuffer (CUdeviceptr *devPtr,
                                                  CUexternalMemory extMem,
                                                  const CUDA_EXTERNAL_MEMORY_BUFFER_DESC *bufferDesc);

/**
 * CuExternalMemoryGetMappedMipmappedArray: (skip) (attributes doc.skip=true)
 */
extern
CUresult  CuExternalMemoryGetMappedMipmappedArray (CUmipmappedArray *mipmap,
                                                          CUexternalMemory extMem,
                                                          const CUDA_EXTERNAL_MEMORY_MIPMAPPED_ARRAY_DESC *mipmapDesc);

/**
 * CuImportExternalMemory: (skip) (attributes doc.skip=true)
 */
extern
CUresult  CuImportExternalMemory (CUexternalMemory *extMem_out,
                                         const CUDA_EXTERNAL_MEMORY_HANDLE_DESC *memHandleDesc);

/**
 * CuImportExternalSemaphore: (skip) (attributes doc.skip=true)
 */
extern
CUresult  CuImportExternalSemaphore (CUexternalSemaphore *extSem_out,
                                            const CUDA_EXTERNAL_SEMAPHORE_HANDLE_DESC *semHandleDesc);

/**
 * CuSignalExternalSemaphoresAsync: (skip) (attributes doc.skip=true)
 */
extern
CUresult  CuSignalExternalSemaphoresAsync (const CUexternalSemaphore *extSemArray,
                                                  const CUDA_EXTERNAL_SEMAPHORE_SIGNAL_PARAMS *paramsArray,
                                                  unsigned int numExtSems,
                                                  CUstream stream);

/**
 * CuWaitExternalSemaphoresAsync: (skip) (attributes doc.skip=true)
 */
extern
CUresult  CuWaitExternalSemaphoresAsync (const CUexternalSemaphore *extSemArray,
                                                const CUDA_EXTERNAL_SEMAPHORE_WAIT_PARAMS *paramsArray,
                                                unsigned int numExtSems,
                                                CUstream stream);

extern
CUresult  CuMemsetD2D8 (CUdeviceptr dstDevice,
                               size_t dstPitch,
                               unsigned char uc,
                               size_t Width,
                               size_t Height);

extern
CUresult  CuMemsetD2D8Async (CUdeviceptr dstDevice,
                                    size_t dstPitch,
                                    unsigned char uc,
                                    size_t Width,
                                    size_t Height,
                                    CUstream hStream);

extern
CUresult  CuMemsetD2D16 (CUdeviceptr dstDevice,
                                size_t dstPitch,
                                unsigned short us,
                                size_t Width,
                                size_t Height);

extern
CUresult  CuMemsetD2D16Async (CUdeviceptr dstDevice,
                                     size_t dstPitch,
                                     unsigned short us,
                                     size_t Width,
                                     size_t Height,
                                     CUstream hStream);

extern
CUresult  CuMemsetD2D32 (CUdeviceptr dstDevice,
                                size_t dstPitch,
                                unsigned int ui,
                                size_t Width,
                                size_t Height);

extern
CUresult  CuMemsetD2D32Async (CUdeviceptr dstDevice,
                                     size_t dstPitch,
                                     unsigned int ui,
                                     size_t Width,
                                     size_t Height,
                                     CUstream hStream);

/* cudaGL.h */
extern
CUresult  CuGraphicsGLRegisterImage  (CUgraphicsResource * pCudaResource,
                                             unsigned int image,
                                             unsigned int target,
                                             unsigned int Flags);

extern
CUresult  CuGraphicsGLRegisterBuffer (CUgraphicsResource * pCudaResource,
                                             unsigned int buffer,
                                             unsigned int Flags);

extern
CUresult  CuGraphicsResourceSetMapFlags (CUgraphicsResource resource,
                                                unsigned int flags);

extern
CUresult  CuGLGetDevices (unsigned int * pCudaDeviceCount,
                                 CUdevice * pCudaDevices,
                                 unsigned int cudaDeviceCount,
                                 CUGLDeviceList deviceList);

#ifdef G_OS_WIN32
/* cudaD3D11.h */
extern
CUresult  CuGraphicsD3D11RegisterResource(CUgraphicsResource * pCudaResource,
                                                 ID3D11Resource * pD3DResource,
                                                 unsigned int Flags);

extern
CUresult  CuD3D11GetDevice(CUdevice * device,
                                  IDXGIAdapter * pAdapter);

extern
CUresult  CuD3D11GetDevices(unsigned int * pCudaDeviceCount,
                                   CUdevice* pCudaDevices,
                                   unsigned int cudaDeviceCount,
                                   ID3D11Device * pD3D11Device,
                                   CUd3d11DeviceList deviceList);
#endif


